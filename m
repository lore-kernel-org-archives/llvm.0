Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969B20E70A;
	Fri,  7 Mar 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741342866; cv=none; b=Xna6o1cLKDETQBBoZkdDKeMLmt0pxXQQ5j7HTBkX9SszsAZAQ7fWfYUqtHLvlQ0jMpjRnHKnDu3hedCtH3QpeQQIzPbeLjs6aX9ZiqhgLqygXctc1hL3WS+1Dqm0vi6ZKjDFEtoP6ZuNn3SuqxHI5sK/Ly+avTEBRjHgrW3Y48s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741342866; c=relaxed/simple;
	bh=ks1DIiAppib2gO/lUd+uSaXzTjjmz0yIKA/deSCHnus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fF8WKu4Q0mf+2RScvDh18+94N0mHMg80EELIRscZ1qlMI48/hOslQHag6zKVW9Ra6fcAx7OkuY9M6fN6Rgq157UTa0USg/wjaMeq3p0YntpUzew2cixeNLw+E7Vu7M8R5Lux4Gb9Z7oC2WGzpfgvbzevv00Tep66a8se0IAn0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drUwjQtX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drUwjQtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741342865; x=1772878865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ks1DIiAppib2gO/lUd+uSaXzTjjmz0yIKA/deSCHnus=;
  b=drUwjQtXNsmvlVwbjYuvd73JZAiKGLALTsufZnRhgTr3a2qq44sLF4wV
   Fl5+yh619RKjvY7F8hYnf8P85AajiwIrlD6noh+i47o+dSkJcCY2R36Qf
   upsBhmzdCdJRQ1QhDkxKbtPtvvyQTAPXaJL9lUoYsy5isZv4OanER1D6k
   aTIPxcVr7/CUXJqdA/mL3BwNs3ygwHXPuyQf+kiViXy/F3LMqgdk9v8bz
   kuN3wNg/j2nQSqRUE67mQGUVS8U3OksvQAa5X/HOr5hLTPSw+FWP3wixl
   uWm+J3LLzMwexrL2wvn63Yj9FxfklxoF5+BLeSQoNYQVndQUbmpPBjVZO
   A==;
X-CSE-ConnectionGUID: 40nU1EGoQFSX6d0Fl3agtQ==
X-CSE-MsgGUID: +Bm1yOF7QCicnRDQtGJYVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59944690"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="59944690"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:21:03 -0800
X-CSE-ConnectionGUID: 8ep++u0xS32CgtFmscy6Pw==
X-CSE-MsgGUID: U0yBoFW0QpiIJ6uBOAFXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119810933"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2025 02:21:02 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqUp9-0000ID-0g;
	Fri, 07 Mar 2025 10:20:59 +0000
Date: Fri, 7 Mar 2025 18:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: Support YUV formats on writeback for DPU
 5.x+
Message-ID: <202503071857.oZbQsPaE-lkp@intel.com>
References: <20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c@quicinc.com>

Hi Jessica,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6d3175a72cc07e90f81fb35841048a8a9b5134cb]

url:    https://github.com/intel-lab-lkp/linux/commits/Jessica-Zhang/drm-msm-dpu-Support-YUV-formats-on-writeback-for-DPU-5-x/20250306-111647
base:   6d3175a72cc07e90f81fb35841048a8a9b5134cb
patch link:    https://lore.kernel.org/r/20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c%40quicinc.com
patch subject: [PATCH] drm/msm/dpu: Support YUV formats on writeback for DPU 5.x+
config: arm-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071857.oZbQsPaE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071857.oZbQsPaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071857.oZbQsPaE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:235:18: warning: unused variable 'wb2_formats_rgb' [-Wunused-const-variable]
     235 | static const u32 wb2_formats_rgb[] = {
         |                  ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/wb2_formats_rgb +235 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

dabfdd89eaa9283 Vinod Polimera 2022-04-11  234  
8c16b988ba2d3df Abhinav Kumar  2023-12-12 @235  static const u32 wb2_formats_rgb[] = {
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  236  	DRM_FORMAT_RGB565,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  237  	DRM_FORMAT_BGR565,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  238  	DRM_FORMAT_RGB888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  239  	DRM_FORMAT_ARGB8888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  240  	DRM_FORMAT_RGBA8888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  241  	DRM_FORMAT_ABGR8888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  242  	DRM_FORMAT_XRGB8888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  243  	DRM_FORMAT_RGBX8888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  244  	DRM_FORMAT_XBGR8888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  245  	DRM_FORMAT_ARGB1555,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  246  	DRM_FORMAT_RGBA5551,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  247  	DRM_FORMAT_XRGB1555,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  248  	DRM_FORMAT_RGBX5551,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  249  	DRM_FORMAT_ARGB4444,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  250  	DRM_FORMAT_RGBA4444,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  251  	DRM_FORMAT_RGBX4444,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  252  	DRM_FORMAT_XRGB4444,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  253  	DRM_FORMAT_BGR888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  254  	DRM_FORMAT_BGRA8888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  255  	DRM_FORMAT_BGRX8888,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  256  	DRM_FORMAT_ABGR1555,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  257  	DRM_FORMAT_BGRA5551,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  258  	DRM_FORMAT_XBGR1555,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  259  	DRM_FORMAT_BGRX5551,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  260  	DRM_FORMAT_ABGR4444,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  261  	DRM_FORMAT_BGRA4444,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  262  	DRM_FORMAT_BGRX4444,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  263  	DRM_FORMAT_XBGR4444,
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  264  };
53324b99bd7b4d6 Abhinav Kumar  2022-04-26  265  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
