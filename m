Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E21F5437;
	Wed, 29 Apr 2026 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777499219; cv=none; b=Q0i5U3aDYo9I6Sfg8zA0/gJRdCB8wh0f3y5CMp8wy/I1/UCbduyiPKFIknEfIA5r36zrajSB+nBY887qAIs4vNc7bbgWJNDeSWtPxAPn1xflDQB7z/5eYCLi48f1/mEZulXpafxbE7VrIdQ2efcRWHX5DdOkZC675r4KAysf6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777499219; c=relaxed/simple;
	bh=71tGufHLVIhR0fNvIFCqJV7iDKZTxt3CByNLikQkMms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXEIE0eZ5V13lt0g0ibInTeVUb57KZcSMvQYo5vYYJr7z944XEW1tqGcg/Wxd24sCBaQtX/6M/toLcz75yrp7f20ziUzVaw5HS2RHmP+Pnz7DLvq04fg0dzLleEMTT/vM+8HZijJ9ZXrSkQzm9hH5l7SD3AWK6GV26wLOmfPw3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NO1uwm4r; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NO1uwm4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777499218; x=1809035218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=71tGufHLVIhR0fNvIFCqJV7iDKZTxt3CByNLikQkMms=;
  b=NO1uwm4rH1CUHbQLjhKtr811nP0Sdd6uUorJktX2rctx89fOUvwQRiKI
   AK3Lk0sPpprX+TMiaj+lNMuL1JU+L5SyUdTYZHh2Qnh7uAjW5AKk3uNq5
   bjBg3A4X+MiY0ZwrX4NmXCSwrFynErMV5U+nvvejUaOUiW0YzRwNfrUxl
   5kjiELQ113hiEyETiDLQU9MCFvaXQMa77lUNlWQ1ziy9Ro3f7fdHkxO/R
   wgL62rvzpFqv4gJ0FljzEIOWD08M/sMhj8QqTbe0vf0inRfILafyB8E++
   C9wbC4tpdyV8oXZP9+JF4/U2nfk/Si6QdgHC8/Gb0bLrC9iUUtXp4HPyy
   g==;
X-CSE-ConnectionGUID: I7wPenLmS3qInTZ8IhhTKQ==
X-CSE-MsgGUID: QoTBllHpSSWxVVwi18LIzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77605821"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="77605821"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:46:58 -0700
X-CSE-ConnectionGUID: +s3H4it+QXiQB+LfIGOC2Q==
X-CSE-MsgGUID: 8kWWS6+1QTWaDfj6KbDk9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="272509355"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2026 14:46:55 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wICk8-00000000BZU-0a6Q;
	Wed, 29 Apr 2026 21:46:52 +0000
Date: Thu, 30 Apr 2026 05:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Evgenii Burenchev <evg28bur@yandex.ru>, stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Evgenii Burenchev <evg28bur@yandex.ru>, alexander.deucher@amd.com,
	christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/radeon/rs780: prevent division by zero in refresh
 rate calculation
Message-ID: <202604300508.yXci8rey-lkp@intel.com>
References: <20260428190318.34413-1-evg28bur@yandex.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428190318.34413-1-evg28bur@yandex.ru>

Hi Evgenii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evgenii-Burenchev/drm-radeon-rs780-prevent-division-by-zero-in-refresh-rate-calculation/20260429-055830
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260428190318.34413-1-evg28bur%40yandex.ru
patch subject: [PATCH] drm/radeon/rs780: prevent division by zero in refresh rate calculation
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260430/202604300508.yXci8rey-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300508.yXci8rey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300508.yXci8rey-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/rs780_dpm.c:68:5: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
      68 |                                 if (pi->refresh_rate == 0)
         |                                 ^
   drivers/gpu/drm/radeon/rs780_dpm.c:66:4: note: previous statement is here
      66 |                         if (crtc->mode.htotal && crtc->mode.vtotal)
         |                         ^
   1 warning generated.


vim +/if +68 drivers/gpu/drm/radeon/rs780_dpm.c

    48	
    49	static void rs780_get_pm_mode_parameters(struct radeon_device *rdev)
    50	{
    51		struct igp_power_info *pi = rs780_get_pi(rdev);
    52		struct radeon_mode_info *minfo = &rdev->mode_info;
    53		struct drm_crtc *crtc;
    54		struct radeon_crtc *radeon_crtc;
    55		int i;
    56	
    57		/* defaults */
    58		pi->crtc_id = 0;
    59		pi->refresh_rate = 60;
    60	
    61		for (i = 0; i < rdev->num_crtc; i++) {
    62			crtc = (struct drm_crtc *)minfo->crtcs[i];
    63			if (crtc && crtc->enabled) {
    64				radeon_crtc = to_radeon_crtc(crtc);
    65				pi->crtc_id = radeon_crtc->crtc_id;
    66				if (crtc->mode.htotal && crtc->mode.vtotal)
    67					pi->refresh_rate = drm_mode_vrefresh(&crtc->mode);
  > 68					if (pi->refresh_rate == 0)
    69						pi->refresh_rate = 60;
    70				break;
    71			}
    72		}
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
