Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBACC7E10B;
	Thu, 29 Feb 2024 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212457; cv=none; b=Uln7NKOhxwRWsD4PRgHg7O75NdEOqFD7rwKLRIJWodmvLOZmGvArv630c/X79MTjTV88RkjxN00d/+umJlSRHDISYd8RJcf1g3zehvpus8fhJ+R2l4+/sIv3d3DwOOSoAOtlXOjL6VDjRg413e5E4bFfS+DLy0DELTuRZ/sPhYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212457; c=relaxed/simple;
	bh=IzPBVnhxKg/Fh4I3HdGZLz0tCkJiB/WDFkWa6OIigPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUc7WWzCmJZQvd2vHaaQu1UW8o4JRKN7l4v3AbmaRQYE6fdiS9s5mGAifnJM+G2R0rhE5TfKHp8mxQbtbiXbmlWCRICyqnlt/+zRqVXjkpC5hggRs3Zg6MNua5jlX+4JctPZBfjhsgfZCZ17S/YOgm0nZcCWNpjtQl5qWW5OnZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKNMqAoU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKNMqAoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709212454; x=1740748454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IzPBVnhxKg/Fh4I3HdGZLz0tCkJiB/WDFkWa6OIigPU=;
  b=KKNMqAoUgE0XdtA2V+KyJzRr+LwuNRBmT5coSUpkNk0S+ThMAz8MS4Rz
   yujgQ6/tox4aPsnXxGQgMFbMKVg80vdHqORIDxG8+ufMqy2cazXmQpm6k
   4GkmdvnrA8WxoeJ2ckP2eROowO67FR8as7bT+YygEj7YfHQoYmXbfA3xS
   sZ4HAgo+a3D4wecnuiVYM5s56/a7/HiR/TBJAfWLdMLbTNdKcDhepQINk
   qL+Sc+R5Eu9yXjuC8+mbDNOJS4wvc9WE0QPjapmzARMReClJBiTf7e8M6
   bucBqAJ3QYRG2MupLXxbQKG0HP76tSy/i2PLbderLxhTlmbSBzyAjS5lG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="6627513"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6627513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:14:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12471679"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Feb 2024 05:14:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfgEf-000Cx9-0a;
	Thu, 29 Feb 2024 13:14:07 +0000
Date: Thu, 29 Feb 2024 21:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 636/860] ld.lld: error: undefined
 symbol: dwc3_host_wakeup_capable
Message-ID: <202402292103.kMHjpTmc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 2790ed87f0ae567824335f9e27bdf0da380bb305 [636/860] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240229/202402292103.kMHjpTmc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292103.kMHjpTmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292103.kMHjpTmc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_host_wakeup_capable
   >>> referenced by xhci-plat.c
   >>>               drivers/usb/host/xhci-plat.o:(xhci_plat_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
