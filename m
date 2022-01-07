Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A21173
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641582489; x=1673118489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ximh22MyQvZLz4L9vpGsuaQggghrD58iTFillYV5oM=;
  b=Ivi6jzzO1vkSd5uTq+nUT7hSgIug2qW3JiFU2hStsD0JGlEy7oTN2YON
   RKr5/hUB5+uHtCE+0RYCb/EruF01ewWSrhED2pusR+MoazWzUEcQNvJRJ
   PUUvhJL2kMz/hkS8UZhncKlTebeicT7uCFFuKQF+AbITA3FJ0QGh6GADa
   m5ZEzYecj72n+aYzZsHgvq5AdwiV6Y0hvpsxmky6KnfDUbaRls0RDSYOS
   cSH5IpzIwUi0RJudhkTnMmgwpyahHE4YfpMDytRK7G1if/ihPwl0+Fszq
   Az6eZeydgLJN7Qkg2F1P6g99DblSMK9OnTJY+x0ccszBy961kQ62h0rMx
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="242875235"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="242875235"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 11:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="473409617"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jan 2022 11:08:08 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5uat-000Ix7-Ge; Fri, 07 Jan 2022 19:08:07 +0000
Date: Sat, 8 Jan 2022 03:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:net-queue 128/174] drivers/net/dsa/mt7530.c:3060:32: error: no
 member named 'pcs_ops' in 'struct mt7530_priv'
Message-ID: <202201080355.pMKHutjh-lkp@intel.com>
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
commit: 0ecdf3ab2ae1d35480614337758d8db5060885cf [128/174] net: dsa: mt7530: partially convert to phylink_pcs  *EXPERIMENTAL*
config: i386-randconfig-a005-20220106 (https://download.01.org/0day-ci/archive/20220108/202201080355.pMKHutjh-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm net-queue
        git checkout 0ecdf3ab2ae1d35480614337758d8db5060885cf
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/dsa/mt7530.c:3026:18: error: incompatible function pointer types initializing 'int (*)(struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' with an expression of type 'void (struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' [-Werror,-Wincompatible-function-pointer-types]
           .pcs_validate = mt753x_pcs_validate,
                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mt7530.c:3033:18: error: incompatible function pointer types initializing 'int (*)(struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' with an expression of type 'void (struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' [-Werror,-Wincompatible-function-pointer-types]
           .pcs_validate = mt753x_pcs_validate,
                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mt7530.c:3060:32: error: no member named 'pcs_ops' in 'struct mt7530_priv'
                   priv->pcs[i].pcs.ops = priv->pcs_ops;
                                          ~~~~  ^
   3 errors generated.


vim +3060 drivers/net/dsa/mt7530.c

  3039	
  3040	static int
  3041	mt753x_setup(struct dsa_switch *ds)
  3042	{
  3043		struct mt7530_priv *priv = ds->priv;
  3044		int ret = priv->info->sw_setup(ds);
  3045		int i;
  3046	
  3047		if (ret)
  3048			return ret;
  3049	
  3050		ret = mt7530_setup_irq(priv);
  3051		if (ret)
  3052			return ret;
  3053	
  3054		ret = mt7530_setup_mdio(priv);
  3055		if (ret && priv->irq)
  3056			mt7530_free_irq_common(priv);
  3057	
  3058		/* Initialise the PCS devices */
  3059		for (i = 0; i < priv->ds->num_ports; i++) {
> 3060			priv->pcs[i].pcs.ops = priv->pcs_ops;
  3061			priv->pcs[i].priv = priv;
  3062			priv->pcs[i].port = i;
  3063		}
  3064	
  3065		return ret;
  3066	}
  3067	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
