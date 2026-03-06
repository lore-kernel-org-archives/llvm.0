Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D0639890F;
	Fri,  6 Mar 2026 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807690; cv=none; b=MH2GTOoluofIxhZTO0dO1HU/Wrz6RPYOiwDptidAmVwPLUpG9buknz+WYiZi9lQ1Ea3c+7x7yOoh59pDf7a70C8tDb01csINFeRDTYkG2mkTa44PZsjiUPms7IIhUTB33KpE924JKELXTop1ssO9ecafq9GSWOOcC+WfeebMHa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807690; c=relaxed/simple;
	bh=1Mq6xx0eUnZ8jBPDmvlPlwPIaJlNudib6W5ATJ4WkNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMuN5f07WKP6PKzA/aF4I72yU7qiA94v1V9I6e41hL3osVED/zhtotEz6XzuaH7QKXMr3CPglwTsvNYZ60WjVucKFmoHUVIQAlKeMezs3yNLrRSJTrK+F1SKiRYN3sDjTnc58reCRsWr5ty/kCRwhjkirIhOHamfMWr5JTK8cBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkyP00Oj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkyP00Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772807689; x=1804343689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1Mq6xx0eUnZ8jBPDmvlPlwPIaJlNudib6W5ATJ4WkNk=;
  b=XkyP00Oj2PHnoA4HLOXZzcg8GV7DRG7vf6BaXag/tk6NEv7ADnS3Bnje
   y5mHy94H6Q8QRTXSIvvN6MknTY0St+rY54iqHC7Q1b8/tj+hcpCcz1WIQ
   gPbEVtthC+V3c8BP+ARJLX+0lsKC839Ytuw02COfkkMQD7OqtKRYWj8XU
   x6p5le9BiRNFV/lfc2A8FQM3gAYZ2OTrHbCLey+PIsy/REpuiOrqdjKQZ
   8/OAOSteZWNQuaXMFBXTRL/n8DZJjpFtrjl1FnCJuto5ZwFDmD89iqJdT
   JbKqJWw3ngsP4J9GWHWXe9Ed6LVB7MIsATVEbDNvr99n+ABsfVV1wGcV8
   g==;
X-CSE-ConnectionGUID: ZFuXrQWGQ+6e4vuFkNOlNw==
X-CSE-MsgGUID: tJ+GvwHsRsGEtirRqs1QbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77785810"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77785810"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:34:48 -0800
X-CSE-ConnectionGUID: kv90EREVS/KxwnEIR/mPtw==
X-CSE-MsgGUID: s/I2Wq/SRJi1vSUJIseemA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="245302381"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Mar 2026 06:34:47 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyWGK-000000000wP-2cqn;
	Fri, 06 Mar 2026 14:34:44 +0000
Date: Fri, 6 Mar 2026 22:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFCv2 10/13] net: usb: sierra_net: use dynamic private
 allocation
Message-ID: <202603062230.ckj9QzU3-lkp@intel.com>
References: <20260303145242.1377514-10-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303145242.1377514-10-oneukum@suse.com>

Hi Oliver,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/net-usb-move-updating-filter-and-status-from-cdc-to-usbnet/20260303-230347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260303145242.1377514-10-oneukum%40suse.com
patch subject: [RFCv2 10/13] net: usb: sierra_net: use dynamic private allocation
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603062230.ckj9QzU3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062230.ckj9QzU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062230.ckj9QzU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/usb/sierra_net.c:676:2: warning: variable 'priv' is uninitialized when used here [-Wuninitialized]
     676 |         priv->usbnet = dev;
         |         ^~~~
   drivers/net/usb/sierra_net.c:645:30: note: initialize the variable 'priv' to silence this warning
     645 |         struct sierra_net_data *priv;
         |                                     ^
         |                                      = NULL
   1 warning generated.


vim +/priv +676 drivers/net/usb/sierra_net.c

eb4fd8cd355c8e Elina Pasheva  2010-04-27  635  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  636  /*
eb4fd8cd355c8e Elina Pasheva  2010-04-27  637   * collects the bulk endpoints, the status endpoint.
eb4fd8cd355c8e Elina Pasheva  2010-04-27  638   */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  639  static int sierra_net_bind(struct usbnet *dev, struct usb_interface *intf)
eb4fd8cd355c8e Elina Pasheva  2010-04-27  640  {
eb4fd8cd355c8e Elina Pasheva  2010-04-27  641  	u8	ifacenum;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  642  	u8	numendpoints;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  643  	u16	fwattr = 0;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  644  	int	status;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  645  	struct sierra_net_data *priv;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  646  	static const u8 sync_tmplate[sizeof(priv->sync_msg)] = {
eb4fd8cd355c8e Elina Pasheva  2010-04-27  647  		0x00, 0x00, SIERRA_NET_HIP_MSYNC_ID, 0x00};
eb4fd8cd355c8e Elina Pasheva  2010-04-27  648  	static const u8 shdwn_tmplate[sizeof(priv->shdwn_msg)] = {
eb4fd8cd355c8e Elina Pasheva  2010-04-27  649  		0x00, 0x00, SIERRA_NET_HIP_SHUTD_ID, 0x00};
2674e7ea22ba0e Jakub Kicinski 2021-10-21  650  	u8 mod[2];
eb4fd8cd355c8e Elina Pasheva  2010-04-27  651  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  652  	dev_dbg(&dev->udev->dev, "%s", __func__);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  653  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  654  	ifacenum = intf->cur_altsetting->desc.bInterfaceNumber;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  655  	numendpoints = intf->cur_altsetting->desc.bNumEndpoints;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  656  	/* We have three endpoints, bulk in and out, and a status */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  657  	if (numendpoints != 3) {
eb4fd8cd355c8e Elina Pasheva  2010-04-27  658  		dev_err(&dev->udev->dev, "Expected 3 endpoints, found: %d",
eb4fd8cd355c8e Elina Pasheva  2010-04-27  659  			numendpoints);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  660  		return -ENODEV;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  661  	}
eb4fd8cd355c8e Elina Pasheva  2010-04-27  662  	/* Status endpoint set in usbnet_get_endpoints() */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  663  	dev->status = NULL;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  664  	status = usbnet_get_endpoints(dev, intf);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  665  	if (status < 0) {
eb4fd8cd355c8e Elina Pasheva  2010-04-27  666  		dev_err(&dev->udev->dev, "Error in usbnet_get_endpoints (%d)",
eb4fd8cd355c8e Elina Pasheva  2010-04-27  667  			status);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  668  		return -ENODEV;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  669  	}
4c4ca3c4616751 Oliver Neukum  2025-07-14  670  	if (!dev->status) {
4c4ca3c4616751 Oliver Neukum  2025-07-14  671  		dev_err(&dev->udev->dev, "No status endpoint found");
4c4ca3c4616751 Oliver Neukum  2025-07-14  672  		return -ENODEV;
4c4ca3c4616751 Oliver Neukum  2025-07-14  673  	}
eb4fd8cd355c8e Elina Pasheva  2010-04-27  674  
afc3f379a3ba33 Oliver Neukum  2026-03-03  675  	/* Initialize sierra private data */
eb4fd8cd355c8e Elina Pasheva  2010-04-27 @676  	priv->usbnet = dev;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  677  	priv->ifnum = ifacenum;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  678  	dev->net->netdev_ops = &sierra_net_device_ops;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  679  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  680  	/* change MAC addr to include, ifacenum, and to be unique */
2674e7ea22ba0e Jakub Kicinski 2021-10-21  681  	mod[0] = atomic_inc_return(&iface_counter);
2674e7ea22ba0e Jakub Kicinski 2021-10-21  682  	mod[1] = ifacenum;
2674e7ea22ba0e Jakub Kicinski 2021-10-21  683  	dev_addr_mod(dev->net, ETH_ALEN - 2, mod, 2);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  684  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  685  	/* prepare shutdown message template */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  686  	memcpy(priv->shdwn_msg, shdwn_tmplate, sizeof(priv->shdwn_msg));
eb4fd8cd355c8e Elina Pasheva  2010-04-27  687  	/* set context index initially to 0 - prepares tx hdr template */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  688  	sierra_net_set_ctx_index(priv, 0);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  689  
7b0c5f21f348a6 Dan Williams   2013-05-06  690  	/* prepare sync message template */
7b0c5f21f348a6 Dan Williams   2013-05-06  691  	memcpy(priv->sync_msg, sync_tmplate, sizeof(priv->sync_msg));
7b0c5f21f348a6 Dan Williams   2013-05-06  692  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  693  	/* decrease the rx_urb_size and max_tx_size to 4k on USB 1.1 */
5aee07281b2aa9 Bjørn Mork     2012-09-02  694  	dev->rx_urb_size  = SIERRA_NET_RX_URB_SIZE;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  695  	if (dev->udev->speed != USB_SPEED_HIGH)
5aee07281b2aa9 Bjørn Mork     2012-09-02  696  		dev->rx_urb_size  = min_t(size_t, 4096, SIERRA_NET_RX_URB_SIZE);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  697  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  698  	dev->net->hard_header_len += SIERRA_NET_HIP_EXT_HDR_LEN;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  699  	dev->hard_mtu = dev->net->mtu + dev->net->hard_header_len;
f77f0aee4da4be Jarod Wilson   2016-10-20  700  	dev->net->max_mtu = SIERRA_NET_MAX_SUPPORTED_MTU;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  701  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  702  	/* Set up the netdev */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  703  	dev->net->flags |= IFF_NOARP;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  704  	dev->net->ethtool_ops = &sierra_net_ethtool_ops;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  705  	netif_carrier_off(dev->net);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  706  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  707  	priv->kevent_flags = 0;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  708  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  709  	/* Use the shared workqueue */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  710  	INIT_WORK(&priv->sierra_net_kevent, sierra_net_kevent);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  711  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  712  	/* Only need to do this once */
d28bb967aa928d Kees Cook      2017-10-16  713  	timer_setup(&priv->sync_timer, sierra_sync_timer, 0);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  714  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  715  	/* verify fw attributes */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  716  	status = sierra_net_get_fw_attr(dev, &fwattr);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  717  	dev_dbg(&dev->udev->dev, "Fw attr: %x\n", fwattr);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  718  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  719  	/* test whether firmware supports DHCP */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  720  	if (!(status == sizeof(fwattr) && (fwattr & SWI_GET_FW_ATTR_MASK))) {
eb4fd8cd355c8e Elina Pasheva  2010-04-27  721  		/* found incompatible firmware version */
eb4fd8cd355c8e Elina Pasheva  2010-04-27  722  		dev_err(&dev->udev->dev, "Incompatible driver and firmware"
eb4fd8cd355c8e Elina Pasheva  2010-04-27  723  			" versions\n");
eb4fd8cd355c8e Elina Pasheva  2010-04-27  724  		kfree(priv);
eb4fd8cd355c8e Elina Pasheva  2010-04-27  725  		return -ENODEV;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  726  	}
6f1464bf65fcaa Elina Pasheva  2010-04-28  727  
eb4fd8cd355c8e Elina Pasheva  2010-04-27  728  	return 0;
eb4fd8cd355c8e Elina Pasheva  2010-04-27  729  }
eb4fd8cd355c8e Elina Pasheva  2010-04-27  730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
