Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC4F1E51FE;
	Fri, 30 May 2025 05:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583765; cv=none; b=H7JBbAdMULcQCTEeFddSf2T2BT21g5/UW4CI3dZJfeoLRTauqouOqTtLmV5vzSU0bWwtlCiVNCpJY49ESa/FDrERH1QsYKOJvUxS2IkpBzfamhDgYtuR6sGgdGWUBQLM81o2AqxP0zntwDm4f7CKCJIVf6ishR/mGLwx0vxSILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583765; c=relaxed/simple;
	bh=um2I7wsc+Y+LhdZesChGyt1Roi+eBMGAXobRf8Bg0cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1R3Txyy4BzokLg0S7GoczErw3gIl1+0KarDxwcvcFUqrdoKCsfDgrkrn9lDe0wFHLmXA+XMnuL5iG606sSm5xoqZd2aGGrmuLjiNKHYvpjSSIlP4dcpqe2+N0rUreSdw5d855MYlgKj5nL+DobPc3M2zXC5mbHjNNtM8/xxPVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fh8Vc3RZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fh8Vc3RZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748583764; x=1780119764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=um2I7wsc+Y+LhdZesChGyt1Roi+eBMGAXobRf8Bg0cU=;
  b=fh8Vc3RZ93mUDR2n9UxquiqQLASNBWfoxDD/smbIWX78QgUp2fHh8od6
   Bzv43FiB+vZiTyQrP9MMpSF10POmwWrYIxng9zT3bi4/uL2OVAuQxb7W3
   1eao47YRNojbr39UKbZBrCMvTgmg9O3n1H69EYc8sQX1ccxy3EDMhOiMq
   8WzsPSSSd+UGHTlMjRZF8cphu4Km0jzpqxHs6yJq3/F5Pt6U3s8uN730D
   +cLesWB21/SbaW7J7KI2lTyuNqIXt1rqwtybei83AxXcU53zNGyijFMEG
   7xYZTFSXXqz59kYLIvMru2wRFjI2ueqQWhP7rlnxkJxPJ3o4asT5hstIp
   w==;
X-CSE-ConnectionGUID: OSSNtUqNQuSARx7xsbTt2Q==
X-CSE-MsgGUID: PUoxhbERSOilUMm3atuupQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50365165"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50365165"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 22:42:41 -0700
X-CSE-ConnectionGUID: 9BBdUUU7SmeQ6qK0tWhqhA==
X-CSE-MsgGUID: XTDiaUxAS3+XmH09wtRdfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="174666167"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2025 22:42:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKsVp-000XNQ-37;
	Fri, 30 May 2025 05:42:37 +0000
Date: Fri, 30 May 2025 13:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <202505301320.Bx7BEpW2-lkp@intel.com>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600@pengutronix.de>

Hi Marco,

kernel test robot noticed the following build errors:

[auto build test ERROR on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/firmware_loader-expand-firmware-error-codes-with-skip-error/20250529-061458
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600%40pengutronix.de
patch subject: [PATCH v2 4/4] Input: Add TouchNetix aXiom I2C Touchscreen support
config: x86_64-randconfig-072-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301320.Bx7BEpW2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301320.Bx7BEpW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301320.Bx7BEpW2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_drm_panel_add_follower
   >>> referenced by touchnetix_axiom.c:2834 (drivers/input/touchscreen/touchnetix_axiom.c:2834)
   >>>               drivers/input/touchscreen/touchnetix_axiom.o:(axiom_register_panel_follower) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
