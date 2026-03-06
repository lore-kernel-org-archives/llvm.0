Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340936EAB3;
	Fri,  6 Mar 2026 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772824123; cv=none; b=eJkzMu6TjM+MMwvyAwp2Jc/mdrv85YEBa5nHjIY1uX3JWQcE3b5tJOvwLWY0w3E3TuCOWzbUZdzT1/UBf8bfIVNDWhstJoU2KQzKJGZ431qgAQeBVUo1rIj5lKc+i6TZJMB1TJvZJj2Qjf6FQx8DvOzzOa1Tleeqe+dU8F3VDyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772824123; c=relaxed/simple;
	bh=G6sap95s+O3olN+hPIYXDMFfrHCfy4hXHRMB/RmkQTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRhnJPegBabxH9c8VMeVaUBeverMb7XExx1952VL9mtyUBAQHTSXZoxFMZHpuqBQAC+QjlJPaUiYshABE52pIXPVFe0i4Xm8Bj6nnai3NrSZy8AHrriTp0aZtEsYlA+iCMRxm88PvNJBDp8RDmV1FSggpRzmKsL39kg6f5pUaWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNqzv8NF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNqzv8NF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772824121; x=1804360121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G6sap95s+O3olN+hPIYXDMFfrHCfy4hXHRMB/RmkQTU=;
  b=TNqzv8NFXWYqTfYv0qx4meR6uu03BaH/zw7qnVPCLtStxm0Xor3RAoZK
   vh4cZ9nlPDwHZT7w2j3NdjSk1Co9enLaH9MsinS/mcSdHJSk3lrnnZGhE
   Oydt5pA+bAP656l0vEgtfBAo0zQULC1iCQxFWpycwek9RvW52pqBq+yp4
   tBsPHbQXHkUvQNNjF4MJbvcsmG+kIlkQwwPDpg9AujaI/jXast1Wadu5x
   2WMyu7b2ir/hEoiYLbXpMIpsIO9wU+0UVnWlD1ACW2eZtVoxHj6+OnZF7
   v8tQL9OOBROu4tNWtZHFxx3K+rZUc0bGA5/BSKALzCCFoOPceYLpVMtdf
   g==;
X-CSE-ConnectionGUID: woXGK4n8TW6hr8Ejr2uewg==
X-CSE-MsgGUID: QehSi6/ESA+yt0F5yyenuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84265952"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84265952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 11:08:40 -0800
X-CSE-ConnectionGUID: RrdBNMv9R16dlvy5i3wzrQ==
X-CSE-MsgGUID: KCZ7O9OWQsGsDgpCm7LNeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="215747407"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 11:08:39 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyaXM-000000001Hl-0xx4;
	Fri, 06 Mar 2026 19:08:36 +0000
Date: Sat, 7 Mar 2026 03:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] tracing: Move snapshot code out of trace.c and into
 trace_snapshot.c
Message-ID: <202603070230.Zz4BBLtb-lkp@intel.com>
References: <20260305211810.3f48aa07@robin>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305211810.3f48aa07@robin>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0-rc2]
[cannot apply to trace/for-next linus/master next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Move-snapshot-code-out-of-trace-c-and-into-trace_snapshot-c/20260306-102714
base:   v7.0-rc2
patch link:    https://lore.kernel.org/r/20260305211810.3f48aa07%40robin
patch subject: [PATCH] tracing: Move snapshot code out of trace.c and into trace_snapshot.c
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260307/202603070230.Zz4BBLtb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070230.Zz4BBLtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070230.Zz4BBLtb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace.c:820:5: warning: no previous prototype for function 'tracing_alloc_snapshot' [-Wmissing-prototypes]
     820 | int tracing_alloc_snapshot(void)
         |     ^
   kernel/trace/trace.c:820:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     820 | int tracing_alloc_snapshot(void)
         | ^
         | static 
   1 warning generated.


vim +/tracing_alloc_snapshot +820 kernel/trace/trace.c

ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  792) 
93e31ffbf417a84 Tom Zanussi              2013-10-24  793  /**
93e31ffbf417a84 Tom Zanussi              2013-10-24  794   * tracing_alloc_snapshot - allocate snapshot buffer.
93e31ffbf417a84 Tom Zanussi              2013-10-24  795   *
93e31ffbf417a84 Tom Zanussi              2013-10-24  796   * This only allocates the snapshot buffer if it isn't already
93e31ffbf417a84 Tom Zanussi              2013-10-24  797   * allocated - it doesn't also take a snapshot.
93e31ffbf417a84 Tom Zanussi              2013-10-24  798   *
93e31ffbf417a84 Tom Zanussi              2013-10-24  799   * This is meant to be used in cases where the snapshot buffer needs
93e31ffbf417a84 Tom Zanussi              2013-10-24  800   * to be set up for events that can't sleep but need to be able to
93e31ffbf417a84 Tom Zanussi              2013-10-24  801   * trigger a snapshot.
93e31ffbf417a84 Tom Zanussi              2013-10-24  802   */
93e31ffbf417a84 Tom Zanussi              2013-10-24  803  int tracing_alloc_snapshot(void)
93e31ffbf417a84 Tom Zanussi              2013-10-24  804  {
93e31ffbf417a84 Tom Zanussi              2013-10-24  805  	struct trace_array *tr = &global_trace;
93e31ffbf417a84 Tom Zanussi              2013-10-24  806  	int ret;
93e31ffbf417a84 Tom Zanussi              2013-10-24  807  
2824f5033248600 Steven Rostedt (VMware   2018-05-28  808) 	ret = tracing_alloc_snapshot_instance(tr);
93e31ffbf417a84 Tom Zanussi              2013-10-24  809  	WARN_ON(ret < 0);
93e31ffbf417a84 Tom Zanussi              2013-10-24  810  
93e31ffbf417a84 Tom Zanussi              2013-10-24  811  	return ret;
93e31ffbf417a84 Tom Zanussi              2013-10-24  812  }
93e31ffbf417a84 Tom Zanussi              2013-10-24  813  EXPORT_SYMBOL_GPL(tracing_alloc_snapshot);
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  814) #else
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  815) void tracing_snapshot(void)
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  816) {
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  817) 	WARN_ONCE(1, "Snapshot feature not enabled, but internal snapshot used");
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  818) }
1b22e382ab40b0e Steven Rostedt (Red Hat  2013-03-09  819) EXPORT_SYMBOL_GPL(tracing_snapshot);
93e31ffbf417a84 Tom Zanussi              2013-10-24 @820  int tracing_alloc_snapshot(void)
93e31ffbf417a84 Tom Zanussi              2013-10-24  821  {
93e31ffbf417a84 Tom Zanussi              2013-10-24  822  	WARN_ONCE(1, "Snapshot feature not enabled, but snapshot allocation used");
93e31ffbf417a84 Tom Zanussi              2013-10-24  823  	return -ENODEV;
93e31ffbf417a84 Tom Zanussi              2013-10-24  824  }
93e31ffbf417a84 Tom Zanussi              2013-10-24  825  EXPORT_SYMBOL_GPL(tracing_alloc_snapshot);
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  826) void tracing_snapshot_alloc(void)
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  827) {
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  828) 	/* Give warning */
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  829) 	tracing_snapshot();
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  830) }
1b22e382ab40b0e Steven Rostedt (Red Hat  2013-03-09  831) EXPORT_SYMBOL_GPL(tracing_snapshot_alloc);
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  832) #endif /* CONFIG_TRACER_SNAPSHOT */
ad909e21bbe69f1 Steven Rostedt (Red Hat  2013-03-06  833) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
