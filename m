Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2701448D7;
	Tue, 14 May 2024 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715695973; cv=none; b=BGacMrYV4Ol3xhc6fPBTk3k18OO+I/Y0sVnHBeEpLD26rt9nHgqvkk8ZPAXQWV7d9B9u8APd1qYpVJ9QX6i5F9ObedR4D/aHsaue5AU9ovABB2zmEnPsF2xJ5QVW3QA8G2LEj8aIUgkEv4qLLjmy6U+UzOPo6tSXOrTQ9nwi6sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715695973; c=relaxed/simple;
	bh=QkLXBf732foY955KPZGH978/SHv7Xxnt7lzvIH9cRLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8GvRGrnIzxULPgEUdCUXIWk/08dlQ3XUZgWnTVkmNRlYd6Rv0Uhl+llOKVQK5MIlv5qqzF+Hd3Gei0poLf8+Z4PWjVDGnDGfqYaXW6B97XQH1wTGOV74eNUrrHLAaWMgoiIvHUUa4QbFNexdarEFcRtWEibVI0RdULN3r1uTjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ES57VHlS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ES57VHlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715695971; x=1747231971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QkLXBf732foY955KPZGH978/SHv7Xxnt7lzvIH9cRLg=;
  b=ES57VHlS5/2SFhLlC6wkUAZ8s1u6v7sE1Ns9bL9eGDOvxupnSuAqxuRC
   diWEwQCa1GMR/wSdwRwrNzBPzjFlbSJPflWIGDCX+vHOmGJrPrC+ej23L
   SZyaDaXy1FUnP84FRMIrY6NEvL5aL0BL4zWr4+7QDqkZenMXJdLLhM4YJ
   b5u/8IKbDK9Cjw9ztGMVXl+2JrxenFSY7E2oHAF1vJirqybcfrYyKk/hc
   +/RjQHT27HRi9tPY0QEyHBAG7XszhEibFMZb3/ib6qM24rX4IUQbW+rMK
   OPIfA5ABTkggLu705AyNbVhmDcYn1eBrKKHs2Ip72zL7jhWeRt1L5tski
   Q==;
X-CSE-ConnectionGUID: XVUvQAJcSyyCVP0rBcZ8fw==
X-CSE-MsgGUID: OCXZ93ZVR7umZ5gG8xNhCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11894617"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11894617"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 07:12:50 -0700
X-CSE-ConnectionGUID: pAuqDw/6RxGJMPG6mHV9TA==
X-CSE-MsgGUID: hSkmzZQZQiaPFWsGMM5zBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35457004"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 May 2024 07:12:49 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6sta-000BWB-1R;
	Tue, 14 May 2024 14:12:46 +0000
Date: Tue, 14 May 2024 22:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:iomap.2 32/32] ERROR: modpost: "iomap_read_end_io"
 [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202405142224.ykqoRg9h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux iomap.2
head:   7defcedce6c031c95fa753060462301bd623163f
commit: 7defcedce6c031c95fa753060462301bd623163f [32/32] btrfs: switch to iomap for buffered reads for data inodes
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240514/202405142224.ykqoRg9h-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405142224.ykqoRg9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405142224.ykqoRg9h-lkp@intel.com/

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
>> ERROR: modpost: "iomap_read_end_io" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
