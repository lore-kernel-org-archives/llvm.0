Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE07A
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654774596; x=1686310596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33cxootEY7Jlxpckk7m1RaDoZNM0cq1b+LgomJohXss=;
  b=NFBjGilkRuS7fpDNby4418wfwtQagVw7aLS+PpLaUdS3kTP6OvddgVSu
   UqOVx/aRH1cF5Lb2jhmNkROkUUAnp2hsQxJrUXHHI0v16kCDWvWIC+QZn
   EQdp1UriDGlvpskLXReze5iSXsBWIuW1uH535dqS69oIlGx73pauyelr2
   HHI8GYlHmHR/7FhR2Nk0EFEUq+BPkvekxb3GiNRGFA/M6H9te8XDA31Ub
   Y1o8yFUXjI5dAhQWvncugv3zXGfxZwVGpVo3mspkQiQzld7K9GJ09cuzd
   kt2kWYCW9AMF/W0Vacgysc3DNrXlEoGD1ovo27LKfFM0oeRyC5kNJe9RD
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="276016308"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="276016308"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 04:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="649211954"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2022 04:36:31 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzGSk-000Fvj-TF;
	Thu, 09 Jun 2022 11:36:30 +0000
Date: Thu, 9 Jun 2022 19:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>
Subject: [avpatel:virtio_rpmsg_bus_fix_v1 45/52]
 arch/riscv/mm/dma-noncoherent.c:65:6: warning: no previous prototype for
 function 'riscv_init_cbom_blocksize'
Message-ID: <202206091918.fF8xyBBM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git virtio_rpmsg_bus_fix_v1
head:   390aaf641ff2f8919268d611e864227265c3f3f2
commit: 3485f5450237db107c3601d2b726458fb98027a6 [45/52] riscv: Implement Zicbom-based cache management operations
config: riscv-randconfig-r042-20220609 (https://download.01.org/0day-ci/archive/20220609/202206091918.fF8xyBBM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/3485f5450237db107c3601d2b726458fb98027a6
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel virtio_rpmsg_bus_fix_v1
        git checkout 3485f5450237db107c3601d2b726458fb98027a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/ kernel/dma/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/mm/dma-noncoherent.c:8:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from arch/riscv/mm/dma-noncoherent.c:8:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/riscv/mm/dma-noncoherent.c:8:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
>> arch/riscv/mm/dma-noncoherent.c:65:6: warning: no previous prototype for function 'riscv_init_cbom_blocksize' [-Wmissing-prototypes]
   void riscv_init_cbom_blocksize(void)
        ^
   arch/riscv/mm/dma-noncoherent.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void riscv_init_cbom_blocksize(void)
   ^
   static 
>> arch/riscv/mm/dma-noncoherent.c:89:6: warning: variable 'cbom_hartid' is uninitialized when used here [-Wuninitialized]
                                           cbom_hartid, hartid);
                                           ^~~~~~~~~~~
   include/linux/printk.h:528:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                              ^~~~~~~~~~~
   include/linux/printk.h:475:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:447:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/riscv/mm/dma-noncoherent.c:73:18: note: initialize the variable 'cbom_hartid' to silence this warning
                   int cbom_hartid;
                                  ^
                                   = 0
   9 warnings generated.
--
   In file included from kernel/dma/pool.c:8:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from kernel/dma/pool.c:8:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/dma/pool.c:8:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
>> kernel/dma/pool.c:105:9: error: call to undeclared function 'pgprot_dmacoherent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                              pgprot_dmacoherent(PAGE_KERNEL),
                                              ^
>> kernel/dma/pool.c:105:9: error: passing 'int' to parameter of incompatible type 'pgprot_t'
                                              pgprot_dmacoherent(PAGE_KERNEL),
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-map-ops.h:235:76: note: passing argument to parameter 'prot' here
   void *dma_common_contiguous_remap(struct page *page, size_t size, pgprot_t prot,
                                                                              ^
   7 warnings and 2 errors generated.


vim +/riscv_init_cbom_blocksize +65 arch/riscv/mm/dma-noncoherent.c

    64	
  > 65	void riscv_init_cbom_blocksize(void)
    66	{
    67		struct device_node *node;
    68		int ret;
    69		u32 val;
    70	
    71		for_each_of_cpu_node(node) {
    72			int hartid = riscv_of_processor_hartid(node);
    73			int cbom_hartid;
    74	
    75			if (hartid < 0)
    76				continue;
    77	
    78			/* set block-size for cbom extension if available */
    79			ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
    80			if (ret)
    81				continue;
    82	
    83			if (!riscv_cbom_block_size) {
    84				riscv_cbom_block_size = val;
    85				cbom_hartid = hartid;
    86			} else {
    87				if (riscv_cbom_block_size != val)
    88					pr_warn("cbom-block-size mismatched between harts %d and %d\n",
  > 89						cbom_hartid, hartid);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
