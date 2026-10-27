Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085205;
	b=G2n+B5g4atfQka42ec6u/jFwxSt/p6WXrNuc448WisBavbvjBWt5CSgxeykf+RqVm2wr
	 CpOLBBWVwqK6AGTEP9Yn6Dv9AIjF6RMQQAGvKN5CTXtZsakEte45yTsfwi/XnMOoQlb3H
	 NsFiq5UyOdrNR0xZ5j9wlrXaGh7VrQQBLEBDoY4Zu4zdBoA89iqnCJVRIGVmbUZYNOeX5
	 pOq5x6nKqYPvSFrG3i06o8+XyEP2j4dA51avFvVyaotg57eeZoFW+0onptB4fQ2g8iVNV
	 d5qlUl6Vw+HvtdS1LRqllKbWiL0JvrSuBmoa/lEZSVapSvisNaZVf3zP9IETQGl3gFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085205;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HWgjXNcJc0ErmZfb38tok7MP8/rKkpuVGXulwc3v14Q=;
	b=cBEA2deUhcENpqd8QskqS/iD49rlvM4rjajACrmOmHjtyvNtKreZ+tjmCM9gKR4y04qr
	 seDys0uZ/FTgwNWV9qmF/2EH5I1gQr1FYb3DqSyPhB+GvBFOYrWN0VnBog0fSPdynbHNB
	 I8nUDvQZOU7AaBm3wxJjywjUzvQjMJDg5z0XeUFk9rMk+faXwg4+hIX0wYpBiRUmkIoUd
	 9G+ep6IkGwIHEnot41/dBUPe3xInfhzWn6mVAWAPODfyeedPSeV6MDNFDEZr6DfQPY47+
	 mS2yNmHQwd+4kJQ/7zKVqOaeL2A3sIAGDwxt8jUQeMP/fuxK/aJ6hBW9kAeWx/1OTNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dh9fHFM5;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07168606A31A;
	Tue, 27 Oct 2026 07:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07168606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dh9fHFM5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793085203; x=1824621203;
  h=date:from:to:cc:subject:message-id;
  bh=hHiBp++D3KCKr11uTuusU7oBz5xeKoYFLFSyfaq9YLs=;
  b=Dh9fHFM5K5JZwuNnVC2iOZ3YtfKMpkUlb0mxdPMuroURiSYFwxtKFtl+
   7mac4ZTQn6UUD+girOr6YC0WLHncAFOsPX4CQCzf2qcV37INp32u73/oe
   dCK8ymQdADvoDfeM/RS73V1xdQivQ7aBCDzDi1vgFJN3ztMONZ/R5jnqn
   lC13zpy+To+uAJXn2C1VrHIJAZYRy9Rh3Xyg7G71inypMDVVc7jLZ7y5o
   sP+1D1ZVj0QiyN+63WW8lJaVzgrgc2s1uWSGSj/vxnXC9BBSWsK7/mhNo
   hoaX0JIwTgI0Kl8QbmJrSnoCIcYyGIaRpheh0f+y6K0bCL3BWdL6KZ2b8
   g==;
X-CSE-ConnectionGUID: B5CjVnowTDaPMFdTbhbDyg==
X-CSE-MsgGUID: p8d1qx+cQsG745cjerFiwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1661994"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1661994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:13:22 -0700
X-CSE-ConnectionGUID: aYxc9cquR1upwgoiTY8ApQ==
X-CSE-MsgGUID: hi1rab1eTjWhJ/WAEUf4tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4428112"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2026 00:13:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLbN0-000000004QN-1R8H;
	Tue, 27 Oct 2026 07:13:18 +0000
Date: Tue, 27 Oct 2026 08:12:21 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 129/136] ld.lld: error: duplicate
 symbol: nvfnic_get_nvmef_info
Message-ID: <202610270846.9XBmt5M3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   1141c3e597e1907335770dd641e3d8ace70aa9eb
commit: c16b21bc4a9bdd1f692264353000bf1d0553a609 [129/136] scsi: fnic: Include fnic_nvme.h at the end of fnic.h
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261027/202610270846.9XBmt5M3-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270846.9XBmt5M3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270846.9XBmt5M3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_pci_subsys_devid.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_debugfs.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_attrs.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_trace.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_scsi.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fdls_disc.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_fcs.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_res.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_nvme.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_main.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: nvfnic_get_nvmef_info
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fip.o:(nvfnic_get_nvmef_info)
   >>> defined at fnic_nvme.h:208 (drivers/scsi/fnic/fnic_nvme.h:208)
   >>>            drivers/scsi/fnic/fnic_isr.o:(.text+0x10)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
