Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961FF4435;
	Sat, 25 Nov 2023 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wgz+FxhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700897075; x=1732433075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=akDnM2kZPFoKnotfTWpvEVHQ2FZN3itt1bPsrne+AfI=;
  b=Wgz+FxhXF5GkSjzXOOYv14uMf1fTJ/UQUbfrnNKC/rGmqz3sh9E+Aafs
   dnsJGb0Y5Ryo/uhEUDfsxczkPnZeThQvh+CAv+twDIBhwchTypHgicGKs
   wDSCzsFgjry1gykkk4yl/7uFcduG8kHcLa0FbzMso0+G1CZCNuLh49Srv
   SpX7HzUverSv2O3U2y8MAHfnrTlM+fAO9/qU6pnvNrIQ4oc70NS2oL98q
   suf6KCNTQON77wlnS/yjRZMJZegx7laGSIXkc+HPqj7TFi30H/J/2eEF7
   SsxTSlLV9rNgDK0aWgxn7IN9E41fndTNNILNLKjdODcOhn319oEtVKTY2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377546090"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="377546090"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="941093726"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="941093726"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Nov 2023 23:24:31 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6n1h-0003j8-2M;
	Sat, 25 Nov 2023 07:24:29 +0000
Date: Sat, 25 Nov 2023 15:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Message-ID: <202311251303.UOiJlP4m-lkp@intel.com>
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
config: hexagon-randconfig-001-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251303.UOiJlP4m-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251303.UOiJlP4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251303.UOiJlP4m-lkp@intel.com/

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
   arch/hexagon/kernel/irq_cpu.c:22:13: error: static declaration of 'unmask_irq' follows non-static declaration
   static void unmask_irq(struct irq_data *data)
               ^
   include/linux/irq.h:662:13: note: previous declaration is here
   extern void unmask_irq(struct irq_desc *desc);
               ^
>> arch/hexagon/kernel/irq_cpu.c:48:16: error: incompatible function pointer types initializing 'void (*)(struct irq_data *)' with an expression of type 'void (struct irq_desc *)' [-Werror,-Wincompatible-function-pointer-types]
           .irq_unmask     = unmask_irq,
                             ^~~~~~~~~~
   6 warnings and 2 errors generated.


vim +48 arch/hexagon/kernel/irq_cpu.c

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
