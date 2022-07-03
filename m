Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1B13D99
	for <llvm@lists.linux.dev>; Sun,  3 Jul 2022 20:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656879313; x=1688415313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLtzFNwIdvmVgBeTtGNXDaHo9ozmQXWBgL+QxblA4uE=;
  b=SWRhDp1BPHzBj9ivPO3vK884YHxYQXWWAoBYVt9m49kTFxJ7162R4RkQ
   jIsD3G/HgJahur6gFzr20QBGWXuxvu1DSbmEYnthrpaGK0FZ9IlhYamIL
   p2zE7S34+d6jWrezSubtpX8iJqzei8ALhYXT4sIn/LVQ6emug7jMAyE6k
   ri6vyw+aXJLU/JA3qMyUFuB5EIFBXcwb5bKysVWuote16d5pugKz4Ne25
   s/3htMq5TCLED7UnoqsDH/Mm+ZMkCs6c2pacwRadbVAUTCpM1CE7vakly
   +mALhBkHbubMdIJ696/99GsABVHJfFw4XYO34bLu4iW4VdhQDZYwIiKMz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="369306833"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="369306833"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 13:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="619017466"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jul 2022 13:15:11 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o85zq-000Gv9-Uf;
	Sun, 03 Jul 2022 20:15:10 +0000
Date: Mon, 4 Jul 2022 04:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 103/112] drivers/net/dsa/mv88e6xxx/chip.c:645:46: error:
 too few arguments to function call, expected 3, have 2
Message-ID: <202207040416.cCvosav4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   6069ba5d4265eb4b6ab7a4a2ea2ebe77e7a53e3f
commit: 18b8857e7eb4757f9642e755b06308d61f6c61e8 [103/112] net: dsa: mv88e6xxx: kabel's idea
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220704/202207040416.cCvosav4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5d787689b14574fe58ba9798563f4a6df6059fbf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm zii
        git checkout 18b8857e7eb4757f9642e755b06308d61f6c61e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/dsa/mv88e6xxx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/dsa/mv88e6xxx/chip.c:645:46: error: too few arguments to function call, expected 3, have 2
                           mv88e6xxx_translate_cmode(cmode, supported);
                           ~~~~~~~~~~~~~~~~~~~~~~~~~                 ^
   drivers/net/dsa/mv88e6xxx/chip.c:560:13: note: 'mv88e6xxx_translate_cmode' declared here
   static void mv88e6xxx_translate_cmode(u8 cmode, unsigned long *supported,
               ^
   1 error generated.


vim +645 drivers/net/dsa/mv88e6xxx/chip.c

d4ebf12bcec453 Russell King (Oracle  2022-02-03  615) 
d4ebf12bcec453 Russell King (Oracle  2022-02-03  616) static void mv88e6352_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
18b8857e7eb475 Russell King (Oracle  2022-07-02  617) 				       struct phylink_config *config,
18b8857e7eb475 Russell King (Oracle  2022-07-02  618) 				       phy_interface_t *default_interface)
d4ebf12bcec453 Russell King (Oracle  2022-02-03  619) {
d4ebf12bcec453 Russell King (Oracle  2022-02-03  620) 	unsigned long *supported = config->supported_interfaces;
d4ebf12bcec453 Russell King (Oracle  2022-02-03  621) 	int err, cmode;
d4ebf12bcec453 Russell King (Oracle  2022-02-03  622) 
d4ebf12bcec453 Russell King (Oracle  2022-02-03  623) 	/* Translate the default cmode */
18b8857e7eb475 Russell King (Oracle  2022-07-02  624) 	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported,
18b8857e7eb475 Russell King (Oracle  2022-07-02  625) 				  default_interface);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  626) 
d4ebf12bcec453 Russell King (Oracle  2022-02-03  627) 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_10 | MAC_100 |
d4ebf12bcec453 Russell King (Oracle  2022-02-03  628) 				   MAC_1000FD;
d4ebf12bcec453 Russell King (Oracle  2022-02-03  629) 
d4ebf12bcec453 Russell King (Oracle  2022-02-03  630) 	/* Port 4 supports automedia if the serdes is associated with it. */
d4ebf12bcec453 Russell King (Oracle  2022-02-03  631) 	if (port == 4) {
d4ebf12bcec453 Russell King (Oracle  2022-02-03  632) 		mv88e6xxx_reg_lock(chip);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  633) 		err = mv88e6352_g2_scratch_port_has_serdes(chip, port);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  634) 		if (err < 0)
d4ebf12bcec453 Russell King (Oracle  2022-02-03  635) 			dev_err(chip->dev, "p%d: failed to read scratch\n",
d4ebf12bcec453 Russell King (Oracle  2022-02-03  636) 				port);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  637) 		if (err <= 0)
d4ebf12bcec453 Russell King (Oracle  2022-02-03  638) 			goto unlock;
d4ebf12bcec453 Russell King (Oracle  2022-02-03  639) 
d4ebf12bcec453 Russell King (Oracle  2022-02-03  640) 		cmode = mv88e6352_get_port4_serdes_cmode(chip);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  641) 		if (cmode < 0)
d4ebf12bcec453 Russell King (Oracle  2022-02-03  642) 			dev_err(chip->dev, "p%d: failed to read serdes cmode\n",
d4ebf12bcec453 Russell King (Oracle  2022-02-03  643) 				port);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  644) 		else
d4ebf12bcec453 Russell King (Oracle  2022-02-03 @645) 			mv88e6xxx_translate_cmode(cmode, supported);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  646) unlock:
d4ebf12bcec453 Russell King (Oracle  2022-02-03  647) 		mv88e6xxx_reg_unlock(chip);
d4ebf12bcec453 Russell King (Oracle  2022-02-03  648) 	}
d4ebf12bcec453 Russell King (Oracle  2022-02-03  649) }
d4ebf12bcec453 Russell King (Oracle  2022-02-03  650) 

:::::: The code at line 645 was first introduced by commit
:::::: d4ebf12bcec45378f6b3badb63806761e10a4596 net: dsa: mv88e6xxx: populate supported_interfaces and mac_capabilities

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
