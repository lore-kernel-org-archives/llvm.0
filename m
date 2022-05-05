Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59944625
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651763302; x=1683299302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ocBht83/TVqIHB7fBIQ8ek09DRB391vGKX6ORBQ/3g4=;
  b=Hyf7YDrUUXcvJqtbNa+aD33L/cpXV0aaRgU9aG4i6L4ncHYliM8LW2G/
   qgePNxe2oV16sDBUnVC3MGDrvbYIa+loUNeEF9vC4TC2NTsHylTx7w+T8
   auJbr9kX3cb/uWqBUzW/TNE3kLAQTtVKFDGI7WFf34tgCrEBxpS/Hygf4
   5Woc8B+cJk7nqSpjOM2RWHVVRi3kSXG6JadR0J0GBs81E0SiPkgxfnj0f
   7TZtUIWDK/ozOHyrgTaWQ6ufiyK0QXM9TWs8yWP8MI+nTrZSvLPOY32p8
   N9WKPxul6OKoND6RAvNYnJGyH4YsRnQAWuI/UeDWos6w/8TR4zLHjaDow
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="354569595"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="354569595"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 08:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="694693743"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 May 2022 08:03:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmd0p-000CUU-BM;
	Thu, 05 May 2022 15:03:27 +0000
Date: Thu, 5 May 2022 23:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Xiao <Jack.Xiao@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 8878/9357]
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3826:6: warning: variable 'index' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202205052242.u5bVKpOl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   632a8c88e339fe86ae6e420a24dfc641d4dd0ab5
commit: 15d839c16a66434c19f9c8a560b7553f9468e588 [8878/9357] drm/amdgpu/gfx10: add mes support for gfx ib test
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220505/202205052242.u5bVKpOl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=15d839c16a66434c19f9c8a560b7553f9468e588
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 15d839c16a66434c19f9c8a560b7553f9468e588
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3829:12: error: implicit declaration of function 'amdgpu_mes_ctx_get_offs' [-Werror,-Wimplicit-function-declaration]
                   offset = amdgpu_mes_ctx_get_offs(ring, AMDGPU_MES_CTX_IB_OFFS);
                            ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3826:6: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (ring->is_mes_queue) {
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3883:30: note: uninitialized use occurs here
           amdgpu_device_wb_free(adev, index);
                                       ^~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3826:2: note: remove the 'if' if its condition is always false
           if (ring->is_mes_queue) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3819:16: note: initialize the variable 'index' to silence this warning
           unsigned index;
                         ^
                          = 0
   1 warning and 1 error generated.


vim +3826 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c

  3813	
  3814	static int gfx_v10_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
  3815	{
  3816		struct amdgpu_device *adev = ring->adev;
  3817		struct amdgpu_ib ib;
  3818		struct dma_fence *f = NULL;
  3819		unsigned index;
  3820		uint64_t gpu_addr;
  3821		volatile uint32_t *cpu_ptr;
  3822		long r;
  3823	
  3824		memset(&ib, 0, sizeof(ib));
  3825	
> 3826		if (ring->is_mes_queue) {
  3827			uint32_t padding, offset;
  3828	
  3829			offset = amdgpu_mes_ctx_get_offs(ring, AMDGPU_MES_CTX_IB_OFFS);
  3830			padding = amdgpu_mes_ctx_get_offs(ring,
  3831							  AMDGPU_MES_CTX_PADDING_OFFS);
  3832	
  3833			ib.gpu_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
  3834			ib.ptr = amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
  3835	
  3836			gpu_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, padding);
  3837			cpu_ptr = amdgpu_mes_ctx_get_offs_cpu_addr(ring, padding);
  3838			*cpu_ptr = cpu_to_le32(0xCAFEDEAD);
  3839		} else {
  3840			r = amdgpu_device_wb_get(adev, &index);
  3841			if (r)
  3842				return r;
  3843	
  3844			gpu_addr = adev->wb.gpu_addr + (index * 4);
  3845			adev->wb.wb[index] = cpu_to_le32(0xCAFEDEAD);
  3846			cpu_ptr = &adev->wb.wb[index];
  3847	
  3848			r = amdgpu_ib_get(adev, NULL, 20, AMDGPU_IB_POOL_DIRECT, &ib);
  3849			if (r) {
  3850				DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
  3851				goto err1;
  3852			}
  3853		}
  3854	
  3855		ib.ptr[0] = PACKET3(PACKET3_WRITE_DATA, 3);
  3856		ib.ptr[1] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
  3857		ib.ptr[2] = lower_32_bits(gpu_addr);
  3858		ib.ptr[3] = upper_32_bits(gpu_addr);
  3859		ib.ptr[4] = 0xDEADBEEF;
  3860		ib.length_dw = 5;
  3861	
  3862		r = amdgpu_ib_schedule(ring, 1, &ib, NULL, &f);
  3863		if (r)
  3864			goto err2;
  3865	
  3866		r = dma_fence_wait_timeout(f, false, timeout);
  3867		if (r == 0) {
  3868			r = -ETIMEDOUT;
  3869			goto err2;
  3870		} else if (r < 0) {
  3871			goto err2;
  3872		}
  3873	
  3874		if (le32_to_cpu(*cpu_ptr) == 0xDEADBEEF)
  3875			r = 0;
  3876		else
  3877			r = -EINVAL;
  3878	err2:
  3879		if (!ring->is_mes_queue)
  3880			amdgpu_ib_free(adev, &ib, NULL);
  3881		dma_fence_put(f);
  3882	err1:
  3883		amdgpu_device_wb_free(adev, index);
  3884		return r;
  3885	}
  3886	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
