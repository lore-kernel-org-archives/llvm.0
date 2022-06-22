Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B6410FF
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 05:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655874334; x=1687410334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VwbCg0Sy0q5tiIBKayXOxfAIqzRDKVC/3B3XYzTebAQ=;
  b=PKpMADiXpxc7mnmrGRXW5Q8NIm3VyR73Sn3nqszGAlLVHn8Y1qzv6FNz
   mCfqGYH0f5/FOn2mYVHStcMJB79r8PkJmX8xfq2VshA1hz4XEJUnh+muZ
   +OVO2gKCj7VHtRKjjgrnqjgQp+oKz1UgX5Dv2wBIz4bUVORMyTOu7e/oB
   +nZX8t9TtnQHPUf2NWxZ+6vgnxO55h1nhMJIEuKuBHC3uU0RfEhtzWB2u
   XfJzfYqmDI0OcchWJmHQdC8QL60/bcVsM4qtOBqo8o6y2S6stJDb/+b4o
   XHYY6orVQ1cKgTe+PMbiJsHDMjfUp2rZZxQNc1HfV492dYE3JMey/GJ7g
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="280360986"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="280360986"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 22:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="643990164"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2022 22:05:32 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3sYW-0000rF-5t;
	Wed, 22 Jun 2022 05:05:32 +0000
Date: Wed, 22 Jun 2022 13:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [rmk-arm:zii 35/107] drivers/net/phy/phylink.c:1328: warning:
 expecting prototype for phylink_set_fixe_linkd(). Prototype was for
 phylink_set_fixed_link() instead
Message-ID: <202206221232.Go3hwcU6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   aedc75cf78fca1c8b7052c5d59981354f47e2e48
commit: 5c17680ea9fcb1a7cf664279fe1bcf51934dcdaa [35/107] net: phylink: add phylink_set_fixed_link()
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220622/202206221232.Go3hwcU6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm zii
        git checkout 5c17680ea9fcb1a7cf664279fe1bcf51934dcdaa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:1328: warning: expecting prototype for phylink_set_fixe_linkd(). Prototype was for phylink_set_fixed_link() instead


vim +1328 drivers/net/phy/phylink.c

  1317	
  1318	/**
  1319	 * phylink_set_fixe_linkd() - set a fixed link configuration for phylink
  1320	 * @pl: a pointer to a &struct phylink returned from phylink_create()
  1321	 * @speed: a SPEED_xx constant
  1322	 * @duplex: DUPLEX_FULL or DUPLEX_HALF
  1323	 *
  1324	 * Set a fixed-link configuration for the phylink instance immediately
  1325	 * after creation. Must not be used at any other time.
  1326	 */
  1327	int phylink_set_fixed_link(struct phylink *pl, int speed, int duplex)
> 1328	{
  1329		if (pl->cfg_link_an_mode != MLO_AN_PHY || pl->phydev || pl->sfp_bus)
  1330			return -EINVAL;
  1331	
  1332		pl->link_config.speed = speed;
  1333		pl->link_config.duplex = duplex;
  1334		pl->link_config.link = 1;
  1335		pl->cfg_link_an_mode = MLO_AN_FIXED;
  1336		pl->cur_link_an_mode = MLO_AN_FIXED;
  1337	
  1338		return 0;
  1339	}
  1340	EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
  1341	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
