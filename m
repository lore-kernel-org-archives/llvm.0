Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60F1D5154;
	Mon, 24 Nov 2025 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763972878; cv=none; b=lGu6ZUph30ufxJ+YmQm8DmuAnDztRhKXMS3VSpnedJgUyNKjw4ySG9/IsBBsg/eM/s8XxCgw7Cqy3q1Fy7AtHayds8ycY1Tr/3KFpZDPjoM481VRsVJ0zVEUDq0VSwSZZumjKdije9fZRI2ZUPs+t1PpoLm9lOBe51JCS3+j3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763972878; c=relaxed/simple;
	bh=xRG4t4eEnDZ8Y5Lv5GHg9KMatGlfUd5zhnpFVcA3Xso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGIuXFax2kB9B/2o8gjcpzrP3xmJxRndxNWzLFJICOvuMnyh/3wdhjm/l/DMrr6ishHghiaYfbuJ/xZ+S7gXnBTBBHSrVRFCJ9+k8ZYgGK9qnaVktD9JKLyEFiVDqMsLzfzOLbBNCrLF0WRWtTseuRjzKtNl9MSzBtm9NZE2rqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnLzcKJT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnLzcKJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763972877; x=1795508877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xRG4t4eEnDZ8Y5Lv5GHg9KMatGlfUd5zhnpFVcA3Xso=;
  b=OnLzcKJTfM2mzZSoHNHtJnE9jsY1KlUkWycdNzSZcXZNloPhquJMyf8M
   OeNUITlZUkIaim/ss4JSlGBzBs5anYUSG7+qmoM45nhxqEht21x6pZH/1
   eBD7R894WGwQWBUlzMl5cqLRdgdw1wC2qZadzYb9qP9HyyDciT1pA9ItA
   icQFpsxhTrijAA63b3Oy1fAgYnGVMgCqDf6gArUHQTQiu9nIPpygaH+KD
   +VANFLkFa4kzef+IljPruhiWa7RqU46yrWriMvQ9i+bJXVT7PYOgY4u7j
   qVnYDlZ+jsHfJbo3Lmc2qSsjSao3aIHucnS1GYes4A3TK2JzNY7oyJYsk
   Q==;
X-CSE-ConnectionGUID: MpvBpVZ3Qjiz1/c5AHKASw==
X-CSE-MsgGUID: RyqahnPyT4+KahPfHMo8NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65996224"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65996224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 00:27:56 -0800
X-CSE-ConnectionGUID: /obRCkK6Rh67VxEPSyC4ew==
X-CSE-MsgGUID: p3bdAIJmQ/q5ICmSET1XGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="215619003"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2025 00:27:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNRvL-000000000Wb-3KTr;
	Mon, 24 Nov 2025 08:27:51 +0000
Date: Mon, 24 Nov 2025 16:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eslam Khafagy <eslam.medhat1993@gmail.com>, linus.walleij@linaro.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Eslam Khafagy <eslam.medhat1993@gmail.com>
Subject: Re: [PATCH RESEND] drm: pl111: replace dev_* print functions with
 drm_* variants
Message-ID: <202511241619.k8AiBZLh-lkp@intel.com>
References: <20251122004951.567753-1-eslam.medhat1993@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122004951.567753-1-eslam.medhat1993@gmail.com>

Hi Eslam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.18-rc7 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eslam-Khafagy/drm-pl111-replace-dev_-print-functions-with-drm_-variants/20251122-085225
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251122004951.567753-1-eslam.medhat1993%40gmail.com
patch subject: [PATCH RESEND] drm: pl111: replace dev_* print functions with drm_* variants
config: arm-nhk8815_defconfig (https://download.01.org/0day-ci/archive/20251124/202511241619.k8AiBZLh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241619.k8AiBZLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241619.k8AiBZLh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/pl111/pl111_nomadik.c:7:
>> drivers/gpu/drm/pl111/pl111_nomadik.h:11:32: warning: declaration of 'struct drm_device' will not be visible outside of this function [-Wvisibility]
      11 | void pl111_nomadik_init(struct drm_device *dev);
         |                                ^
>> drivers/gpu/drm/pl111/pl111_nomadik.c:12:32: warning: declaration of 'struct drm_device' will not be visible outside of this function [-Wvisibility]
      12 | void pl111_nomadik_init(struct drm_device *dev)
         |                                ^
   drivers/gpu/drm/pl111/pl111_nomadik.c:12:6: error: conflicting types for 'pl111_nomadik_init'
      12 | void pl111_nomadik_init(struct drm_device *dev)
         |      ^
   drivers/gpu/drm/pl111/pl111_nomadik.h:11:6: note: previous declaration is here
      11 | void pl111_nomadik_init(struct drm_device *dev);
         |      ^
   drivers/gpu/drm/pl111/pl111_nomadik.c:34:2: error: call to undeclared function 'drm_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      34 |         drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");
         |         ^
   2 warnings and 2 errors generated.


vim +11 drivers/gpu/drm/pl111/pl111_nomadik.h

    10	
  > 11	void pl111_nomadik_init(struct drm_device *dev);
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
