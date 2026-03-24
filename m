Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F03F0A9F;
	Tue, 24 Mar 2026 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354155; cv=none; b=VS+qBf9oL/iSlSeKHonnTvWsUQTwBDsd10DTcVpw0F7/FfipPRvy5Z/84nBG7mFzciO0ffsnioOjxpxYtL+O+EAMkfetVZpgJizahr2O9xcUDLZbw5qlrw2RSeSuZyVmiMMkgjH6xA9hBbdcxsWIXUjkYGrT3cUG8rslBl39EwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354155; c=relaxed/simple;
	bh=89zjSUnik56SwfZ7j/meuHPl/L6L9YHlruY51fauXno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=THc7y6s9TWdbM6gCiMHSOxEaQG6P5CU7tFgUESmlWhPUt2llwt2FMal45sKLlMBJVBJoIqalrdmXnrLvxu8q66t4nEE6BMP5IaV8XHgssJlOOkb1/wVv5D5Rz3TmxdwjhyhgPuQOyL7xVIu5xgp6vDRUeiE2ewdZF8zu1ivBIHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLRkbk8N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLRkbk8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774354149; x=1805890149;
  h=date:from:to:cc:subject:message-id;
  bh=89zjSUnik56SwfZ7j/meuHPl/L6L9YHlruY51fauXno=;
  b=DLRkbk8NoObut2xjBA4XF7mBLil4GC2TZ4rQUMzkpP9I37daG52IXVE6
   eDmIajedKCvsmY971ITIqW1lTZQdZy9Sxm72wN4M569MMh+aIifWwurd7
   /UIG3dQ9x8afP/MhR4U5pKyJGYGZwrmTqY4cTeThmbt2L/2yaoJYHKg6R
   N+B3yuErKuWUX8Ot1iviohlvyxneMwSWfUD/7OZsX+HB4mhFOj0R4Ovkj
   SJtM/+svCrp7LeoBCXavcFDZ8vJibii8J836Y8yFokpMQXc4JM7FBvONf
   aGzaVFQCj9fVqD94wnCQnzqdUn7HUY3SSGaDbeMGZDHOuEqddswjcVrEr
   A==;
X-CSE-ConnectionGUID: gf/Bzxk7SSyAbEvLQHiViQ==
X-CSE-MsgGUID: TDVxCc1uTPW9cgk13henOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86441726"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86441726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:09:08 -0700
X-CSE-ConnectionGUID: HTu6EWQeQPqmNsgr7FrCDA==
X-CSE-MsgGUID: oziPT5ShSyWdqiYg+FyC/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228391776"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Mar 2026 05:09:06 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w50ZD-000000004WH-2ieP;
	Tue, 24 Mar 2026 12:09:03 +0000
Date: Tue, 24 Mar 2026 20:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <Dillon.Varone@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Chuanyu Tseng <chuanyu.tseng@amd.com>
Subject: [agd5f:drm-next 33/80] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3645 function parameter
 'update_descriptor' not described in 'update_planes_and_stream_state'
Message-ID: <202603242035.wyKfokFP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   470891606c5a97b1d0d937e0aa67a3bed9fcb056
commit: c24bb00cc6cfef4afe71de8b9bb5c809a49888f2 [33/80] drm/amd/display: Refactor DC update checks
config: sparc64-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242035.wyKfokFP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242035.wyKfokFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242035.wyKfokFP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3645 function parameter 'update_descriptor' not described in 'update_planes_and_stream_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3645 function parameter 'update_descriptor' not described in 'update_planes_and_stream_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
