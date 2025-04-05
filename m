Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A53596A;
	Sat,  5 Apr 2025 02:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743818559; cv=none; b=WVfBTMNYZsiVCsw0j8zAP0WRXrhjygZXCXNAbG/t9IXYkmKFyqUaqWmf9KZl3cZ+g+T4s31+5DR4xRTmarUOBCOxn2VM44kJAdNCZu2oXRZRmPt1sqYD58O37+fzA+phdT+0IBpqe55+TyclL/4wZIYrBN51qMii5FcyUd5rc8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743818559; c=relaxed/simple;
	bh=giulut+PrxF/O0P30CwxI5j9ksQr3ldBC5eDinXEP3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBFzUeU1UiFSdgL5o8TVcQDpkO4e2CwWXNDVYHPKXPRaMirBAgB1IO255doOoH5koaLl8vs3Vzbrc9SqQ0HjakIxFIpdI7NM8GdC/YGEb71WoJWCEKvF6r8eVJ8Ympa5hNTmsEd8r+TIZStqWQt2gl6B4rB237ga1llQGzATCd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiC+DuPF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiC+DuPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743818558; x=1775354558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=giulut+PrxF/O0P30CwxI5j9ksQr3ldBC5eDinXEP3c=;
  b=UiC+DuPFWfKd4pSrHV+OvawOjZH4S3VLLk098tmqwyZGYO6veV5Bdp38
   LwSye41LSNzk4hrcnKY4jqtlFzFhHbNtcv0iPR+JVk6v2XPe8s0mxWTq2
   e6lzhIVqMP6Zw3VK+bEVWUtest0VHxnOSnJHwl2rB79HThfC+KDVfRpr/
   slXQ5ZtKmwCRmqDrxxOqWGZdqQx+T5cdSdQu+wM+hQRLV2QXvNWMkMlue
   aT4QEumItShl6wehpdAGwBqyM/tW5zDeW0n8NJTrNhdZgElhIrWXkbkx3
   x/HtPLOJhus+X5rOFKcEfeBcdkq3KuzTGWXfZaavi8aVi4nNbdxv9JKq3
   g==;
X-CSE-ConnectionGUID: 89F4yrA0S1CQ2eZ3qDYZvg==
X-CSE-MsgGUID: CdIVfQK6Qf+WELa7qBtesw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49064544"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="49064544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 19:02:34 -0700
X-CSE-ConnectionGUID: phdwfIJuQnmfaBYBelhYdw==
X-CSE-MsgGUID: RtJF8pFtRCWo8Pibg7DFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="127954061"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Apr 2025 19:02:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0srZ-0001jY-2G;
	Sat, 05 Apr 2025 02:02:25 +0000
Date: Sat, 5 Apr 2025 10:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Robert Chiras <robert.chiras@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Markuss Broks <markuss.broks@gmail.com>,
	Artur Weber <aweber.kernel@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
Subject: Re: [PATCH 41/46] panel/widechips-ws2401: Use refcounted allocation
 in place of devm_kzalloc()
Message-ID: <202504050913.gq6yJY4f-lkp@intel.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e@redhat.com>

Hi Anusha,

kernel test robot noticed the following build errors:

[auto build test ERROR on de04bb0089a96cc00d13b12cbf66a088befe3057]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/panel-orisetech-otm8009a-Use-refcounted-allocation-in-place-of-devm_kzalloc/20250404-052751
base:   de04bb0089a96cc00d13b12cbf66a088befe3057
patch link:    https://lore.kernel.org/r/20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e%40redhat.com
patch subject: [PATCH 41/46] panel/widechips-ws2401: Use refcounted allocation in place of devm_kzalloc()
config: x86_64-buildonly-randconfig-004-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050913.gq6yJY4f-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050913.gq6yJY4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050913.gq6yJY4f-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__devm_drm_panel_alloc" [drivers/gpu/drm/panel/panel-widechips-ws2401.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
