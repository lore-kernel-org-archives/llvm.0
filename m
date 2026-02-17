Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630BF20296E;
	Tue, 17 Feb 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337750; cv=none; b=pzp2mt58jULXk/gJo7x+nOoutvLle4s8c+Eot+Rse9UcKkaf8OhRzAQAQgfW6t6s9ScJYPlkP1rj3cpA2XK5hB37sefRAyxF6bSejfsIASEl0Srx0i82IHKhxAA9pGODmtjhCIQ/bL5PuCglkIB4oa4wI+iIw4oK38JFNIUQ6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337750; c=relaxed/simple;
	bh=EXER/Qpch24+fMjnQVZElv1X28ijcATmErOdLXEnZ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pBY8xbRpxlYZznNKpZT2S3h20/EIcwGxAYNs6yO6b/raf+5kOiZ6qLQKcPxyrfBvF20cx8GxJkXtM+FCLD6USTWgJbKycuSBYMoaW9olnn3vVInGbNR2vD7LsaBi1JS8j+BPtzMsdnBwyJhJzkM95SXxsck5aaLNVvMWvCa/R3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAEeWzBM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAEeWzBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771337748; x=1802873748;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EXER/Qpch24+fMjnQVZElv1X28ijcATmErOdLXEnZ9U=;
  b=QAEeWzBMPwa4Xe7RgimTuGWOvwKtJOhbPOB6RfGQSuIf5B4XgsYzbcX3
   GImKpN9gn0vZwujndr6UhnsuO3QiH6pgWqWMlsDWyJ+tPpOWh2k6UjNfQ
   izaR+xJowbM62ilZVROdhivZVeOmiz9PrR20haJd34BQJBlS/zFS/IyRx
   Oj9dyyHLvE2znGwAwigsg9rTgPzImGfiTlXNHHZOUodGSvn1KECWfJIzu
   QRQELYofNhj3wdrs1cQ3WlAKV/1KU4ZBj3+BLcvJgts/12R+fcxW/i2kj
   YEgagzR01tl5/2IGKFiYWPm+3AX7zP6UjFvo5/PqeYgIflUXzMjbzVMKq
   w==;
X-CSE-ConnectionGUID: 6fpxT8H8SPWLLei0d4cOJw==
X-CSE-MsgGUID: rnXpdyDiRvOlvCEsDJaymQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76027703"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="76027703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 06:15:48 -0800
X-CSE-ConnectionGUID: 0Omc/GXdT5ql5Pm4ASpeSQ==
X-CSE-MsgGUID: K9ug/SjaRyKULky0C3MHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213730320"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2026 06:15:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsLrc-0000000113D-06SQ;
	Tue, 17 Feb 2026 14:15:44 +0000
Date: Tue, 17 Feb 2026 22:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 20/27]
 arch/x86/include/asm/vdso/gettimeofday.h:149:27: error: use of undeclared
 identifier 'VDSO_CLOCKMODE_TSC'; did you mean 'VDSO_CLOCKMODE_MAX'?
Message-ID: <202602172254.EdN1C5BF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-compat_32bit_time
head:   e2c69e96cd498c7b99d45f1d7e0afbac22dc3e38
commit: 48df0c19b71f01f91e328dc35501e0b5a1b84bf2 [20/27] guard
config: um-defconfig (https://download.01.org/0day-ci/archive/20260217/2026=
02172254.EdN1C5BF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86=
750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260217/202602172254.EdN1C5BF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602172254.EdN1C5BF-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/um/vdso/um_vdso.c:12:
   In file included from include/vdso/gettime.h:7:
   In file included from arch/x86/include/asm/vdso/gettimeofday.h:20:
   In file included from include/clocksource/hyperv_timer.h:18:
   In file included from include/hyperv/hvhdk.h:10:
   In file included from include/hyperv/hvhdk_mini.h:8:
>> include/hyperv/hvgdk_mini.h:1443:22: error: field has incomplete type 'u=
nion hv_msi_entry'
    1443 |                 union hv_msi_entry msi_entry;
         |                                    ^
   include/hyperv/hvgdk_mini.h:1443:9: note: forward declaration of 'union =
hv_msi_entry'
    1443 |                 union hv_msi_entry msi_entry;
         |                       ^
   In file included from arch/x86/um/vdso/um_vdso.c:12:
   In file included from include/vdso/gettime.h:7:
>> arch/x86/include/asm/vdso/gettimeofday.h:147:19: warning: declaration of=
 'struct vdso_time_data' will not be visible outside of this function [-Wvi=
sibility]
     147 |                                         const struct vdso_time_d=
ata *vd)
         |                                                      ^
>> arch/x86/include/asm/vdso/gettimeofday.h:149:27: error: use of undeclare=
d identifier 'VDSO_CLOCKMODE_TSC'; did you mean 'VDSO_CLOCKMODE_MAX'?
     149 |         if (likely(clock_mode =3D=3D VDSO_CLOCKMODE_TSC))
         |                                  ^~~~~~~~~~~~~~~~~~
         |                                  VDSO_CLOCKMODE_MAX
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/vdso/clocksource.h:16:2: note: 'VDSO_CLOCKMODE_MAX' declared here
      16 |         VDSO_CLOCKMODE_MAX,
         |         ^
   In file included from arch/x86/um/vdso/um_vdso.c:12:
   In file included from include/vdso/gettime.h:7:
>> arch/x86/include/asm/vdso/gettimeofday.h:150:15: error: call to undeclar=
ed function 'rdtsc_ordered'; ISO C99 and later do not support implicit func=
tion declarations [-Wimplicit-function-declaration]
     150 |                 return (u64)rdtsc_ordered() & S64_MAX;
         |                             ^
>> arch/x86/include/asm/vdso/gettimeofday.h:172:58: warning: declaration of=
 'struct vdso_clock' will not be visible outside of this function [-Wvisibi=
lity]
     172 | static inline bool arch_vdso_clocksource_ok(const struct vdso_cl=
ock *vc)
         |                                                          ^
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: warning: declaration of=
 'struct vdso_clock' will not be visible outside of this function [-Wvisibi=
lity]
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^
>> arch/x86/include/asm/vdso/gettimeofday.h:213:25: error: incomplete defin=
ition of type 'const struct vdso_clock'
     213 |         u64 delta =3D cycles - vc->cycle_last;
         |                              ~~^
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: note: forward declarati=
on of 'struct vdso_clock'
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^
   arch/x86/include/asm/vdso/gettimeofday.h:225:25: error: incomplete defin=
ition of type 'const struct vdso_clock'
     225 |         if (unlikely(delta > vc->max_cycles)) {
         |                              ~~^
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: note: forward declarati=
on of 'struct vdso_clock'
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^
   arch/x86/include/asm/vdso/gettimeofday.h:232:21: error: incomplete defin=
ition of type 'const struct vdso_clock'
     232 |                         return base >> vc->shift;
         |                                        ~~^
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: note: forward declarati=
on of 'struct vdso_clock'
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^
   arch/x86/include/asm/vdso/gettimeofday.h:235:53: error: incomplete defin=
ition of type 'const struct vdso_clock'
     235 |                 return mul_u64_u32_add_u64_shr(delta & S64_MAX, =
vc->mult, base, vc->shift);
         |                                                                 =
~~^
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: note: forward declarati=
on of 'struct vdso_clock'
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^
   arch/x86/include/asm/vdso/gettimeofday.h:235:69: error: incomplete defin=
ition of type 'const struct vdso_clock'
     235 |                 return mul_u64_u32_add_u64_shr(delta & S64_MAX, =
vc->mult, base, vc->shift);
         |                                                                 =
                ~~^
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: note: forward declarati=
on of 'struct vdso_clock'
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^
   arch/x86/include/asm/vdso/gettimeofday.h:238:21: error: incomplete defin=
ition of type 'const struct vdso_clock'
     238 |         return ((delta * vc->mult) + base) >> vc->shift;
         |                          ~~^
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: note: forward declarati=
on of 'struct vdso_clock'
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^
   arch/x86/include/asm/vdso/gettimeofday.h:238:42: error: incomplete defin=
ition of type 'const struct vdso_clock'
     238 |         return ((delta * vc->mult) + base) >> vc->shift;
         |                                               ~~^
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: note: forward declarati=
on of 'struct vdso_clock'
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^
   3 warnings and 10 errors generated.


vim +149 arch/x86/include/asm/vdso/gettimeofday.h

7ac8707479886c Vincenzo Frascino  2019-06-21  145 =20
4c5a116ada953b Thomas Gleixner    2020-08-04  146  static inline u64 __arch=
_get_hw_counter(s32 clock_mode,
dafde29605ebf2 Thomas Wei=C3=9Fschuh   2025-02-04 @147  					const struct v=
dso_time_data *vd)
7ac8707479886c Vincenzo Frascino  2019-06-21  148  {
b95a8a27c300d1 Thomas Gleixner    2020-02-07 @149  	if (likely(clock_mode =
=3D=3D VDSO_CLOCKMODE_TSC))
77750f78b0b324 Peter Zijlstra     2023-05-19 @150  		return (u64)rdtsc_orde=
red() & S64_MAX;
7ac8707479886c Vincenzo Frascino  2019-06-21  151  	/*
7ac8707479886c Vincenzo Frascino  2019-06-21  152  	 * For any memory-mappe=
d vclock type, we need to make sure that gcc
7ac8707479886c Vincenzo Frascino  2019-06-21  153  	 * doesn't cleverly hoi=
st a load before the mode check.  Otherwise we
7ac8707479886c Vincenzo Frascino  2019-06-21  154  	 * might end up touchin=
g the memory-mapped page even if the vclock in
7ac8707479886c Vincenzo Frascino  2019-06-21  155  	 * question isn't enabl=
ed, which will segfault.  Hence the barriers.
7ac8707479886c Vincenzo Frascino  2019-06-21  156  	 */
7ac8707479886c Vincenzo Frascino  2019-06-21  157  #ifdef CONFIG_PARAVIRT_C=
LOCK
b95a8a27c300d1 Thomas Gleixner    2020-02-07  158  	if (clock_mode =3D=3D V=
DSO_CLOCKMODE_PVCLOCK) {
7ac8707479886c Vincenzo Frascino  2019-06-21  159  		barrier();
7ac8707479886c Vincenzo Frascino  2019-06-21  160  		return vread_pvclock();
7ac8707479886c Vincenzo Frascino  2019-06-21  161  	}
7ac8707479886c Vincenzo Frascino  2019-06-21  162  #endif
3e2d94535adb2d Vitaly Kuznetsov   2019-08-22  163  #ifdef CONFIG_HYPERV_TIM=
ER
b95a8a27c300d1 Thomas Gleixner    2020-02-07  164  	if (clock_mode =3D=3D V=
DSO_CLOCKMODE_HVCLOCK) {
7ac8707479886c Vincenzo Frascino  2019-06-21  165  		barrier();
7ac8707479886c Vincenzo Frascino  2019-06-21  166  		return vread_hvclock();
7ac8707479886c Vincenzo Frascino  2019-06-21  167  	}
7ac8707479886c Vincenzo Frascino  2019-06-21  168  #endif
7ac8707479886c Vincenzo Frascino  2019-06-21  169  	return U64_MAX;
7ac8707479886c Vincenzo Frascino  2019-06-21  170  }
7ac8707479886c Vincenzo Frascino  2019-06-21  171 =20
bf0eff816e467f Anna-Maria Behnsen 2025-03-03 @172  static inline bool arch_=
vdso_clocksource_ok(const struct vdso_clock *vc)
7778d8417b74ad Thomas Gleixner    2020-06-06  173  {
7778d8417b74ad Thomas Gleixner    2020-06-06  174  	return true;
7778d8417b74ad Thomas Gleixner    2020-06-06  175  }
7778d8417b74ad Thomas Gleixner    2020-06-06  176  #define vdso_clocksource=
_ok arch_vdso_clocksource_ok
7778d8417b74ad Thomas Gleixner    2020-06-06  177 =20
7778d8417b74ad Thomas Gleixner    2020-06-06  178  /*
7778d8417b74ad Thomas Gleixner    2020-06-06  179   * Clocksource read valu=
e validation to handle PV and HyperV clocksources
7778d8417b74ad Thomas Gleixner    2020-06-06  180   * which can be invalida=
ted asynchronously and indicate invalidation by
7778d8417b74ad Thomas Gleixner    2020-06-06  181   * returning U64_MAX, wh=
ich can be effectively tested by checking for a
7778d8417b74ad Thomas Gleixner    2020-06-06  182   * negative value after =
casting it to s64.
77750f78b0b324 Peter Zijlstra     2023-05-19  183   *
77750f78b0b324 Peter Zijlstra     2023-05-19  184   * This effectively forc=
es a S64_MAX mask on the calculations, unlike the
77750f78b0b324 Peter Zijlstra     2023-05-19  185   * U64_MAX mask normally=
 used by x86 clocksources.
7778d8417b74ad Thomas Gleixner    2020-06-06  186   */
7778d8417b74ad Thomas Gleixner    2020-06-06  187  static inline bool arch_=
vdso_cycles_ok(u64 cycles)
7778d8417b74ad Thomas Gleixner    2020-06-06  188  {
7778d8417b74ad Thomas Gleixner    2020-06-06  189  	return (s64)cycles >=3D =
0;
7778d8417b74ad Thomas Gleixner    2020-06-06  190  }
7778d8417b74ad Thomas Gleixner    2020-06-06  191  #define vdso_cycles_ok a=
rch_vdso_cycles_ok
7778d8417b74ad Thomas Gleixner    2020-06-06  192 =20
9d90b93bf325e0 Thomas Gleixner    2019-06-26  193  /*
5b26ef660a690e Adrian Hunter      2024-03-25  194   * x86 specific calculat=
ion of nanoseconds for the current cycle count
9d90b93bf325e0 Thomas Gleixner    2019-06-26  195   *
9d90b93bf325e0 Thomas Gleixner    2019-06-26  196   * The regular implement=
ation assumes that clocksource reads are globally
9d90b93bf325e0 Thomas Gleixner    2019-06-26  197   * monotonic. The TSC ca=
n be slightly off across sockets which can cause
9d90b93bf325e0 Thomas Gleixner    2019-06-26  198   * the regular delta cal=
culation (@cycles - @last) to return a huge time
9d90b93bf325e0 Thomas Gleixner    2019-06-26  199   * jump.
9d90b93bf325e0 Thomas Gleixner    2019-06-26  200   *
9d90b93bf325e0 Thomas Gleixner    2019-06-26  201   * Therefore it needs to=
 be verified that @cycles are greater than
5b26ef660a690e Adrian Hunter      2024-03-25  202   * @vd->cycles_last. If =
not then use @vd->cycles_last, which is the base
5b26ef660a690e Adrian Hunter      2024-03-25  203   * time of the current c=
onversion period.
9d90b93bf325e0 Thomas Gleixner    2019-06-26  204   *
77750f78b0b324 Peter Zijlstra     2023-05-19  205   * This variant also use=
s a custom mask because while the clocksource mask of
77750f78b0b324 Peter Zijlstra     2023-05-19  206   * all the VDSO capable =
clocksources on x86 is U64_MAX, the above code uses
77750f78b0b324 Peter Zijlstra     2023-05-19  207   * U64_MASK as an except=
ion value, additionally arch_vdso_cycles_ok() above
77750f78b0b324 Peter Zijlstra     2023-05-19  208   * declares everything w=
ith the MSB/Sign-bit set as invalid. Therefore the
77750f78b0b324 Peter Zijlstra     2023-05-19  209   * effective mask is S64=
_MAX.
9d90b93bf325e0 Thomas Gleixner    2019-06-26  210   */
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  211  static __always_inline u=
64 vdso_calc_ns(const struct vdso_clock *vc, u64 cycles, u64 base)
9d90b93bf325e0 Thomas Gleixner    2019-06-26  212  {
bf0eff816e467f Anna-Maria Behnsen 2025-03-03 @213  	u64 delta =3D cycles - =
vc->cycle_last;
7e90ffb716d289 Adrian Hunter      2024-03-25  214 =20
77750f78b0b324 Peter Zijlstra     2023-05-19  215  	/*
7e90ffb716d289 Adrian Hunter      2024-03-25  216  	 * Negative motion and =
deltas which can cause multiplication
7e90ffb716d289 Adrian Hunter      2024-03-25  217  	 * overflow require spe=
cial treatment. This check covers both as
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  218  	 * negative motion is g=
uaranteed to be greater than @vc::max_cycles
7e90ffb716d289 Adrian Hunter      2024-03-25  219  	 * due to unsigned comp=
arison.
7e90ffb716d289 Adrian Hunter      2024-03-25  220  	 *
54aa699e8094ef Bjorn Helgaas      2024-01-02  221  	 * Due to the MSB/Sign-=
bit being used as invalid marker (see
7239ae7f8349fb Anna-Maria Behnsen 2024-07-01  222  	 * arch_vdso_cycles_ok(=
) above), the effective mask is S64_MAX, but that
7239ae7f8349fb Anna-Maria Behnsen 2024-07-01  223  	 * case is also unlikel=
y and will also take the unlikely path here.
77750f78b0b324 Peter Zijlstra     2023-05-19  224  	 */
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  225  	if (unlikely(delta > vc=
->max_cycles)) {
77750f78b0b324 Peter Zijlstra     2023-05-19  226  		/*
7e90ffb716d289 Adrian Hunter      2024-03-25  227  		 * Due to the above me=
ntioned TSC wobbles, filter out
7e90ffb716d289 Adrian Hunter      2024-03-25  228  		 * negative motion.  P=
er the above masking, the effective
7e90ffb716d289 Adrian Hunter      2024-03-25  229  		 * sign bit is now bit=
 62.
77750f78b0b324 Peter Zijlstra     2023-05-19  230  		 */
7e90ffb716d289 Adrian Hunter      2024-03-25  231  		if (delta & (1ULL << 6=
2))
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  232  			return base >> vc->sh=
ift;
77750f78b0b324 Peter Zijlstra     2023-05-19  233 =20
7e90ffb716d289 Adrian Hunter      2024-03-25  234  		/* Handle multiplicati=
on overflow gracefully */
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  235  		return mul_u64_u32_add=
_u64_shr(delta & S64_MAX, vc->mult, base, vc->shift);
7e90ffb716d289 Adrian Hunter      2024-03-25  236  	}
7e90ffb716d289 Adrian Hunter      2024-03-25  237 =20
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  238  	return ((delta * vc->mu=
lt) + base) >> vc->shift;
9d90b93bf325e0 Thomas Gleixner    2019-06-26  239  }
5b26ef660a690e Adrian Hunter      2024-03-25  240  #define vdso_calc_ns vds=
o_calc_ns
9d90b93bf325e0 Thomas Gleixner    2019-06-26  241 =20

:::::: The code at line 149 was first introduced by commit
:::::: b95a8a27c300d1a39a4e36f63a518ef36e4b966c x86/vdso: Use generic VDSO =
clock mode storage

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
