Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071A12561
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663919419; x=1695455419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=541maJMIqeYc+trWLsc9+u0f7KuAV6zoN3csGgwaWiY=;
  b=Ouaw2XKDGAubdzGU/1GAfBRKDxoLOnvk3CXinmpTu0KIPa5VQ/Gu3jcq
   ecUly8jeeMY85g2DJJCITG0xjOmqKnq3gQrOUsj3Cdg4jCTLs4CzXwxD1
   P/Ej76ANa8dji6YXwEmZqIqjei+hoTIQE46nonu37tvO8AnHNjhaenA1J
   mqVV9m0cmSjgKiLp7hkFgUmnhDYAxUoqhrbkOowLP8jGYn17+74lc6WO+
   iisZzJg2G2WEHiClp+5XswqLQNzbDXxb/HL77LcdVKtNWsvzJFjS9fAmi
   /3AksGmxpyutvAr1Zm9We2w9UCvQKclodZ5ALvuY0ADXxGch4IWumIS22
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280903602"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="280903602"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 00:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="948932919"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2022 00:50:08 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obdRn-0005RY-2P;
	Fri, 23 Sep 2022 07:50:07 +0000
Date: Fri, 23 Sep 2022 15:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: Binglei Wang <l3b2w1@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: arch/riscv/kernel/probes/rethook.c:10:22: warning: no previous
 prototype for function 'arch_rethook_trampoline_callback'
Message-ID: <202209231518.BeRYebh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220922-214607/Binglei-Wang/rethook-add-riscv-rethook-implementation/20220922-120748
head:   859acf9e4b9a99384f7a8085032c9844ea0fc4f6
commit: 859acf9e4b9a99384f7a8085032c9844ea0fc4f6 rethook: add riscv rethook implementation.
date:   18 hours ago
config: riscv-randconfig-r013-20220922 (https://download.01.org/0day-ci/archive/20220923/202209231518.BeRYebh5-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/859acf9e4b9a99384f7a8085032c9844ea0fc4f6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20220922-214607/Binglei-Wang/rethook-add-riscv-rethook-implementation/20220922-120748
        git checkout 859acf9e4b9a99384f7a8085032c9844ea0fc4f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/probes/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/riscv/kernel/probes/rethook.c:6:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> arch/riscv/kernel/probes/rethook.c:10:22: warning: no previous prototype for function 'arch_rethook_trampoline_callback' [-Wmissing-prototypes]
   unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
                        ^
   arch/riscv/kernel/probes/rethook.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
   ^
   static 
   8 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - DRM_TTM_HELPER [=m] && HAS_IOMEM [=y] && DRM [=m]
   - DRM_HISI_HIBMC [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && (ARM64 || COMPILE_TEST [=y])


vim +/arch_rethook_trampoline_callback +10 arch/riscv/kernel/probes/rethook.c

     8	
     9	/* This is called from arch_rethook_trampoline() */
  > 10	unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
    11	{
    12		return rethook_trampoline_handler(regs, regs->s0);
    13	}
    14	NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
    15	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
