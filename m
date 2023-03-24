Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90177D2F7;
	Fri, 24 Mar 2023 17:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679679450; x=1711215450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkPJwubimH9FL5MsjNq3bMdfxdl2ZtMV9NFR2g0BQrE=;
  b=K+Y1T/hLqd4ej+8LAFYk3G5+0kGaA6xRqtBGgiLV/YUECsLHl+B/oy/A
   dWAV0mAIMa/VZsEWgRozQdOjbVO/JoVNT3X2ECzr9s/YozCdQaiaWXBIm
   KUxztTOz7dKEteFA0akIQZwUkfvBOAP9DdT88JiBZLE2g9vg1hh/2N8QB
   WRpu22SJXVAJuD/Aax1KHT18PuuQgAavlc3XOGL5Mq/2VwfXHiJ61TYZZ
   DwEFS++FR3TPn0KfUiUrvPAN0NXVYdfpGgtzW6jfRW39DOQ5RdKPRVHna
   gAGMqZW7pkzpsfWFvMM7w0ZRPhezRKo/xSQpn5dA6st7VlmvObvLDCZAD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="426105528"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="426105528"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 10:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="685246824"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="685246824"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Mar 2023 10:37:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pflLy-000FWe-1I;
	Fri, 24 Mar 2023 17:37:26 +0000
Date: Sat, 25 Mar 2023 01:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [chunkuang-hu:mediatek-drm-next 9/13]
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:415:10: warning: cast to
 smaller integer type 'enum mtk_ovl_adaptor_comp_type' from 'const void *'
Message-ID: <202303250109.kP1Qb39o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-drm-next
head:   012cc7ebec1e795518b0cd5ec9015fd4b4701a8a
commit: 453c3364632a1f305db7d425dc9f8d6711cd3491 [9/13] drm/mediatek: Add ovl_adaptor support for MT8195
config: arm64-buildonly-randconfig-r003-20230324 (https://download.01.org/0day-ci/archive/20230325/202303250109.kP1Qb39o-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?id=453c3364632a1f305db7d425dc9f8d6711cd3491
        git remote add chunkuang-hu https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
        git fetch --no-tags chunkuang-hu mediatek-drm-next
        git checkout 453c3364632a1f305db7d425dc9f8d6711cd3491
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250109.kP1Qb39o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:415:10: warning: cast to smaller integer type 'enum mtk_ovl_adaptor_comp_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +415 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c

   391	
   392	static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
   393	{
   394		struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
   395		struct device_node *node, *parent;
   396		struct platform_device *comp_pdev;
   397	
   398		parent = dev->parent->parent->of_node->parent;
   399	
   400		for_each_child_of_node(parent, node) {
   401			const struct of_device_id *of_id;
   402			enum mtk_ovl_adaptor_comp_type type;
   403			int id;
   404	
   405			of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
   406			if (!of_id)
   407				continue;
   408	
   409			if (!of_device_is_available(node)) {
   410				dev_dbg(dev, "Skipping disabled component %pOF\n",
   411					node);
   412				continue;
   413			}
   414	
 > 415			type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
   416			id = ovl_adaptor_comp_get_id(dev, node, type);
   417			if (id < 0) {
   418				dev_warn(dev, "Skipping unknown component %pOF\n",
   419					 node);
   420				continue;
   421			}
   422	
   423			comp_pdev = of_find_device_by_node(node);
   424			if (!comp_pdev)
   425				return -EPROBE_DEFER;
   426	
   427			priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
   428	
   429			drm_of_component_match_add(dev, match, compare_of, node);
   430			dev_dbg(dev, "Adding component match for %pOF\n", node);
   431		}
   432	
   433		if (!*match) {
   434			dev_err(dev, "No match device for ovl_adaptor\n");
   435			return -ENODEV;
   436		}
   437	
   438		return 0;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
