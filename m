Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE56D2ED;
	Tue, 21 Mar 2023 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679419963; x=1710955963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7EPdgQ7ngZjfuwDZlcEvq2OY4rjaUfJghmwjPI7ptak=;
  b=Roj/VXX66zfsyo2QiUyOEEus/CGOdCi+xF0JnclJtelF9DEj2ErZgWdB
   dOF0+KYnlRqHp9FWas8pHv5Ct65nSSG0YHm4dXA+TPSZ4fXQBZpBPCWgv
   dPFEgidg6AD0NkEW1bILPBGPUwReMNALneUSj/lI6RA7pkOi6SvFz3w9v
   whaH5gIoeYli/Ge0RKxKzezQznG2BzoK+kDeJj6m92B609nO09OmxtACz
   R1SfcIiPyqTtqhXJIVx8i58j+AlkoGVEia7Dm7GgYrZkHnus9i6s6tiGp
   WWo+WUBUG7/W5AHuucr8qOj6WSZXYAHd4c1402SPjE6x+ijJK2Wc8jw0E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366746811"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="366746811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 10:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="711902736"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="711902736"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Mar 2023 10:32:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pefqj-000CCw-0G;
	Tue, 21 Mar 2023 17:32:41 +0000
Date: Wed, 22 Mar 2023 01:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v5 05/15] net: phy: Add a binding for PHY LEDs
Message-ID: <202303220140.di39rmRa-lkp@intel.com>
References: <20230319191814.22067-6-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319191814.22067-6-ansuelsmth@gmail.com>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230320-032239
patch link:    https://lore.kernel.org/r/20230319191814.22067-6-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v5 05/15] net: phy: Add a binding for PHY LEDs
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230322/202303220140.di39rmRa-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7c3d7e2a0c0c8a14fb18635507f95077bdbc5e46
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230320-032239
        git checkout 7c3d7e2a0c0c8a14fb18635507f95077bdbc5e46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220140.di39rmRa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_register_ext
   >>> referenced by phy_device.c:3025 (drivers/net/phy/phy_device.c:3025)
   >>>               drivers/net/phy/phy_device.o:(phy_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
