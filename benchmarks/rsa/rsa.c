/* rsa.c -- benchmark signing with the RSA algorithm.

Copyright 2003 Free Software Foundation, Inc.

This file is part of GMPbench.

GMPbench is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation; either version 3 of the License, or (at your option) any later
version.

GMPbench is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
GMPbench.  If not, see http://www.gnu.org/licenses/.  */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "hal.h"
#include "gmp.h"

#define RSA_EXP 0x10001

void rsa_sign (mpz_t, mpz_t, mpz_t, mpz_t, mpz_t, mpz_t, mpz_t, mpz_t);

// 2048b
//char result[]="8760403088014219876099857721428959794712962743299353461062554467812173634614905070540048079029086140411351362622193233070788786505466088897087317122807429372239354057761230233641631375874059609344467503354817969880236715042831038293944084065276965982557720738753521824027577006854774956421128928324209802505925519533526234543945266342478722423767633878609206739494651890043648513250618612990076048085573560950757498687146604681210266276955491579362879220005240525706976928120955121435692334911454422308478221835127067628569898205009898759133097827999210792521993520245905204726317195820374628578662332346896707983963";

//4096b
//char result[]="606604675255199869377874361110580052992250214407532452043338198606611704254786643605004834983778973646736116985318010956754385207883307206870132090659734329739126321116296450277874576207142903664072935968457343435426094080864618208008963242572919740600828210867766450195441560810955326922427680358210524567996338964045693446585869134798193650946955136281831950066409847034453170172997329505096377227805246158611344981810447573476772370634342574064696147436554165554419974647609376893326663008525013162390681051780898181533302981777644797233993295797496344034263898117042076187896895162747055354218950448576308375656666815337858997562428048016923946149987996188609899239937363204802649778826384990478189756549656444682110056807715123750671188973853812160266630211612968160699492625841156014122570232460640850235840837718353818910494745496797663470884091827714044332529663780413714668693860017045163866527093091767128339306159791961073784163171497473633301432256411670519891812183555894323344683309160572254791593626657126131328323108390374094511187243378363314633387309395331129519651986399489357615617505734549913426833251787832856038425624127004469130426465033204848226392845558536786186826043864767830704875145202687500678017456319";

//3072b
char rsa_result[]="3643216640036640029132364020677661499210895251407265826882047175463209253962909972714549157158259444853059938332722962922591410004661781435813287949474289231791219818929784052897027432854945141550493996729267613740484890619790211297701161498083960596438523241650695093932111601997051238450139467458649272204881723139400110538602569489163740957517272121385216353985793869687343635553955652745680578861928013288105856356491573303472766496294975987252013946730625340465028315638855896463527702425345399841010906553339763395093293648256129705487485957862988889722942831641921810112950802288784759259465161366912050208746596498211071977570889709657507331110845716159899851732103002967180535700280118688538741476459520368959257016344972136260102743369261105098850483366870861268282717281005338507059299762566460856159393851293483067111681594769170123087441122080967050311814824833086458535331976144237038301138616533422732624966087";

#ifdef CUSTOM_MAIN

extern unsigned long long int get_ticks();
int _main_rsa(int argc ,char *argv[]);

#ifdef ALL_BENCHMARKS
double _rsa()
#else
int main(int argc, char *argv[])
#endif
{

	unsigned long long int t1,t2;
    char *args1[]={"rsa","3072","1"};

    t1 = get_ticks();
    _main_rsa(3,args1);
    t2 = get_ticks();

    printf("----------------------------------------------------------\r\n");
    printf("RSA took %'.6lf million clock cycles\r\n",(t2-t1)/1000000.0);
    printf("----------------------------------------------------------\r\n");
#ifdef ALL_BENCHMARKS
    return (t2-t1)/1000000.0;
#else
    printf("%c\n",0xFE); // Signal termination to board server
    return 0;
#endif
}

int _main_rsa(int argc, char *argv[])
#else
int main (int argc, char *argv[])
#endif
{
  gmp_randstate_t rs;
  mpz_t p, q, pq, pm1, qm1, phi, e, d, p_i_q, dp, dq, msg[1024], smsg;
  unsigned long int n, i, j, niter;
  char *res_str;


  if (argc == 3) {
    n     = atoi (argv[1]);
    niter = atoi (argv[2]);
  } else {
    fprintf (stderr, "usage: %s n i\n", argv[0]);
    fprintf (stderr, "  where n is number of bits in numbers tested\n");
    fprintf (stderr, "  and i is the number of iterations\n");
    return -1;
  }

  gmp_randinit_default (rs);
  mpz_init (p);
  mpz_init (q);
  mpz_init (pq);

  printf ("Generating p, q, d... "); fflush (stdout);

#if 0
  mpz_urandomb (p, rs, n/2);
  mpz_setbit (p, n / 2 - 1);
  mpz_setbit (p, n / 2 - 2);
  mpz_nextprime (p, p);

  mpz_urandomb (q, rs, n/2);
  mpz_setbit (q, n / 2 - 1);
  mpz_setbit (q, n / 2 - 2);
  mpz_nextprime (q, q);
#else
  do
    {
      mpz_urandomb (p, rs, n/2);
      mpz_setbit (p, n / 2 - 1);
      mpz_setbit (p, n / 2 - 2);
      mpz_setbit (p, 0);

      mpz_urandomb (q, rs, n/2);
      mpz_setbit (q, n / 2 - 1);
      mpz_setbit (q, n / 2 - 2);
      mpz_setbit (q, 0);

      mpz_gcd (pq, p, q);
    }
  while (mpz_cmp_ui (pq, 1) != 0);
#endif

  mpz_mul (pq, p, q);

  mpz_init_set_ui (e, RSA_EXP);
  mpz_init (d);
  mpz_init (pm1);
  mpz_init (qm1);
  mpz_init (phi);

  mpz_sub_ui (pm1, p, 1);
  mpz_sub_ui (qm1, q, 1);
  mpz_mul (phi, pm1, qm1);
  if (mpz_invert (d, e, phi) == 0)
    abort ();
  //mpz_clear(e);
  //mpz_clear(d);
  //mpz_clear(phi);

  printf ("done; pq is %d bits\r\n", (int) mpz_sizeinbase (pq, 2));

  printf ("Precomputing CRT constants\r\n");

  mpz_init (p_i_q);
  if (mpz_invert (p_i_q, p, q) == 0)
    abort ();

  mpz_init (dp);
  mpz_init (dq);
  mpz_mod (dp, d, pm1);
  mpz_mod (dq, d, qm1);

  //mpz_clear(pm1);
  //mpz_clear(qm1);

  //printf ("Generating random messages\n");

  mpz_init (smsg);

  printf ("Signing random messages %lu times...\r\n", niter);  fflush (stdout);
  for (i = niter; i > 0; i--) {
	  // Generating random messages
	  for (j = 0; j < 1024; j++)
	    {
	      mpz_init (msg[j]);
	      mpz_urandomb (msg[j], rs, n);
	    }
      rsa_sign (smsg, msg[i % 1024], p, q, pq, p_i_q, dp, dq);
	  res_str = mpz_get_str(NULL, 10, smsg);
	  //printf("%s\n", res_str);
	  if ( strcmp(rsa_result,res_str) ) {
		  printf("ERROR: Wrong result\r\n\r\n");
		  free(res_str);
		  //mpz_clear(p);
		  //mpz_clear(q);
		  //mpz_clear(pq);
		  //mpz_clear(p_i_q);
		  //mpz_clear(dp);
		  //mpz_clear(dq);
		  //for (j = 0; j < 1024; j++)
		  //    mpz_clear(msg[j]);
		  //mpz_clear(smsg);
		  return 1;
	  } else {
		  printf("CORRECT!\r\n\r\n");
	      free(res_str);
	  }
    }
  //printf ("done!\n");

//  mpz_clear(p);
//  mpz_clear(q);
//  mpz_clear(pq);
//  mpz_clear(p_i_q);
//  mpz_clear(dp);
//  mpz_clear(dq);
//  for (j = 0; j < 1024; j++)
//      mpz_clear(msg[j]);
//  mpz_clear(smsg);
  return 0;
}

void
rsa_sign (mpz_t smsg,
	  mpz_t msg, mpz_t p, mpz_t q, mpz_t pq,
	  mpz_t p_i_q, mpz_t dp, mpz_t dq)
{
  mpz_t  t, o, pr, qr, qr_m_pr;

  mpz_init (pr);
  mpz_init (qr);
  mpz_init (qr_m_pr);
  mpz_init (t);
  mpz_init (o);

  mpz_powm (pr, msg, dp, p);
  mpz_powm (qr, msg, dq, q);

  mpz_sub (qr_m_pr, qr, pr);

  mpz_mul (t, qr_m_pr, p_i_q);
  mpz_mod (o, t, q);		/* slow mod */

  mpz_mul (t, o, p);
  mpz_add (smsg, pr, t);
  mpz_mod (smsg, smsg, pq);	/* fast mod */

  mpz_clear (o);
  mpz_clear (t);
  mpz_clear (qr_m_pr);
  mpz_clear (qr);
  mpz_clear (pr);
}
