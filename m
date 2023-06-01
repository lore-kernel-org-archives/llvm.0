Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81966FBA;
	Thu,  1 Jun 2023 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685646760; x=1717182760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PAkRB3uPd1Yg6TiQs6dCFSRWkBnPciL/YbEvjqt4ar4=;
  b=k9ERwYvQ/KuifRr32GeqBw0/GJnfw0rK6Z337NzFsPdoxd+kSf4wHfV9
   kPlU0qS9Kk44lA6OTQinYyvMkKRBINn/LAjSIU77VombMdt8F0FOnEbSx
   NY9nsQdRsBwCWn/QQrmuRxDITHxhAlu2AcPqSRhScYUdLkTZt7CP4hAyG
   74UxMH0AuCrpOmH+6SR+LLfGHzwr84NKEnuR26hlOd989wlpEOrzswBmG
   lZjCQO8ODDN4u82tE9JqpKxZ5d42btypgVzrqEt40q6w0yoejoWgm60SQ
   YOk5f97a01e4XU0ufk1KxjR5D0mDRoHAnOllKdZcQNyoFSrnESqL0Exci
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358083196"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="358083196"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 12:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="881748151"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="881748151"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Jun 2023 12:12:38 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4niw-0002co-01;
	Thu, 01 Jun 2023 19:12:38 +0000
Date: Fri, 2 Jun 2023 03:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v3 7/8] vsock: Add lockless sendmsg() support
Message-ID: <202306020315.cbisgiDr-lkp@intel.com>
References: <20230413-b4-vsock-dgram-v3-7-c2414413ef6a@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-b4-vsock-dgram-v3-7-c2414413ef6a@bytedance.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ed72bd5a6790a0c3747cb32b0427f921bd03bb71]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/vsock-dgram-generalize-recvmsg-and-drop-transport-dgram_dequeue/20230531-084049
base:   ed72bd5a6790a0c3747cb32b0427f921bd03bb71
patch link:    https://lore.kernel.org/r/20230413-b4-vsock-dgram-v3-7-c2414413ef6a%40bytedance.com
patch subject: [PATCH RFC net-next v3 7/8] vsock: Add lockless sendmsg() support
config: s390-randconfig-r044-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020315.cbisgiDr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4e9bf74675652b253b0ba5d9a7c4a505f25fcc7e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/vsock-dgram-generalize-recvmsg-and-drop-transport-dgram_dequeue/20230531-084049
        git checkout 4e9bf74675652b253b0ba5d9a7c4a505f25fcc7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020315.cbisgiDr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/vmw_vsock/virtio_transport_common.c:14:
   In file included from include/linux/virtio_vsock.h:5:
   In file included from include/uapi/linux/virtio_vsock.h:39:
   In file included from include/linux/virtio_config.h:7:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from net/vmw_vsock/virtio_transport_common.c:14:
   In file included from include/linux/virtio_vsock.h:5:
   In file included from include/uapi/linux/virtio_vsock.h:39:
   In file included from include/linux/virtio_config.h:7:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from net/vmw_vsock/virtio_transport_common.c:14:
   In file included from include/linux/virtio_vsock.h:5:
   In file included from include/uapi/linux/virtio_vsock.h:39:
   In file included from include/linux/virtio_config.h:7:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
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
>> net/vmw_vsock/virtio_transport_common.c:1126:7: warning: variable 'skerr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (err)
                       ^~~
   net/vmw_vsock/virtio_transport_common.c:1146:15: note: uninitialized use occurs here
           sk->sk_err = skerr;
                        ^~~~~
   net/vmw_vsock/virtio_transport_common.c:1126:3: note: remove the 'if' if its condition is always false
                   if (err)
                   ^~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:1118:11: note: initialize the variable 'skerr' to silence this warning
           int skerr;
                    ^
                     = 0
   13 warnings generated.
--
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
>> net/vmw_vsock/af_vsock.c:221:5: warning: no previous prototype for function 'vsock_set_remote_info' [-Wmissing-prototypes]
   int vsock_set_remote_info(struct vsock_sock *vsk,
       ^
   net/vmw_vsock/af_vsock.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vsock_set_remote_info(struct vsock_sock *vsk,
   ^
   static 
   net/vmw_vsock/af_vsock.c:383:14: warning: no previous prototype for function 'vsock_find_bound_socket_common' [-Wmissing-prototypes]
   struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
                ^
   net/vmw_vsock/af_vsock.c:383:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
   ^
   static 
>> net/vmw_vsock/af_vsock.c:474:6: warning: no previous prototype for function 'vsock_remove_dgram_bound' [-Wmissing-prototypes]
   void vsock_remove_dgram_bound(struct vsock_sock *vsk)
        ^
   net/vmw_vsock/af_vsock.c:474:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vsock_remove_dgram_bound(struct vsock_sock *vsk)
   ^
   static 
   net/vmw_vsock/af_vsock.c:835:5: warning: no previous prototype for function 'vsock_bind_common' [-Wmissing-prototypes]
   int vsock_bind_common(struct vsock_sock *vsk,
       ^
   net/vmw_vsock/af_vsock.c:835:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vsock_bind_common(struct vsock_sock *vsk,
   ^
   static 
   net/vmw_vsock/af_vsock.c:903:5: warning: no previous prototype for function 'vsock_bind_stream' [-Wmissing-prototypes]
   int vsock_bind_stream(struct vsock_sock *vsk,
       ^
   net/vmw_vsock/af_vsock.c:903:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vsock_bind_stream(struct vsock_sock *vsk,
   ^
   static 
   17 warnings generated.


vim +1126 net/vmw_vsock/virtio_transport_common.c

  1111	
  1112	static int
  1113	virtio_transport_recv_connecting(struct sock *sk,
  1114					 struct sk_buff *skb)
  1115	{
  1116		struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
  1117		struct vsock_sock *vsk = vsock_sk(sk);
  1118		int skerr;
  1119		int err;
  1120	
  1121		switch (le16_to_cpu(hdr->op)) {
  1122		case VIRTIO_VSOCK_OP_RESPONSE:
  1123			sk->sk_state = TCP_ESTABLISHED;
  1124			sk->sk_socket->state = SS_CONNECTED;
  1125			err = vsock_insert_connected(vsk);
> 1126			if (err)
  1127				goto destroy;
  1128			sk->sk_state_change(sk);
  1129			break;
  1130		case VIRTIO_VSOCK_OP_INVALID:
  1131			break;
  1132		case VIRTIO_VSOCK_OP_RST:
  1133			skerr = ECONNRESET;
  1134			err = 0;
  1135			goto destroy;
  1136		default:
  1137			skerr = EPROTO;
  1138			err = -EINVAL;
  1139			goto destroy;
  1140		}
  1141		return 0;
  1142	
  1143	destroy:
  1144		virtio_transport_reset(vsk, skb);
  1145		sk->sk_state = TCP_CLOSE;
  1146		sk->sk_err = skerr;
  1147		sk_error_report(sk);
  1148		return err;
  1149	}
  1150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
