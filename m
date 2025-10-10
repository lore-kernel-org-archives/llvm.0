Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8873226A0F8;
	Fri, 10 Oct 2025 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760089642; cv=none; b=NfpqZpcpFSXkyqXMTZb4fNgvJNLY4Cy8iRIxNV7l4shAlmRJ1jkd/0v4diwOXaSixXjHIQXMTNXXDJB3ckmk1ORtzPV4ycY0IychS6rYju9LHJNwsAJg+lM0N8Gq1eI3tmB+ncRwh7XT3dnKAXPdxVVq86wbGuwQKSs7/uEH9gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760089642; c=relaxed/simple;
	bh=Cmth7AsQ5hYd+/trQ/YE/rNwKfYfvIoCEgHLGdJc4QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3PjRRg1oUnhclvhK3QXHtjc4uqcm/VHa1ywyJkFloOdt1va5GAJFjw+YPs27p6m3fCt+fwjzkNbsC0S/SB6M8KJS/soIcFrO2q4emxuc+pdOj94GcO5Lv8fRLZPX9LHns4WtKxrB3m4wiQrEm4qFdCTL8cJ0ISf200Q11pH5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCWx1Paz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCWx1Paz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760089641; x=1791625641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cmth7AsQ5hYd+/trQ/YE/rNwKfYfvIoCEgHLGdJc4QY=;
  b=TCWx1PazMY2saRW63NCc3vagIkHLDehZL81bCniPpHDtyLY9Nvi6/LOz
   vdHI6zySD9ESMNq7Esb6fe2I/t/fIjRqDnJOZvRy/oGcQWRPfpSurdfBF
   2+j6HmZRwnMzGLq3o2H9E5gaVtMQ8lKx6KQ2HmioLNMnEbJzujG0VgJPE
   pbNbn/kfISV7g8pErg2zN1ziV/zKHmFdizujjXPIeW6t5tIIR2W35ts0Z
   dEGBH5pz0dKoFKsW/L055PrKFWJUvAuMw1XZZOoDalFnn/cWAQPy0yfzV
   lWNS0Ah9bMrDeTPygUqLnDJPaKzc0OS088SLdqIaAJB/LBKmyqYqWL5D4
   Q==;
X-CSE-ConnectionGUID: jv81hvqyTEeb0sLBDsBKWg==
X-CSE-MsgGUID: Hhmoq4msTwiG3AGwjkUgUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62336430"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="62336430"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 02:47:20 -0700
X-CSE-ConnectionGUID: tkWsKG3wSdODMtCjbk8BYw==
X-CSE-MsgGUID: TNnBExx5QX+OrGMKT2yvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180626648"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2025 02:47:17 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v79iU-0002WZ-2y;
	Fri, 10 Oct 2025 09:47:14 +0000
Date: Fri, 10 Oct 2025 17:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 04/16] drm/bridge: Switch private_obj initialization to
 reset
Message-ID: <202510101750.mdgz7wUC-lkp@intel.com>
References: <20251008-drm-private-obj-reset-v1-4-805ab43ae65a@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-4-805ab43ae65a@kernel.org>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on aa1c2b073ad23847dd2e7bdc7d30009f34ed7f59]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-atomic-Add-dev-pointer-to-drm_private_obj/20251009-195815
base:   aa1c2b073ad23847dd2e7bdc7d30009f34ed7f59
patch link:    https://lore.kernel.org/r/20251008-drm-private-obj-reset-v1-4-805ab43ae65a%40kernel.org
patch subject: [PATCH 04/16] drm/bridge: Switch private_obj initialization to reset
config: i386-randconfig-011-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101750.mdgz7wUC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101750.mdgz7wUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101750.mdgz7wUC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1 shuffle=982479975
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1917: modules_install] Error 2 shuffle=982479975
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=982479975
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=982479975
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
