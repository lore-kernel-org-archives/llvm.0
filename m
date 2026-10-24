Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806106;
	b=ng3Tl7CSwoZhbES+3h+RffOPl7k7nGqK6FW+dk/ywBmz4bE17FwAkjS7WgMux7GCh/SS
	 bQjIyXT9PX3uFlfhsd7XUlmf2Wfa3Uq5YZ+C/EYB7zlHqQorMEAhhbWt5cEf5k/PDD8P8
	 ij614Ed+/ZZZn3isFNucZpqdF0vP6gw90VIM4/6pyADGKMfjmDImTFSej6HtMETmDnFOF
	 dOA1VDhiDX2wo+bIwy9bDiA9fF52WvtkWSJaWqwpp3rXOmf9nv/f3rpvWkTvlL7CaOsu+
	 AhMq/Ra8+VqGON9o7tehZfUmogWaI53VYZmR9BrRvqMxQrjGarQumCWEnDrOehTXg2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806106;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7GhrXJO4Df/irB2j1j5hl5ngrdtmuszGWIMXcAqzGYI=;
	b=Y049sD37+0Fcr8AZQNlxtYFRGHZGUj5mWITuru5DB+4cPdel8kdJtLW/Fc1X6Gxkl+29
	 5e2QHYLWaMIyt/WkIBFoW+vfoXsotBDOT/91Qv+AE8fxcHQSTpI5c3f5dA5MFk4X/vvsk
	 r8oK6/NavTwVADzAgDE3SDsTpRVPs7qMJx9ffAbWH+2GcfeMwkCO39/RjIA5pMwALyWB4
	 vwm2AKsYbFhslNywTaLLPD0qxzkT6lySmbTK+VcHFR1JgtXo8BdwU0wQRwCcvq2IR+RL5
	 Wb3Yx5pT+gjd9KG6tw65FYlGGdLSZfDUVNLLEdHP+ECtX0YgwRrjOeaBbsdsLzZ71cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGCCFJnN;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD7606A31A;
	Sat, 24 Oct 2026 01:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADBD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGCCFJnN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792806102; x=1824342102;
  h=date:from:to:cc:subject:message-id;
  bh=VQ4lPdSJWPRH7e92DQIOZWD4w2dOVoqXmhgk7IJ4mTg=;
  b=QGCCFJnN9hVyVe9N2Utqi8AeonXslI5ZuuK6tkydHHTPv2AxXPZgFEFD
   HBaYygI91+faqT+7fWWZxb/Ng3ErpQ35ktUcKvoxoXE/7fgSxgQob/qff
   DaWAMh9aPkgAtm/VuLCjTBiDxxYW7zWCYuIIoVEs2+u2zgc3T4kx3uqLw
   PzDXdvCZ5sTiDfRbZdcXST5aVKXlsOFtWEfJKTz2uqx2dsVBJRP10Q4yb
   uPnUEGuh37h1Gd7MFWzwPLydFJvIWKH2zglPF06VCAuT7P4ewqF1zaspo
   W1i+YUxP030Dy1xaUshMw51rYP/bm0/jEgOfvEEtSvZAl9QBZOYKRATN1
   Q==;
X-CSE-ConnectionGUID: ud0rFtw7S5+B1cd6MLzTsg==
X-CSE-MsgGUID: u8kzHUOERfKOX+hq92WCCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1454915"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1454915"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 18:41:42 -0700
X-CSE-ConnectionGUID: W/TT8K+JQcGEzqMwVWy8kw==
X-CSE-MsgGUID: 5z0wDXaMT9Kr2uhrfUcbCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5630171"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Oct 2026 18:41:40 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKQlO-00000000TUA-04VP;
	Sat, 24 Oct 2026 01:41:38 +0000
Date: Sat, 24 Oct 2026 09:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 15/16]
 include/trace/events/f2fs.h:2738:19: error: call to undeclared function
 'get_pages'; ISO C99 and later do not support implicit function declarations
Message-ID: <202610240934.1IgSWaSw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   4e2ecc51889d46d6803c200c9d70c38d5049cb59
commit: 25f24ed74ab3a7d7b67e2e82fe504d19295f2421 [15/16] f2fs: introduce trace_f2fs_enable_checkpoint()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261024/202610240934.1IgSWaSw-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240934.1IgSWaSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240934.1IgSWaSw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:42:
   In file included from include/trace/events/f2fs.h:2761:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:489:
>> include/trace/events/f2fs.h:2738:19: error: call to undeclared function 'get_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2738 |                 __entry->meta   = get_pages(sbi, F2FS_DIRTY_META);
         |                                   ^
   include/trace/events/f2fs.h:2738:19: note: did you mean 'get_page'?
   include/linux/mm.h:2125:20: note: 'get_page' declared here
    2125 | static inline void get_page(struct page *page)
         |                    ^
   In file included from fs/f2fs/super.c:42:
   In file included from include/trace/events/f2fs.h:2761:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
>> include/trace/events/f2fs.h:2738:19: error: call to undeclared function 'get_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2738 |                 __entry->meta   = get_pages(sbi, F2FS_DIRTY_META);
         |                                   ^
   2 errors generated.


vim +/get_pages +2738 include/trace/events/f2fs.h

  2719	
  2720		TP_PROTO(struct f2fs_sb_info *sbi, u16 phase),
  2721	
  2722		TP_ARGS(sbi, phase),
  2723	
  2724		TP_STRUCT__entry(
  2725			__field(dev_t, dev)
  2726			__field(u16, phase)
  2727			__field(long long, meta)
  2728			__field(long long, imeta)
  2729			__field(long long, nodes)
  2730			__field(long long, data)
  2731			__field(long long, dents)
  2732			__field(long long, qdata)
  2733		),
  2734	
  2735		TP_fast_assign(
  2736			__entry->dev	= sbi->sb->s_dev;
  2737			__entry->phase	= phase;
> 2738			__entry->meta	= get_pages(sbi, F2FS_DIRTY_META);
  2739			__entry->imeta	= get_pages(sbi, F2FS_DIRTY_IMETA);
  2740			__entry->nodes	= get_pages(sbi, F2FS_DIRTY_NODES);
  2741			__entry->data	= get_pages(sbi, F2FS_DIRTY_DATA);
  2742			__entry->dents	= get_pages(sbi, F2FS_DIRTY_DENTS);
  2743			__entry->qdata	= get_pages(sbi, F2FS_DIRTY_QDATA);
  2744		),
  2745	
  2746		TP_printk("dev = (%d,%d), phase: %s, meta: %lld, imeta: %lld, "
  2747			"nodes: %lld, data: %lld, dents: %lld, qdata: %lld",
  2748			show_dev(__entry->dev),
  2749			show_enable_cp_phase(__entry->phase),
  2750			__entry->meta,
  2751			__entry->imeta,
  2752			__entry->nodes,
  2753			__entry->data,
  2754			__entry->dents,
  2755			__entry->qdata)
  2756	);
  2757	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
