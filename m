Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50E30566F;
	Thu, 27 Aug 2026 05:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787807995; cv=none; b=c9zuYNTshtwLZz6lSfjh1aymy2EGVGTIaQhiWypHlxXkNNii1gcie/qc4CzsHn2LUIoSp3VzIb7Pkm6uBIlMPuB2QC+me+WBc1oHXFUlqPgaP2L3RkROdLconS2PIKG7/GltczYTcbRaTvnDEoY2VEJNuq475GzyypDbThn/uG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787807995; c=relaxed/simple;
	bh=Nn9mn6IsEQjm5FhYLgi3yi5xjYFT6SeAjwlJQ3ttRDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XZgadrlEiQ8YdflehHGDcDkN11pu8cGAr3G7XpBdHQnQ1JM1tVPXwvXzFsPjx2xEz+cw1i1N5gAEtjuLAaEUoZcYqnIT9HHiuWnx9+i0eK/GABWvGQ/sUSwXMSO6wN8NJtWLhQyl3KBJF0O4KO3q6IEJqdqrwP607p8ABjY8LT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgsNzMIF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgsNzMIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787807992; x=1819343992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nn9mn6IsEQjm5FhYLgi3yi5xjYFT6SeAjwlJQ3ttRDI=;
  b=SgsNzMIFC8F9fJe9sRAK9WJPqV8gwx2NBkmnM+cSFm9STZqXzuAShspA
   oCB7RESx4SLOQQ2FeQBfxMvHX0sbL4sP6ySl8ngmQayQABUoa0bZSYv+8
   qbEHHN9xMWlY/bgyGziJ04+8Z9ImaFAmxr9HYhim7/CDkwZZ5QpxK05HQ
   HrzJEdiUWDCK3J8FEuk3E6FFRFfWSANnAGK+C83ON5iLt8Z68YjUkTgdq
   SHu0DcxAKbeX2azMeqNc9jcGVgEHAbJAOq3qmkx07roLPAcLO7fHNubXb
   gWjtiCGD8OOP8fzSaMAoMM7kTNN5Xw6Rm7zBVLLugEbbShgyNJAPXj2ph
   g==;
X-CSE-ConnectionGUID: U5gx09F9SISNsVAy3Sfo9g==
X-CSE-MsgGUID: ccin2ux4S0KfRV1eEpszYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88326537"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88326537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 22:19:52 -0700
X-CSE-ConnectionGUID: vQ1BgSkRTQ6h7dApYYWeLA==
X-CSE-MsgGUID: R989jrn5SI+TV6FCvsqM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="291284412"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2026 22:19:50 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzSWg-000000008vR-1UDo;
	Thu, 27 Aug 2026 05:19:46 +0000
Date: Thu, 27 Aug 2026 13:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 41/41]
 kernel/time/timekeeping.c:185:36: warning: overflow in expression; result is
 568'041'472 with type 'long'
Message-ID: <202608271347.XtVtsxLQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   87c2db12ba44bf5bea44868e32bd8df048af5586
commit: 87c2db12ba44bf5bea44868e32bd8df048af5586 [41/41] reciprocal
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260827/202608271347.XtVtsxLQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a908adb93db53c0d630232a5bdab8817495c17eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271347.XtVtsxLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271347.XtVtsxLQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping.c:185:36: warning: overflow in expression; result is 568'041'472 with type 'long' [-Winteger-overflow]
     185 |         this_delta = clamp(this_delta, 0, TK_AUX_MONO_CONV_MAX_DELTA_NS);
         |                      ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:148:45: note: expanded from macro 'TK_AUX_MONO_CONV_MAX_DELTA_NS'
     148 | #define TK_AUX_MONO_CONV_MAX_DELTA_NS           (400 * NSEC_PER_SEC)
         |                                                      ^
   include/linux/minmax.h:206:59: note: expanded from macro 'clamp'
     206 | #define clamp(val, lo, hi) __careful_clamp(auto, val, lo, hi)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/minmax.h:195:30: note: expanded from macro '__careful_clamp'
     195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:187:14: note: expanded from macro '__clamp_once'
     187 |         type uhi = (hi);                                                        \
         |                     ^~
   kernel/time/timekeeping.c:234:54: warning: overflow in expression; result is -647'710'720 with type 'long' [-Winteger-overflow]
     234 |         return ktime_sub(mono_now, mono_conv->mono_base) >= TK_AUX_MONO_CONV_FORCE_UPDATE_DELTA_NS;
         |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:149:53: note: expanded from macro 'TK_AUX_MONO_CONV_FORCE_UPDATE_DELTA_NS'
     149 | #define TK_AUX_MONO_CONV_FORCE_UPDATE_DELTA_NS  (300 * NSEC_PER_SEC)
         |                                                  ~~~~^~~~~~~~~~~~~~
   kernel/time/timekeeping.c:2291:13: warning: variable 'suspend_timing_needed' set but not used [-Wunused-but-set-global]
    2291 | static bool suspend_timing_needed;
         |             ^
   3 warnings generated.


vim +185 kernel/time/timekeeping.c

   175	
   176	static ktime_t ktime_mono_from_to_aux(ktime_t this_now, ktime_t this_base, ktime_t other_base,
   177					      u32 conv_mult)
   178	{
   179		ktime_t this_delta, other_delta;
   180	
   181		/* Both operands are guaranteed to be positive, no over- or underflow is possible. */
   182		this_delta = ktime_sub(this_now, this_base);
   183	
   184		/* Only values in this range can be converted without overflow. */
 > 185		this_delta = clamp(this_delta, 0, TK_AUX_MONO_CONV_MAX_DELTA_NS);
   186	
   187		other_delta = (this_delta * conv_mult) >> TK_AUX_MONO_CONV_SHIFT;
   188	
   189		/*
   190		 * Underflow is impossible, as other_base is always positive.
   191		 * Overflow is impossible, as other_base will never become big enough.
   192		 */
   193		return ktime_add(other_base, other_delta);
   194	}
   195	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
