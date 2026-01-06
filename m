Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870E116A956;
	Tue,  6 Jan 2026 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767693168; cv=none; b=RBC6ze/HGGYouDuXrpwqpfU+5zoCXmnUEzyhCPJtXsqhaGlIdAAZ8CqzbIb6ATYLgsn7XsA/L0l38LohUCECoe5iqClY6FtWzyL2hAmuEIFSFcKSdtD7LWB1pMa+yoF56IYSwnyxVxJk5Sx/KiBR4eWo0C5cQYoXJuscD06IQ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767693168; c=relaxed/simple;
	bh=mOlUFndin9zgx0MGvk8HrOVGuVsIhglztWLE0pRaUQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiuFptHJ/nv7hV4CxotfjBhtfhFlTuU6hpMIA2d4z8p2p+oShNCh3OBTy3G651wdFPSz8HSDoC0x6WTIHO9pgU6Ke5gEZLZ29EV0K+O5cXcNuW0d9x7DXZGYIthpLLWF8Cx6hQs/d9EZB2XQldAtqmDj44fbSZo4zK/nj69ym4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VghH3tBT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VghH3tBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767693167; x=1799229167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mOlUFndin9zgx0MGvk8HrOVGuVsIhglztWLE0pRaUQM=;
  b=VghH3tBTxVqLSg76Un09zK/NYEUkMzqsy5BooJwoJb21y51s+ULMjkOW
   Z/rdk0mOFjF96NoApjt1B9Oe8XhActn231xMPDdrj57pl3xd53SHsZQ55
   4ZRZK6YaEW8qMPFNXlBFMquvKRfafwCSNzlr39hUU/Y3dTtCnnXyz9APs
   stbx2D2FLsC6q8JfiOP/Wh5XEVE9Rj9vNQJxeoUdg2oVbkovyHqliN9aV
   1fLItgrXBG1PAXcPbNAKDUCpMIb3V2Pzd14CBz0sG4MM+GWbWQ33bcXVK
   kZxZqVjqbpa78dlRhE5GHDxB9WnUyk6bqoQKARZH2XpRibsx2gXEFU0Is
   Q==;
X-CSE-ConnectionGUID: KGEvdQ0kQ/GLquqcxLEt/Q==
X-CSE-MsgGUID: JvxhGB75Qka15ZPrt61UvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68068608"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68068608"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 01:52:46 -0800
X-CSE-ConnectionGUID: +YfIa3PQQD6W2B4ZHODkJw==
X-CSE-MsgGUID: FGJA41wURhGPFfgtfbwaJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207495077"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jan 2026 01:52:44 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd3k2-000000001IH-3JXz;
	Tue, 06 Jan 2026 09:52:42 +0000
Date: Tue, 6 Jan 2026 10:51:57 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Ballasi <tballasi@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] mm: vmscan: add PIDs to vmscan tracepoints
Message-ID: <202601061007.oLjwuFir-lkp@intel.com>
References: <20260105160423.23708-3-tballasi@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105160423.23708-3-tballasi@linux.microsoft.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Ballasi/mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints/20260106-000721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260105160423.23708-3-tballasi%40linux.microsoft.com
patch subject: [PATCH v3 2/2] mm: vmscan: add PIDs to vmscan tracepoints
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260106/202601061007.oLjwuFir-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061007.oLjwuFir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061007.oLjwuFir-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:73:
   In file included from include/trace/events/vmscan.h:569:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
>> include/trace/events/vmscan.h:140:4: error: call to undeclared function '__event_in_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 | +               __event_in_irq() ? "(in-irq)" : "")
         |                 ^
   include/trace/events/vmscan.h:188:3: error: call to undeclared function '__event_in_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     188 |                 __event_in_irq() ? "(in-irq)" : "")
         |                 ^
   include/trace/events/vmscan.h:263:4: error: call to undeclared function '__event_in_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     263 | +               __event_in_irq() ? "(in-irq)" : "")
         |                 ^
   include/trace/events/vmscan.h:306:4: error: call to undeclared function '__event_in_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     306 | +               __event_in_irq() ? "(in-irq)" : "")
         |                 ^
   4 errors generated.


vim +/__event_in_irq +140 include/trace/events/vmscan.h

   116	
   117		TP_PROTO(gfp_t gfp_flags, int order, unsigned short memcg_id),
   118	
   119		TP_ARGS(gfp_flags, order, memcg_id),
   120	
   121		TP_STRUCT__entry(
   122			__field(	unsigned long,	gfp_flags	)
   123			__field(	int,	order		)
   124			__field(	int,	pid		)
   125			__field(	unsigned short,	memcg_id	)
   126		),
   127	
   128		TP_fast_assign(
   129			__entry->gfp_flags	= (__force unsigned long)gfp_flags;
   130			__entry->order		= order;
   131			__entry->pid		= current->pid;
   132			__entry->memcg_id	= memcg_id;
   133		),
   134	
   135		TP_printk("order=%d gfp_flags=%s pid=%d memcg_id=%u %s",
   136			__entry->order,
   137			show_gfp_flags(__entry->gfp_flags),
   138			__entry->pid,
   139			__entry->memcg_id,
 > 140	+		__event_in_irq() ? "(in-irq)" : "")
   141	);
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
