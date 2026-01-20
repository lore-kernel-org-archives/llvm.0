Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC713D301E;
	Tue, 20 Jan 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902298; cv=none; b=Xjd0Bu4wQ46eor5d7d39dn5DGKSTYAtD/wDa1WLx01OcGwte1KG5hzp5HUwwLwznewa216LDduHqtsiz87WMVdLIgWgMXRJdABSFe0OBGsLEpGRrLK/DlF4p3iqH/bUZw9LkhHivBUIqkNMUGCuOwOrFGDolvOzrSK59ED7a1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902298; c=relaxed/simple;
	bh=v0RFn+aeplivZPtgfIIgbIKvsTCAKIJUwHe87L3xUAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S98OcDfKPwxlcwBSLJkdhAKlIwdrOb251VOJuHhRkMvOE5MXvNLSispAEL3vByg1I7VaogXjN/p4cA1OHWV34q9zkYQGSYd89VbUN97EMlPXAkhRS/IyalohQswSI4H+Kag4uTS2VCsiyyRzwyS5moj2nFtHdTFhrGGCveTcyEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXQbkXKW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXQbkXKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768902297; x=1800438297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v0RFn+aeplivZPtgfIIgbIKvsTCAKIJUwHe87L3xUAM=;
  b=cXQbkXKWr7D1EVlu5gg4PB39O7PezZn93va3/bNpQfeKns69XzbYptQ7
   JXpScwkOTqv9/sekQeGQcCh48gf8jV71hq/gZ3eyOl3NFzhLf95RHMQTx
   pZMAtbwuH2FohuvpTZRJ+juZkHsVjCTAlbG8x4k4bvOo/0D3Lsb8jPqrL
   9vCyjIcWICOidWALnMwucAVCZs8J3LSgyM269XdS25P78ctpgCqq0EUuR
   rq062YgFEe1aGZDSGiAe3bDZZwws4azb1uBMLcwLnA78lwqJpTshQW8FC
   0AbCSK6OC8H00te+vgzK8L5mLcCB8gUCVMjErk0O4tlGsrbZSZKMgHY2z
   g==;
X-CSE-ConnectionGUID: SDMpjMSNTJKTj7xfXiGfhg==
X-CSE-MsgGUID: RjXugNqpSH2rOCQ8X9/Vew==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87520463"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="87520463"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:44:56 -0800
X-CSE-ConnectionGUID: DOicduV7RkGhYus6tJZeyQ==
X-CSE-MsgGUID: PPAMHC8wS4is1E1AZy5DPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="236763006"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 01:44:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi8I5-00000000Omf-17jm;
	Tue, 20 Jan 2026 09:44:49 +0000
Date: Tue, 20 Jan 2026 17:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v3 04/15] drm/bridge: Switch private_obj initialization
 to atomic_create_state
Message-ID: <202601201722.632RZYWZ-lkp@intel.com>
References: <20260119-drm-private-obj-reset-v3-4-b931abe3a5e3@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-drm-private-obj-reset-v3-4-b931abe3a5e3@redhat.com>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on b36178488d479e9a53bbef2b01280378b5586e60]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-atomic-Make-drm_atomic_private_obj_init-fallible/20260119-205337
base:   b36178488d479e9a53bbef2b01280378b5586e60
patch link:    https://lore.kernel.org/r/20260119-drm-private-obj-reset-v3-4-b931abe3a5e3%40redhat.com
patch subject: [PATCH v3 04/15] drm/bridge: Switch private_obj initialization to atomic_create_state
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260120/202601201722.632RZYWZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201722.632RZYWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201722.632RZYWZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1960: modules_install] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
