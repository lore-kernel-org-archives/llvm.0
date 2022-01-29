Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09E3FE0
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 00:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643415551; x=1674951551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0GBazpexoVldNSQIYAeov6T5VTgvrzGsnWe4cxXBl1c=;
  b=G4sK/eLCPSSGQqNOFW2Y+cYCNHRpqSq7kacAjzYTPpW1OSKsYoDQ9hAZ
   UoOiuQ+0whGf5CZXL5n/gXndL9UmqugC+ROLb7jup35lZP2xr9fHlqvh5
   A51c40G5PGqcjNLT2tUGjX3ItGOqwsR6wTeoudcD1G6QyQfH6rPzH1vdh
   nQ85AfUlRkncneSZlLL7YZn2hDI4IK+Gj3ZeyXfOKcQ2LxjHA0bvL4Kqj
   gZAAolDgnEG3IkDW0Jjg3o+roqlELl9r5H4clPx2mnNSwVqea9fsz3z51
   Mk06d5c2asQ49+B/yS4LJzloPK6h9s+aYP3BcSgZ9AQokjwgjWa37VXvJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="227198961"
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="227198961"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 16:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="770258528"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2022 16:19:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDbSP-000OWT-4I; Sat, 29 Jan 2022 00:19:09 +0000
Date: Sat, 29 Jan 2022 08:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:for-v5.18k 104/107] ld.lld: error: undefined
 symbol: vb2_dma_contig_memops
Message-ID: <202201290827.L4uwxbPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v5.18k
head:   ab1804e24c2d3bb0b511db538d9e834e260db16b
commit: 6e0f23d9552db48996f82eaa5659fb50c692c6a2 [104/107] media: vimc: Add support for contiguous DMA buffers
config: arm-randconfig-r006-20220124 (https://download.01.org/0day-ci/archive/20220129/202201290827.L4uwxbPo-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v5.18k
        git checkout 6e0f23d9552db48996f82eaa5659fb50c692c6a2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vb2_dma_contig_memops
   >>> referenced by vimc-capture.c
   >>>               media/test-drivers/vimc/vimc-capture.o:(vimc_cap_add) in archive drivers/built-in.a
   >>> referenced by vimc-capture.c
   >>>               media/test-drivers/vimc/vimc-capture.o:(vimc_cap_add) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
