Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8DD530;
	Tue, 21 Mar 2023 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679429221; x=1710965221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uC522O9FjPHxQ+tXnnlO/+TRKCyn/oGdK6IwgAN1Jjc=;
  b=jZiKHtz8E4g2hHVqrM2O9BLbNkEnmaJdkFyNb+9Jiw7h093jIJZFL+BC
   VDje1arecus8AuarUH6UoutByZa8EMKaTBfn5JVYzI4CKzb/m7kyqtoJ9
   C0cu1zv+dm/ww7sN5/vTQ7bTyx2Ry/LnDimK6IoFYG4S6tBKwtscjDGkz
   fc2FxvfZlQK15JygwyBRGR9aYip/m81riDnOBLVCNJjVzNJRp+EcyIh0v
   +xWs4LxCvhEA13kIh0e7oXKfNlNlkXlLiYVFfpqBvmwf1xZKFNvCEFDkG
   G3olkIBLCTG1vuXjQ1F/M36t1gJYplMBwCwjYBP5RWLgJCkY4O1eviaLL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339088140"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="339088140"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 13:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="714123916"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="714123916"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Mar 2023 13:06:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peiFv-000CMs-2J;
	Tue, 21 Mar 2023 20:06:51 +0000
Date: Wed, 22 Mar 2023 04:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, ming.qian@nxp.com,
	shijie.qin@nxp.com, eagle.zhou@nxp.com, bin.liu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
	jernel@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 5/8] media: v4l2: Add DELETE_BUF ioctl
Message-ID: <202303220359.f1UOGBNV-lkp@intel.com>
References: <20230321102855.346732-6-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321102855.346732-6-benjamin.gaignard@collabora.com>

Hi Benjamin,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230321-183154
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230321102855.346732-6-benjamin.gaignard%40collabora.com
patch subject: [PATCH v2 5/8] media: v4l2: Add DELETE_BUF ioctl
config: x86_64-randconfig-a002-20230320 (https://download.01.org/0day-ci/archive/20230322/202303220359.f1UOGBNV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c33ab7329647eb04482423ac9945dee579038e84
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230321-183154
        git checkout c33ab7329647eb04482423ac9945dee579038e84
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220359.f1UOGBNV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vb2_core_delete_buf" [drivers/media/common/videobuf2/videobuf2-v4l2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
