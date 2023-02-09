Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B61371;
	Thu,  9 Feb 2023 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675938339; x=1707474339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/IG1pj67wfL2Tp862S2iUmP0nFCNZbLwNz0hzV5n8w=;
  b=eJdiTsvG7bEgC+nG7Jx/KmSqGZ8WsaMUR0J/AI+8b5qH6mOxklBTmjG6
   bCI0SeGUSllYh4HQrGCy6EDbCVkf0T+zzMtDtXAUh86zWzYdV1A6f/wG5
   A6D/ueVC7ionHzsOuI0R8zid6291sUOOUae3JQ9JZzrgIyK+WtKwkU9Th
   IhiduWUwxaaP9BdHNd5OYUv2h1RE/9KSrGEXX7ydkULBPuDTRzusIDDr+
   Fd50PASbH7jbPmqjFVRbo+EFzXrJOMqcFUw8/ejdVmPAcG/lFA19XZ+aD
   zR5z3GOvjoPq+HJh1mja4VwMcSR/LG+E6qJ02ee/ITi/uf+2OjKHm7H6I
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="318071724"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="318071724"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 02:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="996490068"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="996490068"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Feb 2023 02:25:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ47U-000506-1m;
	Thu, 09 Feb 2023 10:25:36 +0000
Date: Thu, 9 Feb 2023 18:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: kyrie wu <kyrie.wu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	irui wang <irui.wang@mediatek.com>
Subject: drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1474:38:
 warning: unused variable 'mt8173_jpeg_drvdata'
Message-ID: <202302091806.7NmqzYWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi kyrie,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: 934e8bccac9542540493a4e5257d6b0db4162478 mtk-jpegenc: support jpegenc multi-hardware
date:   4 months ago
config: mips-randconfig-r005-20230209 (https://download.01.org/0day-ci/archive/20230209/202302091806.7NmqzYWj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=934e8bccac9542540493a4e5257d6b0db4162478
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 934e8bccac9542540493a4e5257d6b0db4162478
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/mediatek/jpeg/ drivers/soc/renesas/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302091806.7NmqzYWj-lkp@intel.com

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1474:38: warning: unused variable 'mt8173_jpeg_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
                                        ^
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1489:38: warning: unused variable 'mtk_jpeg_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
                                        ^
   2 warnings generated.


vim +/mt8173_jpeg_drvdata +1474 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Rick Chang 2016-12-14  1473  
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14 @1474  static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1475  	.clks = mt8173_jpeg_dec_clocks,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1476  	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1477  	.formats = mtk_jpeg_dec_formats,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1478  	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1479  	.qops = &mtk_jpeg_dec_qops,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1480  	.irq_handler = mtk_jpeg_dec_irq,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1481  	.hw_reset = mtk_jpeg_dec_reset,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1482  	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1483  	.dev_name = "mtk-jpeg-dec",
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1484  	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1485  	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1486  	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1487  };
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1488  
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14 @1489  static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1490  	.clks = mtk_jpeg_clocks,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1491  	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1492  	.formats = mtk_jpeg_enc_formats,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1493  	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1494  	.qops = &mtk_jpeg_enc_qops,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1495  	.irq_handler = mtk_jpeg_enc_irq,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1496  	.hw_reset = mtk_jpeg_enc_reset,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1497  	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1498  	.dev_name = "mtk-jpeg-enc",
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1499  	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1500  	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1501  	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1502  };
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c Xia Jiang  2020-08-14  1503  

:::::: The code at line 1474 was first introduced by commit
:::::: b4a82f5d15102ade6134c8cc4bbc8ccef1f4a7dc media: platform: Using the variant structure to contain the varability between dec and enc

:::::: TO: Xia Jiang <xia.jiang@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
