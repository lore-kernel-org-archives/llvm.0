Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5324379F2;
	Sat, 25 Nov 2023 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6oKtAF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700898229; x=1732434229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUotlKVbKNCg36X6xDAsXFx5MD+HjusfkFLH3NXqtis=;
  b=a6oKtAF0/RrSk4gMrn6uUP3gSzHNiU7dQq4iqcOxiU6pyEZ+/FFbdLc8
   ADH2V0yvX881pDHXqCoDCffQfdjuJzwoOjKeSMIchSR5zPGdte5+Rgh+0
   x0p5fquyaDxzX4AP39JulbMBPTpubuvsqZOcnPdt+UC5cj7cBVdXln1mn
   qyg4hS5KL3PYTQH5CKszRi9EXu3gtu38UGt3y8e71QDiRDJ10MtXv+1Jf
   kBl3ZXtnxK+q6nTbr+/5hZ1fHbQmnX9CF0mGr57VaqGPatClDChKWCd5w
   suJqiAoeBl6zxWOtmezntitkSa0YDjSFhP8z7TR9HLIoVA7No9V7slxAZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392266113"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="392266113"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911623524"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="911623524"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 23:43:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6nKE-0003k8-15;
	Sat, 25 Nov 2023 07:43:38 +0000
Date: Sat, 25 Nov 2023 15:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Message-ID: <202311251435.j0xYajwA-lkp@intel.com>
References: <20231124103123.3263471-3-Jiqian.Chen@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124103123.3263471-3-Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.7-rc1]
[also build test ERROR on next-20231124]
[cannot apply to xen-tip/linux-next tip/irq/core tip/x86/core linus/master v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-Add-xen_reset_device_state-function/20231124-183607
base:   v6.7-rc1
patch link:    https://lore.kernel.org/r/20231124103123.3263471-3-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough device in PVH dom0
config: hexagon-randconfig-002-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251435.j0xYajwA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251435.j0xYajwA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251435.j0xYajwA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/irq_cpu.c:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from arch/hexagon/kernel/irq_cpu.c:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/hexagon/kernel/irq_cpu.c:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> arch/hexagon/kernel/irq_cpu.c:22:13: error: static declaration of 'unmask_irq' follows non-static declaration
   static void unmask_irq(struct irq_data *data)
               ^
   include/linux/irq.h:662:13: note: previous declaration is here
   extern void unmask_irq(struct irq_desc *desc);
               ^
>> arch/hexagon/kernel/irq_cpu.c:48:16: error: incompatible function pointer types initializing 'void (*)(struct irq_data *)' with an expression of type 'void (struct irq_desc *)' [-Wincompatible-function-pointer-types]
           .irq_unmask     = unmask_irq,
                             ^~~~~~~~~~
   6 warnings and 2 errors generated.


vim +/unmask_irq +22 arch/hexagon/kernel/irq_cpu.c

2ac211bc423a0e Richard Kuo 2011-10-31  21  
2ac211bc423a0e Richard Kuo 2011-10-31 @22  static void unmask_irq(struct irq_data *data)
2ac211bc423a0e Richard Kuo 2011-10-31  23  {
2ac211bc423a0e Richard Kuo 2011-10-31  24  	__vmintop_locen((long) data->irq);
2ac211bc423a0e Richard Kuo 2011-10-31  25  }
2ac211bc423a0e Richard Kuo 2011-10-31  26  
2ac211bc423a0e Richard Kuo 2011-10-31  27  /*  This is actually all we need for handle_fasteoi_irq  */
2ac211bc423a0e Richard Kuo 2011-10-31  28  static void eoi_irq(struct irq_data *data)
2ac211bc423a0e Richard Kuo 2011-10-31  29  {
2ac211bc423a0e Richard Kuo 2011-10-31  30  	__vmintop_globen((long) data->irq);
2ac211bc423a0e Richard Kuo 2011-10-31  31  }
2ac211bc423a0e Richard Kuo 2011-10-31  32  
2ac211bc423a0e Richard Kuo 2011-10-31  33  /* Power mamangement wake call. We don't need this, however,
2ac211bc423a0e Richard Kuo 2011-10-31  34   * if this is absent, then an -ENXIO error is returned to the
2ac211bc423a0e Richard Kuo 2011-10-31  35   * msm_serial driver, and it fails to correctly initialize.
2ac211bc423a0e Richard Kuo 2011-10-31  36   * This is a bug in the msm_serial driver, but, for now, we
2ac211bc423a0e Richard Kuo 2011-10-31  37   * work around it here, by providing this bogus handler.
2ac211bc423a0e Richard Kuo 2011-10-31  38   * XXX FIXME!!! remove this when msm_serial is fixed.
2ac211bc423a0e Richard Kuo 2011-10-31  39   */
2ac211bc423a0e Richard Kuo 2011-10-31  40  static int set_wake(struct irq_data *data, unsigned int on)
2ac211bc423a0e Richard Kuo 2011-10-31  41  {
2ac211bc423a0e Richard Kuo 2011-10-31  42  	return 0;
2ac211bc423a0e Richard Kuo 2011-10-31  43  }
2ac211bc423a0e Richard Kuo 2011-10-31  44  
2ac211bc423a0e Richard Kuo 2011-10-31  45  static struct irq_chip hexagon_irq_chip = {
2ac211bc423a0e Richard Kuo 2011-10-31  46  	.name		= "HEXAGON",
2ac211bc423a0e Richard Kuo 2011-10-31  47  	.irq_mask	= mask_irq,
2ac211bc423a0e Richard Kuo 2011-10-31 @48  	.irq_unmask	= unmask_irq,
2ac211bc423a0e Richard Kuo 2011-10-31  49  	.irq_set_wake	= set_wake,
2ac211bc423a0e Richard Kuo 2011-10-31  50  	.irq_eoi	= eoi_irq
2ac211bc423a0e Richard Kuo 2011-10-31  51  };
2ac211bc423a0e Richard Kuo 2011-10-31  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
