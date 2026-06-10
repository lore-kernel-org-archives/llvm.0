Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97232202F70;
	Wed, 10 Jun 2026 23:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781134425; cv=none; b=g0+4S/WoY81r/HS+dj+OHR6LM5+4+rDZMLO3UqRlnQt/sdwRT7MCibytvMJhFMSWhfXapgPlwMhq+Eb5zZ4KSk6UcQk+qsHzjMPA+nE9+2Gxw7gtBjSB1+v3TnFEm71gDXkIAf6zamSw/sw7vnagy2/Cz09+ubwuHrMlvgqjWA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781134425; c=relaxed/simple;
	bh=7cgO4PoW38pKtdAQrhf4qftDA/SojIx+cWJbr56OBSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IWgrn/BviU4FRkGZkUE1HUcL+7qS/Id21dMhQO/A1Gp2RrrTryI/oDvnTF+05FQ0xhqNPKtC476bnUmgI+Gey87d8UTaKfn8AIzxf5HN3poOFGYF/KqWE4k0MG7dKuWVu0y4LxHicWA2ll7oAJcWrJ2A+tZA+fNNsBPa4kz/diY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrvpqrYO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrvpqrYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781134424; x=1812670424;
  h=date:from:to:cc:subject:message-id;
  bh=7cgO4PoW38pKtdAQrhf4qftDA/SojIx+cWJbr56OBSA=;
  b=VrvpqrYOvssNMiN3PqiOmlgjvA4UOB7zPh33Rv2gCXSak25mNHuY1KcM
   r2HCWaAKRACe0kEeWn24/1qNTHoyla1cYbDgC7lb4nSFT9zKoLD2wPUlq
   CtweiUNb6UPoPMFRdynr+dkWhoRrEPp5d1MHwATkhwqDoNNbK82iLs0bi
   AEApy+p2ixoL2a0hPKfXuaH9Go2Av/QhA/u1csIuucPKRyYs+aQWrF80j
   JiZjmLLSyc4K8LsTKIg+58jJBwQNl7+9mBhMHnOsJB+urk+jL1SKD3fM7
   QbLG8EJZ7Wk0oORXIGx84Yx7rmE4ISyLsskvDaYNIjkKaKWlkyFpFFecY
   Q==;
X-CSE-ConnectionGUID: iMVToCm4TGSXQBmQjcjAQA==
X-CSE-MsgGUID: A0LfodbKQiOlnIAdIQx5Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81944809"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81944809"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 16:33:43 -0700
X-CSE-ConnectionGUID: t5n6XEabQmO2atic7TWxlA==
X-CSE-MsgGUID: h+kxwKHiRu6hO2RIuZEwow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="248180264"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2026 16:33:42 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXSQV-000000003qP-3xXo;
	Wed, 10 Jun 2026 23:33:39 +0000
Date: Thu, 11 Jun 2026 01:32:48 +0200
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/netfilter/nfnetlink_cthelper.c:227:6: warning: variable
 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202606110148.Pn8XckYm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nf_conntrack_helper-dynamically-allocate-struct-nf_conntrack_helper/20260602-061630
head:   739a05785415ce5213468185673fa33bae0e8306
commit: fe02ae4335b9628202025ecd6821fffb1edaed32 netfilter: nf_conntrack_helper: dynamically allocate struct nf_conntrack_helper
date:   9 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260611/202606110148.Pn8XckYm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110148.Pn8XckYm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110148.Pn8XckYm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nfnetlink_cthelper.c:227:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     227 |         if (!helper)
         |             ^~~~~~~
   net/netfilter/nfnetlink_cthelper.c:280:9: note: uninitialized use occurs here
     280 |         return ret;
         |                ^~~
   net/netfilter/nfnetlink_cthelper.c:227:2: note: remove the 'if' if its condition is always false
     227 |         if (!helper)
         |         ^~~~~~~~~~~~
     228 |                 goto err_cth;
         |                 ~~~~~~~~~~~~
   net/netfilter/nfnetlink_cthelper.c:217:9: note: initialize the variable 'ret' to silence this warning
     217 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +227 net/netfilter/nfnetlink_cthelper.c

   209	
   210	static int
   211	nfnl_cthelper_create(const struct nlattr * const tb[],
   212			     struct nf_conntrack_tuple *tuple)
   213	{
   214		struct nf_conntrack_helper *helper;
   215		struct nfnl_cthelper *nfcth;
   216		unsigned int size;
   217		int ret;
   218	
   219		if (!tb[NFCTH_TUPLE] || !tb[NFCTH_POLICY] || !tb[NFCTH_PRIV_DATA_LEN])
   220			return -EINVAL;
   221	
   222		nfcth = kzalloc_obj(*nfcth, GFP_KERNEL_ACCOUNT);
   223		if (nfcth == NULL)
   224			return -ENOMEM;
   225	
   226		helper = kzalloc_obj(*helper, GFP_KERNEL_ACCOUNT);
 > 227		if (!helper)
   228			goto err_cth;
   229	
   230		nfcth->helper = helper;
   231	
   232		ret = nfnl_cthelper_parse_expect_policy(helper, tb[NFCTH_POLICY]);
   233		if (ret < 0)
   234			goto err_helper;
   235	
   236		nla_strscpy(helper->name,
   237			    tb[NFCTH_NAME], NF_CT_HELPER_NAME_LEN);
   238		size = ntohl(nla_get_be32(tb[NFCTH_PRIV_DATA_LEN]));
   239		if (size > sizeof_field(struct nf_conn_help, data)) {
   240			ret = -ENOMEM;
   241			goto err_helper;
   242		}
   243		helper->data_len = size;
   244	
   245		helper->flags |= NF_CT_HELPER_F_USERSPACE;
   246		memcpy(&helper->tuple, tuple, sizeof(struct nf_conntrack_tuple));
   247	
   248		helper->me = THIS_MODULE;
   249		helper->help = nfnl_userspace_cthelper;
   250		helper->from_nlattr = nfnl_cthelper_from_nlattr;
   251		helper->to_nlattr = nfnl_cthelper_to_nlattr;
   252	
   253		/* Default to queue number zero, this can be updated at any time. */
   254		if (tb[NFCTH_QUEUE_NUM])
   255			helper->queue_num = ntohl(nla_get_be32(tb[NFCTH_QUEUE_NUM]));
   256	
   257		if (tb[NFCTH_STATUS]) {
   258			int status = ntohl(nla_get_be32(tb[NFCTH_STATUS]));
   259	
   260			switch(status) {
   261			case NFCT_HELPER_STATUS_ENABLED:
   262				helper->flags |= NF_CT_HELPER_F_CONFIGURED;
   263				break;
   264			case NFCT_HELPER_STATUS_DISABLED:
   265				helper->flags &= ~NF_CT_HELPER_F_CONFIGURED;
   266				break;
   267			}
   268		}
   269	
   270		ret = __nf_conntrack_helper_register(helper);
   271		if (ret < 0)
   272			goto err_helper;
   273	
   274		list_add_tail(&nfcth->list, &nfnl_cthelper_list);
   275		return 0;
   276	err_helper:
   277		kfree(helper);
   278	err_cth:
   279		kfree(nfcth);
   280		return ret;
   281	}
   282	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
