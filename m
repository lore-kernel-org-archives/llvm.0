Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A433FE1;
	Sat,  9 Mar 2024 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710002678; cv=none; b=hg+noQYD1tJzZEOg1gtqFYM6CIVTm7XKYjoKG2Vbppf2/Z5+/WLDZlwXkVt+crrIXu9pihSPIP75+4DW2gM8FuzlI+gMMBc7cvtgyzhFMTOK+IzkABXycBWokD4Na02ZdatpwEqEov9z8FGay2fz783aGD053LTe8R6/71r2QzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710002678; c=relaxed/simple;
	bh=hKsLeSwdGW/GVgGi/OHHnl8WqvINx+G1zXWpT3+jc24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqvK6n6QCCF2ihynIcM5J1FwuYxx6gK5mESEIg1BrYfL29/iLlhZK333GFJs97GCWO/l1zrUrDT8DdzmGY07l3gNNVEbccY/wbfJQOUydMIMt97I8LVtQD+FZBQYpbQMzA2+Hs9RjEFn2SwCAuGed+M5VbApeNvETVNszuE+Gjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/EyXIKh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/EyXIKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710002675; x=1741538675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hKsLeSwdGW/GVgGi/OHHnl8WqvINx+G1zXWpT3+jc24=;
  b=L/EyXIKhM3rebuEMUilhl4nrSCQ8X1FzqX+ELbDvize0JYBfoFB5y288
   7tytS8dF3RDy5sCFC+9D2Jmkb8nEU1ZMpwHpAgyUr36Y/XWLz0mao708s
   alkvaZh6Y1CbnOvzRoc5ZThlHU/PdLwQ0lFiMnaavsWCYhQEURaOnKLXG
   36eQc2/Z7Qjs91PujGLqwtQ43yZeue5QFF4LOqIOYuWkTQdX/JPk66euB
   psRom6XbNd0/PFcnIrJ/9rWNzxO7mDX94qTWqcwqymRFIOLrgeYF5Ax21
   YZ21EqZanesXYqn77yPe/o+BPBCSgzFdCjjPdOjMYsA+8tZxC1OZ7cuBl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="15277377"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="15277377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 08:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="10813721"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Mar 2024 08:44:33 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rizoE-0007VN-2Z;
	Sat, 09 Mar 2024 16:44:30 +0000
Date: Sun, 10 Mar 2024 00:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf-next 3/9] netfilter: nf_tables: add lockdep assertion
 for chain use counter
Message-ID: <202403100012.wf5Caqtz-lkp@intel.com>
References: <20240307084018.2219-4-fw@strlen.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307084018.2219-4-fw@strlen.de>

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
patch link:    https://lore.kernel.org/r/20240307084018.2219-4-fw%40strlen.de
patch subject: [PATCH nf-next 3/9] netfilter: nf_tables: add lockdep assertion for chain use counter
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240310/202403100012.wf5Caqtz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100012.wf5Caqtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100012.wf5Caqtz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_tables_api.c:6423: warning: Function parameter or struct member 'elem_priv' not described in 'nft_set_elem_destroy'
>> net/netfilter/nf_tables_api.c:6423: warning: Excess function parameter 'elem' description in 'nft_set_elem_destroy'


vim +6423 net/netfilter/nf_tables_api.c

563125a73ac30d Pablo Neira Ayuso 2020-12-09  6406  
60cf9e02aac6c9 Florian Westphal  2024-03-07  6407  /**
60cf9e02aac6c9 Florian Westphal  2024-03-07  6408   * nft_set_elem_destroy - free a set element instantly
60cf9e02aac6c9 Florian Westphal  2024-03-07  6409   * @set: the set the element was supposed to be added to
60cf9e02aac6c9 Florian Westphal  2024-03-07  6410   * @elem: the private element pointer to be free'd
60cf9e02aac6c9 Florian Westphal  2024-03-07  6411   * @destroy_expr: true if embedded expression was initialised before
60cf9e02aac6c9 Florian Westphal  2024-03-07  6412   *
60cf9e02aac6c9 Florian Westphal  2024-03-07  6413   * Immediately releases an element without going through any synchronization.
60cf9e02aac6c9 Florian Westphal  2024-03-07  6414   * This function can only be used for error unwinding BEFORE the element was
60cf9e02aac6c9 Florian Westphal  2024-03-07  6415   * added to the set, else concurrent data path access may result in
60cf9e02aac6c9 Florian Westphal  2024-03-07  6416   * use-after-free.
60cf9e02aac6c9 Florian Westphal  2024-03-07  6417   * For datapath error unwinding, jumps-to-chain or objref are
60cf9e02aac6c9 Florian Westphal  2024-03-07  6418   * not supported.
60cf9e02aac6c9 Florian Westphal  2024-03-07  6419   */
9dad402b89e81a Pablo Neira Ayuso 2023-10-18  6420  void nft_set_elem_destroy(const struct nft_set *set,
9dad402b89e81a Pablo Neira Ayuso 2023-10-18  6421  			  const struct nft_elem_priv *elem_priv,
61f9e2924f4981 Liping Zhang      2016-10-22  6422  			  bool destroy_expr)
61edafbb47e9f4 Patrick McHardy   2015-03-25 @6423  {
9dad402b89e81a Pablo Neira Ayuso 2023-10-18  6424  	struct nft_set_ext *ext = nft_set_elem_ext(set, elem_priv);
3453c92731884b Pablo Neira Ayuso 2018-06-02  6425  	struct nft_ctx ctx = {
3453c92731884b Pablo Neira Ayuso 2018-06-02  6426  		.net	= read_pnet(&set->net),
3453c92731884b Pablo Neira Ayuso 2018-06-02  6427  		.family	= set->table->family,
3453c92731884b Pablo Neira Ayuso 2018-06-02  6428  	};
61edafbb47e9f4 Patrick McHardy   2015-03-25  6429  
60cf9e02aac6c9 Florian Westphal  2024-03-07  6430  	/* We can only do error unwind for vmaps or objref types
60cf9e02aac6c9 Florian Westphal  2024-03-07  6431  	 * if the caller is holding the transaction mutex.
60cf9e02aac6c9 Florian Westphal  2024-03-07  6432  	 */
60cf9e02aac6c9 Florian Westphal  2024-03-07  6433  	if (set->dtype == NFT_DATA_VERDICT ||
60cf9e02aac6c9 Florian Westphal  2024-03-07  6434  	    nft_set_ext_exists(ext, NFT_SET_EXT_OBJREF))
60cf9e02aac6c9 Florian Westphal  2024-03-07  6435  		WARN_ON_ONCE(!lockdep_commit_lock_is_held(read_pnet(&set->net)));
60cf9e02aac6c9 Florian Westphal  2024-03-07  6436  
591054469b3eef Pablo Neira Ayuso 2017-05-15  6437  	nft_data_release(nft_set_ext_key(ext), NFT_DATA_VALUE);
61edafbb47e9f4 Patrick McHardy   2015-03-25  6438  	if (nft_set_ext_exists(ext, NFT_SET_EXT_DATA))
591054469b3eef Pablo Neira Ayuso 2017-05-15  6439  		nft_data_release(nft_set_ext_data(ext), set->dtype);
563125a73ac30d Pablo Neira Ayuso 2020-12-09  6440  	if (destroy_expr && nft_set_ext_exists(ext, NFT_SET_EXT_EXPRESSIONS))
475beb9c8de122 Pablo Neira Ayuso 2020-03-18  6441  		nft_set_elem_expr_destroy(&ctx, nft_set_ext_expr(ext));
8aeff920dcc9b3 Pablo Neira Ayuso 2016-11-28  6442  	if (nft_set_ext_exists(ext, NFT_SET_EXT_OBJREF))
1689f25924ada8 Pablo Neira Ayuso 2023-06-28  6443  		nft_use_dec(&(*nft_set_ext_obj(ext))->use);
9dad402b89e81a Pablo Neira Ayuso 2023-10-18  6444  
9dad402b89e81a Pablo Neira Ayuso 2023-10-18  6445  	kfree(elem_priv);
61edafbb47e9f4 Patrick McHardy   2015-03-25  6446  }
61edafbb47e9f4 Patrick McHardy   2015-03-25  6447  EXPORT_SYMBOL_GPL(nft_set_elem_destroy);
61edafbb47e9f4 Patrick McHardy   2015-03-25  6448  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
