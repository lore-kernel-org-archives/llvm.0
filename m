Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA81DFDE;
	Thu, 29 Jan 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696404; cv=none; b=B33T1bLDalrK+pmU5tFRDYebYH90kU85w6de0uIlNXo3GtAg7V7pjGyBSGWqqAnn1E6ngf7wHloZeb+PH+VZZqOQC4gdzVfMZ56WXp7xnaEsRL7lCfRLiG4cnA2Hew3VhPBjFa+dpDBSLQGs8Yb2mspmG3QP/pJK03FWuHf9XOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696404; c=relaxed/simple;
	bh=apqALf2mZvnFPwFAMX3pLXqSOd6RTvU3jT7r+/TFQCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT6i8CBvFiCh0Ehl2o9L4X9RzQO1sMxHHk3b1hhHygqqOLSCZ82pMza0s1//OQG1s9y7fJrJAxSiDKajRvJ+Lzu0kefyERWp2qKhs1NU7CEiOvypnUx8EiisPaTF74N75T9sS0/ZiewB3zfjtrjjYjTT63RPAavDZfhyWHm/mSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COY+I1LN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COY+I1LN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769696404; x=1801232404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=apqALf2mZvnFPwFAMX3pLXqSOd6RTvU3jT7r+/TFQCQ=;
  b=COY+I1LN/5i3LdC7YO1hmlFv5Ltx+PoDkdyLfwZth3PfSylc0HHigq0/
   4KpVsnmDQ9Ik2W8tpTssXe0NmFvHTwHUmFoiIgFek6M4Ky6tjTzCD3tQP
   05HlInzZrfuHsA2ttcFYCfTkIrEVsOQAlCTQstjFi9McHsqsb2hW9weba
   m/8Hs5YRROXRGK3dQH9mn8AZLMulICeqw4E6enBnxgI0GQZbaj5DKJcW7
   ajK3twchq3wmtp9cSorMesZNakDq1xYBmBNBZgFHJBS7IrRpAuSU+wzuo
   1mkgJO+IK1qKHwplkFQ7UikmYXYfdu16NUDqMt3YGX3rKdf+TMs4iBOr7
   A==;
X-CSE-ConnectionGUID: wZMlXKXaSGS/lykghRZwRg==
X-CSE-MsgGUID: +2UN8s3VQie3tlTib20Q6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70831098"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="70831098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 06:20:03 -0800
X-CSE-ConnectionGUID: +fIWDTCtRX+Rd9/3zT4Q+Q==
X-CSE-MsgGUID: cHu1RMjnT+SWuLKUdUN45Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208829978"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jan 2026 06:19:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlSsE-00000000bXM-42xH;
	Thu, 29 Jan 2026 14:19:54 +0000
Date: Thu, 29 Jan 2026 22:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org,
	harry.wentland@amd.com, uma.shankar@intel.com,
	louis.chauvet@bootlin.com, naveen1.kumar@intel.com,
	ramya.krishna.yella@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Arun R Murthy <arun.r.murthy@intel.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v8 2/7] drm/atomic: Add error_code element in atomic_state
Message-ID: <202601292223.hq35FrBc-lkp@intel.com>
References: <20260129-atomic-v8-2-4cb7b0faa051@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-atomic-v8-2-4cb7b0faa051@intel.com>

Hi Arun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a3c9a03d943eb112c916c7419a837bc7de3a296]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-Define-user-readable-error-codes-for-atomic-ioctl/20260129-170325
base:   6a3c9a03d943eb112c916c7419a837bc7de3a296
patch link:    https://lore.kernel.org/r/20260129-atomic-v8-2-4cb7b0faa051%40intel.com
patch subject: [PATCH v8 2/7] drm/atomic: Add error_code element in atomic_state
config: hexagon-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260129/202601292223.hq35FrBc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601292223.hq35FrBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601292223.hq35FrBc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_atomic.c:2119 function parameter 'format' not described in 'drm_mode_atomic_add_error_msg'
>> Warning: drivers/gpu/drm/drm_atomic.c:2119 function parameter 'format' not described in 'drm_mode_atomic_add_error_msg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
