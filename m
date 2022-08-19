Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146AF193
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 02:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660874786; x=1692410786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQ06/tDX7QJBBTfy6sOVmbpVaLdDkk9llBvg+GKV09M=;
  b=TGmuoh+2kebVjebiTgAPRV1h26SUXBK0i0Si/tfzBLrgAa4DHCGqleyZ
   01m//uh7BFTvi1opGc2cnYxilGBmw1ZT9DZEm6H91ADOEnE5hPPkN5ipt
   0+w54hxgczunIcWXsuKApXzFnYgmi/IY1rNY69U/DSMnXgjtdItBPKsX3
   lc8kn3jGHTBlfdXJsj7SZ3LlzC190IzGFEomi2bWfl0XDHP8eSjPzfy58
   fOLGzv6hRMkYcSe8y6RGGewkn44+6IF0M5mEfTnkSexTFc2BpjyOIxvCd
   P2Qaikcu+rTa1o11pIb4BjxqBN2Ar5ZOMLm/INXXau6kTNX6wQ3BIkRAR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="354654512"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="354654512"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 19:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="676293499"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Aug 2022 19:06:23 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oOrOw-0000v5-1c;
	Fri, 19 Aug 2022 02:06:22 +0000
Date: Fri, 19 Aug 2022 10:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	daoyuan huang <daoyuan.huang@mediatek.com>
Subject: [hverkuil-media-tree:for-v6.1c 3/3]
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:905:10: warning: cast
 to smaller integer type 'enum mdp_comp_type' from 'const void *'
Message-ID: <202208190957.uDT8XE6b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.1c
head:   b2273b84e1291c52279edf13b08744833c1faaab
commit: b2273b84e1291c52279edf13b08744833c1faaab [3/3] media: platform: mtk-mdp3: add MediaTek MDP3 driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220819/202208190957.uDT8XE6b-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v6.1c
        git checkout b2273b84e1291c52279edf13b08744833c1faaab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/mediatek/mdp3/ drivers/vfio/pci/hisilicon/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:905:10: warning: cast to smaller integer type 'enum mdp_comp_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   type = (enum mdp_comp_type)of_id->data;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:964:10: warning: cast to smaller integer type 'enum mdp_comp_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   type = (enum mdp_comp_type)of_id->data;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +905 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c

   883	
   884	static int mdp_comp_sub_create(struct mdp_dev *mdp)
   885	{
   886		struct device *dev = &mdp->pdev->dev;
   887		struct device_node *node, *parent;
   888	
   889		parent = dev->of_node->parent;
   890	
   891		for_each_child_of_node(parent, node) {
   892			const struct of_device_id *of_id;
   893			enum mdp_comp_type type;
   894			int id, alias_id;
   895			struct mdp_comp *comp;
   896	
   897			of_id = of_match_node(mdp_sub_comp_dt_ids, node);
   898			if (!of_id)
   899				continue;
   900			if (!of_device_is_available(node)) {
   901				dev_dbg(dev, "Skipping disabled sub comp. %pOF\n", node);
   902				continue;
   903			}
   904	
 > 905			type = (enum mdp_comp_type)of_id->data;
   906			alias_id = mdp_comp_alias_id[type];
   907			id = mdp_comp_get_id(type, alias_id);
   908			if (id < 0) {
   909				dev_err(dev,
   910					"Fail to get sub comp. id: type %d alias %d\n",
   911					type, alias_id);
   912				return -EINVAL;
   913			}
   914			mdp_comp_alias_id[type]++;
   915	
   916			comp = mdp_comp_create(mdp, node, id);
   917			if (IS_ERR(comp))
   918				return PTR_ERR(comp);
   919		}
   920	
   921		return 0;
   922	}
   923	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
