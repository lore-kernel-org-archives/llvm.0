Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09738173
	for <llvm@lists.linux.dev>; Sat, 22 Jan 2022 10:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642847076; x=1674383076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvE2CnsRiJUJrpU9vwIhU471o/ysBDGjJVQN/FzNE4E=;
  b=NBI9XtK8RdxX18ewKNt1VM+gyksUkDvYpy1uR8ay4QRU94qvxBz8dAEw
   E6FOaPycWgQ6KqFjl66oeOklVQjEj2+RjFJ0pDmDPNJojQ2AVgDMQZc7J
   SX4O/tWILtlxYzRXGGOTa13K+pbQSiK9lXMqk02JMwtXfgytcVv41vjIB
   DPesL+smzyfsAWhI3Pj3/TBWU2uIsXX2xpVDSmQARO9/zU6g6A77GrZkS
   KOIawRp3o8NqadaacpqIRGEHwMibId4U/uzAI+ARz3t4r3ft9AgNhduuA
   hw+f7sWNADxfrePErCSqW7XzVKpRmC/48RHu2FmHP5dPDQWxSCaYpoU6s
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="246030399"
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="246030399"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2022 02:24:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="494118899"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jan 2022 02:24:33 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBDZQ-000GIh-KC; Sat, 22 Jan 2022 10:24:32 +0000
Date: Sat, 22 Jan 2022 18:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: Claudius Heine <ch@denx.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/codecs/tlv320aic32x4.c:1202:18: warning: cast to smaller
 integer type 'enum aic32x4_type' from 'void *'
Message-ID: <202201221803.QYOgJpDv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Claudius,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b57f458985742bd1c585f4c7f36d04634ce1143
commit: 688d47cdd9344b1485eb28c2a7aa99743ed529a3 ASoC: tlv320aic32x4: add type to device private data struct
date:   7 months ago
config: x86_64-randconfig-a005-20211116 (https://download.01.org/0day-ci/archive/20220122/202201221803.QYOgJpDv-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project fbe72e41b99dc7994daac300d208a955be3e4a0a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=688d47cdd9344b1485eb28c2a7aa99743ed529a3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 688d47cdd9344b1485eb28c2a7aa99743ed529a3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/entry/vdso/ arch/x86/lib/ arch/x86/platform/pvh/ drivers/acpi/ kernel/bpf/ sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tlv320aic32x4.c:1202:18: warning: cast to smaller integer type 'enum aic32x4_type' from 'void *' [-Wvoid-pointer-to-enum-cast]
           aic32x4->type = (enum aic32x4_type)dev_get_drvdata(dev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1202 sound/soc/codecs/tlv320aic32x4.c

  1185	
  1186	int aic32x4_probe(struct device *dev, struct regmap *regmap)
  1187	{
  1188		struct aic32x4_priv *aic32x4;
  1189		struct aic32x4_pdata *pdata = dev->platform_data;
  1190		struct device_node *np = dev->of_node;
  1191		int ret;
  1192	
  1193		if (IS_ERR(regmap))
  1194			return PTR_ERR(regmap);
  1195	
  1196		aic32x4 = devm_kzalloc(dev, sizeof(struct aic32x4_priv),
  1197					   GFP_KERNEL);
  1198		if (aic32x4 == NULL)
  1199			return -ENOMEM;
  1200	
  1201		aic32x4->dev = dev;
> 1202		aic32x4->type = (enum aic32x4_type)dev_get_drvdata(dev);
  1203	
  1204		dev_set_drvdata(dev, aic32x4);
  1205	
  1206		if (pdata) {
  1207			aic32x4->power_cfg = pdata->power_cfg;
  1208			aic32x4->swapdacs = pdata->swapdacs;
  1209			aic32x4->micpga_routing = pdata->micpga_routing;
  1210			aic32x4->rstn_gpio = pdata->rstn_gpio;
  1211			aic32x4->mclk_name = "mclk";
  1212		} else if (np) {
  1213			ret = aic32x4_parse_dt(aic32x4, np);
  1214			if (ret) {
  1215				dev_err(dev, "Failed to parse DT node\n");
  1216				return ret;
  1217			}
  1218		} else {
  1219			aic32x4->power_cfg = 0;
  1220			aic32x4->swapdacs = false;
  1221			aic32x4->micpga_routing = 0;
  1222			aic32x4->rstn_gpio = -1;
  1223			aic32x4->mclk_name = "mclk";
  1224		}
  1225	
  1226		if (gpio_is_valid(aic32x4->rstn_gpio)) {
  1227			ret = devm_gpio_request_one(dev, aic32x4->rstn_gpio,
  1228					GPIOF_OUT_INIT_LOW, "tlv320aic32x4 rstn");
  1229			if (ret != 0)
  1230				return ret;
  1231		}
  1232	
  1233		ret = aic32x4_setup_regulators(dev, aic32x4);
  1234		if (ret) {
  1235			dev_err(dev, "Failed to setup regulators\n");
  1236			return ret;
  1237		}
  1238	
  1239		if (gpio_is_valid(aic32x4->rstn_gpio)) {
  1240			ndelay(10);
  1241			gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
  1242			mdelay(1);
  1243		}
  1244	
  1245		ret = regmap_write(regmap, AIC32X4_RESET, 0x01);
  1246		if (ret)
  1247			goto err_disable_regulators;
  1248	
  1249		ret = aic32x4_register_clocks(dev, aic32x4->mclk_name);
  1250		if (ret)
  1251			goto err_disable_regulators;
  1252	
  1253		ret = devm_snd_soc_register_component(dev,
  1254				&soc_component_dev_aic32x4, &aic32x4_dai, 1);
  1255		if (ret) {
  1256			dev_err(dev, "Failed to register component\n");
  1257			goto err_disable_regulators;
  1258		}
  1259	
  1260		return 0;
  1261	
  1262	err_disable_regulators:
  1263		aic32x4_disable_regulators(aic32x4);
  1264	
  1265		return ret;
  1266	}
  1267	EXPORT_SYMBOL(aic32x4_probe);
  1268	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
