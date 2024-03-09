Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D750A93;
	Sat,  9 Mar 2024 22:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710022127; cv=none; b=Vo1AZDePbcQuZ3PavwCtqYnKySMt6ifyBqgDxsYhtzpXv6zQvcXAHqoOQCqBHLnGFRwR9B/uKuv0Vt+BZHd8ML+H1ejGHyzDXVBdLk8H9wZKeXv+AzJlIofZZXJSPCCSLEgqXEWneX+Phy4WK4F7Aj+Ux9A9aXFPdgRMKcjB3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710022127; c=relaxed/simple;
	bh=afmXqoFvDa6CNyn5k7IuU2y/i9GhQAy6hAHBdAg61hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7o4nkW+BGx+kYPHeNNSO1KaxWsUrairn7IsFf8bU15gEPLNBKvlzW4u7eOnT7bS7xEMLWSNLvMvLeaeqpxVYZ6465SAGubPxphZ+xdLV+1DvX5k4zk3f9hn9p3vLYksumPhHt8BYe5XS3C8mlMDDBPgjT2i8l21rsPvCtHX9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hbtn7oMl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hbtn7oMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710022124; x=1741558124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=afmXqoFvDa6CNyn5k7IuU2y/i9GhQAy6hAHBdAg61hU=;
  b=Hbtn7oMl9u4h0j2V3C2oN8JbPtVQZ8tqAjg/SE3cdve/2byOj4ZANb9X
   arZY9STZNqwhkboSQVv4oFa0KiJ401nhL6oGVEOqlS4PDegfOcVSjt67f
   JwZbmUPqhCLIr8FZ+i6NVBCkZbJKAtySD1j1+AnpjRDDRvppGa3Op8PC/
   Yrns4mBZlN7lnhQyWft/+hnyqiu1JZqLRfHjnp9ji2yquTGpa7a/iGHyv
   fDUxmspifIPtf4UB32ineAvcIw5+rZ8OakS3O68hq+GclZklWvyjJH7X+
   EM/oAnfMYNJat/NNV2GkmROOFEJzwmf/+bBjIf7vZvsKUqYHfmegtk2Wt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8474397"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="8474397"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 14:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15459717"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Mar 2024 14:08:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj4rv-0007gd-0F;
	Sat, 09 Mar 2024 22:08:39 +0000
Date: Sun, 10 Mar 2024 06:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf-next 9/9] netfilter: nf_tables: remove gc sequence
 counter
Message-ID: <202403100628.EHPe3Wvk-lkp@intel.com>
References: <20240307084018.2219-10-fw@strlen.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307084018.2219-10-fw@strlen.de>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240307]
[also build test WARNING on linus/master v6.8-rc7]
[cannot apply to nf-next/master netfilter-nf/main v6.8-rc7 v6.8-rc6 v6.8-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_tables-warn-if-set-being-destroyed-is-still-active/20240307-171729
base:   next-20240307
patch link:    https://lore.kernel.org/r/20240307084018.2219-10-fw%40strlen.de
patch subject: [PATCH nf-next 9/9] netfilter: nf_tables: remove gc sequence counter
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240310/202403100628.EHPe3Wvk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100628.EHPe3Wvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100628.EHPe3Wvk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from net/netfilter/nft_set_hash.c:14:
   In file included from include/linux/netlink.h:7:
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
   In file included from net/netfilter/nft_set_hash.c:14:
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
>> net/netfilter/nft_set_hash.c:331:14: warning: variable 'net' set but not used [-Wunused-but-set-variable]
     331 |         struct net *net;
         |                     ^
   38 warnings generated.


vim +/net +331 net/netfilter/nft_set_hash.c

563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  323  
5fc6ced958db70 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2017-05-22  324  static void nft_rhash_gc(struct work_struct *work)
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  325  {
3dd0673ac3cd7d net/netfilter/nft_hash.c     Patrick McHardy   2015-04-05  326  	struct nft_set *set;
5fc6ced958db70 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2017-05-22  327  	struct nft_rhash_elem *he;
5fc6ced958db70 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2017-05-22  328  	struct nft_rhash *priv;
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  329  	struct rhashtable_iter hti;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  330  	struct nft_trans_gc *gc;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09 @331  	struct net *net;
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  332  
5fc6ced958db70 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2017-05-22  333  	priv = container_of(work, struct nft_rhash, gc_work.work);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  334  	set  = nft_set_container_of(priv);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  335  	net  = read_pnet(&set->net);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  336  
5cc2ff2eae3d8c net/netfilter/nft_set_hash.c Florian Westphal  2024-03-07  337  	gc = nft_trans_gc_alloc(set, GFP_KERNEL);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  338  	if (!gc)
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  339  		goto done;
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  340  
0de22baabc97f7 net/netfilter/nft_set_hash.c Taehee Yoo        2018-09-14  341  	rhashtable_walk_enter(&priv->ht, &hti);
97a6ec4ac021f7 net/netfilter/nft_set_hash.c Tom Herbert       2017-12-04  342  	rhashtable_walk_start(&hti);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  343  
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  344  	while ((he = rhashtable_walk_next(&hti))) {
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  345  		if (IS_ERR(he)) {
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  346  			nft_trans_gc_destroy(gc);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  347  			gc = NULL;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  348  			goto try_later;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  349  		}
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  350  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  351  		if (nft_set_elem_is_dead(&he->ext))
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  352  			goto dead_elem;
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  353  
563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  354  		if (nft_set_ext_exists(&he->ext, NFT_SET_EXT_EXPRESSIONS) &&
563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  355  		    nft_rhash_expr_needs_gc_run(set, &he->ext))
563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  356  			goto needs_gc_run;
79b174ade16d90 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2018-06-02  357  
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  358  		if (!nft_set_elem_expired(&he->ext))
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  359  			continue;
563125a73ac30d net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2020-12-09  360  needs_gc_run:
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  361  		nft_set_elem_dead(&he->ext);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  362  dead_elem:
5cc2ff2eae3d8c net/netfilter/nft_set_hash.c Florian Westphal  2024-03-07  363  		gc = nft_trans_gc_queue_async(gc, GFP_ATOMIC);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  364  		if (!gc)
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  365  			goto try_later;
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  366  
2e55eccd9a4596 net/netfilter/nft_set_hash.c Florian Westphal  2024-03-07  367  		nft_async_gc_key_add(gc, &he->priv);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  368  	}
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  369  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  370  try_later:
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  371  	/* catchall list iteration requires rcu read side lock. */
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  372  	rhashtable_walk_stop(&hti);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  373  	rhashtable_walk_exit(&hti);
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  374  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  375  	if (gc)
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  376  		nft_trans_gc_queue_async_done(gc);
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  377  
f6c383b8c31a93 net/netfilter/nft_set_hash.c Pablo Neira Ayuso 2023-08-09  378  done:
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  379  	queue_delayed_work(system_power_efficient_wq, &priv->gc_work,
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  380  			   nft_set_gc_interval(set));
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  381  }
9d0982927e7904 net/netfilter/nft_hash.c     Patrick McHardy   2015-03-26  382  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
