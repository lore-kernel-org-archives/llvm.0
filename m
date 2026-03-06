Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDED03E51EB;
	Fri,  6 Mar 2026 15:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811058; cv=none; b=PnDmfWp+40phSFBfGjVHNCSV1kdvvc9/oyoROr8zO48i37WjemdbRXidmkUQrZqznnYLNKbC8IfEAwrVGSN0ei6Oq9sqn7dRCyMSDnEzFLxlET3DYd91GqIywQR58f92edL99KuDgUaxCiyRoJGpNHh0aGlZ42PgusGZudr3bOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811058; c=relaxed/simple;
	bh=8lxmlK6AYxRX7yFX7wAaCvq0IgMBws1u+vOIphLnFA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t4P4t05SZmAOnS7L55aARZGAP37VGf9OM6+2MQXdc8b3KjS171UeQ6A18qsAJbxcNJVzbZmmBu6gLcbkwpGLxcsV/LY9RIg0fCOKIOPLnW509+A5lHTxPa/JCxeRyYfONYowsOeq4RFqT+TUi/48V9n1Yctt/Hm8ImrT9OJIJp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+OG938N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+OG938N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772811056; x=1804347056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8lxmlK6AYxRX7yFX7wAaCvq0IgMBws1u+vOIphLnFA0=;
  b=M+OG938NQ92tl7N7rRMX/yPohWyT/WT5dqNDzWwsAmhOSI39GxRYtpYi
   JiE9CUCpBGA+ulTKXQgpF1uROB7BQ4t2JXnFbNlklcCY+E1BFxCo09lQe
   j7pbPaSAkWWWUKU++WVlbTbPsExXziPBUxis2Exf6quaRfL5kKcbAxQ5V
   yGILnhmyGJcZpOxF8X/LpXNeXxYVwjnSsyCi0XpekC+oP+0fn9RAZoJEb
   ihKGa13OXirC3L9gX0zvYoRrfHoy0MMvw6EqaYyiIfKgqv968UrLn3UTu
   AqUv4vJO1gXX1PX8Mqdw8weqeC0tlDzQBQ8G48kuXpPAfyR2IJyaVouxt
   g==;
X-CSE-ConnectionGUID: cgWY81LBRbacD2mgjDG7YA==
X-CSE-MsgGUID: d4ZKEm5WSlKYlBqId78BoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84246800"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84246800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:30:54 -0800
X-CSE-ConnectionGUID: 1FAcP4TXTwWReweVDVsJqw==
X-CSE-MsgGUID: AifhLTFkT0CtQOrD8uJqww==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2026 07:30:51 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyX8a-000000000zR-2uw3;
	Fri, 06 Mar 2026 15:30:48 +0000
Date: Fri, 06 Mar 2026 23:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [linux-next:master 1634/4342] ld.lld: error: undefined
 symbol: intel_fbdev_fb_prefer_stolen
Message-ID: <202603062335.M3WYGAjN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f9cd19e764b782706dbaacc69e502099cb014ba
commit: 94c7d286129268ead0fb76d684fe4363d57da415 [1634/4342] drm/i915/fbdev: Extract intel_fbdev_fb_prefer_stolen()
config: i386-buildonly-randconfig-003-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062335.M3WYGAjN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062335.M3WYGAjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062335.M3WYGAjN-lkp@intel.com/

Note: the linux-next/master HEAD 3f9cd19e764b782706dbaacc69e502099cb014ba builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: intel_fbdev_fb_prefer_stolen
   >>> referenced by i915_initial_plane.c:120 (drivers/gpu/drm/i915/i915_initial_plane.c:120)
   >>>               drivers/gpu/drm/i915/i915_initial_plane.o:(i915_alloc_initial_plane_obj) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
