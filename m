Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7767F33C1
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 20:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660162932; x=1691698932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=750f7XuvpErvsci7/p0aCNeOM029STpzBlMv/AR4oNg=;
  b=gOnWc/oScg3fjN92oO8ysoOA8pA1i3AujmuBHtMvUpUBrUtULag7+XOh
   k/Ryuve1sC5rM8Vnpk6Di4vwxVWSK5yqDTfYHtKYdwmNUeamimhFYME+j
   tkftGnE0Xc5hOwGigdck0b5W3RkWW7WzJ58Ci+YSfAI+AtmfWIMeim1rg
   UCgLrGqAxLlOp7Yx7VXFqzxYBGlXsqYB4eRxyeovMm1OH27KE0Wzy5aOO
   IKFdy4Bwp55l0MIRPoq1fJKD6L7s7fZbFPD2wAcvweXC0cphHjlB5xzBu
   j0l11E1K73kn7BD3wOCev56A1hY9xmskC6dRLU00IDt+YFGohLbBDf4tc
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="291975123"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="291975123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 13:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="608690599"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 10 Aug 2022 13:22:05 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLsDN-0000gN-0b;
	Wed, 10 Aug 2022 20:22:05 +0000
Date: Thu, 11 Aug 2022 04:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Shen <shenjian15@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFCv7 PATCH net-next 02/36] net: replace general features
 macroes with global netdev_features variables
Message-ID: <202208110427.1rTIDNfZ-lkp@intel.com>
References: <20220810030624.34711-3-shenjian15@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810030624.34711-3-shenjian15@huawei.com>

Hi Jian,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Shen/net-extend-the-type-of-netdev_features_t-to-bitmap/20220810-111706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git f86d1fbbe7858884d6754534a0afbb74fc30bc26
config: hexagon-randconfig-r023-20220810 (https://download.01.org/0day-ci/archive/20220811/202208110427.1rTIDNfZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/37294e085e2eafe23ebed9a19e6141256d5ca13e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jian-Shen/net-extend-the-type-of-netdev_features_t-to-bitmap/20220810-111706
        git checkout 37294e085e2eafe23ebed9a19e6141256d5ca13e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/core/netdev_features.c:9:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_ethtool_features);
   ^
   int
>> net/core/netdev_features.c:9:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_ethtool_features);
                     ^
   net/core/netdev_features.c:12:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_never_change_features);
   ^
   int
   net/core/netdev_features.c:12:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_never_change_features);
                     ^
   net/core/netdev_features.c:15:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_gso_features_mask);
   ^
   int
   net/core/netdev_features.c:15:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_gso_features_mask);
                     ^
   net/core/netdev_features.c:18:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_ip_csum_features);
   ^
   int
   net/core/netdev_features.c:18:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_ip_csum_features);
                     ^
   net/core/netdev_features.c:21:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_csum_features_mask);
   ^
   int
   net/core/netdev_features.c:21:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_csum_features_mask);
                     ^
   net/core/netdev_features.c:24:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_general_tso_features);
   ^
   int
   net/core/netdev_features.c:24:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_general_tso_features);
                     ^
   net/core/netdev_features.c:27:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_all_tso_features);
   ^
   int
   net/core/netdev_features.c:27:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_all_tso_features);
                     ^
   net/core/netdev_features.c:30:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_tso_ecn_features);
   ^
   int
   net/core/netdev_features.c:30:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_tso_ecn_features);
                     ^
   net/core/netdev_features.c:33:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_all_fcoe_features);
   ^
   int
   net/core/netdev_features.c:33:19: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL(netdev_all_fcoe_features);
                     ^
   net/core/netdev_features.c:36:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(netdev_gso_software_features);
   ^
   int
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/int +9 net/core/netdev_features.c

     7	
     8	netdev_features_t netdev_ethtool_features __ro_after_init;
   > 9	EXPORT_SYMBOL_GPL(netdev_ethtool_features);
    10	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
