Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631EF7D404;
	Thu,  8 Feb 2024 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400367; cv=none; b=pnrNgO50oOxp1bTo7QRTXbx/hnc/rX9uAVvffBKrrSrd0uLkkZcpFiLjHtXOpRUNMu96Jl4U0/MBnFaPY6b2mSzUwpOHrLQmlqdaO8mXsTevHIJJtpaD92BpufDajgAjOmjSTppsnXFUBnKmR4SWW7pBkrp3fk2RHyO0RQAjDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400367; c=relaxed/simple;
	bh=UKylgrz5FIYXmgC4U5ANMQp9BanMq2JFmA0dkETx8V8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drOn44kD6BMFn+lsrNgnm6ch9uqCLm4ckzh7Cp2/hKD0X0BoO1McRBNL8msPTP64pNRaF0+rOnbNWIqs3gdG/VvhuUNjyi/WgEAk+P8VuVNQDQP4Y6edaduIRKidgrAq9/nt3B4vPe1Hx6zJxAsNeuAARFzrU3jW/BdzmVKiACs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/df1Nmy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/df1Nmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707400365; x=1738936365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UKylgrz5FIYXmgC4U5ANMQp9BanMq2JFmA0dkETx8V8=;
  b=K/df1Nmy6F+X5GxR+ZguSW4mWAD+A4vQgw7XxMUOsly2Bg5+Y/qkFvql
   +mFD4x/57TQEDxxm8jlJ1I8HnP7oCia92/PQbXcdIU9CT50DsdxhWXEEd
   +lxAMY5uH5tosWQsxsc4rbdw96pE2RJNlBOpfHtA0lHaUBTV6687KJiKu
   bxWWp33CKlvQHYPVl2AmYq7WnyGnmUTwPSwN4z2TpjMQhOAdQrJoaFuCt
   zio+QNCJYNezKKORPcpoAt7KUrIkVkiO0OHaPWFsSCky8uBVVFyIcIxGx
   KVIPNSJBzdaFjZxi9Tcn2jLA13q9S3lM3T5XfSVOKycdc7Jzcq6wMRpe+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="5001929"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="5001929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 05:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6283424"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2024 05:52:43 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY4pU-0003nA-0p;
	Thu, 08 Feb 2024 13:52:40 +0000
Date: Thu, 8 Feb 2024 21:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.8.y 50/50]
 drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: warning: unused
 variable 'st7701s_ids'
Message-ID: <202402082100.ycRz9G7L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: f3b6698ac10e7f6528408bda7d8d162065a44af1 [50/50] drm/panel: Add driver for ST7701s DPI LCD panel
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240208/202402082100.ycRz9G7L-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402082100.ycRz9G7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402082100.ycRz9G7L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: warning: unused variable 'st7701s_ids' [-Wunused-const-variable]
     426 | static const struct spi_device_id st7701s_ids[] = {
         |                                   ^~~~~~~~~~~
   1 warning generated.


vim +/st7701s_ids +426 drivers/gpu/drm/panel/panel-sitronix-st7701s.c

   425	
 > 426	static const struct spi_device_id st7701s_ids[] = {
   427		{ "st7701s" },
   428		{ }
   429	};
   430	MODULE_DEVICE_TABLE(spi, st7701s_ids);
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
