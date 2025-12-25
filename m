Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51410311956;
	Thu, 25 Dec 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766671600; cv=none; b=elTzu47ou9gMI9772I0YH+ohkXqWXW+s4VgV/xIhi3PpSydKBkik92zFiQN2IyIymBVgoP83IkEKKLstEHui1m2TmvU3lycM2DoK39X+RF5f7za6crDg6vXgEYJfKj1d4EacwfZw1+rqc31mncKL9derIhdCS7bcDoPPLHARqg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766671600; c=relaxed/simple;
	bh=TDyq3nI6wfVGkndHQQmQuxwyGpYlsFvvSnFFiPYfdB8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y7EuKF1T/JS8hk+Gzy1lSyrH/ZJFnze3pCXMSul4WplRbT08OaAUJpRmyUMftU8TNnp6KGxvzumFU5KN4qd7Dc3BfC50eNTMXub2fDmY+1TYa4oBHiGFW6KoEaeniUt266ocVDCH3XWFaZCtbToWh2QqSS6ITJG3V+PefdRR1Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meu/yPFa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meu/yPFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766671599; x=1798207599;
  h=date:from:to:cc:subject:message-id;
  bh=TDyq3nI6wfVGkndHQQmQuxwyGpYlsFvvSnFFiPYfdB8=;
  b=meu/yPFaQVwDO7SLCfN55xEt2UKPCK/ydxw7bPUyWnOAEAYeJGWhOZrC
   7CYWWGnB7d3DVZeqcH8N7tCz3cml1uHG2p21IP8X02pmgAhw/OXYokai6
   IXTKkucY6oX0Pfv51T16GLljDMoQAvkMk1zSgp/rOPe+8LIwkInyw/Cf0
   zGSDdE7iROYjcfPn6wibHu2+gRcPrdnR/0AGceET5c1jvaxjFxHF1Gqkv
   kbZUUixt88EIVcL1pn1a1E93ryFgQ2mVoRHj5l+zYvUY5aR4bGF/qqwgg
   6fvW3SiQ5/4tmrh6HEaYDHOSrej+WUfyTgJblCfdiPgms5s0RZkWd9izc
   w==;
X-CSE-ConnectionGUID: JNVODhl8TsKzroCoNG9CIQ==
X-CSE-MsgGUID: 4yph7ZaWR9GdmPBSBmH/Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79192454"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="79192454"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 06:06:38 -0800
X-CSE-ConnectionGUID: huRBjQkBQbeNV6eeEytmgA==
X-CSE-MsgGUID: zj9a4fjXRBKOMrmE+ZnMFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="204724290"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2025 06:06:37 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYlz9-0000000048z-1Jqe;
	Thu, 25 Dec 2025 14:06:35 +0000
Date: Thu, 25 Dec 2025 22:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 193/242] Warning:
 drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in
 'dcp_crtc_send_page_flip_event'
Message-ID: <202512252154.JAx3tPmW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   6354e3da260793f90e3288781d8faf8af4807efb
commit: d4315d81c8103aa2ef83fb767f5d3f78c45f102a [193/242] drm: apple: Override drm_vblank's page flip event handling [HACK]
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251225/202512252154.JAx3tPmW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252154.JAx3tPmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512252154.JAx3tPmW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
