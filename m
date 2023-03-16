Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E33E20F7;
	Thu, 16 Mar 2023 07:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678953152; x=1710489152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lNZTcgtBHOEBYGLRjfZcwGbtXaQrBPWCmopFwZMvR5Q=;
  b=IThvaliFd838sAW2uPkJMRlmD7qEiGwkMyWvw1yWQeKzO3auFoiBc2HC
   A4cb79LVX++b94LXCyjyctXgYviA2VVBNoK7QY4EF5qE63yVBiA4vWiyS
   WanNdlwoUYUuNTdOqT33oj3WwQVIVFCMNfl97zA4VQXZk3WgdXpjDic3p
   vtkONzE4M7XpmIBHEbILmYUuGRWjsxvYrPPglNgCcjFhnmJzDByVAGa/k
   Cg3A6kYI8J/6aDsD/wSVJSyleNYzDcQS0HoiKFhaBbmMhDycT7F9mfMQX
   5i9cGZajcJoS8jGoMUuQIkesoyx+21JC8h7aXulcE/WeurlhgPv8R8cl8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424189706"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="424189706"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 00:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="925658850"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="925658850"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 00:52:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pciPR-0008Po-0L;
	Thu, 16 Mar 2023 07:52:25 +0000
Date: Thu, 16 Mar 2023 15:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v3 04/14] net: phy: Add a binding for PHY LEDs
Message-ID: <202303161542.hNO84wyv-lkp@intel.com>
References: <20230314101516.20427-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314101516.20427-5-ansuelsmth@gmail.com>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230315-002131
patch link:    https://lore.kernel.org/r/20230314101516.20427-5-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v3 04/14] net: phy: Add a binding for PHY LEDs
config: x86_64-randconfig-a013-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161542.hNO84wyv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d3ed3e0a54a4a40c493b493d6ea2890447ce244a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230315-002131
        git checkout d3ed3e0a54a4a40c493b493d6ea2890447ce244a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161542.hNO84wyv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_unregister
   >>> referenced by phy_device.c:3069 (drivers/net/phy/phy_device.c:3069)
   >>>               drivers/net/phy/phy_device.o:(phy_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
