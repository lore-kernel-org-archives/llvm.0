Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A502E17FF;
	Tue, 13 Jun 2023 03:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686625951; x=1718161951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EQ+j+qBIlCGFw2fPJRN0wVhRT0qvMmL7fMv0nry+c24=;
  b=Tquh1YqJfegzhUKCKWShmSjQi6HCFt1JOSdLYvPTpYL9tH9nZc99bYoS
   8tAOYuy0L6RmXEXBINz/ua+7I2ychhRPpr+1W/vmQMZ/xqrhtPFItBJnE
   oDf0RECBn6KZeKC2/ZBcUQu1l6xa5fgdydFsSbvR6Pne598Ssr2hzjWvo
   rJGbKwSUSMZY1XiWMFN46tM8O/hoKrs5OrYn2Rw2mcouxY1EF0s4OC8bu
   1Od1e1nE1uGfX8D5V83Atcp8P3KB1ZOtNjwCXcfHY8RqCY1wwWBlaCUMr
   JpQLDrxjUMGbqfi0F4p87PZwvHGm12EVFZy+O+VSVWnnDbABT9e7iD36f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347869747"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="347869747"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 20:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711450551"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="711450551"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2023 20:12:27 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8uSI-0000ww-22;
	Tue, 13 Jun 2023 03:12:26 +0000
Date: Tue, 13 Jun 2023 11:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 3/7] bpf: implement devtx hook points
Message-ID: <202306131048.pKMumoot-lkp@intel.com>
References: <20230612172307.3923165-4-sdf@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612172307.3923165-4-sdf@google.com>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/bpf-rename-some-xdp-metadata-functions-into-dev-bound/20230613-012928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230612172307.3923165-4-sdf%40google.com
patch subject: [RFC bpf-next 3/7] bpf: implement devtx hook points
config: hexagon-randconfig-r045-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131048.pKMumoot-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch bpf-next master
        git checkout bpf-next/master
        b4 shazam https://lore.kernel.org/r/20230612172307.3923165-4-sdf@google.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/core/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131048.pKMumoot-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/devtx.c:3:
   In file included from include/net/devtx.h:6:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/core/devtx.c:3:
   In file included from include/net/devtx.h:6:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/core/devtx.c:3:
   In file included from include/net/devtx.h:6:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
>> net/core/devtx.c:41:22: warning: no previous prototype for function 'devtx_sb' [-Wmissing-prototypes]
      41 | __weak noinline void devtx_sb(struct devtx_frame *ctx)
         |                      ^
   net/core/devtx.c:41:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | __weak noinline void devtx_sb(struct devtx_frame *ctx)
         |                 ^
         |                 static 
>> net/core/devtx.c:51:22: warning: no previous prototype for function 'devtx_cp' [-Wmissing-prototypes]
      51 | __weak noinline void devtx_cp(struct devtx_frame *ctx)
         |                      ^
   net/core/devtx.c:51:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | __weak noinline void devtx_cp(struct devtx_frame *ctx)
         |                 ^
         |                 static 
   8 warnings generated.


vim +/devtx_sb +41 net/core/devtx.c

    34	
    35	/**
    36	 * devtx_sb - Called for every egress netdev packet
    37	 *
    38	 * Note: this function is never actually called by the kernel and declared
    39	 * only to allow loading an attaching appropriate tracepoints.
    40	 */
  > 41	__weak noinline void devtx_sb(struct devtx_frame *ctx)
    42	{
    43	}
    44	
    45	/**
    46	 * devtx_cp - Called upon egress netdev packet completion
    47	 *
    48	 * Note: this function is never actually called by the kernel and declared
    49	 * only to allow loading an attaching appropriate tracepoints.
    50	 */
  > 51	__weak noinline void devtx_cp(struct devtx_frame *ctx)
    52	{
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
