Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CA9BA34;
	Sat,  1 Feb 2025 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738438434; cv=none; b=g2sX1yKy+VQw/bWqHDlraM4rNADnOWCjjZ9004cxvOrgV0Xx4Bi6cQ9TovTNLIORW/qHWKlEeAR5upBtOWVb0xZQ+x7G6mwUr8wLR293h9u8mhC+6PA7SUsLiEubYp5vC8psSJW/BiwIM7MNltxbsFgeG5y0uLPlfOA7gLO+Aak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738438434; c=relaxed/simple;
	bh=HOguQcweYm7+8t2SoN89Q4GhyRyM0dWyanuvRDrhlDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWpnfrnosmaX4S0mZC+sQlG+fw81PracKPBIlMqQbDDngbc81jYIL7mfVk8KfO/lacGw/citOyezv/yhSt+YU4owKAQrM64jhBIJzLVU3ZU9Vgvyb/1E0y3iPARstwrsFO/hQHdCRzMYfTopiOK0WmyJELbHYsNbexdkbOaQeqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAojHnWU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAojHnWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738438432; x=1769974432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HOguQcweYm7+8t2SoN89Q4GhyRyM0dWyanuvRDrhlDk=;
  b=AAojHnWUwNYyyFZ3DlA1CXTgqByLOJdzukVODcyCgYbmzPGqjZF5stU5
   EgPd5GTjOh0Ot27QyGG13nuf0nbl3Miu+nuS0lNSxFLx5VSpZ3ygDbRQp
   Yhq1N4r8bn0ZAehuOp0mM0O84qnQG2yPRIitRIHJEoKAc0030M+ecnpoY
   jtAJMB3niw1uucyidbMPiW6c6UGV415ujKmg/mYpxg/u3kHBDKwIjM6Gq
   zr9R9iqGLQ2Ptlv4S3s3+4Qpt0QKDzYA0zy2/n2p7ooEBiFGjVcty4sAr
   SJRDAnXmV8v8c8wmBi1agIKK4loIwRyHnKjBK3jEBS9gwIn9oup3FwlM9
   g==;
X-CSE-ConnectionGUID: xGsJx6STQsOnnTIiaQ4fSg==
X-CSE-MsgGUID: y1oC7NsuQtWEOOHGI7U2wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="50367548"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="50367548"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 11:33:51 -0800
X-CSE-ConnectionGUID: haxzTaxdRK6whPfXTMSXHQ==
X-CSE-MsgGUID: 4RX9PwLiSk+goPWiZQRx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="109852489"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Feb 2025 11:33:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teJFT-000oW3-1c;
	Sat, 01 Feb 2025 19:33:47 +0000
Date: Sun, 2 Feb 2025 03:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:virtual_bus_1 1/1] include/linux/device/virtual.h:6:9:
 warning: '_VIRTUAL_DEVICE_H' is used as a header guard here, followed by
 #define of a different macro
Message-ID: <202502020308.ZrRc2WdO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git virtual_bus_1
head:   ca49dd1ebb4a2a65abbc7d9f250edf9af4b87e11
commit: ca49dd1ebb4a2a65abbc7d9f250edf9af4b87e11 [1/1] driver core: Create a virtural bus for anyone to use
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250202/202502020308.ZrRc2WdO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020308.ZrRc2WdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020308.ZrRc2WdO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/base/virtual.c:6:
>> include/linux/device/virtual.h:6:9: warning: '_VIRTUAL_DEVICE_H' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       6 | #ifndef _VIRTUAL_DEVICE_H
         |         ^~~~~~~~~~~~~~~~~
   include/linux/device/virtual.h:7:9: note: '_VIRTUAL_DEVICE_H_' is defined here; did you mean '_VIRTUAL_DEVICE_H'?
       7 | #define _VIRTUAL_DEVICE_H_
         |         ^~~~~~~~~~~~~~~~~~
         |         _VIRTUAL_DEVICE_H
   1 warning generated.
--
>> drivers/base/virtual.c:133: warning: Function parameter or struct member 'virt_dev' not described in 'virtual_device_put'
>> drivers/base/virtual.c:133: warning: Excess function parameter 'virtual' description in 'virtual_device_put'
>> drivers/base/virtual.c:171: warning: Function parameter or struct member 'virt_drv' not described in 'virtual_driver_unregister'
>> drivers/base/virtual.c:171: warning: Excess function parameter 'drv' description in 'virtual_driver_unregister'


vim +/_VIRTUAL_DEVICE_H +6 include/linux/device/virtual.h

   > 6	#ifndef _VIRTUAL_DEVICE_H
     7	#define _VIRTUAL_DEVICE_H_
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
