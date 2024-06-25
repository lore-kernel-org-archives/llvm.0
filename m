Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2F143C49;
	Tue, 25 Jun 2024 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719352656; cv=none; b=LUJWb3rARmggUQJapwwSgh0zwRGRWFe1kduD9Cuvlq6PNWB6AByUTKFT1YxJOOjJfhA1v02M+tU01b2hdrQM3MjoSNGoGaW+KdRGcaF0vbW1wIQg9+reiSNUv8IpdU10h4YfJw0mj8zYTbQmakW/yza7GobSvwQmm7GjM1EjBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719352656; c=relaxed/simple;
	bh=/737HDrqOVPczNuRbU+qBkwcXu3ZsSzUfxwCaPeT+9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5ODvOg+21cjrFSHNMMjuOS2Zu6e/X+XfB0C0gf2cWtDmBOUwPO6rp2vpm1l1pILmdGoXQXwNV2kJ/OJIgQdfhtnjj6ioblBfJsCGSYMvtB+8W/5NzGLkHsaCl/MYwQ2xkzNStly7BRvd+UWu12OQ+rXu/N9fZOd7m9vU8HWAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAq3btIx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAq3btIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719352655; x=1750888655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/737HDrqOVPczNuRbU+qBkwcXu3ZsSzUfxwCaPeT+9E=;
  b=UAq3btIxxRpR/Fga52xjuRZyWmg3y/guVw0YxK4KtNKB7Kjgwz/YQROy
   fE+JakPz/JYAwUv9ozHW9iW9f3XY7k4WHVrn24aaaBS9jarib3ZapdUWT
   udZJFG3r5YBYFdnnXdxnbQZBxDdDoycpEaiupsFisQEifjEViihUDGglx
   FzIbTwgwBJhPqFbdePFQ2poi+cVfIXoHiy7VD5BhfTQO38ESNeEjgcj6S
   84irkAHBpr7/n9ivY72tntQiyoC5dWQU/g95izX9//AbewuIJzoFotMUV
   EO3876kkxnI/aXii/dG2ndHKOMBcK7j/jGLj5vBsfNyc8Bp8Hyj0zEgcZ
   Q==;
X-CSE-ConnectionGUID: 7LqWLnE9Q+WwLlbThcH/Yg==
X-CSE-MsgGUID: jZq+KkU3RLWF762VMGBcyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33853841"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="33853841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 14:57:28 -0700
X-CSE-ConnectionGUID: vzxqxW+kRFyUiH8rIE6bkg==
X-CSE-MsgGUID: WKGELWE4TGO0E81gznV/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48178267"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jun 2024 14:57:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMEAH-000Ekg-0Y;
	Tue, 25 Jun 2024 21:57:25 +0000
Date: Wed, 26 Jun 2024 05:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: daire.mcnamara@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/3] PCI: microchip: Fix inbound address translation
 tables
Message-ID: <202406260553.oh9Ai6yy-lkp@intel.com>
References: <20240621112915.3434402-3-daire.mcnamara@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621112915.3434402-3-daire.mcnamara@microchip.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/daire-mcnamara-microchip-com/PCI-microchip-Fix-outbound-address-translation-tables/20240625-161731
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240621112915.3434402-3-daire.mcnamara%40microchip.com
patch subject: [PATCH v4 2/3] PCI: microchip: Fix inbound address translation tables
config: i386-buildonly-randconfig-001-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260553.oh9Ai6yy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260553.oh9Ai6yy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260553.oh9Ai6yy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-microchip-host.c:1000:39: warning: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 4294967296 to 0 [-Wconstant-conversion]
    1000 |                         mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~          ^~~~~
   include/linux/sizes.h:46:18: note: expanded from macro 'SZ_4G'
      46 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:27:1: note: expanded from here
      27 | 0x100000000ULL
         | ^~~~~~~~~~~~~~
>> drivers/pci/controller/pcie-microchip-host.c:949:9: error: call to '__compiletime_assert_227' declared with 'error' attribute: FIELD_PREP: value too large for the field
     949 |         val |= FIELD_PREP(ATR_SIZE_MASK, atr_sz);
         |                ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:448:2: note: expanded from macro '_compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:441:4: note: expanded from macro '__compiletime_assert'
     441 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:3:1: note: expanded from here
       3 | __compiletime_assert_227
         | ^
   1 warning and 1 error generated.


vim +949 drivers/pci/controller/pcie-microchip-host.c

   937	
   938	static void mc_pcie_setup_inbound_atr(int window_index, u64 axi_addr, u64 pcie_addr, size_t size)
   939	{
   940		void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
   941		u32 table_offset = window_index * ATR_ENTRY_SIZE;
   942		void __iomem *table_addr = bridge_base_addr + table_offset;
   943		u32 atr_sz;
   944		u32 val;
   945	
   946		atr_sz = ilog2(size) - 1;
   947	
   948		val = ALIGN_DOWN(lower_32_bits(pcie_addr), SZ_4K);
 > 949		val |= FIELD_PREP(ATR_SIZE_MASK, atr_sz);
   950		val |= FIELD_PREP(ATR_IMPL_ENABLE_MASK, 1);
   951	
   952		writel(val, table_addr + ATR0_PCIE_WIN0_SRCADDR_PARAM);
   953	
   954		writel(upper_32_bits(pcie_addr), table_addr + ATR0_PCIE_WIN0_SRC_ADDR);
   955	
   956		writel(lower_32_bits(axi_addr), table_addr + ATR0_PCIE_WIN0_TRSL_ADDR_LSB);
   957		writel(upper_32_bits(axi_addr), table_addr + ATR0_PCIE_WIN0_TRSL_ADDR_UDW);
   958	
   959		writel(TRSL_ID_AXI4_MASTER_0, table_addr + ATR0_PCIE_WIN0_TRSL_PARAM);
   960	}
   961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
