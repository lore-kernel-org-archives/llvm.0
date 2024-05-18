Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC126AFC;
	Sat, 18 May 2024 21:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716067207; cv=none; b=gnnmKV7R+7gqCtsoSSZ4TCtnVFbz378XqaURwXkGCLTTTkcQcqpuIpAuYC+O1Ts5XgteENuIB/jLa4T8OMOeOEKB4W9mqN6R6Hy6K2X1eruklewRiIQXk62QX+ul+qTi3gGGVVNADPJOj8qHwM37oqgqCTwV78oeU23nTEEGuCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716067207; c=relaxed/simple;
	bh=rBj9cZeUYAoUD9odKeNyy82c0utbn05HIdZeMtOw4ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uOJ+D5lzlhwOSOn9MtptIOHRK+O3FkFzIBHw0Qk65xKk8Co0jMRo/eGmHvcINzwizlmn7c8gXP6gS12wnCAveZxB3qItHrTzT8nB4cJRe9nC/0WLurSDMRm+sWrQsvAQEIFP+cHxcmyAwo73kLd4ep0psNb3xeNB9MiMdja/Cfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jX8FFn2X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jX8FFn2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716067205; x=1747603205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rBj9cZeUYAoUD9odKeNyy82c0utbn05HIdZeMtOw4ac=;
  b=jX8FFn2XN4pqpc3QTXoP2rCAzitUS1porHgTth6HlYM8S1SzM9DfYmKO
   ZKeWhV+VQ0OEYp32q76HVOZK0gc2IZ/IUBtcGNa3D4ztJZw5HxjscjQcE
   bxeSnYXJAsWXAofsdvnujJ2oUanj7HBWV4zjWZlFy1+GTmHCD1CUwdesh
   Oa1fUQypOey3bN1S5u4+CeAabF5YZabDmcyLRGigL+3dY7C/4NqKP3CGo
   W9vuh7MPNQ5QsnQpodd4oSnTL0ZVjD111IyBcntSapXnzyaaBeU0eiKd+
   Qg/46t3f4m1EtjWRTpHcYySB3RF6nwe/yQMSLwx6kA/xatSq0SHbG6+Wx
   g==;
X-CSE-ConnectionGUID: VazooQIlQ/KYVKoE9Um0qg==
X-CSE-MsgGUID: nE51s5LzTySiWvteOs4wGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12080871"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12080871"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 14:20:05 -0700
X-CSE-ConnectionGUID: ckjP751USHuvYbCxa9p+SA==
X-CSE-MsgGUID: 5f6Dyo4sRUOfPQ1G6nGfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32119398"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2024 14:20:02 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8RTE-0002d0-0r;
	Sat, 18 May 2024 21:20:00 +0000
Date: Sun, 19 May 2024 05:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [drm-misc:drm-misc-next 10/10] drivers/gpu/drm/stm/ltdc.c:494:35:
 error: unused function 'encoder_to_ltdc'
Message-ID: <202405190539.epnOVnMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   85cb9d603953d77de5cb311d229a79c439ff6bfb
commit: 6597efcfc53585d5fb177b901a41b4ac2f282b99 [10/10] drm/stm: Allow build with COMPILE_TEST=y
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240519/202405190539.epnOVnMx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190539.epnOVnMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190539.epnOVnMx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/stm/ltdc.c:494:35: error: unused function 'encoder_to_ltdc' [-Werror,-Wunused-function]
     494 | static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
         |                                   ^~~~~~~~~~~~~~~
   1 error generated.


vim +/encoder_to_ltdc +494 drivers/gpu/drm/stm/ltdc.c

b759012c5fa761 Yannick Fertre 2017-04-14  493  
b759012c5fa761 Yannick Fertre 2017-04-14 @494  static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
b759012c5fa761 Yannick Fertre 2017-04-14  495  {
b759012c5fa761 Yannick Fertre 2017-04-14  496  	return (struct ltdc_device *)enc->dev->dev_private;
b759012c5fa761 Yannick Fertre 2017-04-14  497  }
b759012c5fa761 Yannick Fertre 2017-04-14  498  

:::::: The code at line 494 was first introduced by commit
:::::: b759012c5fa761ee08998c80fc4ad6343c258487 drm/stm: Add STM32 LTDC driver

:::::: TO: Yannick Fertre <yannick.fertre@st.com>
:::::: CC: Eric Anholt <eric@anholt.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
