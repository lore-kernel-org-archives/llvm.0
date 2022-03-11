Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7C258E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 22:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647038696; x=1678574696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4O6RQpYi/eKw9Hf8Nu6/EgAcpKedC0HtOcEN0Pgu728=;
  b=NY23CWEo9QpV2N7PEuepgOIG4CxB8qgSKbMk5ZcqSgi+pXEzSxwovODP
   qwRx+2UnmmWlJ7ANkvw73uB6bWzcsaXK2vYGJE+8e3UpyxdoHfoP9izMR
   Znre/lvYgnIrMEJRaPPugHahk3FUVZw1XslbIkzHTQ+sFHVXjaFnTxPSf
   rGHAsgKgz/75xCCnTh0wgchlKLIB3kKLpEYEU2sauw/I2NMtG9Rx2IHAu
   xMwbE1C/ABh8ZOTEmGPWWO+L6UJTKPgTP8OJYGcYZRb6/HapS7Xgy6vjt
   oavHlj76sctnWm5mziwOziL71wTU8FPC4kEcJmn1kVibtSrZt4MAX3iAu
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="243114151"
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="243114151"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 14:44:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="539165362"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Mar 2022 14:44:53 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSo0D-0007CK-5g; Fri, 11 Mar 2022 22:44:53 +0000
Date: Sat, 12 Mar 2022 06:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH nf-next] netfilter: nf_tables: add stubs for readonly
 expressions
Message-ID: <202203120618.2FZ2VXaE-lkp@intel.com>
References: <20220311105430.12075-1-fw@strlen.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311105430.12075-1-fw@strlen.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Florian,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20220310]
[cannot apply to nf-next/master nf/master linus/master v5.17-rc7 v5.17-rc6 v5.17-rc5 v5.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Florian-Westphal/netfilter-nf_tables-add-stubs-for-readonly-expressions/20220311-185613
base:    71941773e143369a73c9c4a3b62fbb60736a1182
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220312/202203120618.2FZ2VXaE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a0cb27794354ccba36b882731b93fdda090f2003
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Florian-Westphal/netfilter-nf_tables-add-stubs-for-readonly-expressions/20220311-185613
        git checkout a0cb27794354ccba36b882731b93fdda090f2003
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/panel/ net/netfilter/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/netfilter/nft_cmp.c:363:13: error: use of undeclared identifier 'nft_cmp_reduce'; did you mean 'nft_cmp_dump'?
           .reduce         = nft_cmp_reduce,
                             ^~~~~~~~~~~~~~
                             nft_cmp_dump
   net/netfilter/nft_cmp.c:99:12: note: 'nft_cmp_dump' declared here
   static int nft_cmp_dump(struct sk_buff *skb, const struct nft_expr *expr)
              ^
>> net/netfilter/nft_cmp.c:363:13: error: incompatible function pointer types initializing 'bool (*)(struct nft_regs_track *, const struct nft_expr *)' (aka '_Bool (*)(struct nft_regs_track *, const struct nft_expr *)') with an expression of type 'int (struct sk_buff *, const struct nft_expr *)' [-Werror,-Wincompatible-function-pointer-types]
           .reduce         = nft_cmp_reduce,
                             ^~~~~~~~~~~~~~
   2 errors generated.


vim +363 net/netfilter/nft_cmp.c

   354	
   355	
   356	const struct nft_expr_ops nft_cmp16_fast_ops = {
   357		.type		= &nft_cmp_type,
   358		.size		= NFT_EXPR_SIZE(sizeof(struct nft_cmp16_fast_expr)),
   359		.eval		= NULL,	/* inlined */
   360		.init		= nft_cmp16_fast_init,
   361		.dump		= nft_cmp16_fast_dump,
   362		.offload	= nft_cmp16_fast_offload,
 > 363		.reduce		= nft_cmp_reduce,
   364	};
   365	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
