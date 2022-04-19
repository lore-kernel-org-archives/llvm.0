Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E32CEA1
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 05:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650347798; x=1681883798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJNEMlUq642vw41WuZGW6kiev/7F+H45Wwus3epbUHI=;
  b=ZSr79eaFF9bpra144ak6haGWi2RNdJ7s8RBIZynTQ4uRL2iTEmON2Ymc
   41Zfg7M4eUe6m83Th+Ba1V/U6aGv4tNhibgG4SLPPkJcoF7hAIwyYRkZE
   OzGA47t2JXN8oEIDTMVrL7xkKLxHZ7i1Y2zt0jr0VwIWcKJNxEqdja87B
   3LRTuwsuLzmivqQr512avXnm74bKO0sPKLNRDgEmDNm2HmH4XAfiAwIVq
   Fio3VyUnA91QJzvyVpLBkKrgRH4cFgY3JjhSkdZXual8uD2eZF24QPRL4
   zlv7wZ1IAxTW9tCJVPekZcpzqxCw/KUinBfBHrVp8rTFvOQUltS/bddom
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="288779752"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="288779752"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 22:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="529972598"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Apr 2022 22:56:28 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nggqh-0005P5-Hz;
	Tue, 19 Apr 2022 05:56:27 +0000
Date: Tue, 19 Apr 2022 13:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1769/2356]
 drivers/clk/clk-renesas-pcie.c:115:5: warning: incompatible integer to
 pointer conversion assigning to 'struct device_node *' from 'int'
Message-ID: <202204191324.6JvhhTcF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   af93551cf39027d176f30b9beafc60a4c130998a
commit: 9f931b54e4f33f52c5cc50956b4aa86a9395e4dc [1769/2356] headers/deps: of: Optimize <linux/of.h> dependencies, remove <linux/of_api.h>
config: i386-randconfig-a015-20220418 (https://download.01.org/0day-ci/archive/20220419/202204191324.6JvhhTcF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=9f931b54e4f33f52c5cc50956b4aa86a9395e4dc
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 9f931b54e4f33f52c5cc50956b4aa86a9395e4dc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/block/ drivers/clk/ drivers/iio/accel/ drivers/infiniband/core/ drivers/infiniband/ulp/ipoib/ drivers/input/touchscreen/ drivers/mmc/host/ drivers/net/dsa/ drivers/nvdimm/ drivers/powercap/ drivers/usb/typec/ mm/damon/ net/dsa/ net/smc/ sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/clk-renesas-pcie.c:115:7: error: implicit declaration of function 'of_get_child_by_name' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           np = of_get_child_by_name(client->dev.of_node, name);
                ^
>> drivers/clk/clk-renesas-pcie.c:115:5: warning: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
           np = of_get_child_by_name(client->dev.of_node, name);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-renesas-pcie.c:120:8: error: implicit declaration of function 'of_property_read_u32' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = of_property_read_u32(np, "renesas,slew-rate", &sr);
                 ^
   drivers/clk/clk-renesas-pcie.c:120:8: note: did you mean 'fwnode_property_read_u32'?
   include/linux/property.h:202:19: note: 'fwnode_property_read_u32' declared here
   static inline int fwnode_property_read_u32(const struct fwnode_handle *fwnode,
                     ^
   drivers/clk/clk-renesas-pcie.c:121:2: error: implicit declaration of function 'of_node_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           of_node_put(np);
           ^
   drivers/clk/clk-renesas-pcie.c:149:8: error: implicit declaration of function 'of_property_read_u32' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = of_property_read_u32(np, "renesas,out-amplitude-microvolt",
                 ^
   1 warning and 4 errors generated.
--
   drivers/powercap/dtpm.c:448:7: error: implicit declaration of function 'of_find_node_by_path' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           np = of_find_node_by_path(hierarchy->name);
                ^
>> drivers/powercap/dtpm.c:448:5: warning: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
           np = of_find_node_by_path(hierarchy->name);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/powercap/dtpm.c:462:4: error: implicit declaration of function 'of_node_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           of_node_put(np);
                           ^
   drivers/powercap/dtpm.c:467:2: error: implicit declaration of function 'of_node_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           of_node_put(np);
           ^
   drivers/powercap/dtpm.c:576:7: error: implicit declaration of function 'of_find_node_by_path' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           np = of_find_node_by_path("/");
                ^
   drivers/powercap/dtpm.c:576:5: warning: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
           np = of_find_node_by_path("/");
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/powercap/dtpm.c:580:10: error: implicit declaration of function 'of_match_node' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           match = of_match_node(dtpm_match_table, np);
                   ^
>> drivers/powercap/dtpm.c:580:8: warning: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
           match = of_match_node(dtpm_match_table, np);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/powercap/dtpm.c:582:2: error: implicit declaration of function 'of_node_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           of_node_put(np);
           ^
   3 warnings and 6 errors generated.
--
   sound/soc/codecs/tas5805m.c:558:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   .of_match_table = of_match_ptr(tas5805m_of_match),
                                     ^
>> sound/soc/codecs/tas5805m.c:558:21: warning: incompatible integer to pointer conversion initializing 'const struct of_device_id *' with an expression of type 'int' [-Wint-conversion]
                   .of_match_table = of_match_ptr(tas5805m_of_match),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas5805m.c:558:21: error: initializer element is not a compile-time constant
                   .of_match_table = of_match_ptr(tas5805m_of_match),
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +115 drivers/clk/clk-renesas-pcie.c

892e0ddea1aa6f Marek Vasut 2022-02-26  101  
892e0ddea1aa6f Marek Vasut 2022-02-26  102  static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
892e0ddea1aa6f Marek Vasut 2022-02-26  103  {
892e0ddea1aa6f Marek Vasut 2022-02-26  104  	struct i2c_client *client = rs9->client;
892e0ddea1aa6f Marek Vasut 2022-02-26  105  	unsigned char name[5] = "DIF0";
892e0ddea1aa6f Marek Vasut 2022-02-26  106  	struct device_node *np;
892e0ddea1aa6f Marek Vasut 2022-02-26  107  	int ret;
892e0ddea1aa6f Marek Vasut 2022-02-26  108  	u32 sr;
892e0ddea1aa6f Marek Vasut 2022-02-26  109  
892e0ddea1aa6f Marek Vasut 2022-02-26  110  	/* Set defaults */
892e0ddea1aa6f Marek Vasut 2022-02-26  111  	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
892e0ddea1aa6f Marek Vasut 2022-02-26  112  	rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
892e0ddea1aa6f Marek Vasut 2022-02-26  113  
892e0ddea1aa6f Marek Vasut 2022-02-26  114  	snprintf(name, 5, "DIF%d", idx);
892e0ddea1aa6f Marek Vasut 2022-02-26 @115  	np = of_get_child_by_name(client->dev.of_node, name);
892e0ddea1aa6f Marek Vasut 2022-02-26  116  	if (!np)
892e0ddea1aa6f Marek Vasut 2022-02-26  117  		return 0;
892e0ddea1aa6f Marek Vasut 2022-02-26  118  
892e0ddea1aa6f Marek Vasut 2022-02-26  119  	/* Output clock slew rate */
892e0ddea1aa6f Marek Vasut 2022-02-26  120  	ret = of_property_read_u32(np, "renesas,slew-rate", &sr);
892e0ddea1aa6f Marek Vasut 2022-02-26  121  	of_node_put(np);
892e0ddea1aa6f Marek Vasut 2022-02-26  122  	if (!ret) {
892e0ddea1aa6f Marek Vasut 2022-02-26  123  		if (sr == 2000000) {		/* 2V/ns */
892e0ddea1aa6f Marek Vasut 2022-02-26  124  			rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
892e0ddea1aa6f Marek Vasut 2022-02-26  125  			rs9->clk_dif_sr |= RS9_REG_SR_2V0_DIF(idx);
892e0ddea1aa6f Marek Vasut 2022-02-26  126  		} else if (sr == 3000000) {	/* 3V/ns (default) */
892e0ddea1aa6f Marek Vasut 2022-02-26  127  			rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
892e0ddea1aa6f Marek Vasut 2022-02-26  128  			rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
892e0ddea1aa6f Marek Vasut 2022-02-26  129  		} else
892e0ddea1aa6f Marek Vasut 2022-02-26  130  			ret = dev_err_probe(&client->dev, -EINVAL,
892e0ddea1aa6f Marek Vasut 2022-02-26  131  					    "Invalid renesas,slew-rate value\n");
892e0ddea1aa6f Marek Vasut 2022-02-26  132  	}
892e0ddea1aa6f Marek Vasut 2022-02-26  133  
892e0ddea1aa6f Marek Vasut 2022-02-26  134  	return ret;
892e0ddea1aa6f Marek Vasut 2022-02-26  135  }
892e0ddea1aa6f Marek Vasut 2022-02-26  136  

:::::: The code at line 115 was first introduced by commit
:::::: 892e0ddea1aa6f70b68cb2dd8e16bf271e20e72f clk: rs9: Add Renesas 9-series PCIe clock generator driver

:::::: TO: Marek Vasut <marex@denx.de>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
