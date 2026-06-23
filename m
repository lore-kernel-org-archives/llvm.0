Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A3A3A7826;
	Tue, 23 Jun 2026 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782255713; cv=none; b=G3VNpem6yrsuxo6aqvNLr6Kg8Mjhms7x7h/TGQ4B60y1fK1o0dGdcnvOKtqXa7N8mDyQCfp8F+ZXAv78LTw70bM2jGTxASelHHAzlZclHXslQx2PcalVOH12ulqsKMC4OP96GD6rz5VuFmickDR7kZLhCYUJc/QNj0BFjkp8KlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782255713; c=relaxed/simple;
	bh=Xzy3uMehQPlXO82Jx1ZHXfyZmUa2+tecXS7lcezgEvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iPcvLiF8FPaoMvdOtm5WxAgmo/tNNLRE/WseqKLkGdBWfWZK0P+C1uCGxh1xIe4vCKvcjKGE/qQo9n2dfoSI4DHxYtj2IB7g8wDOnr/1HDhb42Sv5yFI5UqPbBEXOVEKRFkf88sGZNlwq/5kByYYTbeH7FNWaZ7lnlmtJY3l0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnbpepTy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnbpepTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782255712; x=1813791712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xzy3uMehQPlXO82Jx1ZHXfyZmUa2+tecXS7lcezgEvI=;
  b=JnbpepTyjeDx2RctcZJs8fpInv2/JMAUERYup6GtoAAPBd5l+c0alZxy
   0/tbVsP4MpK4upl5Vy37l+Vh9B2wLInl5MrwOgckFytUDxK7oKYpEC1AK
   ict1jPAM/CdkCz56hHkfT75zl2D4wv3vVH4aKz3Htyo+NWeXBP5boH7dT
   f4FLyn2FEVrapXqllWjbfwayC4oaGtdLkGMeAWcKmvsEQNyyABcSYIgtg
   4cznuZNZx5fGavlnc3/Sg1lbvAAgfCPqxVg2U/L/+KiWSW6wGl3EZ5qri
   4Ck8RvA52i+bvpjBWznyv8c+pXB6kT4wFsW6Q4B7l4W5CkmUrhvAuhU5O
   w==;
X-CSE-ConnectionGUID: S0U6bnJ3R4qgcwzQNmMJTg==
X-CSE-MsgGUID: cLLwcQwqTtWwCTJr8oOp9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100436060"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="100436060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:01:51 -0700
X-CSE-ConnectionGUID: nRxOCV7bRlmchOcfl9jomQ==
X-CSE-MsgGUID: LF8qZeEbTiaG/ZkBWBiamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="251574872"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2026 16:01:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcA7m-000000002wn-2mQb;
	Tue, 23 Jun 2026 23:01:46 +0000
Date: Wed, 24 Jun 2026 07:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-prep-easy 38/57]
 drivers/pci/slot.c:111:11: error: initializing 'struct attribute **' with an
 expression of type 'const struct attribute *const[4]' discards qualifiers in
 nested pointer types
Message-ID: <202606240700.55fyYCeN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-prep-easy
head:   67a3c6abb9033d2ce2a9ac12d4cfb9530148b38f
commit: e336a966dae35aa3b0795b315b543fb744b61ff0 [38/57] pci
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260624/202606240700.55fyYCeN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240700.55fyYCeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240700.55fyYCeN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/slot.c:111:11: error: initializing 'struct attribute **' with an expression of type 'const struct attribute *const[4]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     111 |         .attrs = pci_slot_default_attrs,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +111 drivers/pci/slot.c

e4f9ab031dc86c Niklas Schnelle 2026-04-07  109  
e4f9ab031dc86c Niklas Schnelle 2026-04-07  110  static const struct attribute_group pci_slot_default_group = {
e4f9ab031dc86c Niklas Schnelle 2026-04-07 @111  	.attrs = pci_slot_default_attrs,
e4f9ab031dc86c Niklas Schnelle 2026-04-07  112  };
e4f9ab031dc86c Niklas Schnelle 2026-04-07  113  

:::::: The code at line 111 was first introduced by commit
:::::: e4f9ab031dc86c9987c3619e97c5c7d8ad7afda2 PCI: s390: Expose the UID as an arch specific PCI slot attribute

:::::: TO: Niklas Schnelle <schnelle@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
