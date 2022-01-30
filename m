Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83472C9E
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 01:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643505674; x=1675041674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r+UndQ1T578rPOdJL5bqdLK8JUgvuQSEksEyo5ytApM=;
  b=GF+yaiT4IMZCqfF6zuiI3H3O8KpUzS2RLtNTI90aBKBYtrA4GWjdOkOD
   Br68genpS+rIzAh/grlceI3FdX6CryO6XDqSgTjTrBKMor4vpYNNX4Wph
   tyqO+xNBoWEXiEiA8PNogHrD3LZ6vCzItsNCVlpjmNlQKpGQcmAxS5DMs
   llx4MN4diilu1WDQcDU3We+krFnCyhu7Mk37RJkniEDbunqHEQBg9wTnx
   mNEZxw5doCh4E9Egf9/1XO8EY5/LZfylkTXSkVo5wFRZWjyt+lPUMhP6r
   jobQVWes6RWtp2tG1eqap3YBlndOBfvQFZYDk/XaQiJmwXF/mfap9mLA1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="308037916"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="308037916"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 17:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="478661771"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jan 2022 17:21:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDytz-000Ps7-Kg; Sun, 30 Jan 2022 01:21:11 +0000
Date: Sun, 30 Jan 2022 09:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>, netdev@vger.kernel.org,
	kuba@kernel.org, ilias.apalodimas@linaro.org, davem@davemloft.net,
	hawk@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Joe Damato <jdamato@fastly.com>
Subject: Re: [net-next v2 10/10] net-procfs: Show page pool stats in proc
Message-ID: <202201300928.UoQgv8PS-lkp@intel.com>
References: <1643499540-8351-11-git-send-email-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643499540-8351-11-git-send-email-jdamato@fastly.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Joe,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Joe-Damato/page_pool-Add-page_pool-stat-counters/20220130-074147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git ff58831fa02deb42fd731f830d8d9ec545573c7c
config: arm-randconfig-r016-20220130 (https://download.01.org/0day-ci/archive/20220130/202201300928.UoQgv8PS-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/5f0fd838269d51e7a97662eaf54868a248b8bd42
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Joe-Damato/page_pool-Add-page_pool-stat-counters/20220130-074147
        git checkout 5f0fd838269d51e7a97662eaf54868a248b8bd42
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/core/net-procfs.c:399:1: warning: unused label 'out_ptype' [-Wunused-label]
   out_ptype:
   ^~~~~~~~~~
   1 warning generated.


vim +/out_ptype +399 net/core/net-procfs.c

5f0fd838269d51 Joe Damato 2022-01-29  398  
900ff8c6321418 Cong Wang  2013-02-18 @399  out_ptype:
900ff8c6321418 Cong Wang  2013-02-18  400  	remove_proc_entry("ptype", net->proc_net);
900ff8c6321418 Cong Wang  2013-02-18  401  out_softnet:
900ff8c6321418 Cong Wang  2013-02-18  402  	remove_proc_entry("softnet_stat", net->proc_net);
900ff8c6321418 Cong Wang  2013-02-18  403  out_dev:
900ff8c6321418 Cong Wang  2013-02-18  404  	remove_proc_entry("dev", net->proc_net);
900ff8c6321418 Cong Wang  2013-02-18  405  	goto out;
900ff8c6321418 Cong Wang  2013-02-18  406  }
900ff8c6321418 Cong Wang  2013-02-18  407  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
