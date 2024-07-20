Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF513775E;
	Sat, 20 Jul 2024 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721496220; cv=none; b=qMV43d6B83zEXlBui5GS1ffUldjMsrpPraszPnkUrOMk4XL9jlluXnVodQCk+ubiejHbmxD+mPg2K63D/4BcmkVV1HpsxvhK+4inDv2shCNIbWfAlJ8Mt27GbgCu836kS/cvY4iuBZMmsBk2Sk2KExdkuu+EuQxG/A8L6gdcNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721496220; c=relaxed/simple;
	bh=CmRf8xfUoue/OsP80j08hXpw8hkr9GdEqPwF/fPzxHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kAnrQOb0BQa86OC3lWhOZ5YaCZeKtj/xqfLoChPyab8vDmSMc7FICsbdLzTCyrXhG7sGgE4U638wxa4o+wEYmAXh+mf1ahcTxAQYyQ8el0nJ6JMQgnhSqcq/a+7xp9+6r1POGldVQPYLn6tqtFc1HXFVj5KezF6Bu+PmvxxDMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xx4HiIao; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xx4HiIao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721496218; x=1753032218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmRf8xfUoue/OsP80j08hXpw8hkr9GdEqPwF/fPzxHs=;
  b=Xx4HiIaoJkk4+ea71e5zrg/tyilW1GLRFEx0O6NxBcqeY2il0IKtZG7J
   wkORbYJ6yU0iBLHZvnkAcj6uA1wCWNspwrVlEjab/EOLdp2gFaCcVA4Lq
   75zNxifyBAUcfCnUCk670L2gs0mOGleFZ6ar6NxNs2lAlMkrGlgdoF7el
   Ej4C4yIpnGLdc+XSnMJWuqN0gfUs2YIijU+On7YUmQMxTIrVjQiGvN0W2
   vqIqL8xi+k5TumLrETFWUis6gcO1U7J5Ymx8eQzVLZ/6elBXdssOgPOUs
   mKNF0ST3heERZY8+FBvNFU8S3jpsj7V/m8izMvDYjIYihYj5/aszIhuxb
   g==;
X-CSE-ConnectionGUID: IbtKBBWpRcSYS9wApLjaTA==
X-CSE-MsgGUID: MI/9Z14vQkyJWqe5lxXczg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="29689763"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="29689763"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 10:23:37 -0700
X-CSE-ConnectionGUID: ebp+H30sSWKp6kyEKBKuYQ==
X-CSE-MsgGUID: v77bShUETYuKJlX9ldXYLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="55709668"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jul 2024 10:23:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVDnx-000jT8-0v;
	Sat, 20 Jul 2024 17:23:33 +0000
Date: Sun, 21 Jul 2024 01:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [agd5f:amd-staging-drm-next-queue-reset 60/60]
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2139:11: warning: operator '?:' has
 lower precedence than '|'; '|' will be evaluated first
Message-ID: <202407210134.PApSunS1-lkp@intel.com>
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
commit: a5bdae426e5b6593ac3ac0814950110bec1dda31 [60/60] drm/amdgpu/gfx7: add ring reset callback for gfx
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240721/202407210134.PApSunS1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210134.PApSunS1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210134.PApSunS1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2139:11: warning: operator '?:' has lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-parentheses]
    2135 |         amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~~~
    2136 |                                  EOP_TC_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~
    2137 |                                  EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2138 |                                  EVENT_INDEX(5) |
         |                                  ~~~~~~~~~~~~~~~~
    2139 |                                  exec ? EOP_EXEC : 0));
         |                                  ~~~~ ^
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2139:11: note: place parentheses around the '|' expression to silence this warning
    2135 |         amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~~~
    2136 |                                  EOP_TC_ACTION_EN |
         |                                  ~~~~~~~~~~~~~~~~~~
    2137 |                                  EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2138 |                                  EVENT_INDEX(5) |
         |                                  ~~~~~~~~~~~~~~~~
    2139 |                                  exec ? EOP_EXEC : 0));
         |                                  ~~~~ ^
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2139:11: note: place parentheses around the '?:' expression to evaluate it first
    2139 |                                  exec ? EOP_EXEC : 0));
         |                                       ^             
         |                                  (                  )
   1 warning generated.


vim +2139 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c

  2100	
  2101	/**
  2102	 * gfx_v7_0_ring_emit_fence_gfx - emit a fence on the gfx ring
  2103	 *
  2104	 * @ring: amdgpu_ring structure holding ring information
  2105	 * @addr: address
  2106	 * @seq: sequence number
  2107	 * @flags: fence related flags
  2108	 *
  2109	 * Emits a fence sequence number on the gfx ring and flushes
  2110	 * GPU caches.
  2111	 */
  2112	static void gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
  2113						 u64 seq, unsigned flags)
  2114	{
  2115		bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
  2116		bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
  2117		bool exec = flags & AMDGPU_FENCE_FLAG_EXEC;
  2118	
  2119		/* Workaround for cache flush problems. First send a dummy EOP
  2120		 * event down the pipe with seq one below.
  2121		 */
  2122		amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
  2123		amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
  2124					 EOP_TC_ACTION_EN |
  2125					 EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
  2126					 EVENT_INDEX(5)));
  2127		amdgpu_ring_write(ring, addr & 0xfffffffc);
  2128		amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
  2129					DATA_SEL(1) | INT_SEL(0));
  2130		amdgpu_ring_write(ring, lower_32_bits(seq - 1));
  2131		amdgpu_ring_write(ring, upper_32_bits(seq - 1));
  2132	
  2133		/* Then send the real EOP event down the pipe. */
  2134		amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
  2135		amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
  2136					 EOP_TC_ACTION_EN |
  2137					 EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
  2138					 EVENT_INDEX(5) |
> 2139					 exec ? EOP_EXEC : 0));
  2140		amdgpu_ring_write(ring, addr & 0xfffffffc);
  2141		amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
  2142					DATA_SEL(write64bit ? 2 : 1) | INT_SEL(int_sel ? 2 : 0));
  2143		amdgpu_ring_write(ring, lower_32_bits(seq));
  2144		amdgpu_ring_write(ring, upper_32_bits(seq));
  2145	}
  2146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
