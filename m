Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B20C185B56;
	Thu,  7 Nov 2024 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731009153; cv=none; b=f1LWq6GUkf3P+VZmPQ6x6K5BaUB1QEEzC+oGWa69kANfcOh74e0lOAVOlTLv5EkC8nnr/2Vx8ea5K7okkpmG/YdYRFh5MPa89lyfZDznrBpy8xlsjAgU81Z4GfqHnujCIxh00igz/XMWNtNFtSK8nXk5G0h5fSwJsBojb8Hxn7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731009153; c=relaxed/simple;
	bh=cTv2IJtY2oZEyU3mmu6NAcZIzE8Q8oIuozfawf8iUiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+gsMIudTZJ8sSuUgVl7n7EtLOf0p6TMr4ng2AfidqIiPW7abMUif71PKcw1kjRx0VqQ5F02Kvh4GbrG1W7VlDQWbfqHsWE6hrwmZ2VVdN73FUhy5phiTyu9wHvbcV9sLmDRJOQI6hE1U5tPzrKkoWsWp4UZs4VPUrl8TpVgteg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+UjRyfE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+UjRyfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731009151; x=1762545151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cTv2IJtY2oZEyU3mmu6NAcZIzE8Q8oIuozfawf8iUiM=;
  b=d+UjRyfEJsofpFFn7YjlKpyA9/O3mnr479ZuPLm+c+tDyRVux7Mi+Y7X
   OknT3FKO1aZS0CPJs2QfOtlYSSEv41JzG3oU+DuHSf9E1Z//O6tDIPHwO
   znYkL6CgB3ccKEjOlsTqcp2rGPDibfTqys8ZHXnb4wP7E0zfaoLxVkciI
   S/IMnfj+Ey0JqeIHZPaYgQIW/UGoO+f4dKalDwgwQpLgM3Hg1IFyg4sju
   2WtNja1Be5YNwE5LEcIhHyv7GVZEOiBtn1VEh58pu9SJpcdIEi7HQMUYM
   rCETs5XbRLzqtQ9z1tQNwax9/8eXaEA1JJWvHsOLUrS3d/TpHv+SXKfFk
   Q==;
X-CSE-ConnectionGUID: xcHW1Fk3QYm4aO+B6Pvhyw==
X-CSE-MsgGUID: hcjt1BX6Q/Skl2yMyp54+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56273175"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="56273175"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:52:31 -0800
X-CSE-ConnectionGUID: pcIzTETWTR6eas7kZ0VTqQ==
X-CSE-MsgGUID: 6ZeMLHnAQRyvSdV7R5/wHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="108480287"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2024 11:52:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t98YN-000qd2-1r;
	Thu, 07 Nov 2024 19:52:27 +0000
Date: Fri, 8 Nov 2024 03:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] x86/cpu/bugs: Consider having old Intel microcode
 to be a vulnerability
Message-ID: <202411080337.HKOT7oZc-lkp@intel.com>
References: <20241107170630.2A92B8D3@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107170630.2A92B8D3@davehans-spike.ostc.intel.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/smp/core]
[also build test ERROR on tip/x86/core]
[cannot apply to tip/master driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus tip/auto-latest linus/master v6.12-rc6 next-20241107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Hansen/x86-cpu-bugs-Consider-having-old-Intel-microcode-to-be-a-vulnerability/20241108-011145
base:   tip/smp/core
patch link:    https://lore.kernel.org/r/20241107170630.2A92B8D3%40davehans-spike.ostc.intel.com
patch subject: [RFC][PATCH] x86/cpu/bugs: Consider having old Intel microcode to be a vulnerability
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241108/202411080337.HKOT7oZc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080337.HKOT7oZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080337.HKOT7oZc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/common.c:5:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/cpu/common.c:1321:
>> arch/x86/kernel/cpu/microcode/intel-ucode-defs.h:2:1: error: expected '}'
       2 | { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6,  .model = 0x05, .steppings = 0x0001, .driver_data = 0x45 }
         | ^
   arch/x86/kernel/cpu/common.c:1320:44: note: to match this '{'
    1320 | struct x86_cpu_id cpu_latest_microcdoe[] = {
         |                                            ^
   4 warnings and 1 error generated.


vim +2 arch/x86/kernel/cpu/microcode/intel-ucode-defs.h

   > 2	{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6,  .model = 0x05, .steppings = 0x0001, .driver_data = 0x45 }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
