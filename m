Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFFC376BC1;
	Tue,  7 Apr 2026 03:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534262; cv=none; b=jjpbdioPEedv/DRmRTdiKZyDQVuy96X/THdBBMlZbt976123JBF5GIa3zHsL5LCL7E5l59UJBVI22mDtii1FApmerl08jDt/r/ZtB4SD0cLt8Lr45Oly7WBeXCCLDbS2qvnoTMbu0pznS3txDS/mt6onW6rluazZX+d9Mhs03lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534262; c=relaxed/simple;
	bh=JCID5yQ7inguw3fp+wnCkdK0jMUWdV2fiFztVSKuv4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VthPzSmGcaLbjHXSKCC+ujcgwbcbuqSvI3CuHxVAQMhpz4xMv59aXxnz8apIXg3huEmeSqFTJ4HZ2Mb8PpKRZCULRmrbN8N8D3d6ryIGfFd/Vij/pLvhr6ZKpER0ksC87nyBzxPIAY7az4wr8MX4NuHHmad06xuUUC+vcEUsexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3RFXejM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3RFXejM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534260; x=1807070260;
  h=date:from:to:cc:subject:message-id;
  bh=JCID5yQ7inguw3fp+wnCkdK0jMUWdV2fiFztVSKuv4Y=;
  b=U3RFXejMReZ/Rnkbfcy/1stTvR2BMpPbeazRqUukWJKLfYR0xPFe6nGn
   Ei+vJH8UP4mkpduquXYnHFTNpDyhkqR94B+35pDLvnSoYjv+a9CYOcdhe
   LJ38E2IVEwjWA4xWDDWvkZ1uL9RK3vuqoP48Fn5ze5hlqL/OCENPvhTQo
   Fu/v1Xsgo2hjkz+I1/JZuV1wvthgvN4vxDZffNGeqSabJt8HYhhH+zCMj
   fQej+cT5jJBosdXrLAJa7/soGIVm3Eql5LT2EGuGjj1cRBRx8sGLD2dTS
   lGgfSqXw6HhXTLPU2AfvWiDNWn835Obcz6YnrEEJmM4jYjIrJ/iZs9TQ9
   g==;
X-CSE-ConnectionGUID: IzePVbuORoqc7O6i3FluXg==
X-CSE-MsgGUID: 1v9yVXWoRcmHo01Ae25/CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081101"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:37 -0700
X-CSE-ConnectionGUID: 6ZqNfcIBS8yupV8rV96hgw==
X-CSE-MsgGUID: C6ePxoJyRMq/SNPpyZ0BIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995303"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:57:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005P-3Tov;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 105/178] Warning:
 drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in
 'dcp_crtc_send_page_flip_event'
Message-ID: <202604050746.qSPTtFeU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   ffa1d7fc2698e42c395e0ff58f7d20adaef4b263
commit: 75fddc9fb0f1cdd2af06667840ca80a48d9f8ee8 [105/178] drm: apple: Override drm_vblank's page flip event handling [HACK]
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260405/202604050746.qSPTtFeU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050746.qSPTtFeU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050746.qSPTtFeU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:100 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
