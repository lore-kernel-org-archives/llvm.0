Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD23264D0;
	Mon, 29 Jun 2026 19:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762833; cv=none; b=YUTkdmyAJN3exfSNmvpDcS/hAmukrmHmSvXY4T16EA3X4zaVhVo0u84RVT3R0et+WZFrUlAgDft3fkZfim6tU1mte3gl7uJEZEbDpv9FeePNrwxwSdSpXhNF4Zt+e8njOyFjmnP7/HOTsJrehmY23jXKCXxT5ym+oFAZA2HccGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762833; c=relaxed/simple;
	bh=ecYnhXuuJH4IUECfb2I+uTec+wdYrt9F59dfcsmq5HM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DeQE5cgVja1QTR0aBCwcv4lp5mduxvBwCiqkm3ei7i4NWmPMFiQl/+r5rS2Rml5Syk1lPc5VqzFa01UWrFBTOcdKJbLzch5oQmsSln6/nYOyMa3xiKVFTP2Mdz3V3WGuhpRmJP2TojV9iVo1olN3RCGihzGy9nTN0oeq9MrQPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEG2mwo9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEG2mwo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782762831; x=1814298831;
  h=date:from:to:cc:subject:message-id;
  bh=ecYnhXuuJH4IUECfb2I+uTec+wdYrt9F59dfcsmq5HM=;
  b=LEG2mwo99DuXXtR0DpiYe4c+x7S5AxQQXJfZ4Sx97r3zffNeCyCUDs+7
   kzHwnqScoLjdTk1vFdadejsXix/Dd0ZlldvrBpQgVExucMjq/jN3i8niH
   WrcNlDJV1y2g8GsX9iNkrzvUOsBg4FM9XM0q28yHIPSv3rwbPiirVVJKD
   fZueb0H2iu2DUYX5Ttt/9C53FsapqpeH3JXLuIV5tH5wHw71wv92A2r5D
   VJH1Dghz/6a6NfXsRLiajVLORBTwVTpdWjsa8RQfn0eLPQ2200TSOTGGi
   obgVzGwu3gRyICoqnt7k5zJ2rzJbfa01dFbKyB6SXlB+rhauk8NkFuWg1
   w==;
X-CSE-ConnectionGUID: O+wN1ZGpTtmOKw3lxrG9wQ==
X-CSE-MsgGUID: blm+m7J3Qn2FN3WtLOwSiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82461645"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="82461645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 12:53:50 -0700
X-CSE-ConnectionGUID: kj3ZQp3SQjCCeu/sT/MB7w==
X-CSE-MsgGUID: Rmc6Z5jSTUKm5t2MQriqag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="247593237"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 12:53:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weI38-000000007hV-1FlE;
	Mon, 29 Jun 2026 19:53:46 +0000
Date: Tue, 30 Jun 2026 03:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 105/176] Warning:
 drivers/gpu/drm/apple/dcp.c:100 function parameter 'crtc' not described in
 'dcp_crtc_send_page_flip_event'
Message-ID: <202606300332.OAjOUk5E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   54e3c0d3b3f7f4f11f9bc05d2a94725eb7e39148
commit: d15af95c52ecf6e855fa9ba92d0a95ad7f6204b0 [105/176] drm: apple: Override drm_vblank's page flip event handling [HACK]
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606300332.OAjOUk5E-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300332.OAjOUk5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300332.OAjOUk5E-lkp@intel.com/

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
