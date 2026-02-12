Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFACCBA21;
	Thu, 12 Feb 2026 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770922349; cv=none; b=GE/JW/JoXLG9TBSlK4PX2fYRSBWPOAa2uDwj4w0uwpMXIa90f2pFlqt+HIHiXu+nFeoR2FMHgRzgSD1k0GzqUY2D2/eRASQJRID3M6tCSl+RRiAvHPGqHlN8eEhabMB9odSiUX039sDmZNnvuNDofjOGgJw2OknyOFGlYMOcDg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770922349; c=relaxed/simple;
	bh=+Ys3Nzyehyy7T5zBEo7o1NSAXzowFsqDv9PZFh6VNQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdMbnOZugM8HInnPs+veuO3qdRZt9dJCb8vVCb1/ZhUIoqJQbCJDcEPfnccgNnUkO9W7/KeXdZ8IcqJh6aR36rQqOFGmESjxXDEVtBP0/pN+eyawa+H/YPboo4LsEEyGw+FBw8PcfTm0PNgA2ovO9ybHUMfy7pN7OMvTF7KViY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZI1mvRe4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZI1mvRe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770922348; x=1802458348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Ys3Nzyehyy7T5zBEo7o1NSAXzowFsqDv9PZFh6VNQA=;
  b=ZI1mvRe4HADsOkdWwmiTd/carRI1CCSKH7dTQjOd6DYlmMfS77hU1eGt
   PyshxqQPbM7JEunHxBO8GPHo9utUswjF7PuQvNO6lbp6GVrZSsrsM6Fwm
   OAFtNoU7xQXNWOitaqvB5UMNY3+EpA2J0QqQDqVhTHt71YhlOFhvCpyAq
   Sflo/5su7SGQrGeUjhcWaOrgV7grYZFFhXvVYJLrnODPPZo0+EZOZT5fD
   OpHnY22CKZStQ/K9uH4W2nuvqPBOJxrapEUHoUYG5Jt1CL5xY/EhfGvXO
   wAFFV6zSE9QdQeHI8t8/ZVrp6TSYVm3CiA9GN3QUp7tI+kb/NgoIFL5TT
   w==;
X-CSE-ConnectionGUID: lx3mRV+1SGeuOT3dnvZo1g==
X-CSE-MsgGUID: k4DUU/e3SKm4QNYqEp0HOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94744773"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="94744773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 10:52:27 -0800
X-CSE-ConnectionGUID: HVOYSGJCTGqCu6xEgvroIQ==
X-CSE-MsgGUID: JtWuuvgmSFSGdd0p4JRZOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="211919746"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2026 10:52:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqbnc-00000000sSu-0zp6;
	Thu, 12 Feb 2026 18:52:24 +0000
Date: Fri, 13 Feb 2026 02:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 3/3] net: usb: usbnet: remove driver_priv
Message-ID: <202602130213.zIDtfW6G-lkp@intel.com>
References: <20260210151416.42254-4-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210151416.42254-4-oneukum@suse.com>

Hi Oliver,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/net-usb-divorce-private-data-and-cdc-state-in-usbnet/20260210-231805
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260210151416.42254-4-oneukum%40suse.com
patch subject: [RFC net-next 3/3] net: usb: usbnet: remove driver_priv
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260213/202602130213.zIDtfW6G-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130213.zIDtfW6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130213.zIDtfW6G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/usb/aqc111.c:734:30: warning: variable 'aqc111_data' is uninitialized when used here [-Wuninitialized]
     734 |         aqc111_read_fw_version(dev, aqc111_data);
         |                                     ^~~~~~~~~~~
   drivers/net/usb/aqc111.c:689:33: note: initialize the variable 'aqc111_data' to silence this warning
     689 |         struct aqc111_data *aqc111_data;
         |                                        ^
         |                                         = NULL
   1 warning generated.


vim +/aqc111_data +734 drivers/net/usb/aqc111.c

33cd597fbfe00d Dmitry Bezrukov 2018-11-26  684  
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  685  static int aqc111_bind(struct usbnet *dev, struct usb_interface *intf)
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  686  {
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  687  	struct usb_device *udev = interface_to_usbdev(intf);
7b8b06544ab035 Dmitry Bezrukov 2018-11-26  688  	enum usb_device_speed usb_speed = udev->speed;
33cd597fbfe00d Dmitry Bezrukov 2018-11-26  689  	struct aqc111_data *aqc111_data;
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  690  	int ret;
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  691  
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  692  	/* Check if vendor configuration */
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  693  	if (udev->actconfig->desc.bConfigurationValue != 1) {
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  694  		usb_driver_set_configuration(udev, 1);
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  695  		return -ENODEV;
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  696  	}
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  697  
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  698  	usb_reset_configuration(dev->udev);
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  699  
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  700  	ret = usbnet_get_endpoints(dev, intf);
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  701  	if (ret < 0) {
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  702  		netdev_dbg(dev->net, "usbnet_get_endpoints failed");
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  703  		return ret;
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  704  	}
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  705  
df2d59a2ab6c9c Dmitry Bezrukov 2018-11-26  706  	/* Init the MAC address */
df2d59a2ab6c9c Dmitry Bezrukov 2018-11-26  707  	ret = aqc111_read_perm_mac(dev);
df2d59a2ab6c9c Dmitry Bezrukov 2018-11-26  708  	if (ret)
df2d59a2ab6c9c Dmitry Bezrukov 2018-11-26  709  		goto out;
df2d59a2ab6c9c Dmitry Bezrukov 2018-11-26  710  
af804e6db9f60b Jakub Kicinski  2021-10-01  711  	eth_hw_addr_set(dev->net, dev->net->perm_addr);
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  712  
361459cd964263 Dmitry Bezrukov 2018-11-26  713  	/* Set Rx urb size */
361459cd964263 Dmitry Bezrukov 2018-11-26  714  	dev->rx_urb_size = URB_SIZE;
361459cd964263 Dmitry Bezrukov 2018-11-26  715  
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  716  	/* Set TX needed headroom & tailroom */
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  717  	dev->net->needed_headroom += sizeof(u64);
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  718  	dev->net->needed_tailroom += sizeof(u64);
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  719  
a4017cc264c66b Dmitry Bezrukov 2018-11-26  720  	dev->net->max_mtu = 16334;
a4017cc264c66b Dmitry Bezrukov 2018-11-26  721  
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  722  	dev->net->netdev_ops = &aqc111_netdev_ops;
027e6f7800e5ff Dmitry Bezrukov 2018-11-26  723  	dev->net->ethtool_ops = &aqc111_ethtool_ops;
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  724  
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  725  	if (usb_device_no_sg_constraint(dev->udev))
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  726  		dev->can_dma_sg = 1;
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  727  
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  728  	dev->net->hw_features |= AQ_SUPPORT_HW_FEATURE;
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  729  	dev->net->features |= AQ_SUPPORT_FEATURE;
7afa6c9803eac4 Dmitry Bezrukov 2018-11-26  730  	dev->net->vlan_features |= AQ_SUPPORT_VLAN_FEATURE;
4a3576d2bcc755 Dmitry Bezrukov 2018-11-26  731  
ee8b7a1156f357 Jakub Kicinski  2022-05-05  732  	netif_set_tso_max_size(dev->net, 65535);
de074e7a7e20f0 Dmitry Bezrukov 2018-11-26  733  
33cd597fbfe00d Dmitry Bezrukov 2018-11-26 @734  	aqc111_read_fw_version(dev, aqc111_data);
7b8b06544ab035 Dmitry Bezrukov 2018-11-26  735  	aqc111_data->autoneg = AUTONEG_ENABLE;
7b8b06544ab035 Dmitry Bezrukov 2018-11-26  736  	aqc111_data->advertised_speed = (usb_speed == USB_SPEED_SUPER) ?
7b8b06544ab035 Dmitry Bezrukov 2018-11-26  737  					 SPEED_5000 : SPEED_1000;
33cd597fbfe00d Dmitry Bezrukov 2018-11-26  738  
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  739  	return 0;
df2d59a2ab6c9c Dmitry Bezrukov 2018-11-26  740  
df2d59a2ab6c9c Dmitry Bezrukov 2018-11-26  741  out:
df2d59a2ab6c9c Dmitry Bezrukov 2018-11-26  742  	return ret;
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  743  }
7cea2d40afd053 Dmitry Bezrukov 2018-11-26  744  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
