Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416380E
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655759403; x=1687295403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cB1p0i6jzLmOV7NF3TaIcWh0U0fj0paqeOOwL4rpvIs=;
  b=fD8zwghbP+A4ZvEdubwj9csQFx3QQOo3RVuM8vlPLKOPqjBpzKUnPBEE
   YaB3rRYUpbZy6ktMNgx0xEbfNQZFLmm4MZAH9qFXNYUrAXyryLEwoj/T2
   PxWmo2wOoX/yZtLYZXoI9T+wBOZuAaZM71WsKa3fI7WIlpcFa6JpLKqFF
   XiCp7BuBUoRqthIAzvTQq/tbRuifb92wo+4S/j77cNRKxMLrXQGVfxV/z
   2Ph27dXP4BrZdyDYY+6NTHYJ2sdHG3gUDk1uHbo5ntj68ixbB8KBOdXk2
   TmwpDuiXB1Zz4NgvAKRKiQncAMAJJ5IwT+CGH6AX/NsHZhUk21QKB8HHB
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="305410218"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="305410218"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 14:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="833264941"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jun 2022 14:10:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3Oem-000W8V-4z;
	Mon, 20 Jun 2022 21:10:00 +0000
Date: Tue, 21 Jun 2022 05:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 1090/1181]
 drivers/staging/xilinx-tsn/xilinx_tsn_ep_ex.c:111:52: warning: variable
 'mac_addr' is uninitialized when used here
Message-ID: <202206210504.DOkGUgfX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   5e0be2b8c0a423b650f4e4d107be37e858d2b9dd
commit: 69f4e38f3088d4dc9c007070610b5223c5611d08 [1090/1181] net: xilinx: Move Xilinx TSN to staging
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220621/202206210504.DOkGUgfX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/69f4e38f3088d4dc9c007070610b5223c5611d08
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout 69f4e38f3088d4dc9c007070610b5223c5611d08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/xilinx-tsn/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/xilinx-tsn/xilinx_tsn_ep_ex.c:111:52: warning: variable 'mac_addr' is uninitialized when used here [-Wuninitialized]
           ret = of_get_mac_address(pdev->dev.of_node, (u8 *)mac_addr);
                                                             ^~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep_ex.c:86:22: note: initialize the variable 'mac_addr' to silence this warning
           const void *mac_addr;
                               ^
                                = NULL
   1 warning generated.


vim +/mac_addr +111 drivers/staging/xilinx-tsn/xilinx_tsn_ep_ex.c

50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   79  
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   80  static int tsn_ex_ep_probe(struct platform_device *pdev)
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   81  {
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   82  	struct axienet_local *lp;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   83  	struct net_device *ndev;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   84  	struct device_node *ep_node;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   85  	struct axienet_local *ep_lp;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   86  	const void *mac_addr;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   87  	int ret = 0;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   88  	const void *packet_switch;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   89  
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   90  	ndev = alloc_netdev(sizeof(*lp), "exep",
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   91  			    NET_NAME_UNKNOWN, ether_setup);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   92  	if (!ndev)
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   93  		return -ENOMEM;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   94  
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   95  	platform_set_drvdata(pdev, ndev);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   96  
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   97  	SET_NETDEV_DEV(ndev, &pdev->dev);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   98  	ndev->flags &= ~IFF_MULTICAST;  /* clear multicast */
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06   99  	ndev->features = NETIF_F_SG;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  100  	ndev->netdev_ops = &ex_ep_netdev_ops;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  101  
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  102  	/* MTU range: 64 - 9000 */
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  103  	ndev->min_mtu = 64;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  104  	ndev->max_mtu = XAE_JUMBO_MTU;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  105  
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  106  	lp = netdev_priv(ndev);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  107  	lp->ndev = ndev;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  108  	lp->dev = &pdev->dev;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  109  	lp->options = XAE_OPTION_DEFAULTS;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  110  	/* Retrieve the MAC address */
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06 @111  	ret = of_get_mac_address(pdev->dev.of_node, (u8 *)mac_addr);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  112  	if (ret) {
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  113  		dev_err(&pdev->dev, "could not find MAC address\n");
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  114  		goto free_netdev;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  115  	}
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  116  	tsn_ex_ep_set_mac_address(ndev, mac_addr);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  117  	packet_switch = of_get_property(pdev->dev.of_node, "packet-switch", NULL);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  118  	ep_node = of_parse_phandle(pdev->dev.of_node, "tsn,endpoint", 0);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  119  
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  120  	lp->master = of_find_net_device_by_node(ep_node);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  121  	ret = register_netdev(lp->ndev);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  122  	if (ret) {
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  123  		dev_err(lp->dev, "register_netdev() error (%i)\n", ret);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  124  		goto free_netdev;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  125  	}
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  126  	ep_lp = netdev_priv(lp->master);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  127  	ep_lp->ex_ep = ndev;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  128  	if (packet_switch)
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  129  		ep_lp->packet_switch = 1;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  130  	return ret;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  131  free_netdev:
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  132  	free_netdev(ndev);
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  133  
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  134  	return ret;
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  135  }
50ac45f37fce9e drivers/net/ethernet/xilinx/xilinx_tsn_ep_ex.c Pranavi Somisetty 2022-04-06  136  

:::::: The code at line 111 was first introduced by commit
:::::: 50ac45f37fce9e1fc3e40b605ac1f18d9c193efd net: xilinx: TSN endpoint extension support

:::::: TO: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
