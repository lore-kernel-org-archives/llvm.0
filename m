Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAD66996F;
	Tue, 12 Mar 2024 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710230368; cv=none; b=W3Mle85mIiUkSTd0nKymBPBxx9LCSnFQFm2cM8rdsIqRm6skqFgyuqniP+ql/z6aj6Hqg7hqrqsZajYscyle/b+tDdRTIbfI7ElP4xy3SckZaCY6ehvLRK3kbiWW0Iv2h2kfA5u8+PjAuX+hD50KJ9LTsc1PSlqm3ES+NI21X/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710230368; c=relaxed/simple;
	bh=svJj7nCwh/gmBL8BJT3lFqBgO9J5//PD7QV6PQmiZ5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhV3d+w/FxN1So1MqutKXfNPZ41uhMUHsJvTsMmVC/1S+ZD7hdW0dxSLi2QYBwQClW+TAk5nt4bo4lKU6hxQYy7YOT4KkSeeX+lrur7gA8cj6eG+xkL8O1lbYLbcONiZnqZc+pAhfjSIaNZHQFtzz5so2mXcQTq54intATM4WD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cn2BXHdS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cn2BXHdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710230366; x=1741766366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svJj7nCwh/gmBL8BJT3lFqBgO9J5//PD7QV6PQmiZ5Y=;
  b=Cn2BXHdSWmbOGEjPoZF6uKZSGZyixRkB8u5pqcixaFgVbVNcvaTYrKM4
   O7ey2shqOr7X5zVEH1XgFnj30NnZieyZ0QyKMdh3b/psTBSTgZVI0EOsU
   E6eT8daKL1aJE/MvKqVaTMWfbxl0OVn266YqMw39ljoEoSya35epGUOBY
   31psdP8J/LuKa9S9xLqNtot7tgtdPft1BusZvgyItbxGA7xZEMhy1IJxk
   MHReG1f0x4Xj5fwdAtfhliP/3XKAeTh2SnTF7EnBr1LkRYfwK/UUU+emj
   oXop7wRYUbojyePpCc4a5rhqHvW6d9N0pIdGwdcuc8H40DoSWMkjDoq53
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16067936"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="16067936"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 00:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="42373913"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2024 00:59:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjx2f-0009wF-2q;
	Tue, 12 Mar 2024 07:59:21 +0000
Date: Tue, 12 Mar 2024 15:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 4/5] net: integrate QUIC build configuration
 into Kconfig and Makefile
Message-ID: <202403121528.HJYneYzx-lkp@intel.com>
References: <f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin@gmail.com>

Hi Xin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/net-define-IPPROTO_QUIC-and-SOL_QUIC-constants-for-QUIC-protocol/20240312-002959
base:   net-next/main
patch link:    https://lore.kernel.org/r/f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin%40gmail.com
patch subject: [RFC PATCH net-next 4/5] net: integrate QUIC build configuration into Kconfig and Makefile
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240312/202403121528.HJYneYzx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121528.HJYneYzx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121528.HJYneYzx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from net/quic/frame.c:13:
   In file included from net/quic/socket.h:15:
   In file included from include/net/udp_tunnel.h:5:
   In file included from include/net/ip_tunnels.h:6:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:9:
   In file included from include/linux/security.h:35:
   include/linux/bpf.h:736:48: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     736 |         ARG_PTR_TO_MAP_VALUE_OR_NULL    = PTR_MAYBE_NULL | ARG_PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:737:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     737 |         ARG_PTR_TO_MEM_OR_NULL          = PTR_MAYBE_NULL | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:738:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     738 |         ARG_PTR_TO_CTX_OR_NULL          = PTR_MAYBE_NULL | ARG_PTR_TO_CTX,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:739:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     739 |         ARG_PTR_TO_SOCKET_OR_NULL       = PTR_MAYBE_NULL | ARG_PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:740:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     740 |         ARG_PTR_TO_STACK_OR_NULL        = PTR_MAYBE_NULL | ARG_PTR_TO_STACK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:741:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     741 |         ARG_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | ARG_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:745:38: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     745 |         ARG_PTR_TO_UNINIT_MEM           = MEM_UNINIT | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:747:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     747 |         ARG_PTR_TO_FIXED_SIZE_MEM       = MEM_FIXED_SIZE | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:770:48: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     770 |         RET_PTR_TO_MAP_VALUE_OR_NULL    = PTR_MAYBE_NULL | RET_PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:771:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     771 |         RET_PTR_TO_SOCKET_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:772:47: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     772 |         RET_PTR_TO_TCP_SOCK_OR_NULL     = PTR_MAYBE_NULL | RET_PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:773:50: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     773 |         RET_PTR_TO_SOCK_COMMON_OR_NULL  = PTR_MAYBE_NULL | RET_PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:775:49: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     775 |         RET_PTR_TO_DYNPTR_MEM_OR_NULL   = PTR_MAYBE_NULL | RET_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:776:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     776 |         RET_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:777:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     777 |         RET_PTR_TO_BTF_ID_TRUSTED       = PTR_TRUSTED    | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~    ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:888:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     888 |         PTR_TO_MAP_VALUE_OR_NULL        = PTR_MAYBE_NULL | PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:889:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     889 |         PTR_TO_SOCKET_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/bpf.h:890:46: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     890 |         PTR_TO_SOCK_COMMON_OR_NULL      = PTR_MAYBE_NULL | PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:891:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     891 |         PTR_TO_TCP_SOCK_OR_NULL         = PTR_MAYBE_NULL | PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   include/linux/bpf.h:892:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     892 |         PTR_TO_BTF_ID_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
>> net/quic/frame.c:1345:2: error: a randomized struct can only be initialized with a designated initializer
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:214:1: note: expanded from here
     214 | quic_frame_padding_create
         | ^
   net/quic/frame.c:1346:2: error: a randomized struct can only be initialized with a designated initializer
    1346 |         quic_frame_create_and_process(ping),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:218:1: note: expanded from here
     218 | quic_frame_ping_create
         | ^
   net/quic/frame.c:1347:2: error: a randomized struct can only be initialized with a designated initializer
    1347 |         quic_frame_create_and_process(ack),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:222:1: note: expanded from here
     222 | quic_frame_ack_create
         | ^
   net/quic/frame.c:1348:2: error: a randomized struct can only be initialized with a designated initializer
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:226:1: note: expanded from here
     226 | quic_frame_ack_create
         | ^
   net/quic/frame.c:1349:2: error: a randomized struct can only be initialized with a designated initializer
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:230:1: note: expanded from here
     230 | quic_frame_reset_stream_create
         | ^
   net/quic/frame.c:1350:2: error: a randomized struct can only be initialized with a designated initializer
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:234:1: note: expanded from here
     234 | quic_frame_stop_sending_create
         | ^
   net/quic/frame.c:1351:2: error: a randomized struct can only be initialized with a designated initializer
    1351 |         quic_frame_create_and_process(crypto),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:238:1: note: expanded from here
     238 | quic_frame_crypto_create
         | ^
   net/quic/frame.c:1352:2: error: a randomized struct can only be initialized with a designated initializer
    1352 |         quic_frame_create_and_process(new_token),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:242:1: note: expanded from here
     242 | quic_frame_new_token_create
         | ^
   net/quic/frame.c:1353:2: error: a randomized struct can only be initialized with a designated initializer
    1353 |         quic_frame_create_and_process(stream),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:4:1: note: expanded from here
       4 | quic_frame_stream_create
         | ^
   net/quic/frame.c:1354:2: error: a randomized struct can only be initialized with a designated initializer
    1354 |         quic_frame_create_and_process(stream),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:8:1: note: expanded from here
       8 | quic_frame_stream_create
         | ^
   net/quic/frame.c:1355:2: error: a randomized struct can only be initialized with a designated initializer
    1355 |         quic_frame_create_and_process(stream),
         |         ^
   net/quic/frame.c:1342:3: note: expanded from macro 'quic_frame_create_and_process'
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^
   <scratch space>:12:1: note: expanded from here
      12 | quic_frame_stream_create
         | ^
   net/quic/frame.c:1356:2: error: a randomized struct can only be initialized with a designated initializer
    1356 |         quic_frame_create_and_process(stream),


vim +1345 net/quic/frame.c

b53fc4edb7faf3 Xin Long 2024-03-11  1340  
b53fc4edb7faf3 Xin Long 2024-03-11  1341  #define quic_frame_create_and_process(type) \
b53fc4edb7faf3 Xin Long 2024-03-11  1342  	{quic_frame_##type##_create, quic_frame_##type##_process}
b53fc4edb7faf3 Xin Long 2024-03-11  1343  
b53fc4edb7faf3 Xin Long 2024-03-11  1344  static struct quic_frame_ops quic_frame_ops[QUIC_FRAME_MAX + 1] = {
b53fc4edb7faf3 Xin Long 2024-03-11 @1345  	quic_frame_create_and_process(padding), /* 0x00 */
b53fc4edb7faf3 Xin Long 2024-03-11  1346  	quic_frame_create_and_process(ping),
b53fc4edb7faf3 Xin Long 2024-03-11  1347  	quic_frame_create_and_process(ack),
b53fc4edb7faf3 Xin Long 2024-03-11  1348  	quic_frame_create_and_process(ack), /* ack_ecn */
b53fc4edb7faf3 Xin Long 2024-03-11  1349  	quic_frame_create_and_process(reset_stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1350  	quic_frame_create_and_process(stop_sending),
b53fc4edb7faf3 Xin Long 2024-03-11  1351  	quic_frame_create_and_process(crypto),
b53fc4edb7faf3 Xin Long 2024-03-11  1352  	quic_frame_create_and_process(new_token),
b53fc4edb7faf3 Xin Long 2024-03-11  1353  	quic_frame_create_and_process(stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1354  	quic_frame_create_and_process(stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1355  	quic_frame_create_and_process(stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1356  	quic_frame_create_and_process(stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1357  	quic_frame_create_and_process(stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1358  	quic_frame_create_and_process(stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1359  	quic_frame_create_and_process(stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1360  	quic_frame_create_and_process(stream),
b53fc4edb7faf3 Xin Long 2024-03-11  1361  	quic_frame_create_and_process(max_data), /* 0x10 */
b53fc4edb7faf3 Xin Long 2024-03-11  1362  	quic_frame_create_and_process(max_stream_data),
b53fc4edb7faf3 Xin Long 2024-03-11  1363  	quic_frame_create_and_process(max_streams_bidi),
b53fc4edb7faf3 Xin Long 2024-03-11  1364  	quic_frame_create_and_process(max_streams_uni),
b53fc4edb7faf3 Xin Long 2024-03-11  1365  	quic_frame_create_and_process(data_blocked),
b53fc4edb7faf3 Xin Long 2024-03-11  1366  	quic_frame_create_and_process(stream_data_blocked),
b53fc4edb7faf3 Xin Long 2024-03-11  1367  	quic_frame_create_and_process(streams_blocked_bidi),
b53fc4edb7faf3 Xin Long 2024-03-11  1368  	quic_frame_create_and_process(streams_blocked_uni),
b53fc4edb7faf3 Xin Long 2024-03-11  1369  	quic_frame_create_and_process(new_connection_id),
b53fc4edb7faf3 Xin Long 2024-03-11  1370  	quic_frame_create_and_process(retire_connection_id),
b53fc4edb7faf3 Xin Long 2024-03-11  1371  	quic_frame_create_and_process(path_challenge),
b53fc4edb7faf3 Xin Long 2024-03-11  1372  	quic_frame_create_and_process(path_response),
b53fc4edb7faf3 Xin Long 2024-03-11  1373  	quic_frame_create_and_process(connection_close),
b53fc4edb7faf3 Xin Long 2024-03-11  1374  	quic_frame_create_and_process(connection_close),
b53fc4edb7faf3 Xin Long 2024-03-11  1375  	quic_frame_create_and_process(handshake_done),
b53fc4edb7faf3 Xin Long 2024-03-11  1376  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1377  	quic_frame_create_and_process(invalid), /* 0x20 */
b53fc4edb7faf3 Xin Long 2024-03-11  1378  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1379  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1380  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1381  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1382  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1383  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1384  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1385  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1386  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1387  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1388  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1389  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1390  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1391  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1392  	quic_frame_create_and_process(invalid),
b53fc4edb7faf3 Xin Long 2024-03-11  1393  	quic_frame_create_and_process(datagram), /* 0x30 */
b53fc4edb7faf3 Xin Long 2024-03-11  1394  	quic_frame_create_and_process(datagram),
b53fc4edb7faf3 Xin Long 2024-03-11  1395  };
b53fc4edb7faf3 Xin Long 2024-03-11  1396  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
