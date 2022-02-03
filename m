Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB852F21
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643902760; x=1675438760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7mRbriesMnc5y9jim1krZpY4CvguXRL9C3UcMNNveDg=;
  b=hYzXqGNr3S3/CyOSHwUdaMH9ZaatXADvnrmrDkyR+kITliN7cG4FmPHN
   ALA/qoVhJqbrPx1UMZmYFdYtVCaTfmaWbEfBArbD+SN6cR89aj3ZhDXdD
   pM0aaguSa4zMuTJAVNE8VVT4Osbf/bOQ765EwsrWXkckgrgtWNmfLoJVa
   A9BBrHebKDFq1xAEBX+l7sCTGj2/URN59hxybplR6jhXzgvoeeg9s4EkT
   J2e4I347u9QO0PRiGE3EHxk1IXjXvxiRLzzW3FobkF5z8yiP3RxlIb/jW
   wncm8UqoLjA03ZaYkqFySc0CotZV7hMh4pEIUYU1d5BPSfXCKQuCroMu8
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="311472184"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="311472184"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 07:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="583821356"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2022 07:39:18 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFeCb-000WI2-SS; Thu, 03 Feb 2022 15:39:17 +0000
Date: Thu, 3 Feb 2022 23:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Powell <darren.powell@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-next 243/250]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:2277:6: warning:
 variable 'ret' set but not used
Message-ID: <202202032303.GcRtJxzw-lkp@intel.com>
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
head:   53593d1be00c441585cb4fec41a756b8e586b710
commit: 5d64f9bbb6281a5a89a2266b9d39daa1fca1d6b4 [243/250] amdgpu/pm: Implement new API function "emit" that accepts buffer base and write offset
config: i386-randconfig-a011-20220131 (https://download.01.org/0day-ci/archive/20220203/202202032303.GcRtJxzw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 5d64f9bbb6281a5a89a2266b9d39daa1fca1d6b4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:2277:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret = 0;
               ^
   1 warning generated.


vim +/ret +2277 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c

  2272	
  2273	static int smu_emit_ppclk_levels(void *handle, enum pp_clock_type type, char *buf, int *offset)
  2274	{
  2275		struct smu_context *smu = handle;
  2276		enum smu_clk_type clk_type;
> 2277		int ret = 0;
  2278	
  2279		clk_type = smu_convert_to_smuclk(type);
  2280		if (clk_type == SMU_CLK_COUNT)
  2281			return -EINVAL;
  2282	
  2283		if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
  2284			return -EOPNOTSUPP;
  2285	
  2286		if (!smu->ppt_funcs->emit_clk_levels)
  2287			ret = -ENOENT;
  2288	
  2289		return smu->ppt_funcs->emit_clk_levels(smu, clk_type, buf, offset);
  2290	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
