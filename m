Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096E1F16D;
	Thu,  3 Aug 2023 21:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691098433; x=1722634433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzpgsYa1pEx3NtJJ2J94M6mMCtI/fKSNZrlA+ijEyjs=;
  b=KXtP1bKkEO1Pc/HuuX7USiawX1zKtQpXXSS6DRFWQo24xpAARPgyk83Z
   NywYDMQjjOguA7Wb037j/hwZhEQinOPe5j5RrhMv2p6uNWbGfsSq+LA2D
   FKHK9qYFUmuIxqrO2lv+4HgjTMVPYNbaU2BbhcrNQJrgot2pYLPx62JEX
   dC37WlpXM0/MRC6a8eerEXasz2FzDH4+ddiITIWk448+w0SCVC3O2fj4K
   YULWqrqC0YC2jFQqe9ScchRFHCXL0FsJywG1AKRXKhMIduc+5N5HTpMbP
   vfm41F3OdCxhBKUcgb1vlqH+7Yg3rUgPXH4MzeuEZqR8Vgs68GreOGgVg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="367465720"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="367465720"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 14:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="976274847"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="976274847"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 14:33:50 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRfx7-0002Md-0o;
	Thu, 03 Aug 2023 21:33:49 +0000
Date: Fri, 4 Aug 2023 05:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.14.y 4459/9999] lib/mpi/mpih-div.c:142:20: error:
 invalid use of a cast in a inline asm context requiring an lvalue: remove
 the cast or build with -fheinous-gnu-extensions
Message-ID: <202308040553.nMR9oB8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: 71749b1181eca12af96654a781cabcd058c37c8f [4459/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r035-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040553.nMR9oB8v-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040553.nMR9oB8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040553.nMR9oB8v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/mpi/mpih-div.c:142:20: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
     142 |                                         umul_ppmm(n1, n0, d0, q);
         |                                         ~~~~~~~~~~~~~~^~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
>> lib/mpi/mpih-div.c:142:6: error: invalid output constraint '=h' in asm
     142 |                                         umul_ppmm(n1, n0, d0, q);
         |                                         ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   lib/mpi/mpih-div.c:205:20: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
     205 |                                         umul_ppmm(n1, n0, d1, q);
         |                                         ~~~~~~~~~~~~~~^~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
   lib/mpi/mpih-div.c:205:6: error: invalid output constraint '=h' in asm
     205 |                                         umul_ppmm(n1, n0, d1, q);
         |                                         ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   4 errors generated.
--
>> lib/mpi/generic_mpih-mul1.c:50:24: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
      50 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
>> lib/mpi/generic_mpih-mul1.c:50:3: error: invalid output constraint '=h' in asm
      50 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   2 errors generated.
--
   lib/mpi/generic_mpih-mul3.c:49:24: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
      49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
>> lib/mpi/generic_mpih-mul3.c:49:3: error: invalid output constraint '=h' in asm
      49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   2 errors generated.
--
>> lib/mpi/generic_mpih-mul2.c:49:24: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
      49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
>> lib/mpi/generic_mpih-mul2.c:49:3: error: invalid output constraint '=h' in asm
      49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   2 errors generated.


vim +142 lib/mpi/mpih-div.c

cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   39  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   40  /* Divide num (NP/NSIZE) by den (DP/DSIZE) and write
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   41   * the NSIZE-DSIZE least significant quotient limbs at QP
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   42   * and the DSIZE long remainder at NP.	If QEXTRA_LIMBS is
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   43   * non-zero, generate that many fraction bits and append them after the
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   44   * other quotient limbs.
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   45   * Return the most significant limb of the quotient, this is always 0 or 1.
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   46   *
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   47   * Preconditions:
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   48   * 0. NSIZE >= DSIZE.
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   49   * 1. The most significant bit of the divisor must be set.
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   50   * 2. QP must either not overlap with the input operands at all, or
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   51   *    QP + DSIZE >= NP must hold true.	(This means that it's
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   52   *    possible to put the quotient in the high part of NUM, right after the
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   53   *    remainder in NUM.
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   54   * 3. NSIZE >= DSIZE, even if QEXTRA_LIMBS is non-zero.
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   55   */
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   56  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   57  mpi_limb_t
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   58  mpihelp_divrem(mpi_ptr_t qp, mpi_size_t qextra_limbs,
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   59  	       mpi_ptr_t np, mpi_size_t nsize, mpi_ptr_t dp, mpi_size_t dsize)
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   60  {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   61  	mpi_limb_t most_significant_q_limb = 0;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   62  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   63  	switch (dsize) {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   64  	case 0:
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   65  		/* We are asked to divide by zero, so go ahead and do it!  (To make
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   66  		   the compiler not remove this statement, return the value.)  */
a6d68ecc56ed18 Dmitry Kasatkin 2012-01-26   67  		/*
a6d68ecc56ed18 Dmitry Kasatkin 2012-01-26   68  		 * existing clients of this function have been modified
a6d68ecc56ed18 Dmitry Kasatkin 2012-01-26   69  		 * not to call it with dsize == 0, so this should not happen
a6d68ecc56ed18 Dmitry Kasatkin 2012-01-26   70  		 */
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   71  		return 1 / dsize;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   72  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   73  	case 1:
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   74  		{
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   75  			mpi_size_t i;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   76  			mpi_limb_t n1;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   77  			mpi_limb_t d;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   78  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   79  			d = dp[0];
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   80  			n1 = np[nsize - 1];
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   81  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   82  			if (n1 >= d) {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   83  				n1 -= d;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   84  				most_significant_q_limb = 1;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   85  			}
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   86  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   87  			qp += qextra_limbs;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   88  			for (i = nsize - 2; i >= 0; i--)
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   89  				udiv_qrnnd(qp[i], n1, n1, np[i], d);
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   90  			qp -= qextra_limbs;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   91  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   92  			for (i = qextra_limbs - 1; i >= 0; i--)
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   93  				udiv_qrnnd(qp[i], n1, n1, 0, d);
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   94  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   95  			np[0] = n1;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   96  		}
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   97  		break;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   98  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31   99  	case 2:
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  100  		{
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  101  			mpi_size_t i;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  102  			mpi_limb_t n1, n0, n2;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  103  			mpi_limb_t d1, d0;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  104  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  105  			np += nsize - 2;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  106  			d1 = dp[1];
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  107  			d0 = dp[0];
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  108  			n1 = np[1];
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  109  			n0 = np[0];
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  110  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  111  			if (n1 >= d1 && (n1 > d1 || n0 >= d0)) {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  112  				sub_ddmmss(n1, n0, n1, n0, d1, d0);
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  113  				most_significant_q_limb = 1;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  114  			}
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  115  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  116  			for (i = qextra_limbs + nsize - 2 - 1; i >= 0; i--) {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  117  				mpi_limb_t q;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  118  				mpi_limb_t r;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  119  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  120  				if (i >= qextra_limbs)
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  121  					np--;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  122  				else
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  123  					np[0] = 0;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  124  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  125  				if (n1 == d1) {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  126  					/* Q should be either 111..111 or 111..110.  Need special
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  127  					 * treatment of this rare case as normal division would
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  128  					 * give overflow.  */
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  129  					q = ~(mpi_limb_t) 0;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  130  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  131  					r = n0 + d1;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  132  					if (r < d1) {	/* Carry in the addition? */
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  133  						add_ssaaaa(n1, n0, r - d0,
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  134  							   np[0], 0, d0);
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  135  						qp[i] = q;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  136  						continue;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  137  					}
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  138  					n1 = d0 - (d0 != 0 ? 1 : 0);
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  139  					n0 = -d0;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  140  				} else {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  141  					udiv_qrnnd(q, r, n1, n0, d1);
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31 @142  					umul_ppmm(n1, n0, d0, q);

:::::: The code at line 142 was first introduced by commit
:::::: cdec9cb5167ab1113ba9c58e395f664d9d3f9acb crypto: GnuPG based MPI lib - source files (part 1)

:::::: TO: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
:::::: CC: Dmitry Kasatkin <dmitry.kasatkin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
