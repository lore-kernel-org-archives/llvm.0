Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084822AD33;
	Sat, 20 Apr 2024 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713640711; cv=none; b=Qe0OiCt7BLQlrdBveMZqVB2zTrRxFgsBRxufArPfAZ1fjw+cr87iI39YjaKdyclEd524ZDdT4thyQQIJbs3l8yrdaQh1FwDIh2ZbZkzcNTGF6DcAfOoyktercd7s2E2gWx/4nS+sH5ZKDQpXjOAvJHIIatGALjfjXI/J2sXpaFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713640711; c=relaxed/simple;
	bh=dzfsTT7OeVKToYll1jd812+BwTCYhJxVIqP4UfuPeOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWZOlS7HcTsgzCpGemd080dNy+aoa7H0bvI/NgKrwQCrM//Jn/xSsUseAFRp6hO0gn7DxH9KHaDbxG8PbgM/W5qjkcmhM8Gcn2jQnVRXzv+J93dnO3k59TunXHDYM7Uh7Oc+dOThbNExhfC2y3CV1/+i4DU+GMps+0m7PyCmKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBH2Zjox; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBH2Zjox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713640710; x=1745176710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dzfsTT7OeVKToYll1jd812+BwTCYhJxVIqP4UfuPeOQ=;
  b=fBH2ZjoxTdkDp+tUaEiwkqwMOcVN1Ltlxb9jb70pVQXkBqRbhiOlgE+I
   fiV8yv7Lj+EhjivQqDfh7ws6kPOYW9MI4nPAJqnzV1OoBzNq6bZNfQYeK
   50HVYi1UlaiwAiRqH7O8Zw3wGBiscU6laezbGoagf1EgKugN3Dh3bAbFU
   IW7v3WXNuJdnmdoQzUvaEZQ6StZFfHl11aS8ECzTKR4NQ6QXdHriw2SMk
   97nnSe64rsT3Rmka83hgCcEk5NMXPpEj3iDRkfczLggnmTMGhIcs2Cf2m
   1IIqPYfG2M/RD585ZVuDGeckqqoMDmkAAao7lzK7+OIxLXTrI8v/WJ2HV
   w==;
X-CSE-ConnectionGUID: R7CE8K1dTtyc7+OPp9usHg==
X-CSE-MsgGUID: maNoYkodTVa/lhZb/8YP3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="20646724"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="20646724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 12:18:30 -0700
X-CSE-ConnectionGUID: d2q8NSrTTc+u2UMQs7bLIA==
X-CSE-MsgGUID: +bUozVW/TG6aWAlutmVCAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="28411178"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Apr 2024 12:18:28 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryGED-000BRE-2X;
	Sat, 20 Apr 2024 19:18:25 +0000
Date: Sun, 21 Apr 2024 03:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_virtio_test 1/5] ERROR: modpost:
 "__register_virtio_driver" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
Message-ID: <202404210313.lnTmXWxt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_virtio_test
head:   e810345cfbf58ce6a60f67ae4095dc4cb9bf11af
commit: 95c9aa71b26340b2b6bdf6f0d2cc978c460446a3 [1/5] virtio: add debugfs infrastructure to allow to debug virtio features
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240421/202404210313.lnTmXWxt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404210313.lnTmXWxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404210313.lnTmXWxt-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/riscv/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_dma_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_obex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_ether.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ncm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_eem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm_subset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_rndis.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_mass_storage.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_fs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
>> ERROR: modpost: "__register_virtio_driver" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
>> ERROR: modpost: "unregister_virtio_driver" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
>> ERROR: modpost: "virtio_check_driver_offered_feature" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
>> ERROR: modpost: "virtio_reset_device" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
>> ERROR: modpost: "is_virtio_device" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
