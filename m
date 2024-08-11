Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E11818E06;
	Sun, 11 Aug 2024 22:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723416049; cv=none; b=sjf+m//n0Nx5uEeMApNSDbHQvGcDNztlmeuVMYJct1KLTjvC7UmlFWCdi01HfxZIZT6v3R1fRthEBdWyszBqRMwaM9IZP5sMCbNjjGWn4gOZWP1CZoo1xvncgO2GFj8b+F3ga31Uk4AWbNUygzNrO4+MAHd8GgT6cwusXNFJpzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723416049; c=relaxed/simple;
	bh=kTxP1BhfN8m4BibA3AnY2DsR9srukC7nsncZniVgWXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MsWj+7lG3fueUJBQGwqlj/p6nMUIJrv60muc+bF8cnl9MLn1Ja5aBmwvHD6x3+hVW/nsWQ9oaa5Amrzbm/zpD8dNjXQJ9AL4/xP59Hlepi2gyZJlxRye2RYYmlgztjdTGCpavQZuSoW/XSJWXMnwCmnYC9H420qpPtIb8nBsjW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7LvJzQJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7LvJzQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723416047; x=1754952047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTxP1BhfN8m4BibA3AnY2DsR9srukC7nsncZniVgWXU=;
  b=X7LvJzQJm/Ni9NF8iyCpyJzy22S/JbEo+h48YkDnwEVWsMCaXHaE5iPK
   aVTPeV4JGkWs97tCmycxd/a7eGDVN6AsxpCW8IRdVRBObHFHaJWzbU5RO
   jIwykjPbLbHmfb49HBTfYKT2icIpvxCfCHfNNDlxpujkCII+w3fCAUqv3
   VbPS1/+PyejbVRqDkfk+a6jRUVFczAgRsYhsPl5rfDuDvBGfaQ1TZ3teR
   XfFyiUI4C2PHIV/7LnE3n6/nQ+X+JZdxAVcqsFf5GrYdIYTGVwIALA4eU
   AiIsbA21QfR263EK7Z9zXMbb540j7HW13paEPc6+x4rovUrD6C2eOsd0L
   w==;
X-CSE-ConnectionGUID: FTDGuvttTNW+9TncnpuenA==
X-CSE-MsgGUID: AtzUheEYQCyZnxbv/oORGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32090045"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="32090045"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 15:40:46 -0700
X-CSE-ConnectionGUID: A/IgArikTGKfzePgAxNcUg==
X-CSE-MsgGUID: 39MyV7sqQKSOSNvDLo9/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="57738581"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 11 Aug 2024 15:40:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdHEx-000BCf-0D;
	Sun, 11 Aug 2024 22:40:43 +0000
Date: Mon, 12 Aug 2024 06:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Subject: ld.lld: warning:
 src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6213:0:
 stack frame size (4896) exceeds limit (2048) in function
 'dml_core_mode_support'
Message-ID: <202408120604.hpAu9VSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7006fe2f7f781fc96c8bab9df0c0417fd670a8e1
commit: 27442758e9b4e083bef3f164a1739475c01f3202 Merge tag 'amd-drm-next-6.7-2023-10-13' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
date:   10 months ago
config: x86_64-randconfig-002-20240810 (https://download.01.org/0day-ci/archive/20240812/202408120604.hpAu9VSP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120604.hpAu9VSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120604.hpAu9VSP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1854:0: stack frame size (2184) exceeds limit (2048) in function 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.126032'
   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3542:0: stack frame size (2136) exceeds limit (2048) in function 'dml30_ModeSupportAndSystemConfigurationFull'
   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:60:0: stack frame size (2144) exceeds limit (2048) in function 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.126182'
   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1723:0: stack frame size (2760) exceeds limit (2048) in function 'dml32_ModeSupportAndSystemConfigurationFull'
>> ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6213:0: stack frame size (4896) exceeds limit (2048) in function 'dml_core_mode_support'
>> ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8261:0: stack frame size (3288) exceeds limit (2048) in function 'dml_core_mode_programming'
   vmlinux.o: warning: objtool: .text.jffs2_erase_pending_blocks: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
