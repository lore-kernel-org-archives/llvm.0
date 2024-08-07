Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E613AD32;
	Wed,  7 Aug 2024 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723048871; cv=none; b=t8vf97L0cbCAamW+IxjtcFA+ZhCCTZSuwqkKRYVShORz0liG2QO0hUxoB7YmKzDns/8Fu/6jtyY6g3R4sCfVPdIk3khajVRDfmD/Cv8BOqrt7NE1z7kGqS6vyCUfTRTenPVzBI+AFa0nLcpCUN1vmt4dF640QBTeaGtUlFD5VQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723048871; c=relaxed/simple;
	bh=hdG96AIi/ozK61sI39/rXZUy8Wa9uQbLYU6V3RLlPCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dx8M2fjeO2xRT7fcKU6CXiGq6jPbB7LXbYVFcA9zrvBfvNR8XHSpSlduEOlwI/JrFG8RaayoLffkLgObHO2sqAXBMmgipLEnsKUOJdp3s9gOf/iO0+rsHyR7B8aOue38jQEAms/Zjjj0boRIixpQDZ6UgIqkTyvQhKfU/QW2VxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1SuYFeu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1SuYFeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723048870; x=1754584870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hdG96AIi/ozK61sI39/rXZUy8Wa9uQbLYU6V3RLlPCc=;
  b=k1SuYFeu+QR/dNluR5oZXSIJ39sw35V6E2FYgz9H1PmjVEBcF6DRp+Wh
   MhWLCiqwhwgFyOYICnjmdgDlJIazlvNWRQjE9I63rP97gavpdguIfmKlz
   IjHeCKK1rQX8gfVzHke8711uzhmvAdsmNlH9jSVwLHrW5gu1pV+1pDRau
   0HR/HAl/xNQ2x9UV7br40EthXpKgnEzJAVGJ7XHEt7PHG3RF0IVLoHKVC
   1FWDiviBdUXGlyU/lISXAoOirK2NeIPghjjF58KqZjPmsiVpy3yK0NuMW
   MW0uyw1biVyfem4DGbFaLZWM823WI2/2FJHXXBelo5YRhENYdvJO/IkSO
   g==;
X-CSE-ConnectionGUID: Jq9urmm/Qoe+K4cBDeJkgw==
X-CSE-MsgGUID: 9TRP3stFSOGj/Na6g3qFqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20707785"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="20707785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 09:41:05 -0700
X-CSE-ConnectionGUID: n6Zdv+6fR/CedPfS2jhPtw==
X-CSE-MsgGUID: nlW3u+1GRLWjFOHJ97sGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61561723"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2024 09:41:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbjif-0005Ya-2O;
	Wed, 07 Aug 2024 16:41:01 +0000
Date: Thu, 8 Aug 2024 00:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29899/30000]
 drivers/clk/qcom/videocc-x1e80100.c:106:32: warning: unused variable
 'video_cc_parent_map_0'
Message-ID: <202408080001.kG3CXszv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: 7c495ed7ccac8963ac2d25b151f505a7b7d467e3 [29899/30000] fixup: clk: qcom: Add videocc driver for x1e80100
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408080001.kG3CXszv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080001.kG3CXszv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080001.kG3CXszv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/qcom/videocc-x1e80100.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/qcom/videocc-x1e80100.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/clk/qcom/videocc-x1e80100.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/clk/qcom/videocc-x1e80100.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/clk/qcom/videocc-x1e80100.c:106:32: warning: unused variable 'video_cc_parent_map_0' [-Wunused-const-variable]
     106 | static const struct parent_map video_cc_parent_map_0[] = {
         |                                ^~~~~~~~~~~~~~~~~~~~~
   18 warnings generated.


vim +/video_cc_parent_map_0 +106 drivers/clk/qcom/videocc-x1e80100.c

5bd6442e16cd34 Rajendra Nayak 2023-08-01  105  
5bd6442e16cd34 Rajendra Nayak 2023-08-01 @106  static const struct parent_map video_cc_parent_map_0[] = {
5bd6442e16cd34 Rajendra Nayak 2023-08-01  107  	{ P_BI_TCXO, 0 },
5bd6442e16cd34 Rajendra Nayak 2023-08-01  108  };
5bd6442e16cd34 Rajendra Nayak 2023-08-01  109  

:::::: The code at line 106 was first introduced by commit
:::::: 5bd6442e16cd347ac36f16bb9c11da32ef49862d clk: qcom: Add videocc driver for x1e80100

:::::: TO: Rajendra Nayak <quic_rjendra@quicinc.com>
:::::: CC: Abel Vesa <abel.vesa@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
