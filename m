Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AE62CA1
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 06:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641622061; x=1673158061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=96F1Ni6gH9VSQA5OFzHhmekUcFJbbNPpXUfRntSDwVg=;
  b=Fsvb+/9u4uueuhVCHoA2MCngC390lc84Kb1Kcd+QRyRTzc2OXNt5WnnE
   mrwR8hwUp781HhRcFJBy9Wxc7QbTrqW4kR7G/vd8N7P7z8A2JbeS4FkQr
   0ocUxKsr3elPTNDi+t+uT699g1WfOgJPR1KEz+onklOuTYyos6ALQJhFt
   ULlfBG2I/NRqec4OCb4izx/Q8rtAfdqyYXlYE/mkXKRStsMvpeJJ4JPcS
   CEw15Q1KqKpdjUvQL/+DDsPUmNSNVhga9H0Atqj+1uclmtXaH9RtJjZ+2
   hffWyj17fcugY18nJHc4ZjGuETA4CEGzpQt/QcDc3JTzvNcJiFHYfbNrT
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10220"; a="242786771"
X-IronPort-AV: E=Sophos;i="5.88,272,1635231600"; 
   d="scan'208";a="242786771"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 22:07:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,272,1635231600"; 
   d="scan'208";a="471533961"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Jan 2022 22:07:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n64t8-0000Jk-Mo; Sat, 08 Jan 2022 06:07:38 +0000
Date: Sat, 8 Jan 2022 14:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:net-queue 171/174] drivers/net/dsa/mt7530.c:3005:18: error:
 incompatible function pointer types initializing 'int (*)(struct phylink_pcs
 *, unsigned int, unsigned long *, const struct phylink_link_state *)' with
 an expression of type 'void (struct phylink_pcs *, unsigned lo...
Message-ID: <202201081440.qAwUArEv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git net-queue
head:   9ceab2608ffe3f543e1118044bc86bc6ccb93255
commit: a5d401c6c8d1f84dcfa1a267166ad8ce85cda26f [171/174] net: phylink: pass mode into pcs_validate()
config: i386-randconfig-a005-20220106 (https://download.01.org/0day-ci/archive/20220108/202201081440.qAwUArEv-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm net-queue
        git checkout a5d401c6c8d1f84dcfa1a267166ad8ce85cda26f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/dsa/mt7530.c:3005:18: error: incompatible function pointer types initializing 'int (*)(struct phylink_pcs *, unsigned int, unsigned long *, const struct phylink_link_state *)' with an expression of type 'void (struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' [-Werror,-Wincompatible-function-pointer-types]
           .pcs_validate = mt753x_pcs_validate,
                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mt7530.c:3012:18: error: incompatible function pointer types initializing 'int (*)(struct phylink_pcs *, unsigned int, unsigned long *, const struct phylink_link_state *)' with an expression of type 'void (struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' [-Werror,-Wincompatible-function-pointer-types]
           .pcs_validate = mt753x_pcs_validate,
                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mt7530.c:3039:32: error: no member named 'pcs_ops' in 'struct mt7530_priv'
                   priv->pcs[i].pcs.ops = priv->pcs_ops;
                                          ~~~~  ^
   3 errors generated.


vim +3005 drivers/net/dsa/mt7530.c

c288575f7810a5 Landen Chao           2020-09-11  3003  
0ecdf3ab2ae1d3 Russell King (Oracle  2021-11-21  3004) static const struct phylink_pcs_ops mt7530_pcs_ops = {
0ecdf3ab2ae1d3 Russell King (Oracle  2021-11-21 @3005) 	.pcs_validate = mt753x_pcs_validate,
0ecdf3ab2ae1d3 Russell King (Oracle  2021-11-21  3006) 	.pcs_get_state = mt7530_pcs_get_state,
0ecdf3ab2ae1d3 Russell King (Oracle  2021-11-21  3007) 	.pcs_config = mt753x_pcs_config,
0ecdf3ab2ae1d3 Russell King (Oracle  2021-11-21  3008) 	.pcs_an_restart = mt7530_pcs_an_restart,
0ecdf3ab2ae1d3 Russell King (Oracle  2021-11-21  3009) };
88bdef8be9f649 Landen Chao           2020-09-11  3010  

:::::: The code at line 3005 was first introduced by commit
:::::: 0ecdf3ab2ae1d35480614337758d8db5060885cf net: dsa: mt7530: partially convert to phylink_pcs  *EXPERIMENTAL*

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
