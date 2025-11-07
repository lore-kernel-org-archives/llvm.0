Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977472FD68F;
	Fri,  7 Nov 2025 22:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762555778; cv=none; b=soyHadajbEqHAEfRSwYy11HZUuU1C373P+skPxKCCiKJp87mEP+YLXcgwB8TPappEmArQo0DpC9huH5w0iCmYJyHtutez5aNmr3vouuh7TzviQNuKy1hpv7B0yInyXwDs42OAFx8sxUqFRTsQHqnDUG7fjErB3CHOsnqZHX1gJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762555778; c=relaxed/simple;
	bh=gw6oG3QI9N3k+DjBmZ6zNjL9yJC0i0iwK8nhXShn4js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cu90Ha8qRAT7NTh2W5V5DL6LVSdIjGiCVfdHdhnup1cF3hy2AxH0Dqg8vp6CrMBNAdpox5T21ELSyO1U2VgU0kx0AqN/nvtvNitpP94hFsgUC3SHSDeRZ0K9McFqz7wXaf5/jpUH657XMeydXrvlLOToUhZCm42HQGWwsTDHQUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbgmCMl2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbgmCMl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762555776; x=1794091776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gw6oG3QI9N3k+DjBmZ6zNjL9yJC0i0iwK8nhXShn4js=;
  b=YbgmCMl2I2apbSHNB8mFzPU7Es0qkr13E4CfsXbNwp7vC81oqZKDRfrP
   cNEFV/M7XPfxUO+R3ceJo97YcBBlhhSdxb38lMOQv29mzJRS+adjAgZu/
   5Pw3qIif+8vXX2FsnDKiBQn1VrIOtDvnYiAIgU/Qn1oJYWWLc3IFkcuQi
   O3WqFW44jRoGonLa/kUgLqlRuyEP1pNREAaMr+6NLngNncuEEfxTC6LFN
   TOq/dCsstb+fmf6aeFnldTkNtNuYtmjp9Lf1+YbO3UP9q+63Q8G/wNN+C
   Ym2cswtIsTIxx/9CWGF2Ig5qr4XVWsNGzb1NsT3dXrS+QlslnNFEJAWST
   g==;
X-CSE-ConnectionGUID: l8JJWaiqQt61IFJ5CB1NTg==
X-CSE-MsgGUID: 3C8sJrRdQyS0g4TQIUKGxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64617121"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64617121"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 14:49:35 -0800
X-CSE-ConnectionGUID: U2PjCKWGRVqtXukWGrNxxQ==
X-CSE-MsgGUID: 86VRHFJ9TcODZ2zOopLnog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="188868566"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2025 14:49:33 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHVGt-0000Qu-0q;
	Fri, 07 Nov 2025 22:49:31 +0000
Date: Sat, 8 Nov 2025 06:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 4684/7207]
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c:80:3: error: call to undeclared
 function 'drm_err'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202511080858.FWtHMMlX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c0826a5d9aa4d52206dd89976858457a2a8a7ed
commit: ea722522d505fa8fb3533a386adeb400607e5072 [4684/7207] drm/mm: replace drm_print.h include with a forward declaration
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511080858.FWtHMMlX-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080858.FWtHMMlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080858.FWtHMMlX-lkp@intel.com/

Note: the linux-next/master HEAD 9c0826a5d9aa4d52206dd89976858457a2a8a7ed builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:80:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |                 drm_err(dev, "Failed to allocate mmio\n");
         |                 ^
   drivers/gpu/drm/hyperv/hyperv_drm_drv.c:91:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      91 |                 drm_err(dev, "Failed to map vram\n");
         |                 ^
   drivers/gpu/drm/hyperv/hyperv_drm_drv.c:123:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     123 |                 drm_err(dev, "Failed to connect to vmbus.\n");
         |                 ^
>> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:140:3: error: call to undeclared function 'drm_warn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |                 drm_warn(dev, "Failed to update vram location.\n");
         |                 ^
   drivers/gpu/drm/hyperv/hyperv_drm_drv.c:148:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     148 |                 drm_err(dev, "Failed to register drm driver.\n");
         |                 ^
   5 errors generated.
--
>> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:161:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     161 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%d (pitch %d) greater than %ld\n",
         |                 ^
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:278:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     278 |                 drm_err(dev, "Failed to initialized connector.\n");
         |                 ^
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:311:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     311 |                 drm_err(dev, "Failed to initialized mode setting.\n");
         |                 ^
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:327:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     327 |                 drm_err(dev, "Failed to initialized pipe.\n");
         |                 ^
   4 errors generated.
--
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:215:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     215 |                 DRM_ERROR("unsupported format[%08x]\n", format);
         |                 ^
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:395:5: error: call to undeclared function 'drm_dbg_kms'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     395 |                                 drm_dbg_kms(vop2->drm,
         |                                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:405:5: error: call to undeclared function 'drm_dbg_kms'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     405 |                                 drm_dbg_kms(vop2->drm, "Only support 32 bpp format with afbc\n");
         |                                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:415:3: error: call to undeclared function 'drm_dbg_kms'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     415 |                 drm_dbg_kms(vop2->drm, "Unsupported format modifier 0x%llx\n",
         |                 ^
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:602:4: error: call to undeclared function 'drm_dbg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     602 |                         drm_dbg(vop2->drm, "%s dst_w[%d] should align as 2 pixel\n",
         |                         ^
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:763:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     763 |                 drm_err(vop2->drm, "failed to enable hclk - %d\n", ret);
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:769:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     769 |                 drm_err(vop2->drm, "failed to enable aclk - %d\n", ret);
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:775:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     775 |                 drm_err(vop2->drm, "failed to enable pclk - %d\n", ret);
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:806:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     806 |                 drm_err(vop2->drm, "failed to get pm runtime: %d\n", ret);
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:818:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     818 |                 drm_err(vop2->drm, "failed to attach dma mapping, %d\n", ret);
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:824:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     824 |                 drm_err(vop2->drm, "Hardware version(0x%08x) mismatch\n", version);
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:896:3: error: call to undeclared function 'drm_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     896 |                 drm_err(vp->vop2->drm, "display LUT RAM enable timeout!\n");
         |                 ^
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:967:3: error: call to undeclared function 'drm_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     967 |                 drm_info(vop2->drm, "wait for vp%d dsp_hold timeout\n", vp->id);
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1043:3: error: call to undeclared function 'drm_dbg_kms'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1043 |                 drm_dbg_kms(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1050:3: error: call to undeclared function 'drm_dbg_kms'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1050 |                 drm_dbg_kms(vop2->drm, "Invalid source: %dx%d. max input: %dx%d\n",
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1062:3: error: call to undeclared function 'drm_dbg_kms'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1062 |                 drm_dbg_kms(vop2->drm, "Invalid Source: Yuv format not support odd xpos\n");
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1076:2: error: call to undeclared function 'drm_dbg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1076 |         drm_dbg(vop2->drm, "%s disable\n", win->data->name);
         |         ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1217:3: error: call to undeclared function 'drm_dbg_kms'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1217 |                 drm_dbg_kms(vop2->drm,
         |                 ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1229:3: error: call to undeclared function 'drm_dbg_kms'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1229 |                 drm_dbg_kms(vop2->drm,
         |                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c:173:2: error: call to undeclared function 'drm_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
         |         ^
   1 error generated.


vim +/drm_err +80 drivers/gpu/drm/hyperv/hyperv_drm_drv.c

76c56a5affeba1 Deepak Rawat       2021-05-27   68  
a0ab5abced550d Saurabh Sengar     2022-05-21   69  static int hyperv_setup_vram(struct hyperv_drm_device *hv,
76c56a5affeba1 Deepak Rawat       2021-05-27   70  			     struct hv_device *hdev)
76c56a5affeba1 Deepak Rawat       2021-05-27   71  {
76c56a5affeba1 Deepak Rawat       2021-05-27   72  	struct drm_device *dev = &hv->dev;
76c56a5affeba1 Deepak Rawat       2021-05-27   73  	int ret;
76c56a5affeba1 Deepak Rawat       2021-05-27   74  
76c56a5affeba1 Deepak Rawat       2021-05-27   75  	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
76c56a5affeba1 Deepak Rawat       2021-05-27   76  
76c56a5affeba1 Deepak Rawat       2021-05-27   77  	ret = vmbus_allocate_mmio(&hv->mem, hdev, 0, -1, hv->fb_size, 0x100000,
76c56a5affeba1 Deepak Rawat       2021-05-27   78  				  true);
76c56a5affeba1 Deepak Rawat       2021-05-27   79  	if (ret) {
76c56a5affeba1 Deepak Rawat       2021-05-27  @80  		drm_err(dev, "Failed to allocate mmio\n");
76c56a5affeba1 Deepak Rawat       2021-05-27   81  		return -ENOMEM;
76c56a5affeba1 Deepak Rawat       2021-05-27   82  	}
76c56a5affeba1 Deepak Rawat       2021-05-27   83  
76c56a5affeba1 Deepak Rawat       2021-05-27   84  	/*
76c56a5affeba1 Deepak Rawat       2021-05-27   85  	 * Map the VRAM cacheable for performance. This is also required for VM
76c56a5affeba1 Deepak Rawat       2021-05-27   86  	 * connect to display properly for ARM64 Linux VM, as the host also maps
76c56a5affeba1 Deepak Rawat       2021-05-27   87  	 * the VRAM cacheable.
76c56a5affeba1 Deepak Rawat       2021-05-27   88  	 */
76c56a5affeba1 Deepak Rawat       2021-05-27   89  	hv->vram = ioremap_cache(hv->mem->start, hv->fb_size);
76c56a5affeba1 Deepak Rawat       2021-05-27   90  	if (!hv->vram) {
76c56a5affeba1 Deepak Rawat       2021-05-27   91  		drm_err(dev, "Failed to map vram\n");
76c56a5affeba1 Deepak Rawat       2021-05-27   92  		ret = -ENOMEM;
76c56a5affeba1 Deepak Rawat       2021-05-27   93  		goto error;
76c56a5affeba1 Deepak Rawat       2021-05-27   94  	}
76c56a5affeba1 Deepak Rawat       2021-05-27   95  
76c56a5affeba1 Deepak Rawat       2021-05-27   96  	hv->fb_base = hv->mem->start;
76c56a5affeba1 Deepak Rawat       2021-05-27   97  	return 0;
76c56a5affeba1 Deepak Rawat       2021-05-27   98  
76c56a5affeba1 Deepak Rawat       2021-05-27   99  error:
76c56a5affeba1 Deepak Rawat       2021-05-27  100  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
76c56a5affeba1 Deepak Rawat       2021-05-27  101  	return ret;
76c56a5affeba1 Deepak Rawat       2021-05-27  102  }
76c56a5affeba1 Deepak Rawat       2021-05-27  103  
76c56a5affeba1 Deepak Rawat       2021-05-27  104  static int hyperv_vmbus_probe(struct hv_device *hdev,
76c56a5affeba1 Deepak Rawat       2021-05-27  105  			      const struct hv_vmbus_device_id *dev_id)
76c56a5affeba1 Deepak Rawat       2021-05-27  106  {
76c56a5affeba1 Deepak Rawat       2021-05-27  107  	struct hyperv_drm_device *hv;
76c56a5affeba1 Deepak Rawat       2021-05-27  108  	struct drm_device *dev;
76c56a5affeba1 Deepak Rawat       2021-05-27  109  	int ret;
76c56a5affeba1 Deepak Rawat       2021-05-27  110  
76c56a5affeba1 Deepak Rawat       2021-05-27  111  	hv = devm_drm_dev_alloc(&hdev->device, &hyperv_driver,
76c56a5affeba1 Deepak Rawat       2021-05-27  112  				struct hyperv_drm_device, dev);
76c56a5affeba1 Deepak Rawat       2021-05-27  113  	if (IS_ERR(hv))
76c56a5affeba1 Deepak Rawat       2021-05-27  114  		return PTR_ERR(hv);
76c56a5affeba1 Deepak Rawat       2021-05-27  115  
76c56a5affeba1 Deepak Rawat       2021-05-27  116  	dev = &hv->dev;
76c56a5affeba1 Deepak Rawat       2021-05-27  117  	init_completion(&hv->wait);
76c56a5affeba1 Deepak Rawat       2021-05-27  118  	hv_set_drvdata(hdev, hv);
76c56a5affeba1 Deepak Rawat       2021-05-27  119  	hv->hdev = hdev;
76c56a5affeba1 Deepak Rawat       2021-05-27  120  
76c56a5affeba1 Deepak Rawat       2021-05-27  121  	ret = hyperv_connect_vsp(hdev);
76c56a5affeba1 Deepak Rawat       2021-05-27  122  	if (ret) {
76c56a5affeba1 Deepak Rawat       2021-05-27  123  		drm_err(dev, "Failed to connect to vmbus.\n");
76c56a5affeba1 Deepak Rawat       2021-05-27  124  		goto err_hv_set_drv_data;
76c56a5affeba1 Deepak Rawat       2021-05-27  125  	}
76c56a5affeba1 Deepak Rawat       2021-05-27  126  
37aeccf5f839c1 Thomas Zimmermann  2024-09-30  127  	aperture_remove_all_conflicting_devices(hyperv_driver.name);
778e73d2411abc Thomas Zimmermann  2024-01-03  128  
a0ab5abced550d Saurabh Sengar     2022-05-21  129  	ret = hyperv_setup_vram(hv, hdev);
76c56a5affeba1 Deepak Rawat       2021-05-27  130  	if (ret)
76c56a5affeba1 Deepak Rawat       2021-05-27  131  		goto err_vmbus_close;
76c56a5affeba1 Deepak Rawat       2021-05-27  132  
76c56a5affeba1 Deepak Rawat       2021-05-27  133  	/*
76c56a5affeba1 Deepak Rawat       2021-05-27  134  	 * Should be done only once during init and resume. Failing to update
76c56a5affeba1 Deepak Rawat       2021-05-27  135  	 * vram location is not fatal. Device will update dirty area till
76c56a5affeba1 Deepak Rawat       2021-05-27  136  	 * preferred resolution only.
76c56a5affeba1 Deepak Rawat       2021-05-27  137  	 */
76c56a5affeba1 Deepak Rawat       2021-05-27  138  	ret = hyperv_update_vram_location(hdev, hv->fb_base);
76c56a5affeba1 Deepak Rawat       2021-05-27  139  	if (ret)
76c56a5affeba1 Deepak Rawat       2021-05-27 @140  		drm_warn(dev, "Failed to update vram location.\n");
76c56a5affeba1 Deepak Rawat       2021-05-27  141  
76c56a5affeba1 Deepak Rawat       2021-05-27  142  	ret = hyperv_mode_config_init(hv);
76c56a5affeba1 Deepak Rawat       2021-05-27  143  	if (ret)
f1f63cbb705dc3 Christophe JAILLET 2022-07-31  144  		goto err_free_mmio;
76c56a5affeba1 Deepak Rawat       2021-05-27  145  
76c56a5affeba1 Deepak Rawat       2021-05-27  146  	ret = drm_dev_register(dev, 0);
76c56a5affeba1 Deepak Rawat       2021-05-27  147  	if (ret) {
76c56a5affeba1 Deepak Rawat       2021-05-27  148  		drm_err(dev, "Failed to register drm driver.\n");
f1f63cbb705dc3 Christophe JAILLET 2022-07-31  149  		goto err_free_mmio;
76c56a5affeba1 Deepak Rawat       2021-05-27  150  	}
76c56a5affeba1 Deepak Rawat       2021-05-27  151  
663269cebc7157 Thomas Zimmermann  2024-09-24  152  	drm_client_setup(dev, NULL);
76c56a5affeba1 Deepak Rawat       2021-05-27  153  
76c56a5affeba1 Deepak Rawat       2021-05-27  154  	return 0;
76c56a5affeba1 Deepak Rawat       2021-05-27  155  
f1f63cbb705dc3 Christophe JAILLET 2022-07-31  156  err_free_mmio:
aed709355fd05e Michael Kelley     2025-02-10  157  	iounmap(hv->vram);
f1f63cbb705dc3 Christophe JAILLET 2022-07-31  158  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
76c56a5affeba1 Deepak Rawat       2021-05-27  159  err_vmbus_close:
76c56a5affeba1 Deepak Rawat       2021-05-27  160  	vmbus_close(hdev->channel);
76c56a5affeba1 Deepak Rawat       2021-05-27  161  err_hv_set_drv_data:
76c56a5affeba1 Deepak Rawat       2021-05-27  162  	hv_set_drvdata(hdev, NULL);
76c56a5affeba1 Deepak Rawat       2021-05-27  163  	return ret;
76c56a5affeba1 Deepak Rawat       2021-05-27  164  }
76c56a5affeba1 Deepak Rawat       2021-05-27  165  

:::::: The code at line 80 was first introduced by commit
:::::: 76c56a5affeba1e163b66b9d8cc192e6154466f0 drm/hyperv: Add DRM driver for hyperv synthetic video device

:::::: TO: Deepak Rawat <drawat.floss@gmail.com>
:::::: CC: Deepak Rawat <drawat.floss@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
