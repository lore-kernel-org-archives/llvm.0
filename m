Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049578;
	b=BIAuETPcEpSxyKGkwwVg1RXpNukWk8j2wkOXMSG5RHw37fh72qE7rxqGgz5wF+Pp6Y+D
	 /nw1+CnDUE1FBW4nBwciiTZ6Q7BW/6ywlzQhJ8sKr8ZdAhhi/qROBHfID5Izgh41cBtJ9
	 vWhLnBN52Fm98o6hwTV+Y8v9zdInGqvtLmyv6CZOeLFTCTVKaXMLszpEg8GajC2XxwdOr
	 niGcAOkMUVUixZ070e95LWIqsNAr8Ndsfr8oflfLmCz8INLf+WO4FYZxtGPYTxyRLUOoW
	 JV0yy4ikvvN7lPBezEw4+JGheinKl4+676M0TJMgruCTKXBKWHHE9tiOnIdt4HBQobw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049578;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iKdG1ccKcovCvfF/PKi/FoVYcNlOycrHUx9QgA9Ji2E=;
	b=w0a7lsKGkcykgFD7ErUZhCKuKuPE9ECFq4EIhXjPCPBkDHlBd+7LiahZ1HL71p5yCTDo
	 d78Q5VJNye/LZGjJkiDfcIEbwRgd0VUfxYHyXAc3D9Z7rmEf+tb4j4oQ31HjuO7qHHx9j
	 jKWJM62FZacofljn1IIEx452B9zPoizsvnPL2aI9foNZ9IUqTpIm+5MqujtNjj0gLqDz9
	 6FLPONJuN53ZUNSXC5vNjtMk2IIZzMrx89OTF+WOLnpA7H99ctCIg2RLSxPwuO03ueF1S
	 W16uaraB+X8+tyhIpEg5ZmECNBAlXfSzcebaWODvErb5/oDS5j6JwOmX9xAv1JLZD2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YEXpdVik;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54504606A31D;
	Mon, 26 Oct 2026 21:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54504606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YEXpdVik
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793049576; x=1824585576;
  h=date:from:to:cc:subject:message-id;
  bh=wTYayaykCFDwXz6yrpjj4nJwil6tjPUttPAQgdMkkTA=;
  b=YEXpdVikGW3uwgIHevMJdIBinjhX+8vLI0PPGLVT6qdV5uqZwmf2RKy4
   5Pk68lJWpqME1Rw4oxgFwAHafPdFL75vD9A/cfsEGpdSFXoglzIjbIT7T
   RoxBYXUDsTvAsuI0c+sH7gjd5v8yOShtupbEohU/mWM0nNUn2h9dBfKH1
   g4ZKiAa1+wv1HfiUm073M34Gbr6Dn9I55lUMohCBamLrF7CmppSTwdb4b
   EUibnWXwmNI0C8LaCltDdGShKbH1CZqSkeeoki3NWRQlgE5TYPFdbrKW4
   OUY3i7I7sTq/1p5u3hlJY7aI1tovfkZuxFdM14NOFAdXbddiizVmt+Fc8
   w==;
X-CSE-ConnectionGUID: FSLzlKHKS2CM6g7bF1C0TQ==
X-CSE-MsgGUID: SjxnnnFbSpe++k9et10MIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1616670"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1616670"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:19:35 -0700
X-CSE-ConnectionGUID: L9lAJw53SKGJ9MM4BhKvpQ==
X-CSE-MsgGUID: V3WhXM9SSzu9oE8JHxR3bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4321862"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Oct 2026 14:19:33 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLS6N-000000004EN-1sCi;
	Mon, 26 Oct 2026 21:19:31 +0000
Date: Mon, 26 Oct 2026 22:19:02 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 126/133] ld.lld: error: duplicate
 symbol: nvfnic_get_nvmef_info
Message-ID: <202610262207.oOEPYY8s-lkp@intel.com>
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
commit: 8b48e1d295fc285e4f33b7212f77709fae675299 [126/133] scsi: fnic: Include fnic_nvme.h at the end of fnic.h
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261026/202610262207.oOEPYY8s-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610262207.oOEPYY8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610262207.oOEPYY8s-lkp@intel.com/

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
