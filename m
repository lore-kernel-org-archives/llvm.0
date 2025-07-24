Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F82459D7;
	Thu, 24 Jul 2025 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753356410; cv=none; b=Y5hoxhtViBBk7F3zYKvnQG7GljXnNuvV5ExjNXq2ryOYXO76QmEKn3pPTQ80KyKFnDbrHMZyHZRV1CQikifIsZg5tj9qvBjQcNeZqM4AC9SDP9cAsMhmTRXt4QQLCeTmCDZwkD9AKGINhvhPHQuD4Fuk0wSysqByeQmVCbJGMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753356410; c=relaxed/simple;
	bh=kG7LDs5bk1m54HXdMCSGeTVy8L86DTIx637Yz5C2kLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XAvPqbfYpQ4XRMPwcZO/9ucIA2IkFN+cqoPYluawp/9e8P66ADinqUY30kwhLZn7gsLrW8O5Legw1647nqVsalkM0R4+46M7bKKE/dIf98SCjIc8Xl0TIvNhuYB69mnO05o1MI3Py5b4ABUa/eOWo1dKNjoO+RodzZE8MnqvnfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+MmLIvg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+MmLIvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753356409; x=1784892409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kG7LDs5bk1m54HXdMCSGeTVy8L86DTIx637Yz5C2kLg=;
  b=d+MmLIvgwV7iEmnKwEJtW1QX4diadTMTdh2S2qlhGXkgGnP9odSUByQ7
   esRoqF3ZTOF28s/D9RAwR93S8JreHzw1M9QWqC3SZBNgc/Qe2bXztIcJY
   MM4zaR0a9FPK68jglWt5KFuKrJ+pgqyl3A1laT4gWoXQeZxfl57y6kagC
   pvvlM0C8PEjERX5qpAQDBUvZMfZIDnz2+yCIk1tJYpfD7Iein7d6Pif7A
   +XnTfY1dlgh3HzCcgRYs7ovN9ns4itLIaIY07e/JEuClYs0iQlQY53N3L
   xq/YA2Ku4FtAnoDW20w6nefzdVJ4ouooUQ/pqMAy80UHueaRA9gQexDtj
   g==;
X-CSE-ConnectionGUID: am2z0fA8Qe+yHTDBOEmSIA==
X-CSE-MsgGUID: F5Jpj5oaSxO1S2v//jSIfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55369861"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55369861"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 04:26:48 -0700
X-CSE-ConnectionGUID: JhkC6knvROapG6djLESaAQ==
X-CSE-MsgGUID: 9RtVb1s4QDGP9U4GS6GplA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="159774345"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 04:26:45 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueu5y-000039-1L;
	Thu, 24 Jul 2025 11:26:42 +0000
Date: Thu, 24 Jul 2025 13:26:25 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [agd5f:kq_resets 16/41]
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:742: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202507241307.3zdfZT68-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git kq_resets
head:   524eebfdd4b30fd63ca774d7ea346bcf0e8e76b1
commit: 2ed8b69e9971cd99c0fed42c9e0ecf24d3d2b481 [16/41] drm/amdgpu: track ring state associated with a fence
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250724/202507241307.3zdfZT68-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241307.3zdfZT68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241307.3zdfZT68-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:742: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Kernel queue reset handling


vim +742 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

   739	
   740	
   741	/**
 > 742	 * Kernel queue reset handling
   743	 *
   744	 * The driver can reset individual queues for most engines, but those queues
   745	 * may contain work from multiple contexts.  Resetting the queue will reset
   746	 * lose all of that state.  In order to minimize the collateral damage, the
   747	 * driver will save the ring contents which are not associated with the guilty
   748	 * context prior to resetting the queue.  After resetting the queue the queue
   749	 * contents from the other contexts is re-emitted to the rings so that it can
   750	 * be processed by the engine.  To handle this, we save the queue's write
   751	 * pointer (wptr) in the fences associated with each context.  If we get a
   752	 * queue timeout, we can then use the wptrs from the fences to determine
   753	 * which data needs to be saved out of the queue's ring buffer.
   754	 */
   755	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
