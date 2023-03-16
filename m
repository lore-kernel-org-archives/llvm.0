Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239DB20EE;
	Thu, 16 Mar 2023 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678953151; x=1710489151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P4uR5lQsRhLn/DGWaZn3xLL2/0YV/DoJRKZ+9nv3mMM=;
  b=Kj+0uRzrqooX086ZefLC5c6cp9S1Rvj2CSZDsqYxYy9p1AmpEwFUlMFf
   Ruyle8VfCoYRxjE95BRlAYnW9LHY5jJsUT2kdyKkTzvw29lPyH/RI3xm5
   ZKXUbQS+ywyHpTDkmNuhfXDW3wUQlUY0NULsWqG8dH/wrI5198vWCJ6fk
   PRuJR6kT4pGNAt/b0OZ08Qdq+FX4MPrpg8AX7AAY+eiwqP+/Jox+CZdub
   pU5Kxt8ui/f+iykGOC6eXmLY03n5Xb33qt68xqbuoEvwBBw4rN1s7eZ2n
   0dACzgMzHUnSk3uX/9fA36I45vRerr3NPWmMZ97mdjJ0FBo9aVfZH5l+/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337935006"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="337935006"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 00:52:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="673046044"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="673046044"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2023 00:52:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pciPR-0008Pm-0H;
	Thu, 16 Mar 2023 07:52:25 +0000
Date: Thu, 16 Mar 2023 15:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: Anjali Kulkarni <anjali.k.kulkarni@oracle.com>, davem@davemloft.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	zbr@ioremap.net, brauner@kernel.org, johannes@sipsolutions.net,
	ecree.xilinx@gmail.com, leon@kernel.org, keescook@chromium.org,
	socketcan@hartkopp.net, petrm@nvidia.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	anjali.k.kulkarni@oracle.com
Subject: Re: [PATCH v2 2/5] connector/cn_proc: Add filtering to fix some bugs
Message-ID: <202303161507.MJc3Twl0-lkp@intel.com>
References: <20230315021850.2788946-3-anjali.k.kulkarni@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315021850.2788946-3-anjali.k.kulkarni@oracle.com>

Hi Anjali,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master vfs-idmapping/for-next linus/master v6.3-rc2]
[cannot apply to next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjali-Kulkarni/netlink-Reverse-the-patch-which-removed-filtering/20230315-102137
patch link:    https://lore.kernel.org/r/20230315021850.2788946-3-anjali.k.kulkarni%40oracle.com
patch subject: [PATCH v2 2/5] connector/cn_proc: Add filtering to fix some bugs
config: hexagon-randconfig-r045-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161507.MJc3Twl0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3d67dd0fedbcbd247d8a8f925547dc57c5ad83e4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anjali-Kulkarni/netlink-Reverse-the-patch-which-removed-filtering/20230315-102137
        git checkout 3d67dd0fedbcbd247d8a8f925547dc57c5ad83e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/connector/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161507.MJc3Twl0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/connector/cn_proc.c:14:
   In file included from include/linux/connector.h:17:
   In file included from include/net/sock.h:38:
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
   In file included from drivers/connector/cn_proc.c:14:
   In file included from include/linux/connector.h:17:
   In file included from include/net/sock.h:38:
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
   In file included from drivers/connector/cn_proc.c:14:
   In file included from include/linux/connector.h:17:
   In file included from include/net/sock.h:38:
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
>> drivers/connector/cn_proc.c:51:5: warning: no previous prototype for function 'cn_filter' [-Wmissing-prototypes]
   int cn_filter(struct sock *dsk, struct sk_buff *skb, void *data)
       ^
   drivers/connector/cn_proc.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int cn_filter(struct sock *dsk, struct sk_buff *skb, void *data)
   ^
   static 
   7 warnings generated.


vim +/cn_filter +51 drivers/connector/cn_proc.c

    50	
  > 51	int cn_filter(struct sock *dsk, struct sk_buff *skb, void *data)
    52	{
    53		enum proc_cn_mcast_op mc_op;
    54	
    55		if (!dsk)
    56			return 0;
    57	
    58		mc_op = ((struct proc_input *)(dsk->sk_user_data))->mcast_op;
    59	
    60		if (mc_op == PROC_CN_MCAST_IGNORE)
    61			return 1;
    62	
    63		return 0;
    64	}
    65	EXPORT_SYMBOL_GPL(cn_filter);
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
