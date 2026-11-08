Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794118753;
	b=ZTJ5+CceRtiSVhHUzdr37L0ut7W5wt2GcyBykoRPb7XbNTxssfd5cdzqtd+tqdoWqMCb
	 dN0G97XJSPcGfZG5cVEJ2I63vWpVBjYHwiJgUTzPebQBZTtYe6XdhrKH48fzIjKsd4JDx
	 LdOBTN+RG9k+I8UnKidQSCor3wvJtZ+H9a0Jp780y0opgv9GRR0+tIrSAuSXmJ9g/iQk/
	 0+mU1ShYnMvrN21kW5rV5z9bEAX+kwxBmBXfYj+UPfolQCj3lkqu0hDR8DpkiX0YGC5zV
	 R3rUUPCKbfG9S8l4mhFX0ckkopWb1WwzqeN0vq3swKxDNFi1/fpZA+2QKIH/S4sBX6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794118753;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5AtrlrN+yda8tqODXCIvfCYFZUpv9juwSIA40fu9Ui0=;
	b=4uUIw2oA1bzIrRb/Ba/8RrobdsEDHfmHoEz+vHKOFynvLMLhORDovlgwvexuScxLQ8T0
	 YAvKS+L7ArBZPlj+8eB2X0t9vJdtSukjFJwlD2VjmkTCucfVgwpFgP5QxY9EO6wratw3T
	 jgvA8rSiSQ1T1YIpFC6nxdQ7E22KNVWPqQNEl8e1MyYBsNOnlJ5QiDUBhZVX8wyctRgBs
	 CWnQM0cR3/eJIeJZizGuqNKNkkVgaSWN+Ye9m+hEZbFoe2hCJR7VXEvPlWlrq5QHHNuR5
	 HxGpBhpUdHl1NZgptmuH1zfOSmEmBdtVWlWdm8MaEimeiA/ZGrVX/re96ACcGv1mR2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kumYXDZB;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03D606A31C;
	Sun,  8 Nov 2026 06:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB03D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kumYXDZB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794118752; x=1825654752;
  h=date:from:to:cc:subject:message-id;
  bh=2kdw2iswn5VpOCLFBVV2+tOMUjMSYLfTUf1oxZrHC4s=;
  b=kumYXDZBBNjg0HEWiaYMOrWbF9NEqZ/SrDhTPFIjcdUTDhQwL1cPVjiB
   W6zAjbA0gs8cEZIdLlUMcuyxqGTpcpdE4lZIoZKZEACR/J8QLtUorsYI2
   1UDU/LPOCTuA7psyCUIt2TJ0z3jBGiZBnOeuFxxqANlF7WDU6BZo7TVGd
   jEzjwGy5YKpMWqPmfq+DRa5i7SxKnkLbyYKUa0rbqvaEMlGQThz7nJNza
   WjtKFQ2k8kjh+bcipAz0piUif89QMVJOXE+3AtVWL4yXNiacvAIrHkKyV
   NrMfxR4wDs13aw1OYITaAGHypfbZ5M0OeWAT2xYeD99YLsAuK1qFcXeMN
   Q==;
X-CSE-ConnectionGUID: rL26FVkQTJO14L+vEN0EYA==
X-CSE-MsgGUID: tVRQQSBVQSK387lnK4AxuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2762309"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2762309"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 22:19:12 -0800
X-CSE-ConnectionGUID: r5zDTpDOQeG49OxzKWbwcQ==
X-CSE-MsgGUID: qM4WG8cAQlilTBN+cB129w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7786620"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2026 22:19:09 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPwF9-00000000sHC-20u5;
	Sun, 08 Nov 2026 06:19:07 +0000
Date: Sun, 08 Nov 2026 14:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Braun <colinbrauncl@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:test/sound-rust-v7.3 37/56] error[E0433]:
 cannot find `module_usb_driver` in `kernel`
Message-ID: <202611081435.FPB03bH2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: 62a6ac49d75b79105edfb6f148ca23108899be6d [37/56] media: add gv-usb2 audio capture driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611081435.FPB03bH2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081435.FPB03bH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081435.FPB03bH2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::usb`
   --> drivers/media/usb/gv-usb2/driver.rs:17:5
   |
   17 |     usb,
   |     ^^^ no `usb` in the root
   |
   note: found an item that was configured out
   --> rust/kernel/lib.rs:148:9
   |
   147 | #[cfg(CONFIG_USB = "y")]
   |       ---------------- the item is gated behind the `y` feature
   148 | pub mod usb;
   |         ^^^
--
>> error[E0433]: cannot find `module_usb_driver` in `kernel`
   --> drivers/media/usb/gv-usb2/gv_usb2.rs:7:9
   |
   7 | kernel::module_usb_driver! {
   |         ^^^^^^^^^^^^^^^^^ could not find `module_usb_driver` in `kernel`
--
>> error[E0433]: cannot find `usb_device_table` in `kernel`
   --> drivers/media/usb/gv-usb2/driver.rs:152:9
   |
   152 | kernel::usb_device_table!(
   |         ^^^^^^^^^^^^^^^^ could not find `usb_device_table` in `kernel`
--
>> error[E0425]: cannot find value `USB_TABLE` in this scope
   --> drivers/media/usb/gv-usb2/driver.rs:162:51
   |
   162 |     const ID_TABLE: usb::IdTable<Self::IdInfo> = &USB_TABLE;
   |                                                   ^^^^^^^^^ not found in this scope
--
>> warning: unused import: `crate::driver::GvUsb2Driver`
   --> drivers/media/usb/gv-usb2/gv_usb2.rs:5:5
   |
   5 | use crate::driver::GvUsb2Driver;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
