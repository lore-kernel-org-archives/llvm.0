Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262B2C80
	for <llvm@lists.linux.dev>; Wed, 29 Dec 2021 03:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640749418; x=1672285418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gy3ovrmRBnT4Z6o9MbsJ37FAdHY2PPV6axeAn/D/VmM=;
  b=RqdWYEupyQ8NfqZfhrpC1YQlAqy7En3YhMls8trj49Sz+3PrmZiYc4LH
   bsbwUnXcR6G+ts5ZxSyyEornLgxAqr/iK1ac5WrWM4e4phzFWJD20vwFw
   1ipbu21/Mr/3Bfy5Z4BI7fljw3LimlCXOo5oUbejCTZARgx6Sa4hGPB3X
   6GAkfG0OV/Rl/ndZG2ZIs05hZ/tv222nPu+9B/WoKmjvEzqW6U4V4mjBG
   /fra9PGFTlfdlHAbwCfafDABGaE6UstC9v1WjSFszsa5Ppuxwny1ujE94
   RlsbNq4HIY00f0o1S/EZ1pDGQ1SmbkqWlAQzcG+DU2HiSNI0soZggyccI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="304816550"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="304816550"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 19:43:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="618922839"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Dec 2021 19:43:36 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n2PsF-0008MR-Eo; Wed, 29 Dec 2021 03:43:35 +0000
Date: Wed, 29 Dec 2021 11:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jolsa-perf:kprobe/multi 7/13]
 samples/kprobes/kprobe_example.c:124:6: error: no member named 'multi' in
 'struct kprobe'
Message-ID: <202112291138.cVJHohUf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git kprobe/multi
head:   774280c9bc95e4e50cda3cd09324bd03fec50b52
commit: 2bf53e58ccdc41fb37bc2768bfa17ed9f822bf1e [7/13] samples/kprobes: Add support for multi kprobe interface
config: i386-randconfig-a016-20211228 (https://download.01.org/0day-ci/archive/20211229/202112291138.cVJHohUf-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=2bf53e58ccdc41fb37bc2768bfa17ed9f822bf1e
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf kprobe/multi
        git checkout 2bf53e58ccdc41fb37bc2768bfa17ed9f822bf1e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash samples/kprobes/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> samples/kprobes/kprobe_example.c:124:6: error: no member named 'multi' in 'struct kprobe'
                   kp.multi.symbols = (const char **) symbols;
                   ~~ ^
   samples/kprobes/kprobe_example.c:125:6: error: no member named 'multi' in 'struct kprobe'
                   kp.multi.cnt = cnt;
                   ~~ ^
   2 errors generated.


vim +124 samples/kprobes/kprobe_example.c

    98	
    99	static int __init kprobe_init(void)
   100	{
   101		char *p, *tmp, **symbols = NULL;
   102		int cnt, ret;
   103	
   104		kp.pre_handler = handler_pre;
   105		kp.post_handler = handler_post;
   106	
   107		if (strchr(symbol, ',')) {
   108			tmp = kstrdup(symbol, GFP_KERNEL);
   109			if (!tmp)
   110				return -ENOMEM;
   111	
   112			p = strchr(tmp, ',');
   113			while (p) {
   114				*p = ' ';
   115				p = strchr(p + 1, ',');
   116			}
   117	
   118			symbols = argv_split(GFP_KERNEL, tmp, &cnt);
   119			if (!symbols) {
   120				ret = -ENOMEM;
   121				goto out;
   122			}
   123	
 > 124			kp.multi.symbols = (const char **) symbols;
   125			kp.multi.cnt = cnt;
   126		}
   127	
   128		ret = register_kprobe(&kp);
   129		if (ret < 0) {
   130			pr_err("register_kprobe failed, returned %d\n", ret);
   131			goto out;
   132		}
   133	
   134		if (symbols)
   135			pr_info("Planted multi kprobe to %s\n", symbol);
   136		else
   137			pr_info("Planted kprobe at %p\n", kp.addr);
   138	
   139	out:
   140		kfree(tmp);
   141		if (symbols)
   142			argv_free(symbols);
   143		return ret;
   144	}
   145	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
