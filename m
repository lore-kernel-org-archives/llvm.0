Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3911833E345;
	Sun, 18 Oct 2026 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792308523; cv=none; b=F6THKCcLxTOTZppWgwdDImVvaJmCZeDvRvd1DxF6eQ8fplQEFBPjdsd+PkDfRk9V1QRQF3e+NuAPM6uSlGxnJv5VyHljkc/Tf5WUoWNX5BlXMvs9oWpJGiXrHyDlGFkVGMGvmhbgnaVUB8fn5ukrqU5gSwBL8RApsWVfSCZ1htw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792308523; c=relaxed/simple;
	bh=PBzsd+WxPK0feIG0VW0gXD1GCtK5KrwzVBZEs/eklZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SWWyXopIqQab+lAH2n8bYefLOWof0++LYk5MP4Y6wy2I5Lu6uMH75Wxwppa6OC272JRNucFi5dFa52gfj4NWa767++icCx02KPspvFsc/9RcmAd3M61oVepyA3i3b4Ma+ewKWQwoCGRO81wXjM7RkY2/4SdXaY4OGuLxiS3TIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxuVi1ad; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxuVi1ad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792308522; x=1823844522;
  h=date:from:to:cc:subject:message-id;
  bh=PBzsd+WxPK0feIG0VW0gXD1GCtK5KrwzVBZEs/eklZU=;
  b=NxuVi1adRTiVyyJAXflltNuPUd2bp8PNv1XARMCcfnw+8JV9mhTpdvNz
   Od2DSMWFOrw8t7EYttkm+tCkuZ6zp0dWlpyzclxsu23fOO7vrtnzSrHVX
   jEchflHnSPBA2LtavF7EbZk7A43izetKPqPR+UCoIOXiYC+UiOnl1au/q
   sAGXQOSB91OMDYvM4y4hDwBiqRwCvcgHYHGA0gYg+GkWWpJ8YW6h1A8hT
   ASXPU4Mqs3/IY1YjwCHc3wqY2e1Vt8KoJDKaHkboRpTKnwuNuQI2xtc07
   u9Oz9Eb2dQ/Cwv9+Q9cYyOTinHbWpoV195d+xEXEJK67mhyq8wTNefR2M
   w==;
X-CSE-ConnectionGUID: MqRowx02Sx6MoHHNZgcgpQ==
X-CSE-MsgGUID: ka8Qy84OQC+QgGiAxvumnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1034710"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="1034710"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:28:41 -0700
X-CSE-ConnectionGUID: ITJNLYFoTGmFz8Nb1NuejQ==
X-CSE-MsgGUID: PHB04GIhRxCFwa0/BkszBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2269089"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Oct 2026 00:28:40 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILJt-00000000KEs-11kO;
	Sun, 18 Oct 2026 07:28:37 +0000
Date: Sun, 18 Oct 2026 15:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 191/212] Warning:
 drivers/gpu/drm/apple/dcp.c:108 function parameter 'crtc' not described in
 'dcp_crtc_send_page_flip_event'
Message-ID: <202610181511.ARA2vk1E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   172fa9c2711c66d7ecd3c0c5232d86fc6de767cb
commit: 9233982e054bb36f08099524906b6b5b664d350d [191/212] fixup! drm: apple: Add CRTC CRC support
config: arm64-randconfig-1003-20261018 (https://download.01.org/0day-ci/archive/20261018/202610181511.ARA2vk1E-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181511.ARA2vk1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181511.ARA2vk1E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
