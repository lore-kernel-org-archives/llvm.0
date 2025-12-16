Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAA1A840A;
	Tue, 16 Dec 2025 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849564; cv=none; b=CvNS286+nb7eenWfm+xDu9VWQ0ZXjsdtCV2v+9MT2NGKE2SThwpx/A2H/XN6VCAGCggbe790tySstwXO1WFjTf/WOkVTYwEZMKC7Zz4iJQdAqe85rtb0YZ0wKXTtpj5zQAuNeoLbxs2ebhFJ7CSVAtsZHtTAe4+DB1SbNWida9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849564; c=relaxed/simple;
	bh=1y+AfcF9fj2JCrtn10mqB8ExLsMeg0TPdN4H9QQvPP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6tHm6mwp1newsGdjwKB4ISezBrw+BqQK9PkN21vwkjC8kOb2vWxMVpWCFEFjLNTblJTZcyEGSRm9h3pUrMCE3+oCEToWkDzHeR8gD1m3UBOI+gYLFDSvnz1NsjHrjmmXGlyzAPwllhp39tyQul7MF92483c+kvb+0qn0Wj/vUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbNr2RU2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbNr2RU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765849563; x=1797385563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1y+AfcF9fj2JCrtn10mqB8ExLsMeg0TPdN4H9QQvPP4=;
  b=kbNr2RU2IeabcSTBmkPu0+sf+CqCs1uDcH6v5Rw9BPLHSZ+xbQ6v3UFT
   GvrT45i9OovJzOPGyCYYWS3S8p0BRUXYMgkur5tSB7uaC4uaFf++1PHSI
   UUqo40ire+jLsHc7ET48ddBSbgJu2UsKdqPOQcwhTZXvabCUYd7UXqmaK
   SZm7+nw8l+4BdafNuxbUyMV2sFu9u4L4jXGoKzWsDdhmFr0yPEg287Enw
   z05aadbu2IJGLc3JTkbuzHzDpKlYwlSDakEWOAla3andSFcPtyV6ZhHUA
   45XLNPYBDiWIjmT0H5KXuH8+/HAq7D4B38hlQfPFkUyY4atGzHxEatwak
   w==;
X-CSE-ConnectionGUID: vkP0rjX/TX6UAjZgYF6RaQ==
X-CSE-MsgGUID: KAZL3E4TSGaYtuWH/kXVgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66949828"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="66949828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 17:45:58 -0800
X-CSE-ConnectionGUID: aJ+4myAYTGu0cQy/NbfdmQ==
X-CSE-MsgGUID: ZhrIK6C5TRyy/DiX1WsbNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202284957"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Dec 2025 17:45:56 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVK8Q-0000000011u-2GgO;
	Tue, 16 Dec 2025 01:45:54 +0000
Date: Tue, 16 Dec 2025 09:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	Armin Wolf <W_Armin@gmx.de>
Subject: [rafael-pm:acpi-queue 1/29] Warning: drivers/pci/pci-acpi.c:888
 function parameter 'root' not described in 'pci_acpi_add_root_pm_notifier'
Message-ID: <202512160913.bOymxd8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-queue
head:   e88d169a6053918f230dfc78ee0eff2c2a2ca9bf
commit: 5194aade5e28559c33f0e11c54f4783dfb162213 [1/29] ACPI: PCI: PM: Rework root bus notification setup
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251216/202512160913.bOymxd8S-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160913.bOymxd8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160913.bOymxd8S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/pci-acpi.c:888 function parameter 'root' not described in 'pci_acpi_add_root_pm_notifier'
>> Warning: drivers/pci/pci-acpi.c:888 function parameter 'root' not described in 'pci_acpi_add_root_pm_notifier'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
