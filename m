Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84397F9;
	Thu, 24 Jul 2025 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753352171; cv=none; b=HvwyETk3y0J8h8WzpVID4bgp2PNPap9wBTiAImBOL9yerSEmTQlVtDxVyERfOKnhBvkvx+PAqncLbSooFhAC/Bng/dYRw/Z9VwAG1vpaDVskBJRgl6VDFNlyEbpKq1XuI+G5dPBtPMIOseZltfL5n3SwMZSzH5822VVNVdCNV3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753352171; c=relaxed/simple;
	bh=VVB9qXg1AUsZy4sUF5MVoylaU8u9uqvmy3X0oLIuACA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rzoh3Hv8ssrSApT5blxVr5h7EZPwkZ+QUg6pN3wXulVHf/y+bQCEUuBmEngfDXtego2eymWqcd5F/lIfbbuaGg9/ptBhDUNRmxCIuJ0mhXrvVOxBGCfJF9GoKOxGiEJayppvWHFWDuV3UW2km0XyGDb6p0PHz2kTM3ExyuYFLWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jxuwsq5g; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jxuwsq5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753352170; x=1784888170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVB9qXg1AUsZy4sUF5MVoylaU8u9uqvmy3X0oLIuACA=;
  b=Jxuwsq5giMmdfWc8d1Zj3N/caTK7zbFwWhEGXj/3lSJJ7EK6VTQ0w5c5
   nQypf0buxB4nDZDUSbm9unyo08u0AcVpnjatt1Dd/UQmDQFcK1W5AoQ1+
   kobK2jCqpAFS3R7yRgqXXzDz+nqpA55WhqTv6fjIKTo3mKLIi7fTbC3Dw
   jZh62R93R5OAbJVz6b1MpvzEzuy6t3Bt4ykIu6bwq6w89tI/8oWmvwT9X
   g1trQuotCtPd5Uahg7NiqxSKnuJt31NF2SPfE4dIUtIBdDGIAiLASvk/Z
   Azy7CqQH1a7SKVEyGrQhymQ024EvGx29KHm732kE4ejPD+4vaLsxr3A8F
   A==;
X-CSE-ConnectionGUID: ZOIib+9bS12XA2wvrYWEow==
X-CSE-MsgGUID: 5dhdCxAXStWXxojv7/DZdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55749318"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55749318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 03:16:09 -0700
X-CSE-ConnectionGUID: ocecmmnDS7WZivRmwZsb/A==
X-CSE-MsgGUID: Oo/6XuN4S9KXD46pCrjERg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160670444"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jul 2025 03:16:08 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uesze-000KJ9-0z;
	Thu, 24 Jul 2025 10:16:06 +0000
Date: Thu, 24 Jul 2025 18:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:vm_normal_page_pud 7/10]
 include/linux/pgtable.h:2107:15: error: unexpected token in argument list
Message-ID: <202507241805.BGVBITox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux vm_normal_page_pud
head:   003d8c09bad32ddd03332b6356751f332e161659
commit: ae14c9cd658c8aafb8341ca020db5ec850814c48 [7/10] mm/memory: convert print_bad_pte() to print_bad_pgtable_entry()
config: x86_64-buildonly-randconfig-002-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241805.BGVBITox-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241805.BGVBITox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241805.BGVBITox-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/pgtable.h:2099:21: error: invalid register name
   enum pgtable_level {
                       ^
   include/linux/pgtable.h:2099:21: error: Expected an op-mask register at this point
   enum pgtable_level {
                       ^
   include/linux/pgtable.h:2100:23: error: expected newline
    PGTABLE_LEVEL_PTE = 0,
                         ^
   include/linux/pgtable.h:2101:19: error: unknown token in expression
    PGTABLE_LEVEL_PMD,
                     ^
   include/linux/pgtable.h:2102:19: error: unknown token in expression
    PGTABLE_LEVEL_PUD,
                     ^
   include/linux/pgtable.h:2103:19: error: unknown token in expression
    PGTABLE_LEVEL_P4D,
                     ^
   include/linux/pgtable.h:2104:19: error: unknown token in expression
    PGTABLE_LEVEL_PGD,
                     ^
   include/linux/pgtable.h:2105:1: error: invalid instruction mnemonic '}'
   };
   ^
>> include/linux/pgtable.h:2107:15: error: unexpected token in argument list
   static inline const char* pgtable_level_to_str(enum pgtable_level level)
                 ^
>> include/linux/pgtable.h:2108:2: error: Unexpected token after '{'
   {
    ^
   include/linux/pgtable.h:2109:18: error: invalid register name
    switch (level) {
                    ^
   include/linux/pgtable.h:2109:18: error: Expected an op-mask register at this point
    switch (level) {
                    ^
   include/linux/pgtable.h:2110:24: error: unexpected token in argument list
    case PGTABLE_LEVEL_PTE:
                          ^
>> include/linux/pgtable.h:2111:3: error: invalid instruction mnemonic 'return'
     return "pte";
     ^~~~~~
   include/linux/pgtable.h:2112:24: error: unexpected token in argument list
    case PGTABLE_LEVEL_PMD:
                          ^
   include/linux/pgtable.h:2113:3: error: invalid instruction mnemonic 'return'
     return "pmd";
     ^~~~~~
   include/linux/pgtable.h:2114:24: error: unexpected token in argument list
    case PGTABLE_LEVEL_PUD:
                          ^
   include/linux/pgtable.h:2115:3: error: invalid instruction mnemonic 'return'
     return "pud";
     ^~~~~~
   include/linux/pgtable.h:2116:24: error: unexpected token in argument list
    case PGTABLE_LEVEL_P4D:
                          ^
   include/linux/pgtable.h:2117:3: error: invalid instruction mnemonic 'return'
     return "p4d";
     ^~~~~~
   include/linux/pgtable.h:2118:24: error: unexpected token in argument list
    case PGTABLE_LEVEL_PGD:
                          ^
   include/linux/pgtable.h:2119:3: error: invalid instruction mnemonic 'return'
     return "pgd";
     ^~~~~~
>> include/linux/pgtable.h:2121:3: error: invalid instruction mnemonic 'vm_warn_on_once'
     VM_WARN_ON_ONCE(1);
     ^~~~~~~~~~~~~~~
   include/linux/pgtable.h:2122:3: error: invalid instruction mnemonic 'return'
     return "unknown";
     ^~~~~~
   include/linux/pgtable.h:2123:2: error: invalid instruction mnemonic '}'
    }
    ^
   include/linux/pgtable.h:2124:1: error: invalid instruction mnemonic '}'
   }
   ^


vim +2107 include/linux/pgtable.h

  2098	
  2099	enum pgtable_level {
  2100		PGTABLE_LEVEL_PTE = 0,
  2101		PGTABLE_LEVEL_PMD,
  2102		PGTABLE_LEVEL_PUD,
> 2103		PGTABLE_LEVEL_P4D,
> 2104		PGTABLE_LEVEL_PGD,
  2105	};
  2106	
> 2107	static inline const char* pgtable_level_to_str(enum pgtable_level level)
> 2108	{
> 2109		switch (level) {
  2110		case PGTABLE_LEVEL_PTE:
> 2111			return "pte";
  2112		case PGTABLE_LEVEL_PMD:
  2113			return "pmd";
  2114		case PGTABLE_LEVEL_PUD:
  2115			return "pud";
  2116		case PGTABLE_LEVEL_P4D:
> 2117			return "p4d";
  2118		case PGTABLE_LEVEL_PGD:
  2119			return "pgd";
  2120		default:
> 2121			VM_WARN_ON_ONCE(1);
  2122			return "unknown";
  2123		}
  2124	}
  2125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
