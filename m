Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749D2137C35;
	Sat, 20 Jul 2024 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721489251; cv=none; b=Opy4YaigzQfK/ZEDz+exKFxqVmi5KLziSufY00fvWukjflgn8h9Z906BjsVF48s4rhoIvM7Zy3JU5d7QNsy6RYdU3mGQdI9AofurbdcBkdmku8KmqHJWQv4oY5ZeCaukQDEehvaVDtVkd+PmCMklN2H3XY93Ul0ye/ytxKYTWQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721489251; c=relaxed/simple;
	bh=wqfcE+VTFcPEVwS+83Rhg6CLTWfqIPXFbuBST/XPvWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9ZJBWTcgHs7jVKWXi+BvQaFb4zmMIpXJT2rjAeWZGibYIIjOFJUmvK5x6o3AvVz8j4l3d7SAJYij9hjaoUEUtW34YuCQugEs2uYDY+7o807j5/7PFnxsDC33+OAZlsHtbHKafYIaQubpTVVPsoGVRB13U8Y/UzUcEXEJFBGZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcYNZrht; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcYNZrht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721489249; x=1753025249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wqfcE+VTFcPEVwS+83Rhg6CLTWfqIPXFbuBST/XPvWY=;
  b=lcYNZrht19/OW8zAh2noQcTvnVsO+DrNCfcUUYVyeGFibZYQll6kKsSt
   grdEvtwHztR/bG+06ae1lke1jw133VvxYFvEljmd3paGqqJrbWhAkqT68
   A7gm5SNw2gBQsAkdV81qMq9ADoRhjokuxyYa0o8ur6cJCJMkZopiWoKoO
   NCmCcaSr+qeGwDNttPMz00eAw34xyomESWmy8VB/yC0RqpPeyg8UuXI7F
   K8qDyGu+XGNir9haeXLm0y+ifsf8vY1SuKDHJxKHEzorWuvIqyCy9VtyU
   h1DxgIQFNcpmyMjig2K6ellJZVNkZFa68RTkxwhTFPQXO0E72IhEkvI6J
   w==;
X-CSE-ConnectionGUID: CLGQcn6eRy6O5oZoBaMo4A==
X-CSE-MsgGUID: C0xnlem+SSybFs2vfqvmuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="36635289"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="36635289"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:27:28 -0700
X-CSE-ConnectionGUID: euKTo2e7Thy3AS0A9+TuSA==
X-CSE-MsgGUID: qatL2HfOTVGAMccjew2dnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51380201"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jul 2024 08:27:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVBzY-000jL6-2Y;
	Sat, 20 Jul 2024 15:27:24 +0000
Date: Sat, 20 Jul 2024 23:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [agd5f:amd-staging-drm-next-queue-reset 59/60]
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:6177:11: warning: operator '?:' has
 lower precedence than '|'; '|' will be evaluated first
Message-ID: <202407202353.cuFqyue8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next-queue-reset
head:   a5bdae426e5b6593ac3ac0814950110bec1dda31
commit: 711e8c91f6131a2c587e9c037906272ad1c341c0 [59/60] drm/amdgpu/gfx8: add ring reset callback for gfx
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240720/202407202353.cuFqyue8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202353.cuFqyue8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202353.cuFqyue8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:6177:11: warning: operator '?:' has lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-parentheses]
    6172 |         amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~~~
    6173 |                                  EOP_TC_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~
    6174 |                                  EOP_TC_WB_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~~~~
    6175 |                                  EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6176 |                                  EVENT_INDEX(5) |
         |                                  ~~~~~~~~~~~~~~~~
    6177 |                                  exec ? EOP_EXEC : 0));
         |                                  ~~~~ ^
   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:6177:11: note: place parentheses around the '|' expression to silence this warning
    6172 |         amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~~~
    6173 |                                  EOP_TC_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~
    6174 |                                  EOP_TC_WB_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~~~~
    6175 |                                  EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6176 |                                  EVENT_INDEX(5) |
         |                                  ~~~~~~~~~~~~~~~~
    6177 |                                  exec ? EOP_EXEC : 0));
         |                                  ~~~~ ^
   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:6177:11: note: place parentheses around the '?:' expression to evaluate it first
    6177 |                                  exec ? EOP_EXEC : 0));
         |                                       ^             
         |                                  (                  )
   1 warning generated.


vim +6177 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c

  6146	
  6147	static void gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
  6148						 u64 seq, unsigned flags)
  6149	{
  6150		bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
  6151		bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
  6152		bool exec = flags & AMDGPU_FENCE_FLAG_EXEC;
  6153	
  6154		/* Workaround for cache flush problems. First send a dummy EOP
  6155		 * event down the pipe with seq one below.
  6156		 */
  6157		amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
  6158		amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
  6159					 EOP_TC_ACTION_EN |
  6160					 EOP_TC_WB_ACTION_EN |
  6161					 EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
  6162					 EVENT_INDEX(5)));
  6163		amdgpu_ring_write(ring, addr & 0xfffffffc);
  6164		amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
  6165					DATA_SEL(1) | INT_SEL(0));
  6166		amdgpu_ring_write(ring, lower_32_bits(seq - 1));
  6167		amdgpu_ring_write(ring, upper_32_bits(seq - 1));
  6168	
  6169		/* Then send the real EOP event down the pipe:
  6170		 * EVENT_WRITE_EOP - flush caches, send int */
  6171		amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
  6172		amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
  6173					 EOP_TC_ACTION_EN |
  6174					 EOP_TC_WB_ACTION_EN |
  6175					 EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
  6176					 EVENT_INDEX(5) |
> 6177					 exec ? EOP_EXEC : 0));
  6178		amdgpu_ring_write(ring, addr & 0xfffffffc);
  6179		amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
  6180				  DATA_SEL(write64bit ? 2 : 1) | INT_SEL(int_sel ? 2 : 0));
  6181		amdgpu_ring_write(ring, lower_32_bits(seq));
  6182		amdgpu_ring_write(ring, upper_32_bits(seq));
  6183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
