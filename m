Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74044C147;
	Fri, 19 Jul 2024 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721391261; cv=none; b=CPbkXlJsndCciB0B5RQ5tkrx5Y5NFdjAbKPpr8/hZ5thNKpaZIMyTu2BAXAJwwEtZWb5e4K3pSJ27J/kY0NwzIZ4IWFXniCXBDGRSz7e3fSgtUn8tE1An0UW7q1LjRSFOt5o5FFyM1R/kHCxVBUw2ToSsYf8wFMOaVi06xGQBLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721391261; c=relaxed/simple;
	bh=85EKwa3Rh6hiyiVvxO0vPFdpeA7I3dbxQDpv1GoOpUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hsBasLxO4ldpI0BsOf47ZEPGYE7tqz3eZTIdZmd7E4MYYBKxa3zSn3utHZq3LKiVJMFeE2wQYDcpSHv97wUnFnMNq+iFeveYUkG/dvCNJWg5pxUGCumExs6EmZYfo7/lExKtbMCMN7lFxMIKqS/mJQodR3qw5Rq1rcldktlfOy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B361kssE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B361kssE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721391260; x=1752927260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=85EKwa3Rh6hiyiVvxO0vPFdpeA7I3dbxQDpv1GoOpUQ=;
  b=B361kssEQRPkTBovPm5K9M5Ar4pMcDdToaPVanMiyk66ay22lPDNTpTl
   G3Mib5Oi4vD1OffMl15KYSdb8Wv8dTuTOh4p8xiBcNL9qDClkpthvd0SG
   6RM8XcAyiFpeUnPSKX58Ck0+qW2PuW4DaPN8SXc9JYdV1hHU+Cy4LLMSM
   drrOxS/CVPN4jRygSERU8o+0MIzT+zwpfOXt7Tv+KxxMkQDS8CXY55fTn
   zgxVuBBfkUX+6XOkGlbBFtLNvPTD9VwYphROWDqcODlo4Hwrg9nf0S2KV
   qH3d14FYBcIOlng0MVXDs9TnuVtI0vHPMlsuHezHHTsmty/9FI/s90wYN
   g==;
X-CSE-ConnectionGUID: kooiZQN9S4qLGs37YuyVBg==
X-CSE-MsgGUID: ZWzJdYKNT6epuUvWURz21g==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19113134"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="19113134"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 05:14:19 -0700
X-CSE-ConnectionGUID: qWSKY0jxR+iBtOLMQMieKw==
X-CSE-MsgGUID: 4yVtVng0T7WAip+eVY/rtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="50992150"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Jul 2024 05:14:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUmV5-000i8U-0i;
	Fri, 19 Jul 2024 12:14:15 +0000
Date: Fri, 19 Jul 2024 20:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 25/25] mm/memory.c:448:12: error: incompatible
 pointer types initializing 'pgtable_t' (aka 'struct page *') with an
 expression of type 'typeof (pte_alloc_one_noprof(mm))' (aka 'struct ptdesc
 *')
Message-ID: <202407192006.ZPbNi38F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   0cbc69cf7dfd23eaec0cd316463493ac0dbdbbb9
commit: 0cbc69cf7dfd23eaec0cd316463493ac0dbdbbb9 [25/25] pgtable: return ptdesc in pte_alloc_one series functions
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240719/202407192006.ZPbNi38F-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407192006.ZPbNi38F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407192006.ZPbNi38F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
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
>> mm/memory.c:448:12: error: incompatible pointer types initializing 'pgtable_t' (aka 'struct page *') with an expression of type 'typeof (pte_alloc_one_noprof(mm))' (aka 'struct ptdesc *') [-Werror,-Wincompatible-pointer-types]
     448 |         pgtable_t new = pte_alloc_one(mm);
         |                   ^     ~~~~~~~~~~~~~~~~~
>> mm/memory.c:4650:21: error: incompatible pointer types assigning to 'pgtable_t' (aka 'struct page *') from 'typeof (pte_alloc_one_noprof(vma->vm_mm))' (aka 'struct ptdesc *') [-Werror,-Wincompatible-pointer-types]
    4650 |                 vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
         |                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memory.c:5013:21: error: incompatible pointer types assigning to 'pgtable_t' (aka 'struct page *') from 'typeof (pte_alloc_one_noprof(vmf->vma->vm_mm))' (aka 'struct ptdesc *') [-Werror,-Wincompatible-pointer-types]
    5013 |                 vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
         |                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 3 errors generated.


vim +448 mm/memory.c

ed33b5a677da33 Qi Zheng           2021-11-05  445  
ed33b5a677da33 Qi Zheng           2021-11-05  446  int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
ed33b5a677da33 Qi Zheng           2021-11-05  447  {
ed33b5a677da33 Qi Zheng           2021-11-05 @448  	pgtable_t new = pte_alloc_one(mm);
ed33b5a677da33 Qi Zheng           2021-11-05  449  	if (!new)
ed33b5a677da33 Qi Zheng           2021-11-05  450  		return -ENOMEM;
362a61ad61199e Nicholas Piggin    2008-05-14  451  
03c4f20454e023 Qi Zheng           2021-11-05  452  	pmd_install(mm, pmd, &new);
2f569afd9ced9e Martin Schwidefsky 2008-02-08  453  	if (new)
2f569afd9ced9e Martin Schwidefsky 2008-02-08  454  		pte_free(mm, new);
1bb3630e89cb8a Hugh Dickins       2005-10-29  455  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  456  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  457  

:::::: The code at line 448 was first introduced by commit
:::::: ed33b5a677da33d6e8f959879bb61e9791b80354 mm: remove redundant smp_wmb()

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
