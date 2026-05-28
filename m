Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B062F9985;
	Thu, 28 May 2026 02:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935833; cv=none; b=c8nhwbghZCYYM/0825ZEVRFzI1a1hdhX6AzyaL2+v47rClpxYYkSyC0OV7BXCOOHV8R7iOZh5+L0HYiH3Egb9OJ96/NMf07LPjUsx3BlXVO1mvUB2NvFqLyXRRNXP6Md/yBLtFmsU+lbBHTIY4FcdXdGx3tAlc+vNlQodPk2HT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935833; c=relaxed/simple;
	bh=khOy1YHkLh2at/czqg+ErAUw3NkZTduS66BBN1JphJs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ebVy0gq2LYeCPvGY1bMjOuSABEOZBvBRlAU0uQq5dUDT5iRF9ziKmlCTgsdj1IvFECRt47f2LKM/A2yoQMq5KRrVjZ35GLbIRVSKYPoQdB6wsE5xP9CUZ9utqI2h7LzO2y81WWiHmbfsMjJ+ENwypQ+3AkUv7savBCyrGl9lh20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nS1N1ITZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nS1N1ITZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779935832; x=1811471832;
  h=date:from:to:cc:subject:message-id;
  bh=khOy1YHkLh2at/czqg+ErAUw3NkZTduS66BBN1JphJs=;
  b=nS1N1ITZZ71BVfg+bq7iMEu9fLmskQwx7qf3eevbq12nRTAEWAk02uaE
   O55lvyH/V5iSZ5n84br5zE5JN4f4gje9k9kN6PWfdbtmGw5yhk+ybSZM2
   H6CK1TC0cStGnTbZNUgcus2ApVBaFmmahLB4Q7T2xpOwryl68Qy+TPCEp
   2P3FXE8rV+uWvIH1qbFgNE5ntOufzqMsEI7gOPVq5aI+Ui5BRUSGNZI+6
   VlxRb2j0I5oAzQySMbnmjnPPR/PvB4+iPHr92rCGEQsN8eAQu841nOIH+
   pIzdYWDyOSyzagd7ilZhMAi+0t1+FxV2r9C14dhKzZpxjiDO/71QwwYtG
   w==;
X-CSE-ConnectionGUID: yi/BUraCRUallZl5XzIrfg==
X-CSE-MsgGUID: rSChS56kSvuUwZep2wuB/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98352224"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="98352224"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 19:37:08 -0700
X-CSE-ConnectionGUID: Auj00iVvRbCjAEG+YrsS4g==
X-CSE-MsgGUID: f1mOuKQHR7OYfqX/8jPueQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="239840185"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 May 2026 19:37:05 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSQcJ-000000000FN-1Noq;
	Thu, 28 May 2026 02:37:03 +0000
Date: Thu, 28 May 2026 04:36:32 +0200
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Sesidhar Baddela <sebaddel@cisco.com>,
 Arulprabhu Ponnusamy <arulponn@cisco.com>,
 Gian Carlo Boffa <gcboffa@cisco.com>, Arun Easi <aeasi@cisco.com>,
 Hannes Reinecke <hare@kernel.org>, Lee Duncan <lduncan@suse.com>
Subject: ERROR: modpost: "nvme_fc_set_remoteport_devloss"
 [drivers/scsi/fnic/fnic.ko] undefined!
Message-ID: <202605280430.wTYAqI3A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Karan-Tilak-Kumar/scsi-fnic-Make-debug-logging-protocol-independent/20260528-040540
head:   36a4121c6d75bc8b76d0f8211fb04fb4957393e1
commit: 0b04eb634acdf0b014cff5642fe8ea44a186a67c scsi: fnic: Add the NVMe/FC transport path
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260528/202605280430.wTYAqI3A-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280430.wTYAqI3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280430.wTYAqI3A-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

   drivers/scsi/fnic/fnic_nvme.c:227:6: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
     227 |         int idx;
         |             ^
>> drivers/scsi/fnic/fnic_nvme.c:373:23: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     373 |         struct fnic_tport_s *tport;
         |                              ^
   drivers/scsi/fnic/fnic_nvme.c:509:23: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     509 |         struct fnic_tport_s *tport;
         |                              ^
>> drivers/scsi/fnic/fnic_nvme.c:664:16: warning: variable 'start_time' set but not used [-Wunused-but-set-variable]
     664 |         unsigned long start_time;
         |                       ^
   drivers/scsi/fnic/fnic_nvme.c:666:23: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     666 |         struct fnic_tport_s *tport;
         |                              ^
   5 warnings generated.
--
>> ERROR: modpost: "nvme_fc_set_remoteport_devloss" [drivers/scsi/fnic/fnic.ko] undefined!
>> ERROR: modpost: "nvme_fc_unregister_localport" [drivers/scsi/fnic/fnic.ko] undefined!
>> ERROR: modpost: "nvme_fc_unregister_remoteport" [drivers/scsi/fnic/fnic.ko] undefined!
>> ERROR: modpost: "nvme_fc_register_remoteport" [drivers/scsi/fnic/fnic.ko] undefined!
>> ERROR: modpost: "nvme_fc_register_localport" [drivers/scsi/fnic/fnic.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
