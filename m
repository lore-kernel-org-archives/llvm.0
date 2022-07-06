Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE992F3A
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657105505; x=1688641505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U4e6yc60v5HAchm2P66GR8rfC9HjuSPATHuFD2YBwlQ=;
  b=c6ug73M5p1YlqYOC8Stq9xKccD8aadjmJtgMkzdLvBxQaTKbOSsVAHWB
   QHJvaQNTYEhYx2FALMDMBAVVRo0oa/Z1OCZYKDocZf8/duzXEEe+1wfFa
   I1FdhmU1vqQ8JKLAlAI1ksn7L1qdrzpCLtEAY5DdjJj6ow3KPqmNcmQUr
   W8Jvg7/88PqrSM2XcImS65lK6lNMTkSTQGvcu7dK1rKD7dIEeT4nntSJQ
   F+Y7fx2xTUKqhx4aD9Uolgtw2if98IqKEUpiVEX218B7ZNK3vOq4n0CaT
   nO5jvxQGSWJ9BvdgyXH3mnczAYXmKEkKYClw4ydRiy/ke8RtomilZNVXK
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="309265272"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="309265272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 04:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="543355084"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jul 2022 04:04:59 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o92q2-000KUZ-Ay;
	Wed, 06 Jul 2022 11:04:58 +0000
Date: Wed, 6 Jul 2022 19:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC net-next 2/5] net: dsa: mv88e6xxx: report the default
 interface mode for the port
Message-ID: <202207061812.FVnuLMD9-lkp@intel.com>
References: <E1o8f9s-0059a6-3S@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1o8f9s-0059a6-3S@rmk-PC.armlinux.org.uk>

Hi "Russell,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-dsa-add-support-for-retrieving-the-interface-mode/20220705-175304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 874bdbfe624e577687c2053a26aab44715c68453
config: x86_64-randconfig-a012-20220704 (https://download.01.org/0day-ci/archive/20220706/202207061812.FVnuLMD9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f553287b588916de09c66e3e32bf75e5060f967f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9423b094f4b1e0c313bbdd0e65cd0824b51e3016
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Russell-King-Oracle/net-dsa-add-support-for-retrieving-the-interface-mode/20220705-175304
        git checkout 9423b094f4b1e0c313bbdd0e65cd0824b51e3016
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/dsa/mv88e6xxx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/mv88e6xxx/chip.c:861:5: warning: unused variable 'cmode' [-Wunused-variable]
           u8 cmode = chip->ports[port].cmode;
              ^
   1 warning generated.


vim +/cmode +861 drivers/net/dsa/mv88e6xxx/chip.c

   855	
   856	static void mv88e6xxx_get_caps(struct dsa_switch *ds, int port,
   857				       struct phylink_config *config,
   858				       phy_interface_t *default_interface)
   859	{
   860		struct mv88e6xxx_chip *chip = ds->priv;
 > 861		u8 cmode = chip->ports[port].cmode;
   862	
   863		chip->info->ops->phylink_get_caps(chip, port, config,
   864						  default_interface);
   865	
   866		/* Internal ports need GMII for PHYLIB */
   867		if (mv88e6xxx_phy_is_internal(ds, port))
   868			__set_bit(PHY_INTERFACE_MODE_GMII,
   869				  config->supported_interfaces);
   870	}
   871	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
