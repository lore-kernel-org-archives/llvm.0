Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436229CA
	for <llvm@lists.linux.dev>; Sat, 22 Jan 2022 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642862742; x=1674398742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vhR7cR4eOo8lrsWY0PuU178rKDTS93fAiJOIhYx9ejI=;
  b=dkxrqGEHTbDKRs1rJFf9XnEm7gs6VInAeFZ14rLX73rpK4J5ZODH/sbB
   kEJVO247JBYt30fz7OHCVRvEerxOY1oNI4lf9dI55eWDa4K9K0ytBANTS
   vS9ae/VsDEz+9G/gEo+fP/0ZU9bqQ/04kTnGPhhDCd0KEcZm/fOWgPnqM
   AZ/BO+19eKqekEsrHIKt2YRuPVcCIamhdcCBRvw10FBFuQZJN5F/CfyU3
   9tnWdG3CsVzzrm8aoErT3v0GHo2jo7tqNL58VIFlcuc+pt553IqZPZHbU
   ph74hWjr5EwaAg5zWwtJO6X5gq5zh3HRrcyImjBeznDKgEgGuYNBZ3Ir7
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="243421555"
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="243421555"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2022 06:45:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="478560409"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Jan 2022 06:45:40 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBHe7-000GVE-G6; Sat, 22 Jan 2022 14:45:39 +0000
Date: Sat, 22 Jan 2022 22:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: Francis Laniel <flaniel@linux.microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3 2/2] security/inode.c: Add capabilities file.
Message-ID: <202201222235.SOQYCPHW-lkp@intel.com>
References: <20220120180116.167702-3-flaniel@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120180116.167702-3-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Francis,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linux/master]
[also build test ERROR on linus/master jmorris-security/next-testing v5.16 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Francis-Laniel/Add-capabilities-file-to-sysfs/20220121-020524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1d1df41c5a33359a00e919d54eaebfb789711fdc
config: riscv-randconfig-r026-20220120 (https://download.01.org/0day-ci/archive/20220122/202201222235.SOQYCPHW-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/48b37f6e79a73709d7bcf17ea19464073f5da9b6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Francis-Laniel/Add-capabilities-file-to-sysfs/20220121-020524
        git checkout 48b37f6e79a73709d7bcf17ea19464073f5da9b6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from security/inode.c:18:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:11:
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
   In file included from security/inode.c:18:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:11:
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
   In file included from security/inode.c:18:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:11:
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
>> security/inode.c:362:24: error: implicit declaration of function 'securityfs' [-Werror,-Wimplicit-function-declaration]
           capabilities_dentry = securityfs("capabilities", 0444, NULL, NULL,
                                 ^
>> security/inode.c:362:22: warning: incompatible integer to pointer conversion assigning to 'struct dentry *' from 'int' [-Wint-conversion]
           capabilities_dentry = securityfs("capabilities", 0444, NULL, NULL,
                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   8 warnings and 1 error generated.


vim +/securityfs +362 security/inode.c

   344	
   345	static int __init securityfs_init(void)
   346	{
   347		int retval;
   348	
   349		retval = sysfs_create_mount_point(kernel_kobj, "security");
   350		if (retval)
   351			return retval;
   352	
   353		retval = register_filesystem(&fs_type);
   354		if (retval) {
   355			sysfs_remove_mount_point(kernel_kobj, "security");
   356			return retval;
   357		}
   358	#ifdef CONFIG_SECURITY
   359		lsm_dentry = securityfs_create_file("lsm", 0444, NULL, NULL,
   360							&lsm_ops);
   361	#endif
 > 362		capabilities_dentry = securityfs("capabilities", 0444, NULL, NULL,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
