Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6140795;
	Thu,  1 Jun 2023 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685639800; x=1717175800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S2Hf7YDn2rfm6E4b7h2+0osQy8pvbHeKqZIOK8qQ1a0=;
  b=agtkBN+hbJj6P5hhMQxOBvev716uzx/+ZxntyIAOKWfziziNzS/gRiIG
   9Qg0y6n4RKHlRONIrx/uZ6sf3RlET2Xkx+EVD9OOTDFuaYv9iDuRoh0FT
   inQFrldo3wlzqN38oZK5mlpbPtReaD8hqFtuNZGWnHHQTXCuxw576dUjO
   D1cpd9jlTnD7luMLd2lttE7V3o4YJ6oVyV263zA2K9zjD2Mt2BaDffgXC
   ghNBs4Is5SkF2uz0crO/S+aI34Bb0cfbJ6TZKUMVP51BqeR0LMM96SnbA
   JLk+UKpIIEl1ycVw0QWklwh2ZnsCuBXVStRcINM39YMvnQBoxrxQWYDFp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335244920"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="335244920"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 10:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037583744"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="1037583744"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Jun 2023 10:16:33 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4lua-0002WP-2p;
	Thu, 01 Jun 2023 17:16:32 +0000
Date: Fri, 2 Jun 2023 01:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v3 4/8] vsock: make vsock bind reusable
Message-ID: <202306020103.SKP4Pz6Z-lkp@intel.com>
References: <20230413-b4-vsock-dgram-v3-4-c2414413ef6a@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-b4-vsock-dgram-v3-4-c2414413ef6a@bytedance.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ed72bd5a6790a0c3747cb32b0427f921bd03bb71]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/vsock-dgram-generalize-recvmsg-and-drop-transport-dgram_dequeue/20230531-084049
base:   ed72bd5a6790a0c3747cb32b0427f921bd03bb71
patch link:    https://lore.kernel.org/r/20230413-b4-vsock-dgram-v3-4-c2414413ef6a%40bytedance.com
patch subject: [PATCH RFC net-next v3 4/8] vsock: make vsock bind reusable
config: s390-randconfig-r044-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020103.SKP4Pz6Z-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f69c7f6d6d618c47334134277ad9a2d3877020f5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/vsock-dgram-generalize-recvmsg-and-drop-transport-dgram_dequeue/20230531-084049
        git checkout f69c7f6d6d618c47334134277ad9a2d3877020f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020103.SKP4Pz6Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/vmw_vsock/af_vsock.c:93:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from net/vmw_vsock/af_vsock.c:93:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from net/vmw_vsock/af_vsock.c:93:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> net/vmw_vsock/af_vsock.c:233:14: warning: no previous prototype for function 'vsock_find_bound_socket_common' [-Wmissing-prototypes]
   struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
                ^
   net/vmw_vsock/af_vsock.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
   ^
   static 
>> net/vmw_vsock/af_vsock.c:652:5: warning: no previous prototype for function 'vsock_bind_common' [-Wmissing-prototypes]
   int vsock_bind_common(struct vsock_sock *vsk,
       ^
   net/vmw_vsock/af_vsock.c:652:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vsock_bind_common(struct vsock_sock *vsk,
   ^
   static 
>> net/vmw_vsock/af_vsock.c:720:5: warning: no previous prototype for function 'vsock_bind_stream' [-Wmissing-prototypes]
   int vsock_bind_stream(struct vsock_sock *vsk,
       ^
   net/vmw_vsock/af_vsock.c:720:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vsock_bind_stream(struct vsock_sock *vsk,
   ^
   static 
   15 warnings generated.


vim +/vsock_find_bound_socket_common +233 net/vmw_vsock/af_vsock.c

   232	
 > 233	struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
   234						    struct list_head *bind_table)
   235	{
   236		struct vsock_sock *vsk;
   237	
   238		list_for_each_entry(vsk, bind_table, bound_table) {
   239			if (vsock_addr_equals_addr(addr, &vsk->local_addr))
   240				return sk_vsock(vsk);
   241	
   242			if (addr->svm_port == vsk->local_addr.svm_port &&
   243			    (vsk->local_addr.svm_cid == VMADDR_CID_ANY ||
   244			     addr->svm_cid == VMADDR_CID_ANY))
   245				return sk_vsock(vsk);
   246		}
   247	
   248		return NULL;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
