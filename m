Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA923A9B3;
	Wed,  5 Nov 2025 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354124; cv=none; b=ZOOI5XIPVlScw+L6o4zqukDQM5AmKjzULAoB1zJg8YDTx0jQYJPjo1T0Z+LOxEqbHFMfXP4e1mmg6rUrzKl4VkpY7AH0umxE8NlrSJ6VFiM5V/KVMOhzrJ1r3SbYsPe7Oy/gHWvZjrO/z5Q5peKmCPN68oLWD9yBAOBzaJaxb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354124; c=relaxed/simple;
	bh=AYyGt4IBdouvmmb0sjpTOATP18MjHeHF9c46BtKw/MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7JQfrQ2U4v1yBXkB0YNCiLdHAhA6wzm7m+Z59rz3xUf6OrmeV4umjMzYHEN4/K6D/uwNUg+6jNSbPnURFw+w9zqFfZGNDbYgEVDH3X8+A1T9mge007N4YhvPhJQPJHiieX88hoDmMyclxcWqZiSFB6GLrwmQPWZBR79UXUwMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SP798l2n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SP798l2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762354123; x=1793890123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AYyGt4IBdouvmmb0sjpTOATP18MjHeHF9c46BtKw/MQ=;
  b=SP798l2nZftQoeYgreooi8uU3kpov+kEOaa24cAOuD8jmgP+9ZvC/JyI
   NdWFBekF5DbT6KAISaGBUjeVlVJhvLCJgh4qYv8pmRa80K5kHKwBG9+2i
   Qm4yDHKIofh1lGCW7Tqbae0xaYNsVKiFifubYoOAHrkiJ9TPZroBbrmxu
   MvEUPZRnDzpI13xUrCMcfTPkNAsFGlG7w6XVCgagmYrRoUqhE3oRqGUST
   RLL7BSajLEnP2uPMo6WZmijvetV3U0vv/SEpG7zSzbHqDKrH4wUgiOr3m
   NpmhiovqrLBhRFDdn3MFouiKm+8w1ZAvFYoZTadLdWlfzyqD4o4jrPeIF
   g==;
X-CSE-ConnectionGUID: 4yUQk+DrRqi0WumyodghZw==
X-CSE-MsgGUID: nMVCw6O+StKWvQ3TdrlLLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89931112"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="89931112"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 06:48:42 -0800
X-CSE-ConnectionGUID: EEzexZKgRtSHfWWdKidK3Q==
X-CSE-MsgGUID: ku2SwyiBRIqMp5Yy3ntjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187923090"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2025 06:48:39 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGeo1-000SiS-0e;
	Wed, 05 Nov 2025 14:48:14 +0000
Date: Wed, 5 Nov 2025 22:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: xur@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/2] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <202511052257.Bb85ptQG-lkp@intel.com>
References: <20251028182822.3210436-3-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028182822.3210436-3-xur@google.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-move-vmlinux-a-build-rule-to-scripts-Makefile-vmlinux_a/20251029-024527
base:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
patch link:    https://lore.kernel.org/r/20251028182822.3210436-3-xur%40google.com
patch subject: [PATCH v5 2/2] kbuild: distributed build support for Clang ThinLTO
config: i386-buildonly-randconfig-003-20251105 (https://download.01.org/0day-ci/archive/20251105/202511052257.Bb85ptQG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052257.Bb85ptQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052257.Bb85ptQG-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: phonet_net_ops.llvm.6273608609221102921+0x8 (section: .data) -> phonet_init_net (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mctp_net_ops.llvm.5397949150189356468+0x8 (section: .data) -> mctp_routes_net_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mctp_net_ops.llvm.12518417922465111039+0x8 (section: .data) -> mctp_neigh_net_init (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
