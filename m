Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E33221546;
	Sun,  9 Aug 2026 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786285889; cv=none; b=hM6ngfpzqZilndw4LpFEReyKa+rCrni3Mmb5MSLQGm5n54MYtimPLjdAmxDkxn6nXDFqeuoLXy0MwWvWZlperI30WkMGJcRroFhofBCsQgXH8nJgOWgvvvcRbL2Td6r+kHIxMUAOz1reTcgx9qHMOS/yPhclE69m/qUYoAPKHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786285889; c=relaxed/simple;
	bh=7kxf05nVH9CYPRE+Yk/ELWavE53ll+DaDRhiR9seVsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U7jRbGhmF4/uNe3kgumET0I7BoqjOMvrRGuyxb87n1s4W4bfx09TV/FPeAoOL7xNeMsfhN8W5Iy9gt3Le936Z3D1WHSIzZkCTDAOSzdea8a75JalHVFM8h/6EWWH5PGMYnxe3oNG2Y5AC+C+tGFg1fyI9TFzlBfKuqhD9mWLOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXwJRLcn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXwJRLcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786285886; x=1817821886;
  h=date:from:to:cc:subject:message-id;
  bh=7kxf05nVH9CYPRE+Yk/ELWavE53ll+DaDRhiR9seVsA=;
  b=hXwJRLcnNQu1/+JNfZu/pcPRNxa/nxW55ekNZBTe3Vq3r+e2yYB0qJeG
   GmQ4axXQknw5RemKd3058JnFEAxJc4S7vnYypD6YRgjgMu+HE3XrrFX5M
   cc3fIIwX/OzK1616Ho9YIrHaimyo6pSsICm4DvZKLn/PcvEka4+TpmndL
   CBWF7lLopfCsRpDvcV4+2wVXuZU//oCBPbkADTANvLn9A2nBSv8aQRKQB
   knBt517tqYsi6ILm1Cd6sPeC4CnSSr8Lh7NdQyPaXklRH8N/FcXI6KHV8
   2+mk2BVd2KNxVg0VrRcPJtHhJwdpua8wmiRKHNdZygKJr4HbFh9+XKl6o
   A==;
X-CSE-ConnectionGUID: PUpdEHmkQ8GG5l8ATojTaQ==
X-CSE-MsgGUID: SsB/QGEJTKWbD6prYgzRMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="89343675"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="89343675"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 07:31:24 -0700
X-CSE-ConnectionGUID: Yn1Qns0+QoGRI7+ZZWNqtA==
X-CSE-MsgGUID: LtJU+6D7QK+2+nQNK/GRpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="301044739"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Aug 2026 07:31:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt4YZ-00000000LvZ-0wqA;
	Sun, 09 Aug 2026 14:31:19 +0000
Date: Sun, 09 Aug 2026 22:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 Arulprabhu Ponnusamy <arulponn@cisco.com>,
 Gian Carlo Boffa <gcboffa@cisco.com>, Arun Easi <aeasi@cisco.com>,
 Hannes Reinecke <hare@kernel.org>, Lee Duncan <lduncan@suse.com>
Subject: [linux-next:master 8664/13846] ld.lld: error: undefined
 symbol: nvme_fc_set_remoteport_devloss
Message-ID: <202608092246.XZe7Hlrt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 5efdd5cf928188023080a01312323bb38e02656e [8664/13846] scsi: fnic: Add the NVMe/FC transport path
config: i386-randconfig-001-20260809 (https://download.01.org/0day-ci/archive/20260809/202608092246.XZe7Hlrt-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608092246.XZe7Hlrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608092246.XZe7Hlrt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nvme_fc_set_remoteport_devloss
   >>> referenced by fnic_nvme.c:1023 (drivers/scsi/fnic/fnic_nvme.c:1023)
   >>>               drivers/scsi/fnic/fnic_nvme.o:(nvfnic_nvme_zero_devloss_tports) in archive vmlinux.a
   >>> referenced by fnic_nvme.c:1023 (drivers/scsi/fnic/fnic_nvme.c:1023)
   >>>               drivers/scsi/fnic/fnic_nvme.o:(nvfnic_nvme_unload) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nvme_fc_unregister_localport
   >>> referenced by fnic_nvme.c:1073 (drivers/scsi/fnic/fnic_nvme.c:1073)
   >>>               drivers/scsi/fnic/fnic_nvme.o:(nvfnic_nvme_unload) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nvme_fc_unregister_remoteport
   >>> referenced by fnic_nvme.c:1743 (drivers/scsi/fnic/fnic_nvme.c:1743)
   >>>               drivers/scsi/fnic/fnic_nvme.o:(nvfnic_delete_tport) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nvme_fc_register_remoteport
   >>> referenced by fnic_nvme.c:1822 (drivers/scsi/fnic/fnic_nvme.c:1822)
   >>>               drivers/scsi/fnic/fnic_nvme.o:(nvfnic_add_tport) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nvme_fc_register_localport
   >>> referenced by fnic_nvme.c:1868 (drivers/scsi/fnic/fnic_nvme.c:1868)
   >>>               drivers/scsi/fnic/fnic_nvme.o:(nvfnic_add_lport) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
