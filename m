Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8E7F3
	for <llvm@lists.linux.dev>; Sun, 18 Sep 2022 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663502791; x=1695038791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ryDXpT+MlEtbkYUsiGBkqeR0x4FHwEizDMuw870HWCs=;
  b=YLgMZhvubkCsynYA0yQsuTXojsBNaWxYsm5FlGznZM5O/v5Jm34aNy8h
   Sw6sfiXHMYcf7HwR0p+UBPqvkDQ7tMzvOJtq9aM+776T4sUM3H+8iolYp
   tSW1k2eLYaOXB5NqAL7VyEmV3j9hubmy6VgT3IDA1paPN5J1L4chtjC+G
   TAgU80UjEcCYS00KUCPA4jlJwtbnI6V4MyNo1xha8flAkP5q+uY0XISMc
   irpPqANvU/x0KFYHKLU3YF8m6EpDHqHKSYl1zvPLVO1RMIpXtwf/p6J3q
   BuEdsS7hOtIF+brm5GVK5yNOQpILdn5Pxk+FPBoT6tyT11f28ffgPKtFp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="297957950"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="297957950"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 05:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="569336668"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Sep 2022 05:06:29 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZt48-0001A9-0R;
	Sun, 18 Sep 2022 12:06:28 +0000
Date: Sun, 18 Sep 2022 20:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Shen <shenjian15@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFCv8 PATCH net-next 02/55] net: replace general features
 macroes with global netdev_features variables
Message-ID: <202209181955.ZwQVuo5F-lkp@intel.com>
References: <20220918094336.28958-3-shenjian15@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220918094336.28958-3-shenjian15@huawei.com>

Hi Jian,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Shen/net-extend-the-type-of-netdev_features_t-to-bitmap/20220918-175512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 44a8535fb87c5503ce01121278ac3058eef701ec
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220918/202209181955.ZwQVuo5F-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d2ad321600f7e1199ffb76240a37122c72bf2b5d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jian-Shen/net-extend-the-type-of-netdev_features_t-to-bitmap/20220918-175512
        git checkout d2ad321600f7e1199ffb76240a37122c72bf2b5d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash lib/ net/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/core/netdev_features.c:99:13: warning: no previous prototype for function 'netdev_features_init' [-Wmissing-prototypes]
   void __init netdev_features_init(void)
               ^
   net/core/netdev_features.c:99:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init netdev_features_init(void)
   ^
   static 
   1 warning generated.


vim +/netdev_features_init +99 net/core/netdev_features.c

    98	
  > 99	void __init netdev_features_init(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
