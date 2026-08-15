Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC3023507B;
	Sat, 15 Aug 2026 04:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786768473; cv=none; b=ETON3A23sjVV3R5/xXz5w5juS8xXqoX/m+VSHXKQqxkbDOgeWnHuV+6+HAEq4BEBrR0FUhYR9PfDm2rrsaxR/JEUmu7ThmxsP+oQBlPp/kCmoCH3LK4SaCO9hn7IEJW07Zgyw8I7OFOmQGhtG0RBLVX5yz1MGUCdC8T94rIr1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786768473; c=relaxed/simple;
	bh=GzorXhZX1Q0On3HEiPKCaUPF1TOnC7dUsD87oSeTyYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YoFwkt7oMo6jWLtAFQLn1kDqqtux/irj1rt3jO1V/DXQ5xYg6eXFQRIEGf0+JDjOhEWE/h8l28gbqmhnoALgNubksKMOuTcE/Iy6IPtLkgBvJJlRzXcO21OiAu3u3bKhPaQl/36ff+7PKFRqYNj4JiRM7mM2DBRp7cbAg2Dpyho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwaXBq7e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwaXBq7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786768470; x=1818304470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GzorXhZX1Q0On3HEiPKCaUPF1TOnC7dUsD87oSeTyYo=;
  b=YwaXBq7e91RuQkjSgQsUX7XbvqyoOUmadSNwnfTs3QlSbS6+/kAtIZ2u
   roIgeruHv4Q3FsM6+tapILddVvzRIqdbWTIwGyGZLx3svAtHGGnIohDaU
   1Afoi2h+A5ZxkHQxozNh8LUdYd0PA0AXJYWJxSHd4I2idVt1uASUP9YKm
   6G0ICdxce/gd3Exu5V+xDbs+8I1EZ6vm8ayOuV1YMbMcWSrhd/dQbR+vD
   Y2byI6pevRHl5ka6XSyWMThgUnzQG+q4TINHl2xxJmrfJ/ranRuB9eAZM
   Sr64nASCd/92+LqsNvBWu8qUbXLmVgJZugfCI+inZgJbFw4sLCwV6IY/Z
   w==;
X-CSE-ConnectionGUID: JiHcA3f2Q2SCeTxBjXkXcw==
X-CSE-MsgGUID: B5w97eXOQsadZMp2Vot6MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="104874165"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="104874165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 21:34:27 -0700
X-CSE-ConnectionGUID: rsj8R4A1SHil+oM9j9KyCA==
X-CSE-MsgGUID: BiazIsATTkyj18fwHGH4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="261119278"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2026 21:34:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv66C-00000000b7y-1MdR;
	Sat, 15 Aug 2026 04:34:24 +0000
Date: Sat, 15 Aug 2026 12:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Timur =?utf-8?Q?Krist=C3=B3f"?= <timur.kristof@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alexander Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 2351/2369] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not
 described in 'amdgpu_ttm_map_buffer'
Message-ID: <202608151228.ZEzI5sCI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   21c50d41af7c46e138b542dba2dcf6d2a978ae99
commit: cfb197c8d3172b5c22c9075f54f58ccea0b71e89 [2351/2369] drm/amdgpu/ttm: Make buffer copy source readonly
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260815/202608151228.ZEzI5sCI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151228.ZEzI5sCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151228.ZEzI5sCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not described in 'amdgpu_ttm_map_buffer'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not described in 'amdgpu_ttm_map_buffer'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
