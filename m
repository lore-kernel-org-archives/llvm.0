Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFA35950;
	Mon, 13 Apr 2026 02:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776047622; cv=none; b=Mv2sMaBegsqJ83AfANbn7ENt+j9u82Q7GC4mM6A98z4KYbimqsEM0RPlgMElE0hTVqmVZvGTvgPgIO41oi3oRC0Ic5IgGNn+jIL0e3lEGQIXkafPyyf/daEpfXAN3uBJMMejnEvdOlRffLnH+MnEA/7xFbdDnluz6QnjSwCa1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776047622; c=relaxed/simple;
	bh=Df3CCeJQ6GVx48cupiWQNJ3ih6ZxwxHhkRQPXtlFp7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aj2qRrndxfMggo63I0ZIQwvJHvZc+A2gqNd6gPizmoQW/3/ubbp0Wki4ZdzHAVjgliXdREWgyq8BObArymM8vOFCAGapF41iOUvex0OyNq+iL42xb7quckCDKr4ADPzu2RG9TZ9FqNFNkR8qU/793VMMkETklZeiA7884m/Bcxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IP1MZvLy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IP1MZvLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776047620; x=1807583620;
  h=date:from:to:cc:subject:message-id;
  bh=Df3CCeJQ6GVx48cupiWQNJ3ih6ZxwxHhkRQPXtlFp7o=;
  b=IP1MZvLyAZv35Fu98JJ3OivnSDHPwsSzO+DmUQo+UuW5PAINzW4fnHT4
   nwGlHlS2Pbwl4AZSDL5R30zMpXUlkvOZeC0rJn9jI02E8imIyass/m1l7
   VCfv4ouZkZ+XEHW4IfjCs0fZICtG0E58gsubCj1r72IqE3uFtyOcSXemy
   mtd0T8lIIHwuKCbD6kOt2FEsUhNSKCAWmlr2aUKJR1rn84J6eyppdi0pK
   6WmVormkjjP/1CiuN3on7fxFgxrVV/qMcq5ICJO5wimeXYL+pvtmzOuet
   MSf8ioxJM3nyCr+n7EJZg6nCDoVqoea8SNFpi+wJkLJzS3zKKDtBFNVdt
   w==;
X-CSE-ConnectionGUID: Jg8pcmk+SVKhCgzcJU4vqg==
X-CSE-MsgGUID: lGcq1CmcQFiXJGPU5ZV9Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76853698"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76853698"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 19:33:39 -0700
X-CSE-ConnectionGUID: ZNCVluJeQk6qNc7z38nsUw==
X-CSE-MsgGUID: hTofF2qFTqG2Drbpf2DGmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="252842542"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Apr 2026 19:33:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC77H-00000000BPJ-10ii;
	Mon, 13 Apr 2026 02:33:35 +0000
Date: Mon, 13 Apr 2026 04:33:11 +0200
From: kernel test robot <lkp@intel.com>
To: Val Packett <val@packett.cool>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: ERROR: modpost: "drm_panel_init"
 [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
Message-ID: <202604130427.IBMIQMEP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Val-Packett/drm-Introduce-drm_panel_prepare_for_mode-callback/20260412-203219
head:   a210eaa6cf90ed0bb6afe19395c080e50a1f71a7
commit: a210eaa6cf90ed0bb6afe19395c080e50a1f71a7 drm/panel: Add driver for Novatek NT37701 based OLED panels
date:   14 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260413/202604130427.IBMIQMEP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130427.IBMIQMEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130427.IBMIQMEP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_panel_init" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "drm_panel_add" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "drm_panel_remove" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_dcs_write_buffer_multi" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_dcs_set_display_brightness_multi" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_dcs_set_tear_on_multi" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_dcs_set_column_address_multi" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_dcs_set_page_address_multi" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
WARNING: modpost: suppressed 12 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
