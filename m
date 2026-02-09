Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455C3374165;
	Mon,  9 Feb 2026 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643331; cv=none; b=nO057yI/kPBYwpO1TdgIeKytN9A28vc1/F/xot3F4O7ON8P7M3kczD2v2MDS/nu9EQmmcAY5ni1UINrWyUAE5D/XXzTn34dYgHZLozD3fqHtH/+2Jl7ssjvopKGx3FlTXArQ1i44tu6ggi8e1caetlk5lQ/FgWFYPD4lobEi5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643331; c=relaxed/simple;
	bh=YdxQc3cQwP9XuHywZ41i1xHy/XfNJbBjyXeY7xbXAbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dz7uSuEUL/RadaThiYXDZj111TO9Olct1o1EXFXTwMklmT9pcW6Z3J+CJp8/7fp5RFUpROSQpN7LXysqRQqHzKO7ULYs4h+I+C0W/4G3RGDZ0bV23DODauBHNp4A81ioyCFgDB3BAlmpy1LVtN3IugXZJFjfFLz94XcDfIJJmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbGil4U/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbGil4U/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770643331; x=1802179331;
  h=date:from:to:cc:subject:message-id;
  bh=YdxQc3cQwP9XuHywZ41i1xHy/XfNJbBjyXeY7xbXAbI=;
  b=SbGil4U/inDrbTqCvqIyeIPvWtO9X9bbv75DtBNM8UrnAoALo1mZhRaX
   SYGh+gJa0xcE64mLOgrh8tZXwqvaTdpKE/k+khoWiXS0ZE/svAJDHu2xW
   XhGMtLOTwGoUfQghoALT5EREJJ8n42UbDZ45Jcar/oDk9QtaS+qMPEYcc
   x1/qitpdimopoAwTrDEMDNbZCqnBA+LcODOlgRs6CAjupgchzpNx+0az8
   s4KgYgDzVzbBM2t/FuUs0FvH6xNewkSq+YLrKMYZxBCQ2XXl3PPZqqbNy
   YS8cGBRWhr26S0qTgQWE6u5w9vCp6hyKfJ7OyZtf5HmAPio9CF2MXy2uv
   w==;
X-CSE-ConnectionGUID: heRSexGDRYW4t+YRf3TbxA==
X-CSE-MsgGUID: NIatcxo7TfaS7VDV+AKCNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71816101"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71816101"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 05:22:10 -0800
X-CSE-ConnectionGUID: LWoGoaPWShuk7Evp8yyDzw==
X-CSE-MsgGUID: NYDaygtaT06fsakmWAa/VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211407565"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Feb 2026 05:22:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpRDK-00000000nOr-3GcL;
	Mon, 09 Feb 2026 13:22:06 +0000
Date: Mon, 09 Feb 2026 21:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/for-next 27/40] kernel/trace/trace.c:1967:6:
 error: no member named 'd_max_latency' in 'struct trace_array'; did you mean
 'max_latency'?
Message-ID: <202602092133.fTdojd95-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   c4f1fe47b106e9200cbb1b8951bd75f036d53bd3
commit: ba73713da50e5c24499ca8941171593466ea34f7 [27/40] tracing: Clean up use of trace_create_maxlat_file()
config: arm64-randconfig-003-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092133.fTdojd95-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092133.fTdojd95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092133.fTdojd95-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:1967:6: error: no member named 'd_max_latency' in 'struct trace_array'; did you mean 'max_latency'?
    1967 |         tr->d_max_latency = trace_create_file("tracing_max_latency",
         |             ^~~~~~~~~~~~~
         |             max_latency
   kernel/trace/trace.h:348:17: note: 'max_latency' declared here
     348 |         unsigned long           max_latency;
         |                                 ^
   kernel/trace/trace.c:9789:23: warning: shift count is negative [-Wshift-count-negative]
    9789 |                     !((1ULL << i) & TOP_LEVEL_TRACE_FLAGS)) {
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:523:9: note: expanded from macro 'TOP_LEVEL_TRACE_FLAGS'
     523 |                TRACE_ITER(PROF_TEXT_OFFSET) | FPROFILE_DEFAULT_FLAGS)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.h:1439:42: note: expanded from macro 'TRACE_ITER'
    1439 |         (TRACE_ITER_##flag##_BIT < 0 ? 0 : 1ULL << (TRACE_ITER_##flag##_BIT))
         |                                                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +1967 kernel/trace/trace.c

  1959	
  1960	static void trace_create_maxlat_file(struct trace_array *tr,
  1961					     struct dentry *d_tracer)
  1962	{
  1963	#ifdef LATENCY_FS_NOTIFY
  1964		INIT_WORK(&tr->fsnotify_work, latency_fsnotify_workfn);
  1965		init_irq_work(&tr->fsnotify_irqwork, latency_fsnotify_workfn_irq);
  1966	#endif
> 1967		tr->d_max_latency = trace_create_file("tracing_max_latency",
  1968						      TRACE_MODE_WRITE,
  1969						      d_tracer, tr,
  1970						      &tracing_max_lat_fops);
  1971	}
  1972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
