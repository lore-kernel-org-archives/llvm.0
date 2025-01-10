Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4622066C0;
	Fri, 10 Jan 2025 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736492232; cv=none; b=S2hXHBBC2QUO7qtzMA/X8VRL8SgJg8/Orh3n92oRybDszFo7FFAK0N6Qu9a4M2keaiefy+KOK73k6M0Ulirz/fSilt8Z1JWaP+AOvDPExu90lQS6jaZKJoKvfDXobet5HYYJ/OesUR0JlzMCwiwAvnph4dW4qOQCaXHXjxVpRbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736492232; c=relaxed/simple;
	bh=agmDusN2gX7M5PyEuh88GOX/U8m3oexr3/0V8MNuJxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jhg7O9b1q7K/G9RTqCjJH66GXdxyMp+2B1lSLihsEiM2EaJAXgizpCm6WKc0Ow+Y/KqAtWZs6k4BSYZu5Ov3FiybwvoNXhfVkmHy05znvPHYJwAU6AFNOChrhnmDFu16kwPMwyMx7VJwRe83oEv97GunWSq7qDpEPcizitEzBP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmGJDeeF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmGJDeeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736492232; x=1768028232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=agmDusN2gX7M5PyEuh88GOX/U8m3oexr3/0V8MNuJxc=;
  b=SmGJDeeFcIMtWDbMZxaZLFO5Auj2icvEayJkQ0+uO+22wJDPfn7EdCTy
   VfriSascG4CZ+oH3FUB7EOBQHMf1qzDlbLiR70ikADobLAPmYfJUXxmsg
   TwaRNbfOv5iE43l3xP9ijynJxSp5//QfemNqE/aqgiYZUBUxXlXL3qR12
   /0D1QeyR+lURyqAN+oU4KioSMDKGwUnWn/gX2XJLDs17UUJWjjGTfiaKL
   eO8ciEFgl65SKnXBHi9QQ0y35zyCYg8qTK6wiZz6Bxr6rfWjsaPsJVP0p
   iDf2FrGss0MBLWmgH+lNvpNLYrkQIvQC6a3JRNvF+lGJvSh/OMyPqXEWT
   g==;
X-CSE-ConnectionGUID: cpFfTqQpQN+tBQymS5qMnw==
X-CSE-MsgGUID: AnVc3jEkSaSDXhmgRe+Fow==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40543295"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="40543295"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 22:57:10 -0800
X-CSE-ConnectionGUID: lpLYaxKhS2iMjnF0ECoa9g==
X-CSE-MsgGUID: AZQPejmxQZaC2hgTa8BzXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="104174766"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2025 22:57:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW8x7-000IhH-0g;
	Fri, 10 Jan 2025 06:57:05 +0000
Date: Fri, 10 Jan 2025 14:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/2] efi/memattr: add efi_mem_attr_table as a reserved
 region in 820_table_firmware
Message-ID: <202501101406.jEd6Y91q-lkp@intel.com>
References: <20250108215957.3437660-3-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108215957.3437660-3-usamaarif642@gmail.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/efi-memattr-Use-desc_size-instead-of-total-size-to-check-for-corruption/20250109-060158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20250108215957.3437660-3-usamaarif642%40gmail.com
patch subject: [RFC 2/2] efi/memattr: add efi_mem_attr_table as a reserved region in 820_table_firmware
config: i386-buildonly-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101406.jEd6Y91q-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101406.jEd6Y91q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101406.jEd6Y91q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/platform/efi/efi.c:39:
   In file included from include/linux/memblock.h:12:
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
>> arch/x86/platform/efi/efi.c:169:6: error: redefinition of 'arch_update_firmware_area'
     169 | void arch_update_firmware_area(u64 addr, u64 size)
         |      ^
   include/linux/efi.h:1360:27: note: previous definition is here
    1360 | static inline void __init arch_update_firmware_area(u64 addr, u64 size)
         |                           ^
   4 warnings and 1 error generated.


vim +/arch_update_firmware_area +169 arch/x86/platform/efi/efi.c

   167	
   168	/* Reserve firmware area if it was marked as RAM */
 > 169	void arch_update_firmware_area(u64 addr, u64 size)
   170	{
   171		if (e820__get_entry_type(addr, addr + size) == E820_TYPE_RAM) {
   172			e820__range_update_firmware(addr, size, E820_TYPE_RAM, E820_TYPE_RESERVED);
   173			e820__update_table(e820_table_firmware);
   174		}
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
