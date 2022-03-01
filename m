Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE8161
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646153266; x=1677689266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mWGDaSPA92rhBEpQPnffC+57LyaI/PppXkHm7qxQG/Y=;
  b=HBQO2Fjk0VGV+wYyD5WxvmCD9HJnV22ygIHSaIxPVWyLVXtYEaQACThz
   QMf3nC3DQ/jT4DH9fgQRltSWFn4SX58ZLTbNzmjSOpGefDD/ZOkSfrQXm
   TaW+v91A4T1pv4lg/rwB+xaeJsDNtdF6y9DRPi+RsjCBV2vfuaBLPLH+s
   9H++ygLKAaQf5AQMh7V5qUQuzBQe73/Hzqd+1HdRIHMOrB10ahnaGyysA
   bbN2knln7PBCkrUIy/qDAjk8lKMj5W8uhPWmpWUXtGIU5c9GWxQS155Xp
   o283b/6jzz4UKcOdnS99iK7Q8KciR42lE1r0Yvkevv5WGptEIyVsejeAI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="252008691"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="252008691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 08:47:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="510580406"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Mar 2022 08:47:44 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nP5f5-0000ja-Im; Tue, 01 Mar 2022 16:47:43 +0000
Date: Wed, 2 Mar 2022 00:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dust Li <dust.li@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 3/7] net/smc: add sysctl for autocorking
Message-ID: <202203020056.6G9pXJjO-lkp@intel.com>
References: <20220301094402.14992-4-dust.li@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301094402.14992-4-dust.li@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dust,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Dust-Li/net-smc-some-datapath-performance-optimizations/20220301-174523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git f2b77012ddd5b2532d262f100be3394ceae3ea59
config: riscv-randconfig-r042-20220301 (https://download.01.org/0day-ci/archive/20220302/202203020056.6G9pXJjO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/e00cb05a2efd7fc375686974d9b3190379a34c31
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dust-Li/net-smc-some-datapath-performance-optimizations/20220301-174523
        git checkout e00cb05a2efd7fc375686974d9b3190379a34c31
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/smc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/smc/smc_tx.c:150:17: warning: comparison of distinct pointer types ('typeof (sock_net(&smc->sk)->smc.sysctl_autocorking_size) *' (aka 'unsigned int *') and 'typeof (conn->sndbuf_desc->len >> 1) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
           corking_size = min(sock_net(&smc->sk)->smc.sysctl_autocorking_size,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +150 net/smc/smc_tx.c

   133	
   134	/* If we have pending CDC messages, do not send:
   135	 * Because CQE of this CDC message will happen shortly, it gives
   136	 * a chance to coalesce future sendmsg() payload in to one RDMA Write,
   137	 * without need for a timer, and with no latency trade off.
   138	 * Algorithm here:
   139	 *  1. First message should never cork
   140	 *  2. If we have pending Tx CDC messages, wait for the first CDC
   141	 *     message's completion
   142	 *  3. Don't cork to much data in a single RDMA Write to prevent burst
   143	 *     traffic, total corked message should not exceed sendbuf/2
   144	 */
   145	static bool smc_should_autocork(struct smc_sock *smc)
   146	{
   147		struct smc_connection *conn = &smc->conn;
   148		int corking_size;
   149	
 > 150		corking_size = min(sock_net(&smc->sk)->smc.sysctl_autocorking_size,
   151				   conn->sndbuf_desc->len >> 1);
   152	
   153		if (atomic_read(&conn->cdc_pend_tx_wr) == 0 ||
   154		    smc_tx_prepared_sends(conn) > corking_size)
   155			return false;
   156		return true;
   157	}
   158	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
