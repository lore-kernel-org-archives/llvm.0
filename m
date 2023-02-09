Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41DF748E;
	Thu,  9 Feb 2023 12:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675944462; x=1707480462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DgCLLbd2OgAmMyk1BGiXGFxAIxijBM0hplnfm2Nw+Fo=;
  b=LBYhzMIBYjRo0EdSWZPiSjHZ6g8EERT3aGFghUk59jVW56p3TbRUdtJV
   2449jscxWA8ijadOZHcjg3Uu6J4wcD82s+Kfqapc0UNWqFD+LosH4tNYZ
   eXCgk41CtXpCCeCs++NEW6auk8pcxS6j9dZ56c6TGhwK3MnUYMgfb6S9A
   3YumA8uckMtH8ljVmjfTXHogUOydVFLEJ1ASWYGQAejooHbGT1NydOsnu
   klAB5x4dfFlhrLzn6e7TPDXTaVj32EoPFPyHpI657WTeKCQa7h1OhvZIV
   iEjxQcnRZE9zCKlPFqLJKLnK/Qa0fodp+oeFUBIHVySRrnDC4Bo/iwfBo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="332206008"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="332206008"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 04:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="841568158"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="841568158"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Feb 2023 04:07:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ5iF-00052g-0A;
	Thu, 09 Feb 2023 12:07:39 +0000
Date: Thu, 9 Feb 2023 20:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: kyrie wu <kyrie.wu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	irui wang <irui.wang@mediatek.com>
Subject: drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1859:38:
 warning: unused variable 'mtk8195_jpegdec_drvdata'
Message-ID: <202302092008.IgpNeNCW-lkp@intel.com>
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
commit: dedc21500334b97b80d4ca37ab683cde214fcb03 media: mtk-jpegdec: add jpeg decode worker interface
date:   4 months ago
config: mips-randconfig-r005-20230209 (https://download.01.org/0day-ci/archive/20230209/202302092008.IgpNeNCW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dedc21500334b97b80d4ca37ab683cde214fcb03
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dedc21500334b97b80d4ca37ab683cde214fcb03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/mediatek/jpeg/ drivers/soc/renesas/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302092008.IgpNeNCW-lkp@intel.com

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1818:38: warning: unused variable 'mt8173_jpeg_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
                                        ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1833:38: warning: unused variable 'mtk_jpeg_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
                                        ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1848:32: warning: unused variable 'mtk8195_jpegenc_drvdata' [-Wunused-variable]
   static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
                                  ^
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1859:38: warning: unused variable 'mtk8195_jpegdec_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
                                        ^
   4 warnings generated.


vim +/mtk8195_jpegdec_drvdata +1859 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  1858	
> 1859	static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
  1860		.formats = mtk_jpeg_dec_formats,
  1861		.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
  1862		.qops = &mtk_jpeg_dec_qops,
  1863		.m2m_ops = &mtk_jpeg_multicore_dec_m2m_ops,
  1864		.dev_name = "mtk-jpeg-dec",
  1865		.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
  1866		.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
  1867		.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
  1868	};
  1869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
