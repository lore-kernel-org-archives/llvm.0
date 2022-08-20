Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535746124
	for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661027896; x=1692563896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Te/fYbB5Id3qCj47OIaI8f2sh+8PafvVjgpquph4No=;
  b=G6CGS0BMb+CdY0RebbkssRX0iz4LZhyKZQEDF1qL6DrJbLUJj4MCHIiR
   6bOA2iAKiftCWjMW0bWJbaYp1ui/GVS8VgSS7U9xJTWw8CNcMQSDmgl5v
   tYAeNbBYSD+3/aul//Tnk7VA6Zltx3ZUmmr2j04AgihH+pvisHFHeGQ/J
   P3YUCbod2RpKm9bOi6MNKBT1LUvpyEBTnhMhpp0XfVMLa00u3NSvvL5L1
   BcyhlHCFf0g5JDYvhD0LJ9al8pWy5s4Ofd71qlUAbSdbyumw4W49X8t3Q
   xCVsPRjFgc64YmYUmAB7pg2LlvQopFpz1HTZF16ZSoHTJ3ZgKD850KvTe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10445"; a="293201282"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="293201282"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 13:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="676784174"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Aug 2022 13:38:14 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPVET-0003BH-1S;
	Sat, 20 Aug 2022 20:38:13 +0000
Date: Sun, 21 Aug 2022 04:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Lu <roger.lu@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: drivers/soc/mediatek/mtk-svs.c:1287:34: warning: unused variable
 'svs_of_match'
Message-ID: <202208210442.ZL8oxHze-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roger,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cc1807b9158a909ffe829a5e222be756c57c9a90
commit: 681a02e9500073cd8b9c25a04f06166254b5a879 soc: mediatek: SVS: introduce MTK SVS engine
date:   9 weeks ago
config: hexagon-randconfig-r022-20220821 (https://download.01.org/0day-ci/archive/20220821/202208210442.ZL8oxHze-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c9a41fe60ab62f7a40049c100adcc8087a47669b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=681a02e9500073cd8b9c25a04f06166254b5a879
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 681a02e9500073cd8b9c25a04f06166254b5a879
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/mediatek/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/soc/mediatek/mtk-svs.c:853:12: warning: unused function 'svs_suspend' [-Wunused-function]
   static int svs_suspend(struct device *dev)
              ^
   drivers/soc/mediatek/mtk-svs.c:880:12: warning: unused function 'svs_resume' [-Wunused-function]
   static int svs_resume(struct device *dev)
              ^
>> drivers/soc/mediatek/mtk-svs.c:1287:34: warning: unused variable 'svs_of_match' [-Wunused-const-variable]
   static const struct of_device_id svs_of_match[] = {
                                    ^
   3 warnings generated.


vim +/svs_of_match +1287 drivers/soc/mediatek/mtk-svs.c

  1286	
> 1287	static const struct of_device_id svs_of_match[] = {
  1288		{
  1289			.compatible = "mediatek,mt8183-svs",
  1290			.data = &svs_mt8183_platform_data,
  1291		}, {
  1292			/* Sentinel */
  1293		},
  1294	};
  1295	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
