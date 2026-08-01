Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2957489896;
	Sat,  1 Aug 2026 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785587705; cv=none; b=MudDOpr6fumxGE3rbyV2KkKlurHLzUexEweS1M/VcZEQEo5HpT5qODEyZl2bQCCj1blB9XFOT6MCOvuVkZViVBxNmvOtJ1PwL1nTYmgZaEkhNnuuIh4P/EasyUFsf9GOxZlgZ8eUcNwJ7Tt+iGZ1jdsbtGRU98gPGqAJg8E1Pvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785587705; c=relaxed/simple;
	bh=2/Ud0OYWmFCC4w53hat0SSRTiFn3O7fS09DwvrGv2v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak9PsGqKxGrRX7gxOAi/TvAqtTP1QwydrvWCb+GaEv3d6JIQucyBn+knu4yvN/NC1lFUyURIzX4QZjj7rJj3Tf9Gn13YPzPIMuvNGNWcS3mWkJ2imp1Q6tqFlwH9nCIzrJUmfX2ChHE3Xsw+T/FSDBbkf0f2yx1LH16D3TyfEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLrnR2JO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLrnR2JO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785587702; x=1817123702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2/Ud0OYWmFCC4w53hat0SSRTiFn3O7fS09DwvrGv2v8=;
  b=hLrnR2JOURCMYlKWCYapsx2dyL4kukobLVNuxVUNbCGvLSY7ketfDCzc
   K8Pe9MenXyePAVZ3I8t1DvO00EcHpWGBaHOqQj5Vjpl3XBzEXrptabjCm
   DJddzW5a0rA0PMup5vMNr/mENKlrU2g2dbRi0Z++YsMUPGRWvCfSGzifo
   w26eQO2z5ssSCGZ/xEUrnAPjRh0mEs6q9w/IDkNY6l8JJ9yWg7IyXorGP
   /LfIh0xdc6mQ2R1rJrBJXAo3QCCBMRhlm90vZQ2jg9VF3A5pfOUpX67jD
   IW8ler7+RThMNkKTINMbZYcoIe2eAR9URxeehequ0GQ92BngYVfw47bQr
   g==;
X-CSE-ConnectionGUID: T1MiCDwCTcC0DTCMfpqLPA==
X-CSE-MsgGUID: Wse+BvXBRfGHchRiQB8f6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89874072"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="89874072"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 05:35:01 -0700
X-CSE-ConnectionGUID: IuY01wPSTsK7xb/Fp8TI9g==
X-CSE-MsgGUID: GAd1e5m3SYeNQflschCGmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="259007701"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2026 05:35:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq8vZ-000000003LB-34lI;
	Sat, 01 Aug 2026 12:34:57 +0000
Date: Sat, 1 Aug 2026 20:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Seliverstov Daniil Denisovich <daniil.seliverstov2003@gmail.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Seliverstov Daniil Denisovich <daniil.seliverstov2003@gmail.com>
Subject: Re: [PATCH] This enables HuC firmware initialization and
 authentication on DG2 hardware when using the Xe DRM driver.
Message-ID: <202608012014.L7f9m7Nm-lkp@intel.com>
References: <20260730164334.8424-1-daniil.seliverstov2003@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730164334.8424-1-daniil.seliverstov2003@gmail.com>

Hi Seliverstov,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-tip/drm-tip char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v7.2-rc5 next-20260731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Seliverstov-Daniil-Denisovich/This-enables-HuC-firmware-initialization-and-authentication-on-DG2-hardware-when-using-the-Xe-DRM-driver/20260801-003327
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260730164334.8424-1-daniil.seliverstov2003%40gmail.com
patch subject: [PATCH] This enables HuC firmware initialization and authentication on DG2 hardware when using the Xe DRM driver.
config: x86_64-buildonly-randconfig-005-20260801 (https://download.01.org/0day-ci/archive/20260801/202608012014.L7f9m7Nm-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608012014.L7f9m7Nm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608012014.L7f9m7Nm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mei_cldev_enabled" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "mei_cldev_enable" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "mei_cldev_send" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "mei_cldev_recv" [drivers/gpu/drm/xe/xe.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
