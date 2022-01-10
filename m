Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70600168
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641812434; x=1673348434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gadpCN+VYLeCFoRt6RHrOnbd8Lmm28cBxIqBB3D4gFs=;
  b=gStt0gNYhUMWYQEj+zUcM6YrYAwIVIrtzi5Ihgf8y0pbL7EilpseIViC
   MLTulx8UYXUPHYD3Zs0vBc8+TrlUelIRDgi+0kZ943HBE57QH0WW/eG7r
   vyvKApRawrfPhf36uxvZemvO0wZ2XXVL3qqUE3S6b+gARNoHLwwDr0VLo
   pjrTXehSqgbBLdpZS84IiFhmHNjGDnlWlJ22iJtYoeJ5UkE+HlCazbkzT
   cdFCa2Ym1zOCXryb8CcEG8J29r8hMzSzO9XcN8AhBSimKwAaG6ZelgfYx
   61FhJtPWBF7RnnN7wmMhPy8ZBsozz64Et3yU07/MALl2DmB/hV0xP8LAj
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="242998057"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="242998057"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 03:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="575783024"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2022 03:00:32 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6sPf-0002x9-Rq; Mon, 10 Jan 2022 11:00:31 +0000
Date: Mon, 10 Jan 2022 19:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 07/14] netfilter: nf_tables: add rule blob layout
Message-ID: <202201101850.vQyjtIwg-lkp@intel.com>
References: <20220109161126.83917-8-pablo@netfilter.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109161126.83917-8-pablo@netfilter.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pablo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on nf-next/master]
[also build test WARNING on next-20220107]
[cannot apply to nf/master v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pablo-Neira-Ayuso/nf_tables-datapath-ruleset-blob-and-register-tracking/20220110-001256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git master
config: i386-randconfig-a013-20220109 (https://download.01.org/0day-ci/archive/20220110/202201101850.vQyjtIwg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3570cf7af56824fc1640caee7c5609f7959d26fe
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pablo-Neira-Ayuso/nf_tables-datapath-ruleset-blob-and-register-tracking/20220110-001256
        git checkout 3570cf7af56824fc1640caee7c5609f7959d26fe
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/netfilter/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_tables_api.c:8266:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
           int i;
               ^
>> net/netfilter/nf_tables_api.c:8277:4: warning: variable 'data_size' is uninitialized when used here [-Wuninitialized]
                           data_size += sizeof(*prule) + rule->dlen;
                           ^~~~~~~~~
   net/netfilter/nf_tables_api.c:8262:30: note: initialize the variable 'data_size' to silence this warning
           unsigned int size, data_size;
                                       ^
                                        = 0
   2 warnings generated.


vim +/i +8266 net/netfilter/nf_tables_api.c

ffe8923f109b7e Florian Westphal  2020-07-24  8258  
0cbc06b3faba75 Florian Westphal  2018-05-25  8259  static int nf_tables_commit_chain_prepare(struct net *net, struct nft_chain *chain)
0cbc06b3faba75 Florian Westphal  2018-05-25  8260  {
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8261  	const struct nft_expr *expr, *last;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8262  	unsigned int size, data_size;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8263  	void *data, *data_boundary;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8264  	struct nft_rule_dp *prule;
0cbc06b3faba75 Florian Westphal  2018-05-25  8265  	struct nft_rule *rule;
0cbc06b3faba75 Florian Westphal  2018-05-25 @8266  	int i;
0cbc06b3faba75 Florian Westphal  2018-05-25  8267  
0cbc06b3faba75 Florian Westphal  2018-05-25  8268  	/* already handled or inactive chain? */
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8269  	if (chain->blob_next || !nft_is_active_next(net, chain))
0cbc06b3faba75 Florian Westphal  2018-05-25  8270  		return 0;
0cbc06b3faba75 Florian Westphal  2018-05-25  8271  
0cbc06b3faba75 Florian Westphal  2018-05-25  8272  	rule = list_entry(&chain->rules, struct nft_rule, list);
0cbc06b3faba75 Florian Westphal  2018-05-25  8273  	i = 0;
0cbc06b3faba75 Florian Westphal  2018-05-25  8274  
0cbc06b3faba75 Florian Westphal  2018-05-25  8275  	list_for_each_entry_continue(rule, &chain->rules, list) {
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8276  		if (nft_is_active_next(net, rule)) {
3570cf7af56824 Pablo Neira Ayuso 2022-01-09 @8277  			data_size += sizeof(*prule) + rule->dlen;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8278  			if (data_size > INT_MAX)
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8279  				return -ENOMEM;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8280  		}
0cbc06b3faba75 Florian Westphal  2018-05-25  8281  	}
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8282  	data_size += offsetof(struct nft_rule_dp, data);	/* last rule */
0cbc06b3faba75 Florian Westphal  2018-05-25  8283  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8284  	chain->blob_next = nf_tables_chain_alloc_rules(data_size);
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8285  	if (!chain->blob_next)
0cbc06b3faba75 Florian Westphal  2018-05-25  8286  		return -ENOMEM;
0cbc06b3faba75 Florian Westphal  2018-05-25  8287  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8288  	data = (void *)chain->blob_next->data;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8289  	data_boundary = data + data_size;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8290  	size = 0;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8291  
0cbc06b3faba75 Florian Westphal  2018-05-25  8292  	list_for_each_entry_continue(rule, &chain->rules, list) {
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8293  		if (!nft_is_active_next(net, rule))
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8294  			continue;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8295  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8296  		prule = (struct nft_rule_dp *)data;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8297  		data += offsetof(struct nft_rule_dp, data);
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8298  		if (WARN_ON_ONCE(data > data_boundary))
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8299  			return -ENOMEM;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8300  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8301  		nft_rule_for_each_expr(expr, last, rule) {
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8302  			if (WARN_ON_ONCE(data + expr->ops->size > data_boundary))
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8303  				return -ENOMEM;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8304  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8305  			memcpy(data + size, expr, expr->ops->size);
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8306  			size += expr->ops->size;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8307  		}
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8308  		if (WARN_ON_ONCE(size >= 1 << 12))
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8309  			return -ENOMEM;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8310  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8311  		prule->handle = rule->handle;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8312  		prule->dlen = size;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8313  		prule->is_last = 0;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8314  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8315  		data += size;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8316  		size = 0;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8317  		chain->blob_next->size += (unsigned long)(data - (void *)prule);
0cbc06b3faba75 Florian Westphal  2018-05-25  8318  	}
0cbc06b3faba75 Florian Westphal  2018-05-25  8319  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8320  	prule = (struct nft_rule_dp *)data;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8321  	data += offsetof(struct nft_rule_dp, data);
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8322  	if (WARN_ON_ONCE(data > data_boundary))
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8323  		return -ENOMEM;
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8324  
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8325  	nft_last_rule(chain->blob_next, prule);
3570cf7af56824 Pablo Neira Ayuso 2022-01-09  8326  
0cbc06b3faba75 Florian Westphal  2018-05-25  8327  	return 0;
0cbc06b3faba75 Florian Westphal  2018-05-25  8328  }
0cbc06b3faba75 Florian Westphal  2018-05-25  8329  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
