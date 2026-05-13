Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063DD39D6CC;
	Wed, 13 May 2026 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692751; cv=none; b=Ks0yF2GHuxMp92ihRAhWgZ66jprf5aBrasF30Uj9km6fAa1cPSMsb56ugHYDM67LtN6gvGwW0KqdZZPgzFNpTeyAjvkn/VFKDcn3PcDxtkurU52Z2tlk5ee13kFMLt+FEVhKW4gNEN7gpaeiZBHlol0w9zVcFzcIkxX8A+9CaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692751; c=relaxed/simple;
	bh=UvVNxzJP+PFnAyxnJk79N0necR83JK7rEPfkB3SPtQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BIu2NW3tXjgtQMkmIdMfUt91cBmzS+SaA7j+SrRGRwzk3SxMH8Sc+QNkvx3n8sFbj/NSfAeJeBnFPS0m1jh1gIj52DLdUyUjHctoSNlP0jarUJKaxb29uZfpBbO5o951l1p93tKlhWa55ln428QBWzY8wKHTKOCocYKGJQMTmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPcrSjut; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPcrSjut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778692748; x=1810228748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UvVNxzJP+PFnAyxnJk79N0necR83JK7rEPfkB3SPtQo=;
  b=QPcrSjutCg4uybN32LXo6y1tJrynE2dx0QknxgyXc/hYpdGMGbBdw0du
   qCqWwJhnhD9+myjD8QKskcokGmI1SRRzmZm/EI0HlQ4Xcgb3SBOTUy6T/
   DXi+yc+Bb3IprcytDIQED3bHNBZ2yKHYpLOrbTR3vAmKoffLpZY/2LR9i
   FAxFPuzB5MqkdrmM6lUGjvjSPZRTdiP0HcMNZQIg53xXR9ns4mACbzT6x
   9d2xPr50kuSguuIxCNuhDGfdzZqndRfCi23vmLjYS5ft4jEg5zmRfFSv0
   svVSej5oOVrCtyvL53c/CvM4QVyiDu7yAhRgq+G3bEB84Aan9NzJJpFpd
   Q==;
X-CSE-ConnectionGUID: 8SqToIZXRNGKY/a0PVlTuQ==
X-CSE-MsgGUID: b1AF8e7nQ5qajJcpBqBaRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78770619"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="78770619"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:19:05 -0700
X-CSE-ConnectionGUID: J01TCjLMRGSUrhCpRpt5ng==
X-CSE-MsgGUID: P/cLza5VReSYE9iTJh4u5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238240936"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2026 10:19:03 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNDEa-000000004fd-30TH;
	Wed, 13 May 2026 17:19:00 +0000
Date: Thu, 14 May 2026 01:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-pci-hotplug 3/3]
 drivers/pci/slot.c:111:11: error: initializing 'struct attribute **' with an
 expression of type 'const struct attribute *const[4]' discards qualifiers in
 nested pointer types
Message-ID: <202605140127.Py50QBFB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-pci-hotplug
head:   f8baf38ff79f1d9bd3d1c4e0d36413a14bc26068
commit: f8baf38ff79f1d9bd3d1c4e0d36413a14bc26068 [3/3] PCI: Constify slot attributes
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260514/202605140127.Py50QBFB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140127.Py50QBFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140127.Py50QBFB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/slot.c:111:11: error: initializing 'struct attribute **' with an expression of type 'const struct attribute *const[4]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     111 |         .attrs = pci_slot_default_attrs,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +111 drivers/pci/slot.c

e4f9ab031dc86c9 Niklas Schnelle 2026-04-07  109  
e4f9ab031dc86c9 Niklas Schnelle 2026-04-07  110  static const struct attribute_group pci_slot_default_group = {
e4f9ab031dc86c9 Niklas Schnelle 2026-04-07 @111  	.attrs = pci_slot_default_attrs,
e4f9ab031dc86c9 Niklas Schnelle 2026-04-07  112  };
e4f9ab031dc86c9 Niklas Schnelle 2026-04-07  113  

:::::: The code at line 111 was first introduced by commit
:::::: e4f9ab031dc86c9987c3619e97c5c7d8ad7afda2 PCI: s390: Expose the UID as an arch specific PCI slot attribute

:::::: TO: Niklas Schnelle <schnelle@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
