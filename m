Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C622DDDD;
	Thu, 17 Aug 2023 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692259668; x=1723795668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8KoWn4BGp7AzKYi1rx1zgLWjbrlHcyfkYk/K8VIcOus=;
  b=KrIv1PWq4ZOziDCC7smAlxC7tUQEGTSWkwop4U1RZn0CD4TnADmJgxUj
   Yu7/2biziQb7kWgQJ74GP6GiyexYYYqJYxz7264EgpRasIZnGbdRr/RJp
   YGYTJ5ZHpU9BravbPhJK6WY44h/SzC6TiT/bUAvkYOQ9VlhPIBgpooOhx
   lgtTEgJkgmuJ2lYyMJfSMzjE+7JE4bhjksxGtldQM6yTk4BxYDj5VU2bI
   W27YJ5YVMa5D8b8xykpyG53WNc6WWpqCn4V5PfTz5un9tzY7Ye3ZbWDmn
   hsnOKSGlI5c0Mz30Ikd+BXi+dgz4GlOsiTspUjAkPU12QuHqfoD2TGRza
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459101099"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="459101099"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799935018"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="799935018"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 01:07:44 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWY2f-0000vv-2Z;
	Thu, 17 Aug 2023 08:07:42 +0000
Date: Thu, 17 Aug 2023 16:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Shashank Sharma <shashank.sharma@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 6742/10848]
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Function
 parameter or member 'doorbell_index' not described in
 'amdgpu_doorbell_index_on_bar'
Message-ID: <202308171521.DFEZZNuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
commit: d124aa0ac96358042ba34df091a3bfa6e77fcf6f [6742/10848] drm/amdgpu: get absolute offset from doorbell index
config: riscv-randconfig-r036-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171521.DFEZZNuE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171521.DFEZZNuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171521.DFEZZNuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Function parameter or member 'doorbell_index' not described in 'amdgpu_doorbell_index_on_bar'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Excess function parameter 'db_index' description in 'amdgpu_doorbell_index_on_bar'


vim +123 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c

   110	
   111	/**
   112	 * amdgpu_doorbell_index_on_bar - Find doorbell's absolute offset in BAR
   113	 *
   114	 * @adev: amdgpu_device pointer
   115	 * @db_bo: doorbell object's bo
   116	 * @db_index: doorbell relative index in this doorbell object
   117	 *
   118	 * returns doorbell's absolute index in BAR
   119	 */
   120	uint32_t amdgpu_doorbell_index_on_bar(struct amdgpu_device *adev,
   121					       struct amdgpu_bo *db_bo,
   122					       uint32_t doorbell_index)
 > 123	{
   124		int db_bo_offset;
   125	
   126		db_bo_offset = amdgpu_bo_gpu_offset_no_check(db_bo);
   127	
   128		/* doorbell index is 32 bit but doorbell's size is 64-bit, so *2 */
   129		return db_bo_offset / sizeof(u32) + doorbell_index * 2;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
