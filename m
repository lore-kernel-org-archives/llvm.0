Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9362A2C3258;
	Thu, 20 Nov 2025 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638805; cv=none; b=cFiQFKVJblwbEJCyncnZEZBg66Oxjw6AgMZJ7gB616wMHipXX1pVnqJhoJK+8hZ+OfWSc0nbfrX+ThQU4EOhm3KrQD1ZrlTwdhzyGxvtLqhPo/kPGcQcBgXa56chZ6NrzMbZ99D8JsCFV4/C1yK62IOzPC5y45PchgPyN1Z5T0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638805; c=relaxed/simple;
	bh=9gmizr7Vz19Px3eczQZcy02bkouE56SZq2c6V7Uf9XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zso5ZmYH5S51L8bOHN0d47oFXbzzMDM3ObwgIjcXPrHYcRX6Of8L0SW8XQbQf8f7RGkfv0qQxYH/Xg90cUGdbnK2dxqNWDITC1Yfohbe1rj/DpOukV/smV3iNuvPCJZkfUMHjoDRJvmjP8fgrQ5TXW0fIEwZataXezN6kmxULTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lp2Fv11a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lp2Fv11a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763638803; x=1795174803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9gmizr7Vz19Px3eczQZcy02bkouE56SZq2c6V7Uf9XQ=;
  b=lp2Fv11a62FrMA9IriDDFrhkFZ0lFPQERewxZ81wqDkS1u88+EGfDFhI
   4xkdIWrIunTSFKtpY8vRm8CpW4RC1u3p2LJ524sRZJf1LxTXLeb4fhcQS
   F+tRl6WSiSXdniyVvoDudXILChk+ku/+57ipNhDy0cWTISauc3VF6PpXc
   jWbnSvirly6bk9X/p1A9vXK1FeOBIKzEPmXVdhMB/ySKgqiu77Cm/M2hQ
   blE4M4Nof3cD/xVC3YRuBGtVCcghr2owQRBkFUkeMphwwIwy89ZOfqOC6
   0oK8Ps+BBWmFwltt/LBjGikD7L1Fpu8zuQkAILboYLNpsppILzRA0CpNM
   Q==;
X-CSE-ConnectionGUID: 7LMeNCOPQJmp313gDC934w==
X-CSE-MsgGUID: uK+pKQHYQ2y72LUolbeM5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="91188601"
X-IronPort-AV: E=Sophos;i="6.20,317,1758610800"; 
   d="scan'208";a="91188601"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 03:40:02 -0800
X-CSE-ConnectionGUID: 2+q+Bn3aTLi8dNNa3z90OA==
X-CSE-MsgGUID: uLwfa42sRJ6EDrHgEQVhVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222274192"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Nov 2025 03:40:01 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM314-0003v9-2G;
	Thu, 20 Nov 2025 11:39:58 +0000
Date: Thu, 20 Nov 2025 19:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [POC][RFC][PATCH 2/3] ftrace: Add perf counters to function
 tracing
Message-ID: <202511201931.aqNiFonA-lkp@intel.com>
References: <20251118003531.805883570@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118003531.805883570@kernel.org>

Hi Steven,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on next-20251120]
[cannot apply to linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Add-perf-events/20251118-083721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251118003531.805883570%40kernel.org
patch subject: [POC][RFC][PATCH 2/3] ftrace: Add perf counters to function tracing
config: s390-randconfig-001-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201931.aqNiFonA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201931.aqNiFonA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201931.aqNiFonA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_functions.c:538:5: warning: 'CONFIG_PERF_EVENTS' is not defined, evaluates to 0 [-Wundef]
     538 | #if CONFIG_PERF_EVENTS
         |     ^
   1 warning generated.


vim +/CONFIG_PERF_EVENTS +538 kernel/trace/trace_functions.c

   529	
   530	static struct tracer_opt func_opts[] = {
   531	#ifdef CONFIG_STACKTRACE
   532		{ TRACER_OPT(func_stack_trace, TRACE_FUNC_OPT_STACK) },
   533	#endif
   534		{ TRACER_OPT(func-no-repeats, TRACE_FUNC_OPT_NO_REPEATS) },
   535	#ifdef CONFIG_FUNCTION_TRACE_ARGS
   536		{ TRACER_OPT(func-args, TRACE_FUNC_OPT_ARGS) },
   537	#endif
 > 538	#if CONFIG_PERF_EVENTS
   539		{ TRACER_OPT(func-cpu-cycles, TRACE_FUNC_OPT_PERF_CYCLES) },
   540		{ TRACER_OPT(func-cache-misses, TRACE_FUNC_OPT_PERF_CACHE) },
   541	#endif
   542		{ } /* Always set a last empty entry */
   543	};
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
