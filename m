Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433DE253F12;
	Thu, 14 Aug 2025 06:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755153451; cv=none; b=u16su9mCEzdBVBRnc+Y8KrzB1p4p+WujZAhSnlSwnWWHqL039k3UowuaxJa2sEhuMdJibEniWMynYoBPqYMAbZEG+ASzySvodZsXYNdDYm7gXZjCn8A2PAfWD6CU7tYtHTXlADPCnqx460RwSjk6G5OpnpuGjfc1fOxEQxajctA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755153451; c=relaxed/simple;
	bh=Bz1atUoEf/yQPoc+B0KkOZCY/bNDcSlOllWHm1ASYuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbvYcGeRMU4UDGn1jZhvjoQWmjKlG2i1tO3rE5kycdCXm02af9vJK6zStckAzLdTnVyLV9dszZzBK4+Dy6lH8JzQIzEXtXc9wC0IO9cJTWxRXTFOUZU0DoGciKdIywUrAud+LgcM7Fdu7vOygs06e7Lex1bhgpuUTzMI3c2frUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkS5o41D; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkS5o41D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755153450; x=1786689450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bz1atUoEf/yQPoc+B0KkOZCY/bNDcSlOllWHm1ASYuM=;
  b=bkS5o41DXkqLuQic6ouKYdk6EwXasv0KriCdKSQKaqXh4P9dZsLE43f1
   Ul6itJFaNRXfACyvyB/Tq7qxCCiWigy/wvAq/UKVQBssdSICjxNaisrVG
   UwoS1h9wH68M8vIjy7l/41ok/hzRBOBFXzRzNAktQwSDX2FcHHOT6CDJS
   7udIO6ZjIG+WQ6/nJnz02qQtPji798KtUsaWIsFBaJp3Z28hyrvWjrNLv
   6hyYPCC/9t2d9fG/M7WZ2f/tu1rQsyKPgttAZ6NJ6RofI1R5SeydgJ+zk
   Cli+bI4dLCCShVRLsOUmicJvPSvtS3uAglRzHfxMvCj2wEW7/C+S4ZPVP
   Q==;
X-CSE-ConnectionGUID: gJ11hieXTzqz11O2+WyzZw==
X-CSE-MsgGUID: BXoREOw1RJCuPvKyaZVfpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57329129"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57329129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 23:37:29 -0700
X-CSE-ConnectionGUID: 63wpKtS+SYSj3L7Kh7MbjA==
X-CSE-MsgGUID: f7V0aADYTKGyJb52uej3Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167487346"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2025 23:37:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umRaX-000Aeo-1D;
	Thu, 14 Aug 2025 06:37:25 +0000
Date: Thu, 14 Aug 2025 14:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Graham <ethan.w.s.graham@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC 6/6] crypto: implement KFuzzTest targets for PKCS7
 and RSA parsing
Message-ID: <202508141445.OdXh6p0u-lkp@intel.com>
References: <20250813133812.926145-7-ethan.w.s.graham@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813133812.926145-7-ethan.w.s.graham@gmail.com>

Hi Ethan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.17-rc1 next-20250814]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Graham/mm-kasan-implement-kasan_poison_range/20250813-214228
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250813133812.926145-7-ethan.w.s.graham%40gmail.com
patch subject: [PATCH v1 RFC 6/6] crypto: implement KFuzzTest targets for PKCS7 and RSA parsing
config: i386-buildonly-randconfig-004-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141445.OdXh6p0u-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141445.OdXh6p0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141445.OdXh6p0u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/rsa_helper.c:12:
>> include/linux/kfuzztest.h:134:3: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     133 |         pr_info("reloc_table: { num_entries = %u, padding = %u } @ offset 0x%lx", rt->num_entries, rt->padding_size,
         |                                                                             ~~~
         |                                                                             %x
     134 |                 (char *)rt - (char *)regions);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:580:34: note: expanded from macro 'pr_info'
     580 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from crypto/rsa_helper.c:12:
   include/linux/kfuzztest.h:140:37: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     140 |         pr_info("payload: [0x%lx, 0x%lx)", (char *)payload_start - (char *)regions,
         |                              ~~~           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              %x
   include/linux/printk.h:580:34: note: expanded from macro 'pr_info'
     580 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from crypto/rsa_helper.c:12:
   include/linux/kfuzztest.h:141:3: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     140 |         pr_info("payload: [0x%lx, 0x%lx)", (char *)payload_start - (char *)regions,
         |                                     ~~~
         |                                     %x
     141 |                 (char *)payload_end - (char *)regions);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:580:34: note: expanded from macro 'pr_info'
     580 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   3 warnings generated.


vim +134 include/linux/kfuzztest.h

cc1dba9238a428 Ethan Graham 2025-08-13  116  
cc1dba9238a428 Ethan Graham 2025-08-13  117  /*
cc1dba9238a428 Ethan Graham 2025-08-13  118   * Dump some information on the parsed headers and payload. Can be useful for
cc1dba9238a428 Ethan Graham 2025-08-13  119   * debugging inputs when writing an encoder for the KFuzzTest input format.
cc1dba9238a428 Ethan Graham 2025-08-13  120   */
cc1dba9238a428 Ethan Graham 2025-08-13  121  __attribute__((unused)) static inline void kfuzztest_debug_header(struct reloc_region_array *regions,
cc1dba9238a428 Ethan Graham 2025-08-13  122  								  struct reloc_table *rt, void *payload_start,
cc1dba9238a428 Ethan Graham 2025-08-13  123  								  void *payload_end)
cc1dba9238a428 Ethan Graham 2025-08-13  124  {
cc1dba9238a428 Ethan Graham 2025-08-13  125  	uint32_t i;
cc1dba9238a428 Ethan Graham 2025-08-13  126  
cc1dba9238a428 Ethan Graham 2025-08-13  127  	pr_info("regions: { num_regions = %u } @ %px", regions->num_regions, regions);
cc1dba9238a428 Ethan Graham 2025-08-13  128  	for (i = 0; i < regions->num_regions; i++) {
cc1dba9238a428 Ethan Graham 2025-08-13  129  		pr_info("  region_%u: { start: 0x%x, size: 0x%x }", i, regions->regions[i].offset,
cc1dba9238a428 Ethan Graham 2025-08-13  130  			regions->regions[i].size);
cc1dba9238a428 Ethan Graham 2025-08-13  131  	}
cc1dba9238a428 Ethan Graham 2025-08-13  132  
cc1dba9238a428 Ethan Graham 2025-08-13  133  	pr_info("reloc_table: { num_entries = %u, padding = %u } @ offset 0x%lx", rt->num_entries, rt->padding_size,
cc1dba9238a428 Ethan Graham 2025-08-13 @134  		(char *)rt - (char *)regions);
cc1dba9238a428 Ethan Graham 2025-08-13  135  	for (i = 0; i < rt->num_entries; i++) {
cc1dba9238a428 Ethan Graham 2025-08-13  136  		pr_info("  reloc_%u: { src: %u, offset: 0x%x, dst: %u }", i, rt->entries[i].region_id,
cc1dba9238a428 Ethan Graham 2025-08-13  137  			rt->entries[i].region_offset, rt->entries[i].value);
cc1dba9238a428 Ethan Graham 2025-08-13  138  	}
cc1dba9238a428 Ethan Graham 2025-08-13  139  
cc1dba9238a428 Ethan Graham 2025-08-13  140  	pr_info("payload: [0x%lx, 0x%lx)", (char *)payload_start - (char *)regions,
cc1dba9238a428 Ethan Graham 2025-08-13  141  		(char *)payload_end - (char *)regions);
cc1dba9238a428 Ethan Graham 2025-08-13  142  }
cc1dba9238a428 Ethan Graham 2025-08-13  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
