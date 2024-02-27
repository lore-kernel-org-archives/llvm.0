Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8474053385;
	Tue, 27 Feb 2024 05:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709011929; cv=none; b=i66t2Pi98lBEi8JhZOS7tutFXx5bmX/Lqii8J14/i5fLsHFXu10AA94L1ymf/biUJHrlEoV3yzcUe5qBJifXElDFwTjM6Dx9VkSMNamYMD3EP4e7Bv7fEftTTsGvZL453/RteEmWgQAWKR+T9lOWAsny2C84vP54RmLk1FC7m1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709011929; c=relaxed/simple;
	bh=6i1Oa1esxsXGGBat7zhgVxsJoqk4GBn1ewO5Bp7RzIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfUQFtckKEWPkv628Ilmg8o/GFFBE8sItx+AzlazUKI85Rm7aQZCcpMjALfuWKCTPcAwXNLLlA7uxisf90zihkA8qNG8OwEHNJmgUK4hSbLsi+TzLPuwhs3PnVkh9mQvPFSxJL5l/TnAGcL3uwW1QMIX6o/n6oDo5by19hu7VhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAzTOCW0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAzTOCW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709011926; x=1740547926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6i1Oa1esxsXGGBat7zhgVxsJoqk4GBn1ewO5Bp7RzIc=;
  b=hAzTOCW0joxalVTFOmM/2PRikqi9gQT9Qx3rWvdyNS5C1N4u4OWRigCq
   tofuygg7XmZBWVwQOEVMDSggmIkwvZRD9YvU8x/ZFtXmrXMjhLdmH5XqF
   ksTVpotUOgPsdYWGScBQuq5kkGfKNqP4rjhT6X/L7Wz7O7MHyldumTeiV
   nozoSXMqw9wLiYsHGbu0br/7ad3dPhIUB9WKnRMARuuK+FAAElCBHrzFp
   f6dVFKeUIcb4wWAKtxUvAPRdP40QOMrznSOkDUdRez6tzudbasXOWvRSr
   pIK/41lDBq3lj42QuxTVl8zsyE7hbgDQYgrp/xWtwcqDbRAkQgESgZFOz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="20882105"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="20882105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 21:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11585293"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Feb 2024 21:32:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1req4O-000AyN-2S;
	Tue, 27 Feb 2024 05:32:00 +0000
Date: Tue, 27 Feb 2024 13:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Szilard Fabian <szfabian@bluemarch.art>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 40/50] ld.lld: error:
 undefined symbol: battery_hook_unregister
Message-ID: <202402271338.3RhwnBqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   cd4525993e49f1449e9380bd28fa1179b05c911d
commit: 611d56d76dee8fb4a362cda7eec787cec70dac75 [40/50] platform/x86/fujitsu-laptop: Add battery charge control support
config: i386-buildonly-randconfig-003-20240226 (https://download.01.org/0day-ci/archive/20240227/202402271338.3RhwnBqC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271338.3RhwnBqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271338.3RhwnBqC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: battery_hook_unregister
   >>> referenced by fujitsu-laptop.c
   >>>               drivers/platform/x86/fujitsu-laptop.o:(acpi_fujitsu_laptop_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: battery_hook_register
   >>> referenced by fujitsu-laptop.c
   >>>               drivers/platform/x86/fujitsu-laptop.o:(fujitsu_battery_charge_control_add) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
