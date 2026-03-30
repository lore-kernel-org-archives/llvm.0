Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008715A864;
	Mon, 30 Mar 2026 02:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774836022; cv=none; b=mbIb3mwk7vSHXu6zmjkLKv9XWVyNlzMBrsGI08SWqeMDeFeiSjhcd54fB91y97zuejOIeeO+TLgHrblpshJZLSA7du6uQ2PFYdHgvIjytT/wBQWe+0OaFQlujyc5wggcUGfnFQAmqotSRxNG42kj5ZXqzNiaswEHyxT3Wu76eg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774836022; c=relaxed/simple;
	bh=Gsfmprni7AW4inJekDM84sSYEWGtABEoTtrR5w39QDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ITMuVnDAKLx+3ODymuI28fB40DjU6dumnJy21bSoWe+VTSA9MXhX2QWaBQGAN10epDzmboK+L9yaHdyDumfmovVtC73Yn0sKPXJFO2NK57PuasEiMYojJDdeSd6OqEa8HwhhD20hnZKc7TQsAnW6pXPDMv4oBklrPAo5bXXSEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpfo7hIn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpfo7hIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774836020; x=1806372020;
  h=date:from:to:cc:subject:message-id;
  bh=Gsfmprni7AW4inJekDM84sSYEWGtABEoTtrR5w39QDI=;
  b=mpfo7hInEHBDuG+kUObI3shu2dyMesdZG9lZ12pE6vHPicKP/a76l5ZX
   d5VOaLwyYVwrrEdLhlOqrgKBTYGBW1sZ+UDoONuKRXQlj0L1isx3o0Ar9
   q9YvpC1KYTWs7zF3uTwcJFXwLeCohK6I9njHdHJQO9WfQ088UpwHoued3
   51Hw4ONFpp2uwxP0vhnrtwNfTFm1ogXfBzjIND1DIXEsJ9WmAFP3x3d8N
   ohTTIBZ1/Ef2VrF0jc6tR33cBxXpR3v6xwiFhux5BtafnyVIo59pC//0U
   sOWNySErP/yrPASAASwHZ3GqHWBEORyEPuJLgTpJtsLxby2KLK78zH0Z9
   w==;
X-CSE-ConnectionGUID: qtWFOK7PQNuNjp5VlWqd3w==
X-CSE-MsgGUID: 3NxThZu1RtaBZhVpI9aslQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="93401233"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="93401233"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 19:00:19 -0700
X-CSE-ConnectionGUID: kBb1UCJ2Q32pCEt3YgWIAA==
X-CSE-MsgGUID: rDKa9ocSQWOoaoCrzsFApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="230376349"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Mar 2026 19:00:17 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w71vK-000000000Xt-2tje;
	Mon, 30 Mar 2026 02:00:14 +0000
Date: Mon, 30 Mar 2026 09:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/acpi/power.c:67:13: warning: variable
 'hp_eb_gp12pxp_quirk' set but not used
Message-ID: <202603300907.e90rIWuu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 0467ed880a17c276c52e442c2454c7c16973a902 ACPI: PM: Add HP EliteBook 855 G7 WWAN modem power resource quirk
date:   7 months ago
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260330/202603300907.e90rIWuu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300907.e90rIWuu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300907.e90rIWuu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/power.c:67:13: warning: variable 'hp_eb_gp12pxp_quirk' set but not used [-Wunused-but-set-global]
      67 | static bool hp_eb_gp12pxp_quirk;
         |             ^
   1 warning generated.


vim +/hp_eb_gp12pxp_quirk +67 drivers/acpi/power.c

    66	
  > 67	static bool hp_eb_gp12pxp_quirk;
    68	static bool unused_power_resources_quirk;
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
