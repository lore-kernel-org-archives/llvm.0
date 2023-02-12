Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D742FAE;
	Sun, 12 Feb 2023 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676223651; x=1707759651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JalP5dtsNS/nATntKYEV0q2+m7k5PGCKfAM66VU2UzY=;
  b=M+rjiHeOheXxYOigNOOJwVCRpC5aVbMP1NQFMm+qlQ1DSwcE4cKmKgz9
   opA4rqsE+2HB8lsPqGfQkRm0X4cZtnZloMCodYB7d7Br+zWnE5G0XOqjz
   ol6Rtiq+rBKsqoTCT8s4CXlddm8NGAlhkVJ4J45H7zy0tThMssXqQEXGy
   Q5NqekN0vWIsRnHEtd5LteuZYpJqjtL9BTIdznB+HF+vZLRwghRtJYBhK
   PCqUR71uJCHpEc7aD2V1H3+7nJlEJVs2XhZHbxU9tO9VDMZzpJA62FykK
   WbRPPDcQBVHB1khRlj6O6hXGSJNnlZh7wjFo0xF6/0bVioQNGeVDXhbzl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310369755"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="310369755"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 09:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="661936353"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="661936353"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2023 09:40:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRGLI-0007Kf-1N;
	Sun, 12 Feb 2023 17:40:48 +0000
Date: Mon, 13 Feb 2023 01:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202302130151.k3aXQ5zK-lkp@intel.com>
References: <20230212153250.1099136-2-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212153250.1099136-2-vdonnefort@google.com>

Hi Vincent,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on rostedt-trace/for-next]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
patch link:    https://lore.kernel.org/r/20230212153250.1099136-2-vdonnefort%40google.com
patch subject: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping functions
config: hexagon-randconfig-r045-20230212 (https://download.01.org/0day-ci/archive/20230213/202302130151.k3aXQ5zK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/96cfb7d92682fb5df39febc590fec75748b47e15
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
        git checkout 96cfb7d92682fb5df39febc590fec75748b47e15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130151.k3aXQ5zK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/ring_buffer.c:7:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/trace/ring_buffer.c:7:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/trace/ring_buffer.c:7:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> kernel/trace/ring_buffer.c:6017:6: warning: no previous prototype for function 'rb_put_mapped_buffer' [-Wmissing-prototypes]
   void rb_put_mapped_buffer(struct ring_buffer_per_cpu *cpu_buffer)
        ^
   kernel/trace/ring_buffer.c:6017:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rb_put_mapped_buffer(struct ring_buffer_per_cpu *cpu_buffer)
   ^
   static 
   7 warnings generated.


vim +/rb_put_mapped_buffer +6017 kernel/trace/ring_buffer.c

  6016	
> 6017	void rb_put_mapped_buffer(struct ring_buffer_per_cpu *cpu_buffer)
  6018	{
  6019		up_read(&cpu_buffer->mapping_lock);
  6020	}
  6021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
