Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB0E29AA
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 17:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651773299; x=1683309299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syeblWLP/RW5gKQYN7+QQQMmDScsDhPH8LGjM0yp/wc=;
  b=WLZGJwmWoPceKnRNx9blAAzH5n3m/f2GC3rqxOqpmp+geqzwF528X+jS
   IiUYfVz6lJl/dzhlmls/oZmq3azNzqaMMowcEiJwucWGgGcmrqtVo17lz
   1A+erHW0TKE3I7GxbBI2DanaroOHhME0XInH5AU4frUOT2z2QuMpZXKXZ
   j3aLbkpR7rTVMXwhzmKI80Kj7nISjVh3e+wP+kEiyuECi8UsXScCLtSYq
   YMXc+yxwPFBDa5wNDFOndF42NfuB3h+Q0g3gB1G7ODJUKeSvbETxtbyXa
   jGHprUvNMja4d51TDR9KwnM+fCz6uzQZ0e8bU0Lk+Ap1ltVIS9L+BNbN/
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248107074"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="248107074"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 10:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,202,1647327600"; 
   d="scan'208";a="600154667"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 May 2022 10:54:57 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmfgm-000CdQ-Ab;
	Thu, 05 May 2022 17:54:56 +0000
Date: Fri, 6 May 2022 01:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Wenhui Sheng <Wenhui.Sheng@amd.com>
Subject: [linux-next:master 8949/9357]
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:362:6: warning: variable 'index' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202205060132.uhqyUx1l-lkp@intel.com>
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
commit: 3d879e81f0f9ed5d33b5eda0fe5226c884bb8073 [8949/9357] drm/amdgpu: add init support for GFX11 (v2)
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220506/202205060132.uhqyUx1l-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3d879e81f0f9ed5d33b5eda0fe5226c884bb8073
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3d879e81f0f9ed5d33b5eda0fe5226c884bb8073
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:362:6: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (ring->is_mes_queue) {
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:419:30: note: uninitialized use occurs here
           amdgpu_device_wb_free(adev, index);
                                       ^~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:362:2: note: remove the 'if' if its condition is always false
           if (ring->is_mes_queue) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:350:16: note: initialize the variable 'index' to silence this warning
           unsigned index;
                         ^
                          = 0
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1945:6: warning: no previous prototype for function 'gfx_v11_0_rlc_stop' [-Wmissing-prototypes]
   void gfx_v11_0_rlc_stop(struct amdgpu_device *adev)
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:1945:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void gfx_v11_0_rlc_stop(struct amdgpu_device *adev)
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5873:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5873:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   3 warnings generated.


vim +362 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c

   344	
   345	static int gfx_v11_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
   346	{
   347		struct amdgpu_device *adev = ring->adev;
   348		struct amdgpu_ib ib;
   349		struct dma_fence *f = NULL;
   350		unsigned index;
   351		uint64_t gpu_addr;
   352		volatile uint32_t *cpu_ptr;
   353		long r;
   354	
   355		/* MES KIQ fw hasn't indirect buffer support for now */
   356		if (adev->enable_mes_kiq &&
   357		    ring->funcs->type == AMDGPU_RING_TYPE_KIQ)
   358			return 0;
   359	
   360		memset(&ib, 0, sizeof(ib));
   361	
 > 362		if (ring->is_mes_queue) {
   363			uint32_t padding, offset;
   364	
   365			offset = amdgpu_mes_ctx_get_offs(ring, AMDGPU_MES_CTX_IB_OFFS);
   366			padding = amdgpu_mes_ctx_get_offs(ring,
   367							  AMDGPU_MES_CTX_PADDING_OFFS);
   368	
   369			ib.gpu_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
   370			ib.ptr = amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
   371	
   372			gpu_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, padding);
   373			cpu_ptr = amdgpu_mes_ctx_get_offs_cpu_addr(ring, padding);
   374			*cpu_ptr = cpu_to_le32(0xCAFEDEAD);
   375		} else {
   376			r = amdgpu_device_wb_get(adev, &index);
   377			if (r)
   378				return r;
   379	
   380			gpu_addr = adev->wb.gpu_addr + (index * 4);
   381			adev->wb.wb[index] = cpu_to_le32(0xCAFEDEAD);
   382			cpu_ptr = &adev->wb.wb[index];
   383	
   384			r = amdgpu_ib_get(adev, NULL, 16, AMDGPU_IB_POOL_DIRECT, &ib);
   385			if (r) {
   386				DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
   387				goto err1;
   388			}
   389		}
   390	
   391		ib.ptr[0] = PACKET3(PACKET3_WRITE_DATA, 3);
   392		ib.ptr[1] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
   393		ib.ptr[2] = lower_32_bits(gpu_addr);
   394		ib.ptr[3] = upper_32_bits(gpu_addr);
   395		ib.ptr[4] = 0xDEADBEEF;
   396		ib.length_dw = 5;
   397	
   398		r = amdgpu_ib_schedule(ring, 1, &ib, NULL, &f);
   399		if (r)
   400			goto err2;
   401	
   402		r = dma_fence_wait_timeout(f, false, timeout);
   403		if (r == 0) {
   404			r = -ETIMEDOUT;
   405			goto err2;
   406		} else if (r < 0) {
   407			goto err2;
   408		}
   409	
   410		if (le32_to_cpu(*cpu_ptr) == 0xDEADBEEF)
   411			r = 0;
   412		else
   413			r = -EINVAL;
   414	err2:
   415		if (!ring->is_mes_queue)
   416			amdgpu_ib_free(adev, &ib, NULL);
   417		dma_fence_put(f);
   418	err1:
   419		amdgpu_device_wb_free(adev, index);
   420		return r;
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
