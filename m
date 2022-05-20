Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F94F7A
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653050928; x=1684586928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMCcUvf4lESFVE+KBBnXAEay0T2uWzyIBLfBOA+tar4=;
  b=M6mxwwDfD9JKRWua8KufkjTG37kJXYRiCBoUgvuUEW+JS/hZh9mBW8gR
   9y3mB7YqGNE4yvgpYoi3EObTEYtWZKAOxLCzMhn1iqQI6r10uqrfUPTR9
   rivZ8uTIfMSXEA1V2y8kAAjQtNXDdsdv10Z2Rtz8hbTsWUXjv0ACsysl+
   XF7XI5Hemgby1wBFknRpgdzTv884OWtuYfGx/4eEJ/2IomzdVw/owjnTO
   fXOWr8PtuNQvJPim1O09opIxDHZBLxce/UXbBXqg9Ddlg3ABetcrC3Hac
   BiIubs7ZiQrqWONhBQyHKsemYV91lnCEE/JmlpmmpZyZSu/NMyA9QLEau
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="252482307"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="252482307"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 05:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="674603101"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 May 2022 05:48:44 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ns23g-0004ht-4I;
	Fri, 20 May 2022 12:48:44 +0000
Date: Fri, 20 May 2022 20:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, openbmc@lists.ozlabs.org,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	kwliu@nuvoton.com, kflin@nuvoton.com,
	Marvin Lin <milkfafa@gmail.com>
Subject: Re: [PATCH v3 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
Message-ID: <202205202038.PeQqCdhg-lkp@intel.com>
References: <20220520024744.25655-6-milkfafa@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520024744.25655-6-milkfafa@gmail.com>

Hi Marvin,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linux/master linus/master v5.18-rc7]
[cannot apply to media-tree/master next-20220519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220520-104901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220520/202205202038.PeQqCdhg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/56e41b3b4b1a54f2096e810eda12259da495c686
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220520-104901
        git checkout 56e41b3b4b1a54f2096e810eda12259da495c686
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/platform/nuvoton/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/platform/nuvoton/npcm-video.c:2048:45: error: expected ';' after top level declarator
   MODULE_DEVICE_TABLE(of, nuvoton_video_match)
                                               ^
                                               ;
   1 error generated.


vim +2048 drivers/media/platform/nuvoton/npcm-video.c

  2047	
> 2048	MODULE_DEVICE_TABLE(of, nuvoton_video_match)
  2049	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
