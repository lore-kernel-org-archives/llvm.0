Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686AF2566EA;
	Wed,  9 Apr 2025 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203840; cv=none; b=cp/mD3fYvGYmjskcKSqqVb2mR1AE0AdZJvWpX7yd5oxT7wmZ+tHyAfu9OAxdgkOsnDn3yzJueAq2qUomKaw6O15KBnmJHSDRDLYn1QwAirP4msvbdwW0+fhOC4a/K6MAETlweSWgaV/UJZgQ/9dshWUSZVMp0C6vPSxXMzmxitE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203840; c=relaxed/simple;
	bh=G99UARn16SMWc5vbkOT1x7AFPIP6fcqJcrFL2Pj3SrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtrNZILrcUofke6PSTBz0w3d6E5+a9Bu9N3OBnGyWVnmXmiLXuF0IPJ4PWXC9A625udZQcDsVK8iwaf8r+hb1fln8CjVCOAFP+oldZ2f1jhaoOXjTMMKrbWvlAKUlPk4dU0iGdrv5tfQcjLyDBbbXf8K9SvIMQvxGT6w/J4sZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pidj+epS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pidj+epS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744203838; x=1775739838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G99UARn16SMWc5vbkOT1x7AFPIP6fcqJcrFL2Pj3SrI=;
  b=Pidj+epSROsbPTGbFCqzgMXjjjWqMe9SP/o3IRavJ/awWcMD3FntycWO
   FY/CS0afANkvfrUygK+TwruuqTbtW+1f4X9/AsW52niWXYJLPqEPaaXwX
   TAUZf8LRGZp0A++hgSC8c+oQJGeOIpXw0n15Mg083trc190BZ8TuE3qfO
   h6sh9fwf6BTovsGwBSTs/ga+awayKpF2L4DLnNTVTKXnkuBhHwk1VzvV0
   AQRyUiFHPr7anW3gx3TgxTF+s8LDu8mCMCW5ddf4/efL/Gw6ChP9xv0au
   y+HxKmfR2rv6b1YvJUZgj9M8nv0c5avostfBAuz2xIIwx0Z9UjLaxUy5r
   w==;
X-CSE-ConnectionGUID: s/YopYNoS+q14awkzzrukA==
X-CSE-MsgGUID: CWhp8SunR0yizsLyOEccmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45392320"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45392320"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:03:58 -0700
X-CSE-ConnectionGUID: wbfpDgBSTvmvdwDxAU5QVw==
X-CSE-MsgGUID: jwQekO8HQeKzMrwhI7j+ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133716331"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2025 06:03:56 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2V5u-0008rr-1X;
	Wed, 09 Apr 2025 13:03:54 +0000
Date: Wed, 9 Apr 2025 21:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <202504092028.5gUc0LTS-lkp@intel.com>
References: <20250408121817.6ae8defd@foxbook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408121817.6ae8defd@foxbook>

Hi Michał,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.15-rc1 next-20250409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Pecio/usb-hcd-Add-a-usb_device-argument-to-hc_driver-endpoint_reset/20250408-182312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250408121817.6ae8defd%40foxbook
patch subject: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to hc_driver.endpoint_reset()
config: arm64-randconfig-002-20250409 (https://download.01.org/0day-ci/archive/20250409/202504092028.5gUc0LTS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092028.5gUc0LTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092028.5gUc0LTS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc2/hcd.c:5004:20: error: incompatible function pointer types initializing 'void (*)(struct usb_hcd *, struct usb_device *, struct usb_host_endpoint *)' with an expression of type 'void (struct usb_hcd *, struct usb_host_endpoint *)' [-Wincompatible-function-pointer-types]
    5004 |         .endpoint_reset = _dwc2_hcd_endpoint_reset,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +5004 drivers/usb/dwc2/hcd.c

ca8b03324877e1 drivers/usb/dwc2/hcd.c     Chen Yu          2017-01-23  4990  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4991  static struct hc_driver dwc2_hc_driver = {
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4992  	.description = "dwc2_hsotg",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4993  	.product_desc = "DWC OTG Controller",
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4994  	.hcd_priv_size = sizeof(struct wrapper_priv_data),
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4995  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4996  	.irq = _dwc2_hcd_irq,
8add17cf8e4c55 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  4997  	.flags = HCD_MEMORY | HCD_USB2 | HCD_BH,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4998  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  4999  	.start = _dwc2_hcd_start,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5000  	.stop = _dwc2_hcd_stop,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5001  	.urb_enqueue = _dwc2_hcd_urb_enqueue,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5002  	.urb_dequeue = _dwc2_hcd_urb_dequeue,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5003  	.endpoint_disable = _dwc2_hcd_endpoint_disable,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11 @5004  	.endpoint_reset = _dwc2_hcd_endpoint_reset,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5005  	.get_frame_number = _dwc2_hcd_get_frame_number,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5006  
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5007  	.hub_status_data = _dwc2_hcd_hub_status_data,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5008  	.hub_control = _dwc2_hcd_hub_control,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5009  	.clear_tt_buffer_complete = _dwc2_hcd_clear_tt_buffer_complete,
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5010  
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5011  	.bus_suspend = _dwc2_hcd_suspend,
99a657983a1e03 drivers/usb/dwc2/hcd.c     Gregory Herrero  2015-04-29  5012  	.bus_resume = _dwc2_hcd_resume,
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5013  
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5014  	.map_urb_for_dma	= dwc2_map_urb_for_dma,
3bc04e28a030a8 drivers/usb/dwc2/hcd.c     Douglas Anderson 2016-01-28  5015  	.unmap_urb_for_dma	= dwc2_unmap_urb_for_dma,
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5016  };
7359d482eb4d39 drivers/staging/dwc2/hcd.c Paul Zimmerman   2013-03-11  5017  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
