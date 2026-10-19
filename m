Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9809848F037;
	Mon, 19 Oct 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401278; cv=none; b=CwQ1KbJAOILV8v0HCaiZ0nNdmPT17tquUuKyutq67StulvJF0fxprvJlzAj+c/RDWDTkuwhV9jLrvuyfqIWDcvv4+yI5lzUhP4vKvAJW4DNa4+o3B4MvcEgXCzGPE8V28MecCoBcv5Q4kJJFhN9S9velh5gm6/+ks6UrBcdFy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401278; c=relaxed/simple;
	bh=ckOPABLP2bt9R/kZo9gNXDmi0jYfWPMrrxD75uClSjY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qlcdKjszSQI6+9zw4Jka29TyFKvhZha/E2TUyGH7s5sMDguG851FjCnMvymawBQxc72LUpgrR3yMfTx9jsJVsQDxLYuT9cWRIxoq1DR/B9o5N+EAHBEa/Mj6z93TYMpFeL+f0mgTywwlRoC3ggbo3wnOW6bN4wv72W6zx+P5VR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZD7wJ7Z0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZD7wJ7Z0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792401277; x=1823937277;
  h=date:from:to:cc:subject:message-id;
  bh=ckOPABLP2bt9R/kZo9gNXDmi0jYfWPMrrxD75uClSjY=;
  b=ZD7wJ7Z0jupPjx88qFE+iM8ULiXaQVOaHLfj92jBZjQpFaFXHg/CqO2n
   3321U+uLBl97OAiv1nGvpTBAFO/vA8/AMx60tEqFXYu14VK+cqeBe8Cof
   AkSCwtX50yNrPYWut92m7axHQvbLVb5S6d9c6rGt5xpNVjIP7OdBwEdzr
   pas64Zo8toFOIfs4m+WOYSO6Tvfg4IHpKssvIZnOAz7HqxHModFZHgeif
   qk7Obh5bw04Sh8t+wafheNtOQaU4xkgrSeAC0lLwepBYZepb8UcYe28Il
   Bf1ZyFq6ojMmWsrLSlp85kMVpiIw9EY5FmBl8l6W+4igjBtFr6VBQ6Oif
   w==;
X-CSE-ConnectionGUID: 1gKB/OyeRseKvs7inqUX3w==
X-CSE-MsgGUID: susTmqIcTrilWUGBzH43IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1093812"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1093812"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:14:37 -0700
X-CSE-ConnectionGUID: hSbzRhQpRHaQkr+UfAsGmg==
X-CSE-MsgGUID: a5hiVcSCQUefLu9hfqlnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2574734"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 02:14:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIjRw-00000000LSu-2Ku1;
	Mon, 19 Oct 2026 09:14:32 +0000
Date: Mon, 19 Oct 2026 17:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 8/22] arch/x86/kernel/smpboot.o: warning:
 objtool: arch_cpuhp_sync_state_poll+0x36: no-cfi indirect call!
Message-ID: <202610191744.RsnRC3xK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   1abf4915b934f55c588e220cfc73188a5d4f13a7
commit: 20f58aa1dc32160414033482f1b4ee292279d225 [8/22] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-1010-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191744.RsnRC3xK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191744.RsnRC3xK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191744.RsnRC3xK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smpboot.o: warning: objtool: arch_cpuhp_sync_state_poll+0x36: no-cfi indirect call!
--
>> arch/x86/events/core.o: warning: objtool: perf_check_microcode+0xf: no-cfi indirect call!
>> arch/x86/events/core.o: warning: objtool: x86_pmu_aux_output_match+0x18: no-cfi indirect call!
--
>> arch/x86/kernel/acpi/boot.o: warning: objtool: acpi_unregister_gsi+0xf: no-cfi indirect call!
--
>> drivers/ssb/sprom.o: warning: objtool: ssb_fill_sprom_with_fallback+0xf: no-cfi indirect call!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
