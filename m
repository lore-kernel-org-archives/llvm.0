Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C737207650;
	Tue, 18 Mar 2025 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311442; cv=none; b=U5Uyi1QJyqselcFt32OyKsMZi8NsSlmXJR+rom26+HdFaeQem81aPETc7uWiqb7QzsDrqWIGsxYWvrpTbsB81cxdF5YDPrp2L/MktQTD0UIbYesH7opDxbu9KzPEdc+ngGGRGc75fTEZq7G7lDjsQAYSwHj81WVcoMqoZmOf740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311442; c=relaxed/simple;
	bh=JAvu1umPYP5wxpojZDUKz51DsO814eKTbuaUHENNPLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFPEvQdiq5qZxqHyTFY8wLqUeGxKSp6fHpV3D0QshHrZ4OtTSFkkSSjKjNRmlwOh7RynHSYV76zL5G5PVl0qnNsVs+qaOX9QyLTs/eFuhzwnNGc8YSHh43gTTB21Ik1kC7dALh/DhU/NxLEiSohT03URELE422Nnrr0SqQGyZ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGvZ6w8X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGvZ6w8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742311440; x=1773847440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JAvu1umPYP5wxpojZDUKz51DsO814eKTbuaUHENNPLc=;
  b=BGvZ6w8XoXjzYOEAb7DyM4A9GxZkZarzJlVWVdBLW99BP3lVJpfqc1o+
   GkrwSTdvXqvMXqsV2OKrBnRDw+udXOd+5RzGjZJU+YSsVnmIKiDTPIfi/
   3E1OUApqoLFgayY8lmTSnwndmTPbjSotvEmPypp6v3ZnC5wvPQyLK1fy6
   ZdigBK8H5eWZurMHSsBGNZP7ytA7RqR+iJXCPKDH8gE4qSOgikC0vVdr6
   PJa8lTQzPbIdEBxFACL7T1/SefG5V3LiiRYWzThlzCMvkC2fgP5dVLq3a
   T24ndg3hyznbWADRHl6bSHmRACC+TPyk+MwMe2dImMc56HfJmCcKYkKKA
   A==;
X-CSE-ConnectionGUID: TAP6SKcfTTm+dz2p+VnRtA==
X-CSE-MsgGUID: hq5M6NgWTVC8uN4TeborjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43629084"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="43629084"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 08:24:00 -0700
X-CSE-ConnectionGUID: AF3aio6HQo+JGTDp8C3Kdg==
X-CSE-MsgGUID: btczNph4T8uHOAgVeR/vxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122261376"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Mar 2025 08:23:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuYnL-000Dt9-2c;
	Tue, 18 Mar 2025 15:23:55 +0000
Date: Tue, 18 Mar 2025 23:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Justin Stitt <justinstitt@google.com>
Subject: vmlinux.o: warning: objtool: .text.rk806_set_mode_dcdc: unexpected
 end of section
Message-ID: <202503182350.52KeHGD4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   76b6905c11fd3c6dc4562aefc3e8c4429fefae1e
commit: 9bf4e919ccad613b3596eebf1ff37b05b6405307 Bluetooth: Fix type of len in {l2cap,sco}_sock_getsockopt_old()
date:   11 months ago
config: x86_64-randconfig-077-20250318 (https://download.01.org/0day-ci/archive/20250318/202503182350.52KeHGD4-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503182350.52KeHGD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503182350.52KeHGD4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text.rk806_set_mode_dcdc: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
