Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF746E011;
	Fri, 14 Aug 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711669; cv=none; b=r4Pywquu1NblifumiBKC0x0XeN5C2TjU9gPyp4ggwZklB2pw50laLF3tO63KD5Kt3FPsMmNSD8osB+O4lgBE+UKs2memGhvM7N0W5n1NaJ72ziduriZZtP/xTTQfdKyw20BbG4gzjVgGEiozPFmEEVYG+0cQ1At2mbXEGKDjIcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711669; c=relaxed/simple;
	bh=aaNHmfC5h8W5VcXyFaRXHP3qCU7TJ6F8OIG8vdYVnJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iagBlk2zobjB6GpczPuZd+yrX0ppGE+pGiE9hjevUNpQK+JHQ/nd5LKHnd0CLD4ksqRBlAXnagdM0p0905gNjcH0FS0OTB//KC2+19CPwtq7QPULa17peFOzBfbjDcxfdveocEXoEFUF08n+OUwJqPU4SP+T1Lq/3rnLLd04Qw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWbPHte0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWbPHte0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786711664; x=1818247664;
  h=date:from:to:cc:subject:message-id;
  bh=aaNHmfC5h8W5VcXyFaRXHP3qCU7TJ6F8OIG8vdYVnJc=;
  b=EWbPHte0c7lewDunMkD1ERvCvJ0Vlvqt80DYB0j0I0em5T/HAqy1fZfd
   jsa9I29IZndPRH2EbS+2KzR/n3Mf+N5iWexAWQjsDcu0XhrDNtGXcQzl8
   zeV2Qg7KtKFileLBwLip0Xc8Ng99/9Yr4vLaRf7t+GSQidvNhqIPo5TB0
   fVn4v9bMoPp2hUE2usAXfexyreXclBvG1E9AnA880N7fburhu4pTyZPkB
   YHuNZRL9WozwI8P0L4TwxN0wUv3qzf2U/nQj9o88uaUxZUpiR3dcqZ2O2
   DudQTz+7Px5MyxHxQ7XvRc7JLBxdyeD0k1OznobczsCwLazqpzYPZ6yXk
   Q==;
X-CSE-ConnectionGUID: ziEN2GeGS6moTSqxm4mRIg==
X-CSE-MsgGUID: zl8T0wIKRDKOTlkQWwADJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91164608"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="91164608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:47:43 -0700
X-CSE-ConnectionGUID: uACEE1DrQ4iqtx6RwXcP3g==
X-CSE-MsgGUID: n3MIOrhySvOiFxQ9noT3oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="267701432"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2026 05:47:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wurJy-000000006FV-3bzA;
	Fri, 14 Aug 2026 12:47:38 +0000
Date: Fri, 14 Aug 2026 14:47:26 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/scsi/scsi_scan.c:1445 function parameter
 'shost' not described in 'scsi_report_lun_scan'
Message-ID: <202608141442.GaDxxpVW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/PCI-Convert-to_pci_dev-into-an-inline-function/20260807-124354
head:   a6fa92957e0ca9fc670915caf6f452bdd88ecdbe
commit: 76eec042c08b5e7834435514a17539bfbb541afc scsi: core: Pass the SCSI host pointer directly
date:   7 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260814/202608141442.GaDxxpVW-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141442.GaDxxpVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141442.GaDxxpVW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/scsi_scan.c:1445 function parameter 'shost' not described in 'scsi_report_lun_scan'
>> Warning: drivers/scsi/scsi_scan.c:1445 function parameter 'shost' not described in 'scsi_report_lun_scan'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
