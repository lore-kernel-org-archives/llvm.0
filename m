Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE092F3C
	for <llvm@lists.linux.dev>; Sun,  1 May 2022 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651447240; x=1682983240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q/N+BHlCsu3KMCwdhRkCaAq2+VcUCLEZL1SifIVZ52U=;
  b=PBeTxr9m5gNcRs49AFcLmYUEMzksR769+7rqQiHi9AUO6Mc3vcGsJPnj
   2H6nbaMUjk43tU69v2Ln0LWvIT+dLE84s3YK1Apk/CxPCxTgbbRH4/T3j
   EYSKL0m7TNsaz79G4STe9b5lMomMWTduu4GNlse+k2TVN5RWYvmqTtTlQ
   kYD/n8rAsrbgMGTC6kp1x3K90ANVBcWlp0oJVzaRGtUI7oNEa9WSDAiSh
   LY7hQFEckknxc8HRlGXVYqfzfCqz+BVjSTkbKB1KYzMpx6QyFEy29v6vc
   4e9l6As56icEgZjzM0Porbdht1pMpqYy7nZ0BIx/JTcVWn8BhZ9KLtEBW
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="267236990"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="267236990"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 16:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="707375378"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 May 2022 16:20:37 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlIrl-00097T-4s;
	Sun, 01 May 2022 23:20:37 +0000
Date: Mon, 2 May 2022 07:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
	michael.jamet@intel.com, mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, gil.fine@intel.com,
	linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 5/5] thunderbolt: Change TMU mode to Hifi-Uni once DP
 tunneled
Message-ID: <202205020718.NyhJst1y-lkp@intel.com>
References: <20220501203321.19021-6-gil.fine@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501203321.19021-6-gil.fine@intel.com>

Hi Gil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc5 next-20220429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gil-Fine/thunderbolt-CL1-support-for-USB4-and-Titan-Ridge/20220502-042620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b2da7df52e16110c8d8dda0602db81c15711e7ff
config: riscv-randconfig-r003-20220501 (https://download.01.org/0day-ci/archive/20220502/202205020718.NyhJst1y-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6693a7867a8fe56f34792011896bb3486803f511
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gil-Fine/thunderbolt-CL1-support-for-USB4-and-Titan-Ridge/20220502-042620
        git checkout 6693a7867a8fe56f34792011896bb3486803f511
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/thunderbolt/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/thunderbolt/tb.c:15:
   In file included from drivers/thunderbolt/tb.h:13:
   In file included from include/linux/pci.h:38:
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
   In file included from drivers/thunderbolt/tb.c:15:
   In file included from drivers/thunderbolt/tb.h:13:
   In file included from include/linux/pci.h:38:
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
   In file included from drivers/thunderbolt/tb.c:15:
   In file included from drivers/thunderbolt/tb.h:13:
   In file included from include/linux/pci.h:38:
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
>> drivers/thunderbolt/tb.c:266:71: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                           tb_dbg(tb, "Fail switching TMU to HiFi for 1st depth router %d\n", ret);
                                                                                              ^~~
   drivers/thunderbolt/tb.h:661:72: note: expanded from macro 'tb_dbg'
   #define tb_dbg(tb, fmt, arg...) dev_dbg(&(tb)->nhi->pdev->dev, fmt, ## arg)
                                                                          ^~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                ^~~~~~~~~~~
   include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   drivers/thunderbolt/tb.c:259:10: note: initialize the variable 'ret' to silence this warning
                   int ret;
                          ^
                           = 0
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   8 warnings and 20 errors generated.


vim +/ret +266 drivers/thunderbolt/tb.c

   246	
   247	/*
   248	 * Once a DP tunnel exists in the domain, we set the TMU mode so that
   249	 * it meets the accuracy requirements and also enables CLx entry (CL0s).
   250	 * We set the TMU mode of the first depth router(s) for CL0s to work.
   251	 */
   252	static int tb_enable_tmu_1st_child(struct tb *tb, enum tb_switch_tmu_rate rate)
   253	{
   254		struct tb_switch *root_sw = tb->root_switch;
   255		struct tb_port *port;
   256	
   257		tb_switch_for_each_port(root_sw, port) {
   258			struct tb_switch *sw;
   259			int ret;
   260	
   261			if (!tb_port_has_remote(port) || !tb_port_is_null(port))
   262				continue;
   263			sw = port->remote->sw;
   264			tb_switch_tmu_configure(sw, rate, tb_switch_is_clx_enabled(sw));
   265			if (tb_switch_tmu_enable(sw))
 > 266				tb_dbg(tb, "Fail switching TMU to HiFi for 1st depth router %d\n", ret);
   267		}
   268	
   269		return 0;
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
