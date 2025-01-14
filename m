Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED91230D0A;
	Tue, 14 Jan 2025 02:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736822721; cv=none; b=Q4/cY98HIf057PF5TEL1nQk7rrRbqyu2AfySKMWrWXBXaM2i1PABaXEkRbwxDlg+PUDWn0hMNGqwEuuxDFncz/idH8iB3FV/Ku2LhrjR3odo1AqwNCa11a9P92zQOE9zQSUsBUXsXo6qpxa+BBuL6ur16Qo3VqPr5NI4+cOIgjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736822721; c=relaxed/simple;
	bh=cioVE+JuE8/2v4PUIiU4Ie2P2LoSQjNifrJPTTyOYaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCqbQLqskfP/Sgyl4rGiJx3awlNOsDRRsLuawaOcluTC++bkFA+Zo3E7b2wVnbm3LxIv3ZgF9t556KPDgoV/yFHz0jq2m7qYgLhGOJF/HfThnMj/9Zcw/2uuxKiJcPkgw2Jz7DNB+8brkXcHzRVFhrGd5wSsxp18a5E4UqJlt7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8MggWEC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8MggWEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736822720; x=1768358720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cioVE+JuE8/2v4PUIiU4Ie2P2LoSQjNifrJPTTyOYaY=;
  b=R8MggWECWL+IpVf08fEWNFpQiGDO88BF/GjfPY5UcVa/XblPUmbn9/O5
   AUZsuAQQto8BlT31rIxrKFxssMFYARxeFhMPbEQp28l82zXFkagrCza19
   T8bIOq2JCcJr9HvjmEHv1w2yfmmAAd510BrCnodpP58oaOq3ew8rzS4Tr
   PlrKaL0GJ+zrFyRe14+AJOSQONLsVt7vUNTUSPZOgQMQT9gYs98g9L5vm
   bd8THV5r4u7yzXmK2f2JdY3pG1Om5HcuYQWK4xgjwZxgK4+VR8ZwTN6ft
   YuEUllFiNLvqqqWCCNUvRpkYPYaBbZya8aeyRW7ApiVVPMcl9PcjijTyP
   A==;
X-CSE-ConnectionGUID: N5iaikVeTUi/0r+4Sgev3Q==
X-CSE-MsgGUID: 91DRyRHYRLeeke9h8x6MdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36995726"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="36995726"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 18:45:19 -0800
X-CSE-ConnectionGUID: m5gP7cBgTku4+l0gjpx/tQ==
X-CSE-MsgGUID: 6MX59i6vSGmgZeicN+tVkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="104440125"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2025 18:45:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXWvb-000O2F-1Z;
	Tue, 14 Jan 2025 02:45:15 +0000
Date: Tue, 14 Jan 2025 10:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 17/23]
 drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype
 for function 'entry_offset'
Message-ID: <202501141028.zTzPS0N7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   0b1f356cc24d8a8d151b33e33cbc2d28f510cc5b
commit: e46e411b8a3cc2340076239155158681b3d25b53 [17/23] efi/zboot: Add support for ELF payloads
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250114/202501141028.zTzPS0N7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141028.zTzPS0N7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501141028.zTzPS0N7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/zboot.c:3:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
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
>> drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype for function 'entry_offset' [-Wmissing-prototypes]
      36 | unsigned long entry_offset(void)
         |               ^
   drivers/firmware/efi/libstub/zboot.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | unsigned long entry_offset(void)
         | ^
         | static 
   5 warnings generated.


vim +/entry_offset +36 drivers/firmware/efi/libstub/zboot.c

    35	
  > 36	unsigned long entry_offset(void)
    37	{
    38		return entrypoint;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
