Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAB719D8BE;
	Wed,  5 Mar 2025 04:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741147405; cv=none; b=r4cmryJb6Z2iP7OIqA17sF1IAi23285vtrynBLalckhUCqCC+lewG/N+7G0dYvhAkvown0vzoWlXdA2Yba7AjxVJ4Z4n8uytOuLDnG1bnvwlNOBt+OHeETNNsUbUnHabdkVF1eskgnoKlcvzk+vZL+zxE9iHM47cfBr7hJs9gaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741147405; c=relaxed/simple;
	bh=1vjVpR0Duqy0Lecr/rAUEzsxejp3tyIVHjdCkjzCkkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hs9MMd2RWqVUUuVRX5trHy2znRgW8IYvCmuBvYvn7hAPUFGvqkeoFk0KDWoTmDKhoWmBhLCWiWfHzWTnxU8x2tW7SihnNDdMoP5sv/n+xEWWFxw552Q/f0JvVJMnYT+B0lBLIn7WmKP7aFfxObYG464m8WA1mkA0xgsdiz9k8B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ad2jkUEJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ad2jkUEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741147402; x=1772683402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1vjVpR0Duqy0Lecr/rAUEzsxejp3tyIVHjdCkjzCkkc=;
  b=ad2jkUEJAwO5doF79eTpXSjbqpHQQFVMRTc+lD/kwcTd1mh2V6a5wFyj
   qm6NGult24zO/nL2BRbZ5AFzHLEZCIxfRrIwYXDzpP84YW5IBNIKFb7IM
   sDJDCMAgQxXvWWbNuy+4LFAJnI4xpNN9w3h2S7X9KiDCNdn4EF2TvsEUM
   vgouJ1PC1uNidDkHQUR95D+FtBwdMrb0cqFCbrAQYDdTVIVaIDhe8tWBV
   +9fgADjnnE3N9zn8CHwKYJrZ1TyrncWBLAXU/wj56OJxQ+zdN0Uo8G/CX
   W2nUPbanlsbQ4aCNkRr0K4h1fFdt8oO5+07yzK9goS+whCA1yGZhCvqco
   g==;
X-CSE-ConnectionGUID: zJSUPbNQSXyQql6hAN0seA==
X-CSE-MsgGUID: 2uCkylOmQhSJST/EY3Kwjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67462028"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="67462028"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 20:03:20 -0800
X-CSE-ConnectionGUID: yErxLGxeQPGST5GAIEg4ig==
X-CSE-MsgGUID: 4En7DRItRuKHa1100kF94w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="118573716"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2025 20:03:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpfyW-000KZi-2q;
	Wed, 05 Mar 2025 04:03:16 +0000
Date: Wed, 5 Mar 2025 12:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Subject: [pci:devres 1/1] drivers/pci/iomap.c:43:24: warning: variable
 'start' is uninitialized when used here
Message-ID: <202503051115.qGzJnRcf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git devres
head:   20099eb129ac39666d7c89f5e52d99b5596e638b
commit: 20099eb129ac39666d7c89f5e52d99b5596e638b [1/1] PCI: Check BAR index for validity
config: i386-buildonly-randconfig-001-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051115.qGzJnRcf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051115.qGzJnRcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051115.qGzJnRcf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/iomap.c:43:24: warning: variable 'start' is uninitialized when used here [-Wuninitialized]
      43 |         if (len <= offset || !start)
         |                               ^~~~~
   drivers/pci/iomap.c:38:23: note: initialize the variable 'start' to silence this warning
      38 |         resource_size_t start, len;
         |                              ^
         |                               = 0
>> drivers/pci/iomap.c:43:6: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
      43 |         if (len <= offset || !start)
         |             ^~~
   drivers/pci/iomap.c:38:28: note: initialize the variable 'len' to silence this warning
      38 |         resource_size_t start, len;
         |                                   ^
         |                                    = 0
   drivers/pci/iomap.c:93:24: warning: variable 'start' is uninitialized when used here [-Wuninitialized]
      93 |         if (len <= offset || !start)
         |                               ^~~~~
   drivers/pci/iomap.c:88:23: note: initialize the variable 'start' to silence this warning
      88 |         resource_size_t start, len;
         |                              ^
         |                               = 0
   drivers/pci/iomap.c:93:6: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
      93 |         if (len <= offset || !start)
         |             ^~~
   drivers/pci/iomap.c:88:28: note: initialize the variable 'len' to silence this warning
      88 |         resource_size_t start, len;
         |                                   ^
         |                                    = 0
   4 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]


vim +/start +43 drivers/pci/iomap.c

20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  13  
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  14  /**
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  15   * pci_iomap_range - create a virtual mapping cookie for a PCI BAR
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  16   * @dev: PCI device that owns the BAR
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  17   * @bar: BAR number
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  18   * @offset: map memory at the given offset in BAR
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  19   * @maxlen: max length of the memory to map
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  20   *
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  21   * Using this function you will get a __iomem address to your device BAR.
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  22   * You can access it using ioread*() and iowrite*(). These functions hide
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  23   * the details if this is a MMIO or PIO address space and will just do what
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  24   * you expect from them in the correct way.
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  25   *
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  26   * @maxlen specifies the maximum length to map. If you want to get access to
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  27   * the complete BAR from offset to the end, pass %0 here.
81fcf28e74a3ff drivers/pci/iomap.c Philipp Stanner    2024-06-13  28   *
81fcf28e74a3ff drivers/pci/iomap.c Philipp Stanner    2024-06-13  29   * NOTE:
81fcf28e74a3ff drivers/pci/iomap.c Philipp Stanner    2024-06-13  30   * This function is never managed, even if you initialized with
81fcf28e74a3ff drivers/pci/iomap.c Philipp Stanner    2024-06-13  31   * pcim_enable_device().
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  32   * */
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  33  void __iomem *pci_iomap_range(struct pci_dev *dev,
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  34  			      int bar,
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  35  			      unsigned long offset,
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  36  			      unsigned long maxlen)
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  37  {
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  38  	resource_size_t start, len;
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  39  	unsigned long flags;
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  40  
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  41  	if (!pci_bar_index_is_valid(bar))
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  42  		return NULL;
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29 @43  	if (len <= offset || !start)
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  44  		return NULL;
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  45  
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  46  	start = pci_resource_start(dev, bar);
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  47  	len = pci_resource_len(dev, bar);
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  48  	flags = pci_resource_flags(dev, bar);
20099eb129ac39 drivers/pci/iomap.c Philipp Stanner    2025-03-04  49  
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  50  	len -= offset;
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  51  	start += offset;
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  52  	if (maxlen && len > maxlen)
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  53  		len = maxlen;
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  54  	if (flags & IORESOURCE_IO)
b923650b84068b lib/pci_iomap.c     Michael S. Tsirkin 2012-01-30  55  		return __pci_ioport_map(dev, start, len);
92b19ff50e8f24 lib/pci_iomap.c     Dan Williams       2015-08-10  56  	if (flags & IORESOURCE_MEM)
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  57  		return ioremap(start, len);
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  58  	/* What? */
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  59  	return NULL;
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  60  }
eb29d8d2aad706 lib/pci_iomap.c     Michael S. Tsirkin 2013-05-29  61  EXPORT_SYMBOL(pci_iomap_range);
66eab4df288aae lib/pci_iomap.c     Michael S. Tsirkin 2011-11-24  62  

:::::: The code at line 43 was first introduced by commit
:::::: eb29d8d2aad70636ea23810b4868693673d630d5 pci: add pci_iomap_range

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
