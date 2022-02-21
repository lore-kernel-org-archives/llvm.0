Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4633C1
	for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645466078; x=1677002078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xOXgXU+OPE9X2oAEgjLqAK/7hgrPrTWqALthyfY5iKU=;
  b=lfaD6GBhepZP8a6IhKrNAmx0/Oa8xWI4eYaHnbWX2pgbmYPZcab0d9VS
   3SU9G+iSBVz1RTK2RtagBVvGiHwxv5peBybYoZuS4lEzr1eSfdhqZhzej
   ncps5P3gg4eHAOpj1XhWx8CgUJZ1m5rF4isbam4lnhAdUWnuUsvwBL2YO
   nm7aZqqAfGhcLp71VXxOKyOUFu6EHtvV6R1fKN+gmE8l9bJeFoI+nGgkU
   g0MfboHcXsy3fxaXOOBl7aGKtvrCJXO7ukyUEp3CxY7SZwmqjdQ6Q5EWJ
   oL9mkujeLWNS/a7ebv7BBFRorMCwU+sXDpCq1oTLwJdlmLt4mo2eWeEJc
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232170168"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="232170168"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 09:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="505164277"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Feb 2022 09:54:36 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMCtP-0001qo-Rh; Mon, 21 Feb 2022 17:54:35 +0000
Date: Tue, 22 Feb 2022 01:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3] netfilter: nf_tables: fix memory leak during stateful
 obj update
Message-ID: <202202220115.4cv9qUQN-lkp@intel.com>
References: <20220221123149.11519-1-fw@strlen.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221123149.11519-1-fw@strlen.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Florian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on nf-next/master]
[also build test WARNING on linus/master v5.17-rc5 next-20220217]
[cannot apply to nf/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Florian-Westphal/netfilter-nf_tables-fix-memory-leak-during-stateful-obj-update/20220221-203309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git master
config: i386-randconfig-a012-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220115.4cv9qUQN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c462078317a686231967b4edac900241eafbbf13
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Florian-Westphal/netfilter-nf_tables-fix-memory-leak-during-stateful-obj-update/20220221-203309
        git checkout c462078317a686231967b4edac900241eafbbf13
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/netfilter/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_tables_api.c:6561:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!trans)
               ^~~~~~
   net/netfilter/nf_tables_api.c:6581:9: note: uninitialized use occurs here
           return err;
                  ^~~
   net/netfilter/nf_tables_api.c:6561:2: note: remove the 'if' if its condition is always false
           if (!trans)
           ^~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6554:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +6561 net/netfilter/nf_tables_api.c

e50092404c1bc7 Pablo Neira Ayuso          2016-11-28  6546  
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6547  static int nf_tables_updobj(const struct nft_ctx *ctx,
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6548  			    const struct nft_object_type *type,
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6549  			    const struct nlattr *attr,
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6550  			    struct nft_object *obj)
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6551  {
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6552  	struct nft_object *newobj;
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6553  	struct nft_trans *trans;
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6554  	int err;
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6555  
c462078317a686 Florian Westphal           2022-02-21  6556  	if (!try_module_get(type->owner))
c462078317a686 Florian Westphal           2022-02-21  6557  		return -ENOENT;
c462078317a686 Florian Westphal           2022-02-21  6558  
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6559  	trans = nft_trans_alloc(ctx, NFT_MSG_NEWOBJ,
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6560  				sizeof(struct nft_trans_obj));
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26 @6561  	if (!trans)
c462078317a686 Florian Westphal           2022-02-21  6562  		goto err_trans;
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6563  
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6564  	newobj = nft_obj_init(ctx, type, attr);
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6565  	if (IS_ERR(newobj)) {
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6566  		err = PTR_ERR(newobj);
b74ae9618b15de Dan Carpenter              2019-09-06  6567  		goto err_free_trans;
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6568  	}
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6569  
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6570  	nft_trans_obj(trans) = obj;
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6571  	nft_trans_obj_update(trans) = true;
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6572  	nft_trans_obj_newobj(trans) = newobj;
0854db2aaef3fc Florian Westphal           2021-04-01  6573  	nft_trans_commit_list_add_tail(ctx->net, trans);
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6574  
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6575  	return 0;
b74ae9618b15de Dan Carpenter              2019-09-06  6576  
b74ae9618b15de Dan Carpenter              2019-09-06  6577  err_free_trans:
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6578  	kfree(trans);
c462078317a686 Florian Westphal           2022-02-21  6579  err_trans:
c462078317a686 Florian Westphal           2022-02-21  6580  	module_put(type->owner);
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6581  	return err;
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6582  }
d62d0ba97b5803 Fernando Fernandez Mancera 2019-08-26  6583  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
