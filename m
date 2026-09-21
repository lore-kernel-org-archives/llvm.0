Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66483803D2;
	Mon, 21 Sep 2026 19:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018458; cv=none; b=nO+o6fZBFsYi4bW+hlTTRnijVjh8GU1eDg5rdVYrbbqvqhpjHsxctlUhgvT1ZBf++ADFvE3U449QNTghZ8FpK+heTIVYREA6xtnrnM4Czd7m36wW+3Y7/h0Vd4w+pGhEzyK2LZhc+68v8YqG0iR67eOy5AoFNOwF6go3GCZVh28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018458; c=relaxed/simple;
	bh=H6djcj6gGlgvhCR/e9r7QIs1i/RCtQkZviYnfxCDYXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M9Bq+W/ViRMLnf+d6h4dqNlTwmsbGhtF20l/t+JjL9dQy1X4Ze23qJHcn6CF/dFhuAEWMF1yRgbjBdGtmhEDPxs3DsZx3PhuXP+XULOhnKr09UvJ5EsTkZ2o5ueYo96RuBE/2ljWayPm0bU8V2HJMqBxODDWp3L2CqMb7TwWbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dhqb/BmT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dhqb/BmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790018456; x=1821554456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6djcj6gGlgvhCR/e9r7QIs1i/RCtQkZviYnfxCDYXM=;
  b=Dhqb/BmTgp+Td2iA3yzT6X92I6y4jHMw+STi4ZOzbCsekC/vtmLhGfcN
   sdArTAbpAAN9/CT02OEatXd1SGPJ+Y3CqOCe+2t587hAM88LiZjwi+zWL
   vsdxMPNqpW34WkLEAi9fkDF7iZ6qKtdGbcrUS+xdKseTVzGLF3d1+pVrV
   yUaKJdL6EqjVgv12lzygEKzTIgAesXH346pkzvb6S53zca+43nxDB7Ntg
   eAXheDThPb/0QJFXOyT/eVHNABa89AbhUXZ9lzzG1gKHPLTMhV1ejlMwF
   iHmzFLXin77bCRrZqJDvp2KMO17kveEtERtFFLvbktdvZ6AqwCMq/vO8J
   Q==;
X-CSE-ConnectionGUID: hIoVv174TiGaDHOFIxIHiQ==
X-CSE-MsgGUID: U2pEwLPwQviJbZjPZZ5GXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89490339"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="89490339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 12:20:55 -0700
X-CSE-ConnectionGUID: q057aMx/TJeR2gexbcSgFQ==
X-CSE-MsgGUID: lJMV0ONwRYeP53A1heS4Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="300743416"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2026 12:20:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8jZK-00000000EHF-3MuL;
	Mon, 21 Sep 2026 19:20:50 +0000
Date: Tue, 22 Sep 2026 03:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gaghik Khachatrian <gaghik.khachatrian@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, James Lin <pinglei.lin@amd.com>
Subject: ld.lld: warning:
 =?us-ascii?Q?src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/di?=
 =?us-ascii?Q?splay=5Fmode=5Fvba=5F314.c:3893:0:?= stack frame size (2176)
 exceeds limit (2048) in function
 'dml314_ModeSupportAndSystemConfigurationFull'
Message-ID: <202609220317.3Z72hVrQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: faaeeecef94ad312b051dbe628d6e3f016ba5263 drm/amd/display: Fix type mismatches in DML and normalize loop bounds
date:   5 months ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260922/202609220317.3Z72hVrQ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609220317.3Z72hVrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: faaeeecef94a ("drm/amd/display: Fix type mismatches in DML and normalize loop bounds")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609220317.3Z72hVrQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:3893:0: stack frame size (2176) exceeds limit (2048) in function 'dml314_ModeSupportAndSystemConfigurationFull'
>> ld.lld: warning: src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3801:0: stack frame size (2192) exceeds limit (2048) in function 'dml31_ModeSupportAndSystemConfigurationFull'
   ld.lld: warning: src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3382:0: stack frame size (2272) exceeds limit (2048) in function 'dml30_ModeSupportAndSystemConfigurationFull'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
