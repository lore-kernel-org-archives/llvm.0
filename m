Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFEF19DF4D;
	Sun, 20 Jul 2025 04:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752985778; cv=none; b=cTrenM7dKwINDFlJKbP1Q7DCyw4fPRKHy5AGn3iz0aMmLZocK0bGdHiHNLDkv45rRE0f6+BfuW4EHsb/b4+jj2Pft/7tuCMNHUcLTP2yKTm9ya+Y0t7e2/B4UhtgvOrI5UdAT/EV+W8gpbuW60LDsPhsDbKMona3+0rCvOZnUAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752985778; c=relaxed/simple;
	bh=3I9gdZQ5iPvFTpSVb266soPkOnEt+lW7WCaPEwb0acU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idKyLMy9z55sgRZYx/I8abLtI0EtrCysU3u4oYeeSbzksPOZ4CHL1NYySBJkgNaoCf/4y1Jkx4WH5N0/Wxey7EE8NgVUkrH6sHDnQYuKeMRx68n3NdoMvAWeZvfLY5Gt1rrp1hp8QwHNpdhHMxTptb/j/uNAb2ETKzD5FRKykKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSQVM8bu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSQVM8bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752985777; x=1784521777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3I9gdZQ5iPvFTpSVb266soPkOnEt+lW7WCaPEwb0acU=;
  b=hSQVM8bubFFISVQ/Wa1FXNm2vaZh3QJ4vxIxRVBQnN1EvISjQrPx9C/X
   kiGwPeWeeNcoxCwuT4s44y3NzbvvJxBnKHIXgKJo32hIxNQN5QFzOd2QA
   vAvTxQFyEMMZCRKo4kNbs3/7Fy44jkjhpL8+8O1/LTmgUYTTJBYBkv5Pi
   s132UJygfBRvi4pt3Xu72H3WQEIMzKyGdOFNnxZfj3v9e/fUmYAQykOJT
   S/arl8pMErVodQswopSGpYWC/pJ9BFX5htxcENK3PVBGooascQ90TH3yT
   EbZQ+n3KFs7C1iAZS5e6yKrVhHlZtsIqF6OXbncM4J/4tOHb+zU3A1zN7
   g==;
X-CSE-ConnectionGUID: Ezzex8aYSdOoTGpXYRrxVg==
X-CSE-MsgGUID: LBTvNgFwS5GvM9ML5zHWCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="54335863"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="54335863"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 21:29:37 -0700
X-CSE-ConnectionGUID: Lir+THrUS0ikhY65CpnbCg==
X-CSE-MsgGUID: Ng+Y7oqpQgawuPrkWjMnMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="162841663"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jul 2025 21:29:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udLg3-000Fvl-1b;
	Sun, 20 Jul 2025 04:29:31 +0000
Date: Sun, 20 Jul 2025 12:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/9] drm/panthor: capture GPU state for devcoredump
Message-ID: <202507201259.fG0O42j1-lkp@intel.com>
References: <20250720000146.1405060-3-olvaffe@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720000146.1405060-3-olvaffe@gmail.com>

Hi Chia-I,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20250718]
[cannot apply to linus/master v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-I-Wu/drm-panthor-add-devcoredump-support/20250720-080312
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250720000146.1405060-3-olvaffe%40gmail.com
patch subject: [PATCH 2/9] drm/panthor: capture GPU state for devcoredump
config: x86_64-buildonly-randconfig-004-20250720 (https://download.01.org/0day-ci/archive/20250720/202507201259.fG0O42j1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201259.fG0O42j1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201259.fG0O42j1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:24 Enum value 'PANTHOR_COREDUMP_GROUP' not described in enum 'panthor_coredump_mask'
>> Warning: drivers/gpu/drm/panthor/panthor_coredump.c:24 Enum value 'PANTHOR_COREDUMP_GPU' not described in enum 'panthor_coredump_mask'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:32 struct member 'reason' not described in 'panthor_coredump_header'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:32 struct member 'timestamp' not described in 'panthor_coredump_header'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:58 struct member 'group' not described in 'panthor_coredump'
>> Warning: drivers/gpu/drm/panthor/panthor_coredump.c:58 struct member 'gpu' not described in 'panthor_coredump'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:58 struct member 'data' not described in 'panthor_coredump'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:58 struct member 'size' not described in 'panthor_coredump'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
