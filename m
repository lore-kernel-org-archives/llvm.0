Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8640C1869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 21:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651266204; x=1682802204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0giy4xbhx/xkB5BiJeSpSBkRZX2hTtEz80dIkMs33c=;
  b=SLLKQZ/BjTGg51Ng0oraD72/J07U/J6QbAyrlCEbGSvcRjgfgnXaTbLQ
   wh0JBJKvGwm2wrFdYRrlW2N7WzZ4etvwwxN5R4PXGlSx9NNAb5X3SUF1T
   kBbQirDpQ1qmQ8iP8R/Nr5EDF49OrlOrL887jffwgykTR4E4UDYULmg18
   dXJ3+zOn1cG9uQLT5IhBWgsgRNTTdRXhOjGcihCWDF8FqKtB9UlYsN0M1
   OzM8sN9hXWgI0VyylhXmeRP+hgMJu8BqASG8BzcuZZJ8yLsyFQAiCS4s6
   xzhvQs9+71i1HNZB+8favuQHx3EXkOJXJIX9v+w9YBelgLj9Rn4Rfir8j
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="329720338"
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; 
   d="scan'208";a="329720338"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 14:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; 
   d="scan'208";a="685397023"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Apr 2022 14:03:22 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkXlp-0006c3-Nf;
	Fri, 29 Apr 2022 21:03:21 +0000
Date: Sat, 30 Apr 2022 05:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	George Sun <george.sun@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [hverkuil-media-tree:for-v5.19g 16/20] ld.lld: error: undefined
 symbol: v4l2_vp9_adapt_coef_probs
Message-ID: <202204300448.3RJ4JWpN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v5.19g
head:   f82120aec4e7ee9f06251d36931ab36bd9ef3c42
commit: 6e2ca6ec467a572cb7896758457e77da2896701c [16/20] media: mediatek: vcodec: support stateless VP9 decoding
config: hexagon-randconfig-r041-20220429 (https://download.01.org/0day-ci/archive/20220430/202204300448.3RJ4JWpN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v5.19g
        git checkout 6e2ca6ec467a572cb7896758457e77da2896701c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: v4l2_vp9_adapt_coef_probs
   >>> referenced by vdec_vp9_req_lat_if.c
   >>> media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.o:(vdec_vp9_slice_lat_decode) in archive drivers/built-in.a
   >>> referenced by vdec_vp9_req_lat_if.c
   >>> media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.o:(vdec_vp9_slice_lat_decode) in archive drivers/built-in.a
   >>> referenced by vdec_vp9_req_lat_if.c
   >>> media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.o:(vdec_vp9_slice_lat_decode) in archive drivers/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: v4l2_vp9_adapt_noncoef_probs
   >>> referenced by vdec_vp9_req_lat_if.c
   >>> media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.o:(vdec_vp9_slice_lat_decode) in archive drivers/built-in.a
   >>> referenced by vdec_vp9_req_lat_if.c
   >>> media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.o:(vdec_vp9_slice_lat_decode) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
