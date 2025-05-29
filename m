Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CB7111AD;
	Thu, 29 May 2025 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748513040; cv=none; b=SK7IaBoQLrl0nhQ95+W5wcC2BKyKWz49Z/axq6kUQ5l8HzI3PSQSx2LNxrNQ9vWnkU6WRb1VTUytu75DC+ki/itmUH+gIDXbE1P2b1DV+RI96cY5y/ehDbfiiofjn3Mg9BigQtsj6YB6VUUDNGnws3fFXuVO5UunVDLjvxNv3/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748513040; c=relaxed/simple;
	bh=dsvOxLoMIo2iOEIC7hajf4cYPrzaoQ6AE01dQGtptvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=At/sO6zqT5rBHL2qBfVVvRAmvK7dp/5VqxrWFjnZaghe3+6djXraSyoF9c31Mh+KPO9Kg9Jh48QMAiQB1m+M0slgmSSeYwUQEZXvKjHcwe3VeY6LhaPZ3LbtgIkdEaxA2fRPgHjcmuM0x1J+mrQFPloSZePbzH+J+noq3a7RCFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiyvP83K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiyvP83K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748513038; x=1780049038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsvOxLoMIo2iOEIC7hajf4cYPrzaoQ6AE01dQGtptvo=;
  b=MiyvP83K3FQccL/oGNWLOgJDhW2F30PoN02buEceW7PB39yLYsyeY0xr
   RZEMiBMtGFhHp+XKVZ5umDochObxEKsyHkOBvX2agb1bFRCfbCQaOX+2y
   bIO1QhibxlbNhH7xpjJAbKIKsJT5gjzXMKlJ8DEovhHA2mqXU0YTx4o0r
   aV6EhUH3fpw5pCNeuRqZLwpjr2R45+eySRqqYyZD9PG+Ro7HH37E0ceJJ
   Vc0euJhr4IMWGUAMgFEa7ntmLQL2CddKjymeSECafHSbbBTn5pTbeLqL4
   dXCYO5BqED/c4SgQOYgv63G/DcgZIV7JPoEfWoE9TQw2bycmQgYCTkZBj
   g==;
X-CSE-ConnectionGUID: M7GzdOPfTnuzKBJuC5ZfYg==
X-CSE-MsgGUID: BxsMXyhPSCOpR0347zZDWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67987430"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="67987430"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 03:03:57 -0700
X-CSE-ConnectionGUID: JoS5pDiSTaeTzBXDgTLPkA==
X-CSE-MsgGUID: wDulgzV8TFyxKAWLWeAsuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="143499071"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 May 2025 03:03:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKa77-000WYK-1l;
	Thu, 29 May 2025 10:03:53 +0000
Date: Thu, 29 May 2025 18:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hyeonki Hong <hhk7734@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.15.y 7/42]
 drivers/input/touchscreen/dwav-usb-mt.c:462:3: error: call to undeclared
 library function 'strlcpy' with type 'unsigned int (char *, const char *,
 unsigned int)'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202505291708.pOUna8DN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.15.y
head:   62efa5294148d0ccb18203491839df4fb9dc18d1
commit: c289e7ada529d848e47a01543adbc1f2fa8da7e6 [7/42] ODROID-COMMON: input/touchscreen: Add D-WAV Multitouch driver.
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250529/202505291708.pOUna8DN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291708.pOUna8DN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291708.pOUna8DN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/dwav-usb-mt.c:462:3: error: call to undeclared library function 'strlcpy' with type 'unsigned int (char *, const char *, unsigned int)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     462 |                 strlcpy(dwav_usb_mt->name,
         |                 ^
   drivers/input/touchscreen/dwav-usb-mt.c:462:3: note: include the header <string.h> or explicitly provide a declaration for 'strlcpy'
   1 error generated.


vim +462 drivers/input/touchscreen/dwav-usb-mt.c

   397	
   398	static int dwav_usb_mt_probe(struct usb_interface *intf,
   399				  const struct usb_device_id *id)
   400	{
   401		struct dwav_usb_mt *dwav_usb_mt = NULL;
   402		struct input_dev *input_dev = NULL;
   403		struct usb_endpoint_descriptor *endpoint;
   404		struct usb_device *udev = interface_to_usbdev(intf);
   405	
   406		int err = 0;
   407	
   408		endpoint = dwav_usb_mt_get_input_endpoint(intf->cur_altsetting);
   409		if (!endpoint)
   410			return  -ENXIO;
   411	
   412		dwav_usb_mt = kzalloc(sizeof(struct dwav_usb_mt), GFP_KERNEL);
   413		if (!dwav_usb_mt)
   414			return  -ENOMEM;
   415	
   416		dwav_usb_mt->dev_id = id->driver_info;
   417	
   418		dwav_usb_mt->finger = kzalloc(sizeof(struct finger_t) *
   419					      DEV_INFO[dwav_usb_mt->dev_id].max_finger,
   420					      GFP_KERNEL);
   421	
   422		if (!dwav_usb_mt->finger)
   423			goto err_free_mem;
   424	
   425		input_dev = input_allocate_device();
   426		if (!input_dev)
   427			goto err_free_mem;
   428	
   429		dwav_usb_mt->data_size = sizeof(struct dwav_raw);
   430		dwav_usb_mt->data = usb_alloc_coherent(udev, dwav_usb_mt->data_size,
   431				GFP_KERNEL, &dwav_usb_mt->data_dma);
   432		if (!dwav_usb_mt->data)
   433			goto err_free_mem;
   434	
   435		dwav_usb_mt->irq = usb_alloc_urb(0, GFP_KERNEL);
   436		if (!dwav_usb_mt->irq) {
   437			dev_dbg(&intf->dev,
   438					"%s - usb_alloc_urb failed: usbtouch->irq\n",
   439					__func__);
   440			goto err_free_buffers;
   441		}
   442	
   443		if (usb_endpoint_type(endpoint) == USB_ENDPOINT_XFER_INT)   {
   444			usb_fill_int_urb(dwav_usb_mt->irq, udev,
   445				usb_rcvintpipe(udev, endpoint->bEndpointAddress),
   446				dwav_usb_mt->data, dwav_usb_mt->data_size,
   447				dwav_usb_mt_irq, dwav_usb_mt, endpoint->bInterval);
   448		} else {
   449			usb_fill_bulk_urb(dwav_usb_mt->irq, udev,
   450				 usb_rcvbulkpipe(udev, endpoint->bEndpointAddress),
   451				 dwav_usb_mt->data, dwav_usb_mt->data_size,
   452				 dwav_usb_mt_irq, dwav_usb_mt);
   453		}
   454	
   455		dwav_usb_mt->irq->dev = udev;
   456		dwav_usb_mt->irq->transfer_dma = dwav_usb_mt->data_dma;
   457		dwav_usb_mt->irq->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
   458	
   459		dwav_usb_mt->interface  = intf;
   460	
   461		if (udev->manufacturer)
 > 462			strlcpy(dwav_usb_mt->name,
   463					udev->manufacturer, sizeof(dwav_usb_mt->name));
   464	
   465		if (udev->product) {
   466			if (udev->manufacturer)
   467				strlcat(dwav_usb_mt->name,
   468						" ", sizeof(dwav_usb_mt->name));
   469	
   470			strlcat(dwav_usb_mt->name,
   471					udev->product, sizeof(dwav_usb_mt->name));
   472		}
   473	
   474		if (!strlen(dwav_usb_mt->name)) {
   475			snprintf(dwav_usb_mt->name, sizeof(dwav_usb_mt->name),
   476					"D-WAV Scientific MultiTouch %04x:%04x",
   477					le16_to_cpu(udev->descriptor.idVendor),
   478					le16_to_cpu(udev->descriptor.idProduct));
   479		}
   480	
   481		usb_make_path(udev, dwav_usb_mt->phys, sizeof(dwav_usb_mt->phys));
   482		strlcat(dwav_usb_mt->phys, "/input0", sizeof(dwav_usb_mt->phys));
   483	
   484		usb_to_input_id(udev, &input_dev->id);
   485	
   486		input_dev->dev.parent = &intf->dev;
   487	
   488		err = dwav_usb_mt_init(dwav_usb_mt, (void *)input_dev);
   489		if (err)
   490			goto err_free_urb;
   491	
   492		usb_set_intfdata(intf, dwav_usb_mt);
   493	
   494		dev_info(&intf->dev, "%s\n", DEV_INFO[dwav_usb_mt->dev_id].name);
   495	
   496		return 0;
   497	
   498	err_free_urb:
   499		usb_free_urb(dwav_usb_mt->irq);
   500	
   501	err_free_buffers:
   502		dwav_usb_mt_free_buffers(udev, dwav_usb_mt);
   503	
   504	err_free_mem:
   505		if (input_dev)
   506			input_free_device(input_dev);
   507		kfree(dwav_usb_mt);
   508	
   509		return err;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
