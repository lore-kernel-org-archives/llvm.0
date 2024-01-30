Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802D67E87;
	Tue, 30 Jan 2024 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706617190; cv=none; b=FjaFtF61ft6+vmyhWMrjuvmPTTpA08orjY3xGjeCCCcRj+Cctq7q/ZGQvfocEgZGq5P9o0rS0llv6PdhEiF2He+0wrntl9B6evqZcL1VvhJ2q2NZofNGaIzZOMHpLff9gztGrGyJfLFkaplawotujmOrwhpgi9oN1gfVuHLAX6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706617190; c=relaxed/simple;
	bh=wnnc1MoYAWTohIs9cnxGpZz9NjvKEKjRjp5YLuQWQMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HoFQYRj/ajTHTWT8rqiNLVa9BjBvCd4gKJGmiMeCpODVZzDt6jLXcKxLSg7rZ0VDEFxKlaH7Gbh8U2LC2nE5PH7g0d8pBdbwd6EmZHzl9ENrVxKCs3nmNS6DO3+hiLjJPo08S7xj1S3NgsgZaCS00mtUDwdtgwTAtx7cOZ8c6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOBa35ml; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOBa35ml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706617190; x=1738153190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wnnc1MoYAWTohIs9cnxGpZz9NjvKEKjRjp5YLuQWQMo=;
  b=ZOBa35mlJRSJBVlNiw7CLiRIvK56yfmhZiz4qiezsr42Y9xhusqkd/vA
   pI6I7meSkjXSXTKBEacN1HHjsb8w3up/Ik/36USaaKZl3uMIiNOcX0YtE
   XmF+C8yGfgDCGwtyJNYQWqIQpfWc/FMFy9ZZl/35F9mpHeVZ3ZMjYsGbc
   Rf5J0xP8S+YkL/3AQqGR3CJaY61U4eF4hkNXXGL/SXRuwlGvF50kJ6Yb6
   /3WAH4/0O3WX0p8RagYiMVLn0yL5mdvGk2mkMHeVxCkVYEnPlgkpluwqe
   bekT5eNXCdDKg1DxC0b2fvCAuQkvUrS471Cveu9kKdYoE6Mgll2+w5Mi0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10366046"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="10366046"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 04:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907475401"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="907475401"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2024 04:19:47 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUn54-0000Gq-0N;
	Tue, 30 Jan 2024 12:19:11 +0000
Date: Tue, 30 Jan 2024 20:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:feature_interrupters 4/4]
 drivers/usb/host/xhci-sideband.c:244:66: error: too few arguments to
 function call, expected 2, have 1
Message-ID: <202401302024.R12VFof5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
head:   a7f098b5bba5fe24fe938751ed128c6dd9b967f9
commit: a7f098b5bba5fe24fe938751ed128c6dd9b967f9 [4/4] xhci: sideband: add initial api to register a sideband entity
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240130/202401302024.R12VFof5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401302024.R12VFof5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302024.R12VFof5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:244:66: error: too few arguments to function call, expected 2, have 1
     244 |         sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci));
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                      ^
   drivers/usb/host/xhci.h:2093:1: note: 'xhci_create_secondary_interrupter' declared here
    2093 | xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg);
         | ^                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +244 drivers/usb/host/xhci-sideband.c

   224	
   225	/**
   226	 * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
   227	 * @sb: sideband instance for this usb device
   228	 *
   229	 * Sets up a xhci interrupter that can be used for this sideband accessed usb
   230	 * device. Transfer events for this device can be routed to this interrupters
   231	 * event ring by setting the 'Interrupter Target' field correctly when queueing
   232	 * the transfer TRBs.
   233	 * Once this interrupter is created the interrupter target ID can be obtained
   234	 * by calling xhci_sideband_interrupter_id()
   235	 *
   236	 * Returns 0 on success, negative error otherwise
   237	 */
   238	int
   239	xhci_sideband_create_interrupter(struct xhci_sideband *sb)
   240	{
   241		if (sb->ir)
   242			return -EBUSY;
   243	
 > 244		sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci));
   245		if (!sb->ir)
   246			return -ENOMEM;
   247	
   248		return 0;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
