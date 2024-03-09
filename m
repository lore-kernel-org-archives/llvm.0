Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA0B33FE;
	Sat,  9 Mar 2024 02:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709949916; cv=none; b=H2GWG5N7wZIthSpY5b0zw6bavlQ6+Go8WVZtgEWJbmbbq4fCe31rsPUt7mhFaPY0/DPaxdqm6U+o+hayN9HDu6bZjNlPCnd/mcKkLw12ulzxSH/1TG3HBFYZlgJg3J3VJ5av4sFmOdhuxLdS2nrJitJ2fuiqEkC5PL4obL2T2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709949916; c=relaxed/simple;
	bh=rMFXz1JqPCxiQef8sQR5SRKpaDNSHF8H4ksiSYx2ZVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AcXjRRsiAJO7f6j+l/XF/nm2c26KnRMiZu/UVU8ATh1j8s+rmtrCpFnAzTIl1av3y9AxeUA+J01RP5JMURcB59/LZK6mjMDyr2IpgWKbgtHfkOnPsdRHZSm7mnj+RBD6bhbiL02lNyvq/S53sff9H4fyOKdtWEsXlFhcwT+aLo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5tsuLQC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5tsuLQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709949915; x=1741485915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rMFXz1JqPCxiQef8sQR5SRKpaDNSHF8H4ksiSYx2ZVE=;
  b=a5tsuLQCi2b3EvFOFu4UeRj69/rR6es76KMVxWnOENlQB99QGw0tzMmP
   luNXu+ViFo59Kco+uWiwvAJk7WgX4ZxoCD/P7QzOBgG87JJ2rN8O2XG9b
   5mbKjoxl9FXXfbVUrB7tGmw3LLK107g0v0ayi3UTLv8StygyVOKdcsyj4
   eY6rHQScsbUp2ARlTLjgAH/ozwvYLqEBL/Urm4LqFRVmSfuRpvm3RzJed
   VDsxDqzqEXtRYT6HIRmIggEStzhh+7JFxinc9WNE878On3gssnvfQNY5k
   WRYzOVKTbodcZBgeXvg1ATjGTzzK4TOdSMgHD3W9+hEvWyeKXdvi+SsBI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="7641009"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="7641009"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 18:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10696080"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2024 18:05:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rim5D-0006tM-2P;
	Sat, 09 Mar 2024 02:05:07 +0000
Date: Sat, 9 Mar 2024 10:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 15/15] drivers/net/gtp.c:605:14: warning: variable
 'pctx' is uninitialized when used here
Message-ID: <202403090941.W2eIXc1p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git main
head:   f5dbf4c7905efa93ca29c5bf7d0282871225615f
commit: f5dbf4c7905efa93ca29c5bf7d0282871225615f [15/15] gtp: identify tunnel via GTP device + GTP version + TEID + family
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240309/202403090941.W2eIXc1p-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090941.W2eIXc1p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090941.W2eIXc1p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/gtp.c:15:
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
   In file included from drivers/net/gtp.c:16:
   In file included from include/linux/udp.h:16:
   In file included from include/net/inet_sock.h:19:
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
>> drivers/net/gtp.c:605:14: warning: variable 'pctx' is uninitialized when used here [-Wuninitialized]
     605 |                 netdev_dbg(pctx->dev, "GTP packet does not encapsulate an IP packet\n");
         |                            ^~~~
   include/net/net_debug.h:57:21: note: expanded from macro 'netdev_dbg'
      57 |         dynamic_netdev_dbg(__dev, format, ##args);              \
         |                            ^~~~~
   include/linux/dynamic_debug.h:278:7: note: expanded from macro 'dynamic_netdev_dbg'
     278 |                            dev, fmt, ##__VA_ARGS__)
         |                            ^~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/net/gtp.c:580:22: note: initialize the variable 'pctx' to silence this warning
     580 |         struct pdp_ctx *pctx;
         |                             ^
         |                              = NULL
   drivers/net/gtp.c:824:14: warning: variable 'pctx' is uninitialized when used here [-Wuninitialized]
     824 |                 netdev_dbg(pctx->dev, "GTP packet does not encapsulate an IP packet\n");
         |                            ^~~~
   include/net/net_debug.h:57:21: note: expanded from macro 'netdev_dbg'
      57 |         dynamic_netdev_dbg(__dev, format, ##args);              \
         |                            ^~~~~
   include/linux/dynamic_debug.h:278:7: note: expanded from macro 'dynamic_netdev_dbg'
     278 |                            dev, fmt, ##__VA_ARGS__)
         |                            ^~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/net/gtp.c:786:22: note: initialize the variable 'pctx' to silence this warning
     786 |         struct pdp_ctx *pctx;
         |                             ^
         |                              = NULL
   39 warnings generated.


vim +/pctx +605 drivers/net/gtp.c

   573	
   574	/* 1 means pass up to the stack, -1 means drop and 0 means decapsulated. */
   575	static int gtp0_udp_encap_recv(struct gtp_dev *gtp, struct sk_buff *skb)
   576	{
   577		unsigned int hdrlen = sizeof(struct udphdr) +
   578				      sizeof(struct gtp0_header);
   579		struct gtp0_header *gtp0;
   580		struct pdp_ctx *pctx;
   581		__u16 inner_proto;
   582	
   583		if (!pskb_may_pull(skb, hdrlen))
   584			return -1;
   585	
   586		gtp0 = (struct gtp0_header *)(skb->data + sizeof(struct udphdr));
   587	
   588		if ((gtp0->flags >> 5) != GTP_V0)
   589			return 1;
   590	
   591		/* If the sockets were created in kernel, it means that
   592		 * there is no daemon running in userspace which would
   593		 * handle echo request.
   594		 */
   595		if (gtp0->type == GTP_ECHO_REQ && gtp->sk_created)
   596			return gtp0_send_echo_resp(gtp, skb);
   597	
   598		if (gtp0->type == GTP_ECHO_RSP && gtp->sk_created)
   599			return gtp0_handle_echo_resp(gtp, skb);
   600	
   601		if (gtp0->type != GTP_TPDU)
   602			return 1;
   603	
   604		if (gtp_inner_proto(skb, hdrlen, &inner_proto) < 0) {
 > 605			netdev_dbg(pctx->dev, "GTP packet does not encapsulate an IP packet\n");
   606			return -1;
   607		}
   608	
   609		pctx = gtp0_pdp_find(gtp, be64_to_cpu(gtp0->tid),
   610				     gtp_proto_to_family(inner_proto));
   611		if (!pctx) {
   612			netdev_dbg(gtp->dev, "No PDP ctx to decap skb=%p\n", skb);
   613			return 1;
   614		}
   615	
   616		return gtp_rx(pctx, skb, hdrlen, gtp->role, inner_proto);
   617	}
   618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
