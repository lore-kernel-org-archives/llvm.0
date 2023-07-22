Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B8125A0;
	Sat, 22 Jul 2023 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690008623; x=1721544623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WveFtvrd12fi7Mk6XPX6+gDGaOffxUk+cn8INDc1QPc=;
  b=MAVOdxlVYE0yYtMnS8kQpzx0ViJ7VYxLE2pCvqhBejZyTPsPTgznfotx
   +x3deyANwq9nvWhOL1eYIaicFwe2JBsqqhf3oq1wQZ23B/Q7gHz1ii8Y/
   t5Bhd/nQxLK1VYZTisNMVJPhepVGVfUoHsAZv8QeJXsGJ4a/F+Zwq8Ynn
   f2CJtJUgmxNddJyboRrx8ixDYAJ3FIrZd5NtXtVwfcgwDoCSWPq5zTFvf
   0voafU46SLRp/55n/ELTli/vOo6+a+4CyrXpC8sXggvBlXhQUnHEDYROi
   l2thI7/bTGZuBae2S2eyT/n8qWNmAugUq//0UgOWcxUzpt41Uyd2mXCnU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="367200568"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="367200568"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 23:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898937935"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="898937935"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Jul 2023 23:50:20 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN6RY-00086L-0u;
	Sat, 22 Jul 2023 06:50:20 +0000
Date: Sat, 22 Jul 2023 14:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: kuifeng@meta.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 2/5] bpf: Provide bpf_copy_from_user() and
 bpf_copy_to_user().
Message-ID: <202307221437.QVQzz3cx-lkp@intel.com>
References: <20230722052248.1062582-3-kuifeng@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722052248.1062582-3-kuifeng@meta.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/kuifeng-meta-com/bpf-enable-sleepable-BPF-programs-attached-to-cgroup-get-set-sockopt/20230722-132551
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230722052248.1062582-3-kuifeng%40meta.com
patch subject: [RFC bpf-next 2/5] bpf: Provide bpf_copy_from_user() and bpf_copy_to_user().
config: hexagon-randconfig-r021-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221437.QVQzz3cx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221437.QVQzz3cx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221437.QVQzz3cx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/helpers.c:4:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/bpf/helpers.c:4:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/bpf/helpers.c:4:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/bpf/helpers.c:681:17: warning: no previous prototype for function 'bpf_copy_to_user' [-Wmissing-prototypes]
     681 | __bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
         |                 ^
   kernel/bpf/helpers.c:681:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     681 | __bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
         |             ^
         |             static 
   7 warnings generated.


vim +/bpf_copy_to_user +681 kernel/bpf/helpers.c

   671	
   672	/**
   673	 * long bpf_copy_to_user(void *dst, u32 size, const void *kern_ptr)
   674	 *     Description
   675	 *             Read *size* bytes from kernel space address *kern_ptr* and
   676	 *              store the data in user space address *dst*. This is a
   677	 *              wrapper of **copy_to_user**\ ().
   678	 *     Return
   679	 *             0 on success, or a negative error in case of failure.
   680	 */
 > 681	__bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
   682					 const void *src__ign)
   683	{
   684		int ret = copy_to_user(dst__uninit, src__ign, dst__sz);
   685	
   686		if (unlikely(ret))
   687			return -EFAULT;
   688	
   689		return ret;
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
