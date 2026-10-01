Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AE519DE8;
	Thu,  1 Oct 2026 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863214; cv=none; b=UxXHQIrFr2zycL3n1TD7sf00TevjYodTYQczUZ2OSmX7Zd+PyQyzUiQ8kn3JflfgGcDvQpKdq/F7eAu2ZEXwGuiKEpx3TG06SyXordqzEOvtliHuK/aYt49053vz4sSdFXFZxirl+xwuGFxUImUE9WmQr60Ne7cC2GUkX2V671A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863214; c=relaxed/simple;
	bh=Na5AMZQi75aT0/7gcH4jwB8i7oaTZ0Jwa6B+Vxh3Wog=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWip88Tpmo2gOuvLYndjZjbEQujhwmFenHsg7Tf8jCrdSZayQdQZ045K1W3z3kHzD9PvJJn8Qs2tsbuZzHVIB5fyYL9nmhbsSZa7hcQFOhSUmY4DdYYr7zkj7rjCrHonEtF+KqmESkr7t+nXQ5JEkbNeumJBOJhai8FSymbC+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnHN0SQd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnHN0SQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790863212; x=1822399212;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=Na5AMZQi75aT0/7gcH4jwB8i7oaTZ0Jwa6B+Vxh3Wog=;
  b=lnHN0SQdVZEClnuZ3eMnOoDh9IB3RY/E409wdmjwV0C3KbZXCfLwabGW
   aeDY/BVZrrCMzwG1K0bHgvQ4uq1apgwhWcmEWXRyiIl16amI7NXsNeRwu
   vXgwuuqRWjco/KC1grP40GsEO+XH34phbXaQkFLA1qlAj6t+Zvim1Vgzo
   zcZZNBdmoiMAz7EOF/wgNNC+Fn8PhCo+dQ68vTxeDrWKhXvcaHjg32iH3
   I0/gp0cXogy6F1/5wrabdfpt3CuPwKgSZ2Yyc1ISaldcQn3goRZH2Q5+T
   I0/rPXWKmY4LmYAJrrsr2Na7bF67fO+hHAFtgEoNM+Sja27EHHmODfKhf
   g==;
X-CSE-ConnectionGUID: 1kZnkvecT4y+ffDL+hfJBQ==
X-CSE-MsgGUID: Wh85m3O9RlaEQbdEaaZiyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94332006"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="94332006"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 07:00:12 -0700
X-CSE-ConnectionGUID: DDOYvaMcSMuVFntBVFvNhg==
X-CSE-MsgGUID: xlOCfdxoQwyXyeGKEBJn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275546714"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Oct 2026 07:00:11 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCHKS-00000000Rvw-3kNj;
	Thu, 01 Oct 2026 14:00:08 +0000
Date: Thu, 1 Oct 2026 21:59:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: usb: gadget: f_uac1: fix ac_header_desc in descriptor lists
Message-ID: <202610012157.VqwTIrZY-lkp@intel.com>
References: <202610012157.VqwTIrZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610012157.VqwTIrZY-lkp@intel.com>

Hi Paritosh,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/paritoshpotukuchi-gmail-com/usb-gadget-f_uac1-fix-ac_header_desc-in-descriptor-lists/20261001-075808
base:   
patch link:    https://lore.kernel.org/r/202610012157.VqwTIrZY-lkp%40intel.com
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261001/202610012157.VqwTIrZY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610012157.VqwTIrZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610012157.VqwTIrZY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_uac1.c:263:2: error: initializer element is not a compile-time constant
     263 |         (struct usb_descriptor_header *)ac_header_desc,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uac1.c:335:2: error: initializer element is not a compile-time constant
     335 |         (struct usb_descriptor_header *)ac_header_desc,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +263 drivers/usb/gadget/function/f_uac1.c

   260	
   261	static struct usb_descriptor_header *f_audio_desc[] = {
   262		(struct usb_descriptor_header *)&ac_interface_desc,
 > 263		(struct usb_descriptor_header *)ac_header_desc,
   264	
   265		(struct usb_descriptor_header *)&usb_out_it_desc,
   266		(struct usb_descriptor_header *)&io_out_ot_desc,
   267		(struct usb_descriptor_header *)&out_feature_unit_desc,
   268	
   269		(struct usb_descriptor_header *)&io_in_it_desc,
   270		(struct usb_descriptor_header *)&usb_in_ot_desc,
   271		(struct usb_descriptor_header *)&in_feature_unit_desc,
   272	
   273		(struct usb_descriptor_header *)&ac_int_ep_desc,
   274	
   275		(struct usb_descriptor_header *)&as_out_interface_alt_0_desc,
   276		(struct usb_descriptor_header *)&as_out_interface_alt_1_desc,
   277		(struct usb_descriptor_header *)&as_out_header_desc,
   278	
   279		(struct usb_descriptor_header *)&as_out_type_i_desc,
   280	
   281		(struct usb_descriptor_header *)&as_out_ep_desc,
   282		(struct usb_descriptor_header *)&as_iso_out_desc,
   283	
   284		(struct usb_descriptor_header *)&as_in_interface_alt_0_desc,
   285		(struct usb_descriptor_header *)&as_in_interface_alt_1_desc,
   286		(struct usb_descriptor_header *)&as_in_header_desc,
   287	
   288		(struct usb_descriptor_header *)&as_in_type_i_desc,
   289	
   290		(struct usb_descriptor_header *)&as_in_ep_desc,
   291		(struct usb_descriptor_header *)&as_iso_in_desc,
   292		NULL,
   293	};
   294	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
