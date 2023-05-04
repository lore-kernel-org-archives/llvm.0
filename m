Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BD8FC1E;
	Thu,  4 May 2023 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683215279; x=1714751279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+W/UCTBIfYK9iU0TR7/tMzBfgHk4eby0Qe2D0HTr7Rc=;
  b=R8EIzvXGJh3WuZwR3hOWNjdpK/U3Rn1p/+bOMvfK0QkP2LPVe115lpDp
   BQ/03+ODc3ZBk2EnHP/a2/2pWhxg3hMppPPA853/85929SgUJdt+DdLiF
   roQodNQfM1UvbQgsEr1qCPxo8wuuifLhGAsSdoaaYvJUZr7sXN9BZoZzY
   oK3IURM/F9oC69Rww2rMMfypcetR0Evidyg8j93io3eNsHxwLdBfPb3he
   eLf6WeVmsG9PF06bue+txn0JoGaRHX4K9j4RDdsLfw51AzLFEFj5YlC/L
   xpefDUSEphE8dDuV8rxtuQRSxzl99rP2SF7WE3tk46I05DEH8k8EsWi8I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328594517"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="328594517"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 08:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="1027007589"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="1027007589"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 May 2023 08:47:45 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pubBI-00001Y-1Q;
	Thu, 04 May 2023 15:47:44 +0000
Date: Thu, 4 May 2023 23:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>, andreas@fatal.se,
	jun.li@nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/4] usb: typec: mux: gpio-sbu-mux: add support for ss
 data lane muxing
Message-ID: <202305042306.TmTuYCAJ-lkp@intel.com>
References: <20230504-b4-v6-3-topic-boards-imx8mp-evk-dual-role-usb-v2-2-3889b1b2050c@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504-b4-v6-3-topic-boards-imx8mp-evk-dual-role-usb-v2-2-3889b1b2050c@pengutronix.de>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 457391b0380335d5e9a5babdec90ac53928b23b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/dt-bindings-usb-gpio-sbu-mux-add-support-for-ss-data-lanes-mux/20230504-214927
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230504-b4-v6-3-topic-boards-imx8mp-evk-dual-role-usb-v2-2-3889b1b2050c%40pengutronix.de
patch subject: [PATCH v2 2/4] usb: typec: mux: gpio-sbu-mux: add support for ss data lane muxing
config: riscv-randconfig-r042-20230501 (https://download.01.org/0day-ci/archive/20230504/202305042306.TmTuYCAJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8cbffd4f358b26347855cb2dcae31dd8c012226f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marco-Felsch/dt-bindings-usb-gpio-sbu-mux-add-support-for-ss-data-lanes-mux/20230504-214927
        git checkout 8cbffd4f358b26347855cb2dcae31dd8c012226f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/typec/mux/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042306.TmTuYCAJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/mux/gpio-sbu-mux.c:119:18: warning: cast to smaller integer type 'enum gpio_sbu_mux_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           sbu_mux->type = (enum gpio_sbu_mux_type)device_get_match_data(&pdev->dev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +119 drivers/usb/typec/mux/gpio-sbu-mux.c

   107	
   108	static int gpio_sbu_mux_probe(struct platform_device *pdev)
   109	{
   110		struct typec_switch_desc sw_desc = { };
   111		struct typec_mux_desc mux_desc = { };
   112		struct device *dev = &pdev->dev;
   113		struct gpio_sbu_mux *sbu_mux;
   114	
   115		sbu_mux = devm_kzalloc(dev, sizeof(*sbu_mux), GFP_KERNEL);
   116		if (!sbu_mux)
   117			return -ENOMEM;
   118	
 > 119		sbu_mux->type = (enum gpio_sbu_mux_type)device_get_match_data(&pdev->dev);
   120	
   121		mutex_init(&sbu_mux->lock);
   122	
   123		sbu_mux->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
   124		if (IS_ERR(sbu_mux->enable_gpio))
   125			return dev_err_probe(dev, PTR_ERR(sbu_mux->enable_gpio),
   126					     "unable to acquire enable gpio\n");
   127	
   128		sbu_mux->select_gpio = devm_gpiod_get(dev, "select", GPIOD_OUT_LOW);
   129		if (IS_ERR(sbu_mux->select_gpio))
   130			return dev_err_probe(dev, PTR_ERR(sbu_mux->select_gpio),
   131					     "unable to acquire select gpio\n");
   132	
   133		sw_desc.drvdata = sbu_mux;
   134		sw_desc.fwnode = dev_fwnode(dev);
   135		sw_desc.set = gpio_sbu_switch_set;
   136	
   137		sbu_mux->sw = typec_switch_register(dev, &sw_desc);
   138		if (IS_ERR(sbu_mux->sw))
   139			return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),
   140					     "failed to register typec switch\n");
   141	
   142		mux_desc.drvdata = sbu_mux;
   143		mux_desc.fwnode = dev_fwnode(dev);
   144		mux_desc.set = gpio_sbu_mux_set;
   145	
   146		sbu_mux->mux = typec_mux_register(dev, &mux_desc);
   147		if (IS_ERR(sbu_mux->mux)) {
   148			typec_switch_unregister(sbu_mux->sw);
   149			return dev_err_probe(dev, PTR_ERR(sbu_mux->mux),
   150					     "failed to register typec mux\n");
   151		}
   152	
   153		platform_set_drvdata(pdev, sbu_mux);
   154	
   155		return 0;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
