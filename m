Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953EF7EC
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 03:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645586296; x=1677122296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMOybF75Y1QlUx30byGPwtyd2n2/N3cIhsbFeWxL8sM=;
  b=Upn6+oW6sIq36cjn30TlycWVVSKYlrleDC8erMXtmvrMNJHdkqImzP85
   7+EoR9EH8Oqo4ZPt6WFFCvBdQd+D1m56QxpIX9heofJGGgqwTBMhN+Bau
   D72OyR67dIaGQOl8ABdU+83Chqk/xXSkZIR78si2aI5UlUExApARQXjRp
   JEJYp6WRtljPLrJ7XeHIwQyQryNrQR7GBplIB8VD55U1ZmKe5wOIlXSls
   7nLKvaMnm8Fe4g1pQTFwZ84vbJMTGEaxgTc77/ghqSxthq/ZZQaIRIQ6V
   uepW3j5XaSTHrSOlAmzYrLC5aWLlm3ukwcgRFaqf+BJlkmYtYyf4WsZSH
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231847075"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="231847075"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 19:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="508258109"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Feb 2022 19:18:13 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMiAP-0000vA-1P; Wed, 23 Feb 2022 03:18:13 +0000
Date: Wed, 23 Feb 2022 11:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Prike Liang <Prike.Liang@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <Lijo.Lazar@amd.com>
Subject: [agd5f:drm-next 115/146]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:526:5: warning: no previous
 prototype for function '__smu_get_enabled_features'
Message-ID: <202202231120.Noceeeac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   b4779e5b8346b52e25e8be6b077d7db67f14644a
commit: f141e251474d673f75e8c16dbdabeb4da3939d7e [115/146] drm/amd/pm: validate SMU feature enable message for getting feature enabled mask
config: arm-randconfig-r035-20220221 (https://download.01.org/0day-ci/archive/20220223/202202231120.Noceeeac-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout f141e251474d673f75e8c16dbdabeb4da3939d7e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/pm/swsmu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:526:5: warning: no previous prototype for function '__smu_get_enabled_features' [-Wmissing-prototypes]
   int __smu_get_enabled_features(struct smu_context *smu,
       ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:526:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __smu_get_enabled_features(struct smu_context *smu,
   ^
   static 
   1 warning generated.


vim +/__smu_get_enabled_features +526 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c

   525	
 > 526	int __smu_get_enabled_features(struct smu_context *smu,
   527				       uint64_t *enabled_features)
   528	{
   529		return smu_cmn_call_asic_func(get_enabled_mask, smu, enabled_features);
   530	}
   531	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
