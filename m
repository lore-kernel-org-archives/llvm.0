Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB2915A7
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 05:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651468815; x=1683004815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QuFyDqKGVTfY4iNddWhDkWIGMMe5nOROfsUE1mx0mJk=;
  b=M9o/VZSMmf4xdWUW92O7Tz3+kF+xzsqSw2pXLEeBFm/BZGDWL4wC3xWd
   AuNONmxy42irvl19GyhVz9UeXkBzVYtOHwtSFVwIqcIh4HermoXm5mFZ9
   qQEmXm7j81wphFJ7EPt0A8dG6ouPdyjKKkf2w9LYYOtZdgTRFgiVYrqCy
   xGx5SUWq+6OoKz9yZ9d3tJQYuGgni2wKs2xDhidN2JY8BCgRJ3Plt/3sO
   poUMUWveSGr2P2wGiUd+TMvRCeo+CCeem2765cuX67Ro0P5gtFddmS3Oy
   koY4oSwANe8ZLRqbce6YI/ilozHqhVqMV1nUQYY35xwvCyuFUpjM7XbdF
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247037146"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="247037146"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 22:20:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="515918422"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 May 2022 22:20:12 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlOTk-0009J9-0Y;
	Mon, 02 May 2022 05:20:12 +0000
Date: Mon, 2 May 2022 13:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-msm:msm-next-staging 56/96]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2: warning: unannotated
 fall-through between switch labels
Message-ID: <202205021302.tnSsOIBN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-staging
head:   f1fc2b87de4719cfa8e193e0746cc524dd9f7472
commit: 6d084806c8c107dc0b652d6792c7aea9b6b0d66f [56/96] drm/msm/dpu: add changes to support writeback in hw_ctl
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220502/202205021302.tnSsOIBN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
        git fetch --no-tags drm-msm msm-next-staging
        git checkout 6d084806c8c107dc0b652d6792c7aea9b6b0d66f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/dma/ti/ drivers/gpu/drm/msm/ drivers/pci/controller/dwc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +273 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c

   264	
   265	static void dpu_hw_ctl_update_pending_flush_wb(struct dpu_hw_ctl *ctx,
   266			enum dpu_wb wb)
   267	{
   268		switch (wb) {
   269		case WB_0:
   270		case WB_1:
   271		case WB_2:
   272			ctx->pending_flush_mask |= BIT(WB_IDX);
 > 273		default:
   274			break;
   275		}
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
