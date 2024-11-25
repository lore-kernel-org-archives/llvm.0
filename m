Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5718FDDE;
	Mon, 25 Nov 2024 22:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732573429; cv=none; b=RTbS8agenUKsUqXMErKv0O0yOkyA4oZWfn4SlafMpP9e5iUcm1SX/H0fqlSEQCQ5go8kFh9Ns1sNH97EZXCIwsuUcwi85T1QWmMvUoNXgYJ5YG3/htRgtAw7IMQDI0w1FA/A2C7YxcKpTvZCW//DLmqdt4Im5qXjkJMeH/OzMsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732573429; c=relaxed/simple;
	bh=VOiOYKKB2AomuTECgrbzPW9cDAf3glqiPFj3FOVU0xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIt7SCFPZRC9C0oW6uivGF/rXH5Y0CyM0Vx4pRevurXeVJTLE7oC2BNM4cH3i3QcBjeFdQrKpT0EC2d43Hzc01OIJGpA/ojMCJGRFz4aEaZ5n3DTAY6PunIin283vq016AmX2H9XKzi6x2N1xT+SgM0MPIJAn9bdALl/if9ZuaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c++1tLUe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c++1tLUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732573428; x=1764109428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOiOYKKB2AomuTECgrbzPW9cDAf3glqiPFj3FOVU0xQ=;
  b=c++1tLUeZpBZKIkm4sinYSA4d67S+dkHGyAMEqu8VDFCEAA2xw/uYuwd
   b2izY5eBfyP3LhiAsos+WPG1b/cWWe44dcpkeV44FTxILj/JzIFgiAPmP
   m4pjsZkmIiL2Cb1+mcD3wMHXpzmu8xl0SdZ2UTCCPrqtz22hV42Lt9rf5
   7IuqVfqi0VVZzHno9nF9z827I45MSdil7k8sixgP70d/g/0h8v2DrWQBT
   WF58If0/a5TO53LB4vzqGyFjhr+40W5QcBxNltK3vVe7vFBHNQhv9SE1a
   5QEG05cq5UhA0cSlcLGKfvcybAE69PATsAGT+dRq4zZeL0TvnSCGd/BnZ
   g==;
X-CSE-ConnectionGUID: EYJulEirQ7KGL6Op3Uwf4A==
X-CSE-MsgGUID: ebIPN6JBRXyJ2k4F4wKIlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32649575"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32649575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 14:23:47 -0800
X-CSE-ConnectionGUID: xu9I1bG8SYy2MGkoiQBEng==
X-CSE-MsgGUID: IQwi2F8eS9Kkp/yFv2GBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="114667263"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2024 14:23:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFhUd-0006qk-1f;
	Mon, 25 Nov 2024 22:23:43 +0000
Date: Tue, 26 Nov 2024 06:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/sm8750-dispcc 30/35]
 drivers/clk/qcom/dispcc-sm8750.c:17:10: fatal error:
 'dt-bindings/clock/qcom,sm8750-dispcc.h' file not found
Message-ID: <202411260603.MSOB8Gem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

First bad commit (maybe != root cause):

tree:   https://github.com/krzk/linux b4/sm8750-dispcc
head:   5350ae4691e59d4aa71df7addb636caef6f730f6
commit: b97538c00c8e24fc168f3addbe7eba146b06396b [30/35] sq
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241126/202411260603.MSOB8Gem-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260603.MSOB8Gem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260603.MSOB8Gem-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/qcom/dispcc-sm8750.c:11:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/dispcc-sm8750.c:17:10: fatal error: 'dt-bindings/clock/qcom,sm8750-dispcc.h' file not found
      17 | #include <dt-bindings/clock/qcom,sm8750-dispcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +17 drivers/clk/qcom/dispcc-sm8750.c

9594918bb3708f Krzysztof Kozlowski 2024-11-25  16  
9594918bb3708f Krzysztof Kozlowski 2024-11-25 @17  #include <dt-bindings/clock/qcom,sm8750-dispcc.h>
9594918bb3708f Krzysztof Kozlowski 2024-11-25  18  

:::::: The code at line 17 was first introduced by commit
:::::: 9594918bb3708f775e232e4a0a9b543135dbc6fa WIP

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
:::::: CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
