Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2ED2CA8
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642751923; x=1674287923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IcljowA7phGs77h2h1Njx9peuGqMrp5Y5dp957/nMvc=;
  b=BgkJnVQubzjGgbxSNUDU9cxEL62zDQuRySs5+lNbqkJ64BdbFFbN9pEr
   eOEvs7WkLuNaD6CItTCcH+aB8uhPt8ZO5G8IEXnjer4HjcotlajVmPbsU
   TS/5Ip4mxhjatdBkICOBb4gdkU3futl9Vac5wXPpyET1jbDZEWBcmn6bp
   tfNSM0tzpG91uAhc95gyiXLK+SaFAwJfaCT5NSHJgd2YxnGDDBCVBltBW
   6L6UbX9kXM5Dc9sE3q/R5kDN1inc6g/Sa7RxGvqLJQbP3+LkkAvUIAtW0
   vvAVe/Hz4XlPEf5kioypf814EFGUQeXxsfZoO+gd+12RBnLBudKyyUhem
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245812074"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="245812074"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 23:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="596051365"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2022 23:58:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAoof-000F4f-Vj; Fri, 21 Jan 2022 07:58:37 +0000
Date: Fri, 21 Jan 2022 15:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: ycaibb <ycaibb@gmail.com>, edumazet@google.com, davem@davemloft.net,
	yoshfuji@linux-ipv6.org, dsahern@kernel.org, kuba@kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	kafai@fb.com, songliubraving@fb.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] ipv4: fix lock leaks
Message-ID: <202201211532.LRhcv7cH-lkp@intel.com>
References: <20220121031108.4813-1-ycaibb@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121031108.4813-1-ycaibb@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi ycaibb,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master horms-ipvs/master linus/master v5.16 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/ycaibb/ipv4-fix-lock-leaks/20220121-111241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 8aaaf2f3af2ae212428f4db1af34214225f5cec3
config: mips-cu1000-neo_defconfig (https://download.01.org/0day-ci/archive/20220121/202201211532.LRhcv7cH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/604258c8f5a9792828f54e55769ca1673c4a34ee
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review ycaibb/ipv4-fix-lock-leaks/20220121-111241
        git checkout 604258c8f5a9792828f54e55769ca1673c4a34ee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_ipv4.c:2344:5: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                                   return sk;
                                   ^
   net/ipv4/tcp_ipv4.c:2342:4: note: previous statement is here
                           if (seq_sk_match(seq, sk))
                           ^
   net/ipv4/tcp_ipv4.c:2423:5: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                                   return sk;
                                   ^
   net/ipv4/tcp_ipv4.c:2421:4: note: previous statement is here
                           if (seq_sk_match(seq, sk))
                           ^
   2 warnings generated.


vim +/if +2344 net/ipv4/tcp_ipv4.c

ad2d61376a0517 Martin KaFai Lau 2021-07-01  2321  
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2322  /* Find a non empty bucket (starting from st->bucket)
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2323   * and return the first sk from it.
a8b690f98baf9f Tom Herbert      2010-06-07  2324   */
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2325  static void *listening_get_first(struct seq_file *seq)
^1da177e4c3f41 Linus Torvalds   2005-04-16  2326  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  2327  	struct tcp_iter_state *st = seq->private;
b08d4d3b6c0460 Yonghong Song    2020-06-23  2328  
a8b690f98baf9f Tom Herbert      2010-06-07  2329  	st->offset = 0;
05c0b35709c58b Martin KaFai Lau 2021-07-01  2330  	for (; st->bucket <= tcp_hashinfo.lhash2_mask; st->bucket++) {
05c0b35709c58b Martin KaFai Lau 2021-07-01  2331  		struct inet_listen_hashbucket *ilb2;
05c0b35709c58b Martin KaFai Lau 2021-07-01  2332  		struct inet_connection_sock *icsk;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2333  		struct sock *sk;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2334  
05c0b35709c58b Martin KaFai Lau 2021-07-01  2335  		ilb2 = &tcp_hashinfo.lhash2[st->bucket];
05c0b35709c58b Martin KaFai Lau 2021-07-01  2336  		if (hlist_empty(&ilb2->head))
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2337  			continue;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2338  
05c0b35709c58b Martin KaFai Lau 2021-07-01  2339  		spin_lock(&ilb2->lock);
05c0b35709c58b Martin KaFai Lau 2021-07-01  2340  		inet_lhash2_for_each_icsk(icsk, &ilb2->head) {
05c0b35709c58b Martin KaFai Lau 2021-07-01  2341  			sk = (struct sock *)icsk;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2342  			if (seq_sk_match(seq, sk))
604258c8f5a979 Ryan Cai         2022-01-21  2343  				spin_unlock(&ilb2->lock);
b72acf4501d7c3 Martin KaFai Lau 2021-07-01 @2344  				return sk;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2345  		}
05c0b35709c58b Martin KaFai Lau 2021-07-01  2346  		spin_unlock(&ilb2->lock);
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2347  	}
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2348  
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2349  	return NULL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2350  }
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2351  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
