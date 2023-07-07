Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A910171C7;
	Fri,  7 Jul 2023 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688766314; x=1720302314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80o0fXO98qdNvbNB+NFjTlHI9jATVuD0TTxD6dr9VTY=;
  b=N1ETxMcH4G42N8G5z3B1YevVXMrKvdevvThsHATLo93tTvUVE0TpCl8K
   7ryd46G/DQrekp7pESX6gQR5BQ7XwqgcsgPdrB8cv7W71sJrjOCzyGAAN
   QfAa4p3fjUzVN/SbIiMjWg0yYmiOZuhBqrBeMNEYISmCZqY3wof24+5mP
   KZUmtCr5E6YPnn+IY5QBo0YJKalO0QhZfMjbvvOekMz0rhtcuBkjJtGGZ
   Ki6kgVIA8EgHJ12dC2AZV/6KWH9JI+f7C3bBWquOXTDb9dVIS+cwroBI4
   eQOIyGjqveX/pPxk8hPZHatkfpHV1AuiY2e6UEeY5U/kmYrGQzygfurlZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="430053066"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="430053066"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="723352023"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="723352023"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jul 2023 14:45:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHtGI-0002KE-2C;
	Fri, 07 Jul 2023 21:45:10 +0000
Date: Sat, 8 Jul 2023 05:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mukul Joshi <mukul.joshi@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Subject: [agd5f:drm-next 22/46]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:834:5: warning: stack frame size
 (1176) exceeds limit (1024) in 'amdgpu_amdkfd_unmap_hiq'
Message-ID: <202307080534.hi8RIxaD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   3de4536fe42d097d64343bb7013035863005de10
commit: 9041b53a59d77039c69fa61be8575fa232cd3bcd [22/46] drm/amdkfd: Use KIQ to unmap HIQ
config: arm-randconfig-r046-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080534.hi8RIxaD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080534.hi8RIxaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080534.hi8RIxaD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:834:5: warning: stack frame size (1176) exceeds limit (1024) in 'amdgpu_amdkfd_unmap_hiq' [-Wframe-larger-than]
   int amdgpu_amdkfd_unmap_hiq(struct amdgpu_device *adev, u32 doorbell_off,
       ^
   36/1176 (3.06%) spills, 1140/1176 (96.94%) variables
   1 warning generated.


vim +/amdgpu_amdkfd_unmap_hiq +834 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c

   833	
 > 834	int amdgpu_amdkfd_unmap_hiq(struct amdgpu_device *adev, u32 doorbell_off,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
