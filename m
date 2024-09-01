Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127FB1E50B;
	Sun,  1 Sep 2024 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725198589; cv=none; b=QfcyWA3SzB03RlHFMqKcRuAua9joKGE8p759MokHmK1LaZxMCIESkKsR257z7bCSKLkEuLQwszcheGN17Y0Ix7psBxuzg8N7Ol/wH4dydJINSdEg99UAB5L6RobLnWii8txJL1OGIbX9amaDOyie+jxYHJPMSM/Jouff02zH4b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725198589; c=relaxed/simple;
	bh=4tEgYWGw1ADqb7hFRr1E4rF8g91o3q27l4jV5IrN0WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxdB4kKBYvY7sy3E8fIfcDWcQ3S2NwUM5UkKwpb9b510jW7e03f0cupr9VYGZ2rcdBNL8EpZ0ThQEM28oLvoMzmtLU122YHhNNtVObMpr2o0r2rFZ//WH0oYGguGtlVurXNAYWbxfOW0Z8EtxeryBQ9s13OR4KbN+97i3aB98Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAfTwSF/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAfTwSF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725198587; x=1756734587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4tEgYWGw1ADqb7hFRr1E4rF8g91o3q27l4jV5IrN0WY=;
  b=dAfTwSF/gb30/14Lorj4a49Y0zTues7eUOtiqnGj/s/cg5ni4Xho7SCH
   bOwsQ8L/w0coW4TZF+c9BRr1/x18mRKV6EorYljVu9Jg7Wea20B9JfoOH
   Kzp2kp6cdzQ8GDlIE2xYq/yZERrmRWxo53CTeraGcpV2pG0vBMCXIncW6
   fwUWKIr9KH2Trw61kiWtkWAwR+NrO0xQuhkP1WpKtwHGphQYUPF9lVRVq
   FeIruwcsUJe+UILjz8yb7fzgMDFww6yxiWi4aT6TJJkmZRSNME/H8t6UT
   l8CEhiqqDuMsaJLk+YD8rMGGtSteYN/7lvcCgYXIzEEDaXGMOnwRlS6sR
   w==;
X-CSE-ConnectionGUID: LHeUQWtTTW6BybB6o5O3ew==
X-CSE-MsgGUID: XVWbkjnlRoKrnOUJWMP4sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23590985"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="23590985"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 06:49:47 -0700
X-CSE-ConnectionGUID: /syDmaSGRB258k/2yMWVHg==
X-CSE-MsgGUID: lBFXEBnaQNG2+zro91ZJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="69249982"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Sep 2024 06:49:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skkxb-0003hi-0p;
	Sun, 01 Sep 2024 13:49:43 +0000
Date: Sun, 1 Sep 2024 21:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sachin Parekh <sachinparekh@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] driver core: platform: Call iommu_release_device in
 dma_cleanup
Message-ID: <202409012129.wNTAUtIZ-lkp@intel.com>
References: <20240829120504.2976612-1-sachinparekh@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829120504.2976612-1-sachinparekh@google.com>

Hi Sachin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sachin-Parekh/driver-core-platform-Call-iommu_release_device-in-dma_cleanup/20240829-200729
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240829120504.2976612-1-sachinparekh%40google.com
patch subject: [RFC PATCH] driver core: platform: Call iommu_release_device in dma_cleanup
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240901/202409012129.wNTAUtIZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409012129.wNTAUtIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409012129.wNTAUtIZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/base/platform.c:15:
   In file included from include/linux/of_irq.h:7:
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
   In file included from drivers/base/platform.c:15:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/base/platform.c:15:
   In file included from include/linux/of_irq.h:7:
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
>> drivers/base/platform.c:1472:3: error: call to undeclared function 'iommu_release_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1472 |                 iommu_release_device(dev);
         |                 ^
   drivers/base/platform.c:1472:3: note: did you mean 'iommu_detach_device'?
   include/linux/iommu.h:1115:20: note: 'iommu_detach_device' declared here
    1115 | static inline void iommu_detach_device(struct iommu_domain *domain,
         |                    ^
   12 warnings and 1 error generated.


vim +/iommu_release_device +1472 drivers/base/platform.c

  1463	
  1464	static void platform_dma_cleanup(struct device *dev)
  1465	{
  1466		struct platform_driver *drv = to_platform_driver(dev->driver);
  1467	
  1468		if (!drv->driver_managed_dma)
  1469			iommu_device_unuse_default_domain(dev);
  1470	
  1471		if (dev_of_node(dev))
> 1472			iommu_release_device(dev);
  1473	}
  1474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
