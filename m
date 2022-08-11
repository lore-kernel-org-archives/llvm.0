Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9157D2F28
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660211341; x=1691747341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PfSVymXx3rlWDe40i32xS/OIc4bbPwP8X01DN5B4Wa0=;
  b=J9+S3IIGGCSKmg0vcBaQRbYwJjbZUBppxiYdTXtaspBbGr/7h3pWkx+9
   8bkmtc4V5Qp7dkIRCedfHeGYmGse+WDdefnS+IjhQbIdYLx4hTvZVITop
   02ZYD2jd3A4fkPAyBb8AS9SvfoTKj6rCmqXpE2b8hDqKSa43RmR8KCI+u
   ICiOMEZrf+mDwLeHuPaUki6+wOpOPX06w2P5EbCaNnfU/BiEvRH/l7KG2
   zhOSPhaULFLvr8c+2O4xvExG7GEzTx0csfM8facBKP66ngBkxQmk+rbou
   8SPGpDmB8c7WzDuH+v0D93Uf25FCbJFo7RPjBGpSPCP/smS03wVOrbdg+
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="290061504"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="290061504"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 02:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="581606795"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Aug 2022 02:48:37 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oM4ns-00003b-27;
	Thu, 11 Aug 2022 09:48:36 +0000
Date: Thu, 11 Aug 2022 17:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 14970/15097] ld.lld: error: undefined symbol:
 dc_dsc_get_policy_for_timing
Message-ID: <202208111743.035rR9Wb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   40d43a7507e1547dd45cb02af2e40d897c591870
commit: b1a63a0b48add192908b578a3c5a566586d49e4e [14970/15097] drm/amd/display: consider DSC pass-through during mode validation
config: powerpc-randconfig-r003-20220810 (https://download.01.org/0day-ci/archive/20220811/202208111743.035rR9Wb-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b1a63a0b48add192908b578a3c5a566586d49e4e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b1a63a0b48add192908b578a3c5a566586d49e4e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dc_dsc_get_policy_for_timing
   >>> referenced by amdgpu_dm_mst_types.c:1409 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1409)
   >>>               gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.o:(dm_dp_mst_is_port_support_mode) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: dc_dsc_compute_bandwidth_range
   >>> referenced by amdgpu_dm_mst_types.c:1410 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1410)
   >>>               gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.o:(dm_dp_mst_is_port_support_mode) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
