Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B764535E941;
	Fri, 20 Mar 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998795; cv=none; b=l6zb/sPxr0A5pZOppVlB93FT58LuBnPxNU+kl2Xb5rTof+3+GZxBvQFblmYl10dvboxexW6m2Hk6aSJjWdtUET7R/za7Ye2Wa22Fy6XgTQz33IY8S/5GE46g64Nqrd84zz5s68F6SEzaDwjVByiNA4R3ffFsuEcp40y+fj5wNCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998795; c=relaxed/simple;
	bh=DOGaCuBCTRkz1PBAmYE+qDUnukQ0pca3NhU408CcktE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uv4/GKICoxJyx3qeLmnUSSM4EVJ7SGamkk8Ca/50f6Bu6+5q5hSxMjsbtHMXLO2BIvn0XEOPGPWANJVWm8h8fRZqXyPFXOhMii6cKO//REqmVjznnLmcduRLV8VYp00b8XtaRK4No5pCQ9KDSa64T4zCad8l0qitJ93sueKkuWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lE7vjFKL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lE7vjFKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773998795; x=1805534795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DOGaCuBCTRkz1PBAmYE+qDUnukQ0pca3NhU408CcktE=;
  b=lE7vjFKLo3fnUv+L7/SPtCF62vh6NZf2Rx65mOfV4W5+FCspx6U8Jhgq
   DLYjrIMKIAjd9KWWQckSW7WVQOYWGAL/Z+rThZimXVTj4sPbjewVRfmtj
   kEwFejGbjxVCSXOb82gr6YupadYvwhbhJVSkS2UAv7q3g9RqQqOjdVQrX
   j2IQ3QN3kj/2Ak74agmv82PuEYgiGE3Otz5xXDUUnVbU2aJ3z8TnoiL8b
   hSRoMW6y8fOf0Ub5MHHBEXsJlafVUZYkEZazOSNa2IIwLKWhGbr8HyiW6
   ZRNftFSFMDHTgf7aHqKa+8DQrRb2piolsrO0YmhpRyRAjjWtihWuynXfg
   A==;
X-CSE-ConnectionGUID: JL4sDvUoRGaCXzCP4BAjTA==
X-CSE-MsgGUID: S7qcvwpsRCCg96ONs4ri5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85782600"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="85782600"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:26:34 -0700
X-CSE-ConnectionGUID: 6CMDdqN/R2qCbE52BuaMXA==
X-CSE-MsgGUID: AWRO+khYT12j2nQa9yZPfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228171443"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2026 02:26:29 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3W63-000000002Cd-33yE;
	Fri, 20 Mar 2026 09:25:07 +0000
Date: Fri, 20 Mar 2026 17:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Koskovich <akoskovich@pm.me>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel
 format
Message-ID: <202603201719.MxZJCZoY-lkp@intel.com>
References: <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me>

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/drm-msm-dsi-rename-MSM8998-DSI-version-from-V2_2_0-to-V2_0_0/20260320-011528
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260319-dsi-rgb101010-support-v3-3-85b99df2d090%40pm.me
patch subject: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel format
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603201719.MxZJCZoY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201719.MxZJCZoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201719.MxZJCZoY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dsi/dsi_host.c:760:7: error: use of undeclared identifier 'MIPI_DSI_FMT_RGB101010'
     760 |         case MIPI_DSI_FMT_RGB101010:    return VID_DST_FORMAT_RGB101010;
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dsi/dsi_host.c:773:7: error: use of undeclared identifier 'MIPI_DSI_FMT_RGB101010'
     773 |         case MIPI_DSI_FMT_RGB101010:    return CMD_DST_FORMAT_RGB101010;
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dsi/dsi_host.c:1710:21: error: use of undeclared identifier 'MIPI_DSI_FMT_RGB101010'
    1710 |         if (dsi->format == MIPI_DSI_FMT_RGB101010 &&
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/MIPI_DSI_FMT_RGB101010 +760 drivers/gpu/drm/msm/dsi/dsi_host.c

   755	
   756	static inline enum dsi_vid_dst_format
   757	dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
   758	{
   759		switch (mipi_fmt) {
 > 760		case MIPI_DSI_FMT_RGB101010:	return VID_DST_FORMAT_RGB101010;
   761		case MIPI_DSI_FMT_RGB888:	return VID_DST_FORMAT_RGB888;
   762		case MIPI_DSI_FMT_RGB666:	return VID_DST_FORMAT_RGB666_LOOSE;
   763		case MIPI_DSI_FMT_RGB666_PACKED:	return VID_DST_FORMAT_RGB666;
   764		case MIPI_DSI_FMT_RGB565:	return VID_DST_FORMAT_RGB565;
   765		default:			return VID_DST_FORMAT_RGB888;
   766		}
   767	}
   768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
