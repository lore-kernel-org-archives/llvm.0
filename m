Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BFB62C
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 10:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650968040; x=1682504040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s3e2Mol8Q7Ae9bok6W3oQgnE6nys4q61z67ZOj7oV0U=;
  b=RT02AiyiT1j3tEeCXpMRciNCpW9TzMErKMQqz+9xyUEqETnrvbLQhcbL
   v7OnO8Ghr3xI8pnmAZSn9uXLWFJs2f7JTLxNlvPrLHd3lfeCe2X0EPR99
   6hPoPS/SIlhuPxNywcPoOalXi6J1ELaOU+Qhs+GVotHCZkX3aI2MiUE23
   x3wMV9NXnDpS8YUhXDo0/yHircDRjMFq7Kxfl1kqB04RFKAAEahDAcsg+
   ZzgVbWCx06iWsRYl+6ev2rUSPELK3wUvdek4U+sy/UqxOKsfGARQClt54
   e3X1AXdgiLBsbuTizpe9QVHY20WI3r13Vfpt+4t8bzDwzK2XcDsZndb7D
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265695684"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="265695684"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 03:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="595693115"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Apr 2022 03:13:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njICh-0003Py-RN;
	Tue, 26 Apr 2022 10:13:55 +0000
Date: Tue, 26 Apr 2022 18:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of NVDLA driver
Message-ID: <202204261827.CMHZCsOI-lkp@intel.com>
References: <20220426060808.78225-5-cai.huoqing@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426060808.78225-5-cai.huoqing@linux.dev>

Hi Cai,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on linus/master linux/master v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Huoqing/drm-nvdla-Add-driver-support-for-NVDLA/20220426-141148
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a003-20220425 (https://download.01.org/0day-ci/archive/20220426/202204261827.CMHZCsOI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a54587f7637b8ee11ad624794af3b409e6306e07
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cai-Huoqing/drm-nvdla-Add-driver-support-for-NVDLA/20220426-141148
        git checkout a54587f7637b8ee11ad624794af3b409e6306e07
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> error: include/uapi/drm/nvdla_drm.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[2]: *** [scripts/Makefile.headersinst:63: usr/include/drm/nvdla_drm.h] Error 1
   make[2]: Target '__headers' not remade because of errors.
   make[1]: *** [Makefile:1280: headers] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
