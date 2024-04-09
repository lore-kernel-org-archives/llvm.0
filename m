Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717315699E;
	Tue,  9 Apr 2024 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712691664; cv=none; b=C2EwaFeYV8Adf59Qh67cEdqqthJOESDZOg642U16bZqskzVEOmDTF4yHPn2lDj+QyDtb7Ub/ZyrJRt/q03WvT38AH5R0UWYH71aGnTNBwbt8YstCDzjtuHNDRpS5LGIVEVKXJq5YhN8Xw2PGQvytvxs6NcYkRrjqd2Jjgw/eNN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712691664; c=relaxed/simple;
	bh=xKoan98Uj/h9Iq5shVSBfa0b6MDLkm8VSgf18by9YxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VHnNfRa+UQAv00HN12p4jhurSb3RAaA6Y+GBW2jzavCHaf8BbwfiGmEU1tBdv36T99NwTDtsG1oV4DVPY9/EUtpT0V1pPryEBNHCmmBs02xPs872mNy5QjYZSQEN5KlTye2yL9JaDjr0FX7FcKuA0WPuNr/aiwjav+IQJaHT6HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWI1ksJ2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWI1ksJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712691662; x=1744227662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xKoan98Uj/h9Iq5shVSBfa0b6MDLkm8VSgf18by9YxM=;
  b=PWI1ksJ2ZcFWKl390YPggSflps9k4I5Xp5nP1x3VnTWQ9sAjRCKTwqub
   WfjbhWFcAz7ZEldJbeQksDZtWtYUOq265AXY2rWTORjV0n6hU9KRaQEJ6
   3nDdKtLo2Fux659mnZSNo5ZCGTiFgQ8WQY5hoWwni8JEPPhdbC9E6aEkl
   uuRMn071CIVCJ6IMTYXVe4g6Vro72UTk2IIaonS2+fva1+6S6nm3nwZGg
   TIa8tHfXSr2uF464HgB9+GZ0U42ZEcJI9/oM5qoOx2yoUfSDwAb/mOMcq
   Kkgn8edGKsJLvG2Vgt+tD0R1QdrMqr+C0QDKESGF7MwOCyszMDvVHFcY8
   Q==;
X-CSE-ConnectionGUID: 1uYox2PDRlikU1gJv1kOhA==
X-CSE-MsgGUID: ayxU81PHQ52jBBbYDkoDuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7896461"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7896461"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 12:41:01 -0700
X-CSE-ConnectionGUID: l5Umh1kMRjqR91XNoQt2oA==
X-CSE-MsgGUID: 9POwSr9LRC66CNn/AlKO2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="57769006"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2024 12:41:00 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruHKz-0006SI-2E;
	Tue, 09 Apr 2024 19:40:57 +0000
Date: Wed, 10 Apr 2024 03:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 90/238] drivers/scsi/lpfc/lpfc_debugfs.c:3141:
 warning: Function parameter or struct member 'from' not described in
 'lpfc_idiag_cmd_get'
Message-ID: <202404100305.Xhth0nFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   c3ff0b337dbde8117a6031b08119fc3e4d408d9f
commit: 51f7e5230d3db80e60dd1f13a6a201f4950ae34d [90/238] scsi: lpfc: convert to read/write iterators
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100305.Xhth0nFC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100305.Xhth0nFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100305.Xhth0nFC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Function parameter or struct member 'iocb' not described in 'lpfc_debugfs_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Function parameter or struct member 'to' not described in 'lpfc_debugfs_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Excess function parameter 'file' description in 'lpfc_debugfs_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Excess function parameter 'buf' description in 'lpfc_debugfs_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Excess function parameter 'nbytes' description in 'lpfc_debugfs_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Excess function parameter 'ppos' description in 'lpfc_debugfs_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Function parameter or struct member 'iocb' not described in 'lpfc_debugfs_multixripools_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Function parameter or struct member 'from' not described in 'lpfc_debugfs_multixripools_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Excess function parameter 'file' description in 'lpfc_debugfs_multixripools_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Excess function parameter 'buf' description in 'lpfc_debugfs_multixripools_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Excess function parameter 'nbytes' description in 'lpfc_debugfs_multixripools_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Excess function parameter 'ppos' description in 'lpfc_debugfs_multixripools_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3141: warning: Function parameter or struct member 'from' not described in 'lpfc_idiag_cmd_get'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3141: warning: Excess function parameter 'buf' description in 'lpfc_idiag_cmd_get'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3141: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_cmd_get'
   drivers/scsi/lpfc/lpfc_debugfs.c:3291: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_pcicfg_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3291: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_pcicfg_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3291: warning: Excess function parameter 'file' description in 'lpfc_idiag_pcicfg_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3291: warning: Excess function parameter 'buf' description in 'lpfc_idiag_pcicfg_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3291: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_pcicfg_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3291: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_pcicfg_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3411: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_pcicfg_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3411: warning: Function parameter or struct member 'from' not described in 'lpfc_idiag_pcicfg_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3411: warning: Excess function parameter 'file' description in 'lpfc_idiag_pcicfg_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3411: warning: Excess function parameter 'buf' description in 'lpfc_idiag_pcicfg_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3411: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_pcicfg_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3411: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_pcicfg_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Excess function parameter 'file' description in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Excess function parameter 'buf' description in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_baracc_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3734: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_baracc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3734: warning: Function parameter or struct member 'from' not described in 'lpfc_idiag_baracc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3734: warning: Excess function parameter 'file' description in 'lpfc_idiag_baracc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3734: warning: Excess function parameter 'buf' description in 'lpfc_idiag_baracc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3734: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_baracc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3734: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_baracc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4038: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4038: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4038: warning: Excess function parameter 'file' description in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4038: warning: Excess function parameter 'buf' description in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4038: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4038: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4245: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4245: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4245: warning: Excess function parameter 'file' description in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4245: warning: Excess function parameter 'buf' description in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4245: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4245: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_queacc_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:4321: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_queacc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:4321: warning: Function parameter or struct member 'from' not described in 'lpfc_idiag_queacc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:4321: warning: Excess function parameter 'file' description in 'lpfc_idiag_queacc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:4321: warning: Excess function parameter 'buf' description in 'lpfc_idiag_queacc_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:4321: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_queacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4321: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_queacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4617: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4617: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4617: warning: Excess function parameter 'file' description in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4617: warning: Excess function parameter 'buf' description in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4617: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4617: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4672: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_drbacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4672: warning: Function parameter or struct member 'from' not described in 'lpfc_idiag_drbacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4672: warning: Excess function parameter 'file' description in 'lpfc_idiag_drbacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4672: warning: Excess function parameter 'buf' description in 'lpfc_idiag_drbacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4672: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_drbacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4672: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_drbacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4834: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4834: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4834: warning: Excess function parameter 'file' description in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4834: warning: Excess function parameter 'buf' description in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4834: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4834: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4886: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_ctlacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4886: warning: Function parameter or struct member 'from' not described in 'lpfc_idiag_ctlacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4886: warning: Excess function parameter 'file' description in 'lpfc_idiag_ctlacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4886: warning: Excess function parameter 'buf' description in 'lpfc_idiag_ctlacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4886: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_ctlacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:4886: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_ctlacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5026: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5026: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5026: warning: Excess function parameter 'file' description in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5026: warning: Excess function parameter 'buf' description in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5026: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5026: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5070: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_mbxacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5070: warning: Function parameter or struct member 'from' not described in 'lpfc_idiag_mbxacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5070: warning: Excess function parameter 'file' description in 'lpfc_idiag_mbxacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5070: warning: Excess function parameter 'buf' description in 'lpfc_idiag_mbxacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5070: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_mbxacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5070: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_mbxacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5344: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_extacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5344: warning: Function parameter or struct member 'from' not described in 'lpfc_idiag_extacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5344: warning: Excess function parameter 'file' description in 'lpfc_idiag_extacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5344: warning: Excess function parameter 'buf' description in 'lpfc_idiag_extacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5344: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_extacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5344: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_extacc_write'
   drivers/scsi/lpfc/lpfc_debugfs.c:5389: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5389: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5389: warning: Excess function parameter 'file' description in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5389: warning: Excess function parameter 'buf' description in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5389: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5389: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_extacc_read'


vim +3141 drivers/scsi/lpfc/lpfc_debugfs.c

e2a0a9d69ce224 James Smart  2008-12-04  3114  
2a622bfbe1d956 James Smart  2011-02-16  3115  /*
86a80846a68eeb James Smart  2011-04-16  3116   * ---------------------------------
2a622bfbe1d956 James Smart  2011-02-16  3117   * iDiag debugfs file access methods
86a80846a68eeb James Smart  2011-04-16  3118   * ---------------------------------
2a622bfbe1d956 James Smart  2011-02-16  3119   *
86a80846a68eeb James Smart  2011-04-16  3120   * All access methods are through the proper SLI4 PCI function's debugfs
86a80846a68eeb James Smart  2011-04-16  3121   * iDiag directory:
2a622bfbe1d956 James Smart  2011-02-16  3122   *
2a622bfbe1d956 James Smart  2011-02-16  3123   *     /sys/kernel/debug/lpfc/fn<#>/iDiag
2a622bfbe1d956 James Smart  2011-02-16  3124   */
2a622bfbe1d956 James Smart  2011-02-16  3125  
2a622bfbe1d956 James Smart  2011-02-16  3126  /**
2a622bfbe1d956 James Smart  2011-02-16  3127   * lpfc_idiag_cmd_get - Get and parse idiag debugfs comands from user space
2a622bfbe1d956 James Smart  2011-02-16  3128   * @buf: The pointer to the user space buffer.
2a622bfbe1d956 James Smart  2011-02-16  3129   * @nbytes: The number of bytes in the user space buffer.
2a622bfbe1d956 James Smart  2011-02-16  3130   * @idiag_cmd: pointer to the idiag command struct.
2a622bfbe1d956 James Smart  2011-02-16  3131   *
2a622bfbe1d956 James Smart  2011-02-16  3132   * This routine reads data from debugfs user space buffer and parses the
2a622bfbe1d956 James Smart  2011-02-16  3133   * buffer for getting the idiag command and arguments. The while space in
2a622bfbe1d956 James Smart  2011-02-16  3134   * between the set of data is used as the parsing separator.
2a622bfbe1d956 James Smart  2011-02-16  3135   *
2a622bfbe1d956 James Smart  2011-02-16  3136   * This routine returns 0 when successful, it returns proper error code
2a622bfbe1d956 James Smart  2011-02-16  3137   * back to the user space in error conditions.
2a622bfbe1d956 James Smart  2011-02-16  3138   */
51f7e5230d3db8 Jens Axboe   2024-04-08  3139  static int lpfc_idiag_cmd_get(struct iov_iter *from,
2a622bfbe1d956 James Smart  2011-02-16  3140  			      struct lpfc_idiag_cmd *idiag_cmd)
2a622bfbe1d956 James Smart  2011-02-16 @3141  {
51f7e5230d3db8 Jens Axboe   2024-04-08  3142  	size_t nbytes = iov_iter_count(from);
2a622bfbe1d956 James Smart  2011-02-16  3143  	char mybuf[64];
2a622bfbe1d956 James Smart  2011-02-16  3144  	char *pbuf, *step_str;
b11d48e898de3c Stephen Boyd 2011-05-12  3145  	int i;
b11d48e898de3c Stephen Boyd 2011-05-12  3146  	size_t bsize;
2a622bfbe1d956 James Smart  2011-02-16  3147  
2a622bfbe1d956 James Smart  2011-02-16  3148  	memset(mybuf, 0, sizeof(mybuf));
2a622bfbe1d956 James Smart  2011-02-16  3149  	memset(idiag_cmd, 0, sizeof(*idiag_cmd));
2a622bfbe1d956 James Smart  2011-02-16  3150  	bsize = min(nbytes, (sizeof(mybuf)-1));
2a622bfbe1d956 James Smart  2011-02-16  3151  
51f7e5230d3db8 Jens Axboe   2024-04-08  3152  	if (!copy_from_iter_full(mybuf, bsize, from))
2a622bfbe1d956 James Smart  2011-02-16  3153  		return -EFAULT;
2a622bfbe1d956 James Smart  2011-02-16  3154  	pbuf = &mybuf[0];
2a622bfbe1d956 James Smart  2011-02-16  3155  	step_str = strsep(&pbuf, "\t ");
2a622bfbe1d956 James Smart  2011-02-16  3156  
2a622bfbe1d956 James Smart  2011-02-16  3157  	/* The opcode must present */
2a622bfbe1d956 James Smart  2011-02-16  3158  	if (!step_str)
2a622bfbe1d956 James Smart  2011-02-16  3159  		return -EINVAL;
2a622bfbe1d956 James Smart  2011-02-16  3160  
2a622bfbe1d956 James Smart  2011-02-16  3161  	idiag_cmd->opcode = simple_strtol(step_str, NULL, 0);
2a622bfbe1d956 James Smart  2011-02-16  3162  	if (idiag_cmd->opcode == 0)
2a622bfbe1d956 James Smart  2011-02-16  3163  		return -EINVAL;
2a622bfbe1d956 James Smart  2011-02-16  3164  
2a622bfbe1d956 James Smart  2011-02-16  3165  	for (i = 0; i < LPFC_IDIAG_CMD_DATA_SIZE; i++) {
2a622bfbe1d956 James Smart  2011-02-16  3166  		step_str = strsep(&pbuf, "\t ");
2a622bfbe1d956 James Smart  2011-02-16  3167  		if (!step_str)
86a80846a68eeb James Smart  2011-04-16  3168  			return i;
2a622bfbe1d956 James Smart  2011-02-16  3169  		idiag_cmd->data[i] = simple_strtol(step_str, NULL, 0);
2a622bfbe1d956 James Smart  2011-02-16  3170  	}
86a80846a68eeb James Smart  2011-04-16  3171  	return i;
2a622bfbe1d956 James Smart  2011-02-16  3172  }
2a622bfbe1d956 James Smart  2011-02-16  3173  

:::::: The code at line 3141 was first introduced by commit
:::::: 2a622bfbe1d95664ecd4bc1cfe6dacf4788dfc10 [SCSI] lpfc 8.3.21: Debugfs additions

:::::: TO: James Smart <james.smart@emulex.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
