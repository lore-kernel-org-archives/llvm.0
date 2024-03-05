Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7C159B76;
	Tue,  5 Mar 2024 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709644608; cv=none; b=R5iE9BE6RaEI5WeD8cJiyIq3hU5793eOT43ekcE1BUCnrE5t4iDO6BTd1YXBG5FAg4Oyka30gltAVANDCp0l/0wGdvzGqbn6FPp086mKSWZG5e7NxG6ejmjTTFh5E0HUxylZfEgh4NrSE7LV1GwY+RoLOHIr6WQ4g9xIHoxvS98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709644608; c=relaxed/simple;
	bh=b7rEagawPX23mE5pppXoyHfmTdvHgUzgExicL6517to=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQLZkVd+PtEBVgi/B10Tg7eWngfB4LJjM9iDjCvTsIBl065wOT0Uq+1AMzLcGYJ/xyXPYQZ3rcAMpItY/24KQ0ym3KLUacZOrVFaAmETCHxW7YO99o/1HeFVfnC/DrrkLZ0CbQMEDql78JHzL5gKQc7crB3vVQ4iRQ//snuJIn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkJSsoZq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkJSsoZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709644606; x=1741180606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7rEagawPX23mE5pppXoyHfmTdvHgUzgExicL6517to=;
  b=GkJSsoZq8nTTro7EAA1ZIeXz96m8UcTxLVcKofjYWWw3QG4xVkKQN2/A
   MuSMj2po3pcUBPV/aDUQYXTP/lzahJB92M11RuLJvhFC1IGh/dlRrG4Qv
   0xFK9soX0y0rcqIRFmcWiWZcLgy6VOQERUarEzjwXc9r2J/IK/ZoVc/+O
   ADcSrJb4iUHnE8Df3SCndMrBUuFAvL5eSGqHuvGpbTW3gYfA0ztr26cfk
   8X0I/PBorThfimy7a3tAVXYR22iG9NSt6feDIYSHOZLgeFZdmz0RhpZXz
   APfD/wNzKsuKiLa0YcOoMOCWLmgLEYzlJZ8Gy6Z6I58YQXZHU86ecdNMW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4777317"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4777317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 05:16:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14051244"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Mar 2024 05:16:43 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhUev-0003JF-0N;
	Tue, 05 Mar 2024 13:16:41 +0000
Date: Tue, 5 Mar 2024 21:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [linux-next:master 11602/11963] ERROR: modpost:
 "acpi_device_notify_remove" [drivers/i2c/i2c-core.ko] undefined!
Message-ID: <202403052102.hlG8I44z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11afac187274a6177a7ac82997f8691c0f469e41
commit: 0a56aa8d77de2237d80e1df028ee2222af94e60c [11602/11963] i2c: acpi: Unbind mux adapters before delete
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240305/202403052102.hlG8I44z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052102.hlG8I44z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052102.hlG8I44z-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/riscv/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/virt-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_dma_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/pcs/pcs_xpcs.o
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
>> ERROR: modpost: "acpi_device_notify_remove" [drivers/i2c/i2c-core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
