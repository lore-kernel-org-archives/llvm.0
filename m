Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352594;
	b=HvwX/XHRYIATkjZTCBLBoGcy7h97w32GqAtu+g8jy2LXXn4uXCyImb3hgDuWuTgYT7P6
	 hKijbWaqbZzs7A+njHFzNVpX5JGAXVN+xdgQRITBq4hn6nIv3sF+a/YRDOF0lEZ7HjQ/p
	 OMIQ8EWvSM4D+qRWLv/cBAL5LCrprjee3ZrdiqrmNTaOTVjRyinT+KrKLj143y7Sa54BU
	 46j59Rwpf9EmLgZkbo6FFwwHDZ7GxZAyidEVQ5iNSAbeoQGYWOJBt+hRG3JEL1PUXGJml
	 gbFMlvnJczgnapQYRXrsmIFhJsSsSbTgcDaIxy64VyPC4Dqa3zx8gxto8ULPszebqWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352594;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9dTvHmvExgXL4658zs3vpBdkxj2etJxtu77jFSpqQsE=;
	b=AYwHZx0gaDeMO9LL7UPk+6BC91y9d0Mtd/2ml87Xd74Vfhuf1mttwBZ/MbhU5kWZhysK
	 yopWg/SGgb2y1V4Y9KXpwuaEcdSYgLiJtwrGGIXkNzXL6HbpFCh07ETvR5fDCRFP8R2/F
	 pcKBv06jN4daDdgI5NCcCLXkIitCkIZcqr/+Fvwh0IaY7Ya+PECoVBQuKSbVzhNm/loX4
	 B/BfKi745j35E1fUhL9bNDv/maz/50BdJiXcmmurIeLp5vqeVPN3nls35vBv93nxF50TH
	 VD4ohxXsmNKO4t4rkAQK/1ijTZ8BxPUwFZT73AWkHD9FJFhPX5YUeSl8FsvTTHfc0hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WRkrYC65;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC3D606A329;
	Fri, 30 Oct 2026 09:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC3D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WRkrYC65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352593; x=1824888593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EMqMfThf7wBi+xqcGlz73yvEPZiRd9YLlzGUba045ok=;
  b=WRkrYC651dLVGtKe/aTgbLwcxQ4FfFDLdZ5D/0JsAWUC2RN+yK+kKEYl
   sND20Jfl+//hrdR9/Vi/CsXidyCGPbrnGCMZ6k3LjIIoTeANCZ6PoEpt+
   18QL5hJx/kxKdDwuu3ySHAC1IVyzOdbOfi1T5TvD/TlAAZOEhyYIwwlDz
   kdpGRxjXYZxot69op3IC6AN6ZQeHfGPXg8owd/dIIuDwB75iQm1uY6hqo
   8VG7gASkxAyY1aW3MBOfdKfyO0VUVycBl2qyLr9nSiAgAMmlXL9UbM3yP
   H9QA1Aw4zwHJuQkqeX1lbR8qsiztEkhojsFqe6hb7dfQKKYf4vSDnbj3x
   w==;
X-CSE-ConnectionGUID: u2W4TjwyTIqKfmf2mPU+2g==
X-CSE-MsgGUID: pRyRXg7DSOCn678f/K7IHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2126338"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2126338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:29:52 -0700
X-CSE-ConnectionGUID: A1XjQrnCRSGV8+6OT8/tjQ==
X-CSE-MsgGUID: G8pzq4FHSjeDHRV7HzC5bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5517732"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2026 02:29:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMivh-00000000bXI-1r9z;
	Fri, 30 Oct 2026 09:29:45 +0000
Date: Fri, 30 Oct 2026 17:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: vop2: Use
 drm_format_info_min_pitch() for plane offsets
Message-ID: <202610301711.Dm8BmGiV-lkp@intel.com>
References: <20261029081429.862-2-kernel@airkyi.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029081429.862-2-kernel@airkyi.com>

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on rockchip/for-next linus/master v7.3 next-20261029]
[cannot apply to linux-review/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261022-151735]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261029-161427
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261029081429.862-2-kernel%40airkyi.com
patch subject: [PATCH v2 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
config: hexagon-randconfig-1001-20261030 (https://download.01.org/0day-ci/archive/20261030/202610301711.Dm8BmGiV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301711.Dm8BmGiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301711.Dm8BmGiV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/rockchip/rockchipdrm.ko: symbol '__hexagon_udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
