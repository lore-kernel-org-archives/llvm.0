Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE1619E;
	Fri, 24 Feb 2023 05:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677214840; x=1708750840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZQIvNF2fQT5ZTTmF4013c95rvzv4D1YYc0RCv0VrnQ=;
  b=ZWQeb7IlPhBoQhC7gU4sRSii/TB0sYgz11dxDA5CxveulNxsuKnWdRH1
   shG6r7tKg89XjYSL1qEr4vtkmaNyUWy+Fk3Ho5SNjnD6hjhKwuQNMAoHJ
   VwTe313ZXHth7/nyufu+OAePZm5a5zv6Sgd+bBROwEAgIkVnIUcvuWWiV
   I9c8IypP8+wqp3MnpiOa46egGCbmZuIVcMj7hCQV92pWfiVCd4gAWCt/I
   03gJPNoyFaCepYC98XG7+fZg8qpSFXb4bE7ysH+PQJYCn0AlvRr+YVpTz
   3y+yhwgpCMQomPj7FvUO+OSfRZWuH4D2ieLkaNIg0v6shL+IeV2S3O605
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="317156416"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="317156416"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 21:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782206623"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="782206623"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2023 21:00:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVQCC-000290-36;
	Fri, 24 Feb 2023 05:00:36 +0000
Date: Fri, 24 Feb 2023 13:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c:38:32:
 warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned
 int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int,
 void *)') converts to incompatible f...
Message-ID: <202302241258.Q3rgDf4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2980d8d826554fa6981d621e569a453787472f8
commit: 2023a99811110aebba9eee4aa09ef7bd21a8a249 media: platform: rename mediatek/mtk-jpeg/ to mediatek/jpeg/
date:   11 months ago
config: hexagon-randconfig-r041-20230224 (https://download.01.org/0day-ci/archive/20230224/202302241258.Q3rgDf4M-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2023a99811110aebba9eee4aa09ef7bd21a8a249
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2023a99811110aebba9eee4aa09ef7bd21a8a249
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/mediatek/vcodec/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241258.Q3rgDf4M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
           ipi_handler_t handler_const = (ipi_handler_t)handler;
                                         ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +38 drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c

46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  27  
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  28  static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  29  					   mtk_vcodec_ipi_handler handler,
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  30  					   const char *name, void *priv)
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  31  {
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  32  	/*
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  33  	 * The handler we receive takes a void * as its first argument. We
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  34  	 * cannot change this because it needs to be passed down to the rproc
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  35  	 * subsystem when SCP is used. VPU takes a const argument, which is
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  36  	 * more constrained, so the conversion below is safe.
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  37  	 */
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13 @38  	ipi_handler_t handler_const = (ipi_handler_t)handler;
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  39  
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  40  	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  41  }
46233e91fa24a9 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c Alexandre Courbot 2020-10-13  42  

:::::: The code at line 38 was first introduced by commit
:::::: 46233e91fa24a91bffca0680b1c55282ba601918 media: mtk-vcodec: move firmware implementations into their own files

:::::: TO: Alexandre Courbot <acourbot@chromium.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
