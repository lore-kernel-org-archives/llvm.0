Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F4257ACF;
	Tue, 22 Jul 2025 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197598; cv=none; b=UE6+I/84OxMgdH+P7Fgcaxr6Vs16bPlCuMHES3OeRbzawFL47KdAAJIbt4pEaSLJBba3GiGn1MAWjsGiNkN19o2bP8eACtA1a2NSUubRc/bz4xdQqSZA1mRtdUIJGlSF4rOB4uPiRvw4r3TuaCTw/qNYDXbE1a9eVZdttXy84fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197598; c=relaxed/simple;
	bh=+sGqgGjgNmnjMLda+apmd8ND1PGuNPsgCimJgbyGk7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hOEbUvLwtbw8Cnze9oVQmR5Zz5pCRe0hJCQWpDyiCTn/8CLVrNE89oP26hm2E8RT2q/FmJPpLQ+mZ49fW9hxc5fbearMnScdU6dKDSs2y7ITz4KsA63DslxGUIgIlI8sF0XnR1ylSiOPPChpxGG+RKoNy2S9M3x3F5ya/o/FXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uz3LmLj1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uz3LmLj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753197596; x=1784733596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+sGqgGjgNmnjMLda+apmd8ND1PGuNPsgCimJgbyGk7c=;
  b=Uz3LmLj1c1BjNjuPjCV2Wyat9KuNAISD1j6mTVQ6zFvwKUV23jkw+vce
   Ql4n+PVyq25ebCxO02i+ydKb8smyKFXoM8V8uoEVOqE+GI12i6TYHNzEt
   gTRzeVqNS7mhpDEtMs7I5/CWwf14MM5LGV1g2C26KsSRuA88LeVYrBHg+
   Wza1a7MfrpQ3jz9NQuLkpnB3+oN5Hucbn0/9xo3wKqKLenGKiZ1azZgxD
   354QlVqBhYGL4EfSlD98LfeBaEWDmBrVqMsocqfmt0uleAj4HHv0hTRmY
   M4SmotygfANE1jJQ2PUROxrhRRwgx4S+ldh5QuxZ711QhU4rBYQI6CHRg
   g==;
X-CSE-ConnectionGUID: avK7V8dsQLeM+CVONluCOA==
X-CSE-MsgGUID: s1YwXJACThWFtwkQVVuywA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66139106"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="66139106"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 08:19:56 -0700
X-CSE-ConnectionGUID: 9DE0fK94Ry2JcwHou+v5wg==
X-CSE-MsgGUID: Xxcp89MjQdCNtvqUEpn02Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="158476000"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jul 2025 08:19:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueEmV-000ITD-3A;
	Tue, 22 Jul 2025 15:19:51 +0000
Date: Tue, 22 Jul 2025 23:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Hyeonki Hong <hhk7734@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.16.y 7/44]
 drivers/input/touchscreen/dwav-usb-mt.c:462:3: error: call to undeclared
 library function 'strlcpy' with type '__size_t (char *, const char *,
 __size_t)' (aka 'unsigned int (char *, const char *, unsigned int)'); ISO
 C99 and later do not support implicit ...
Message-ID: <202507222311.butw2vKW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   ac46a60ec2fb958f1dc2e5871e122abb98ac0da9
commit: 804dbb7299c970e3cb07ee5eac596f8ca42f620d [7/44] ODROID-COMMON: input/touchscreen: Add D-WAV Multitouch driver.
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250722/202507222311.butw2vKW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507222311.butw2vKW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222311.butw2vKW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/dwav-usb-mt.c:462:3: error: call to undeclared library function 'strlcpy' with type '__size_t (char *, const char *, __size_t)' (aka 'unsigned int (char *, const char *, unsigned int)'); ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
