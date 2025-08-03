Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D231401B;
	Sun,  3 Aug 2025 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754234877; cv=none; b=csxyoeQhkTLQeE/DH8jSOhdqHrlUJiYzzUAX7Ec99fXV5xdtV6+kmn8qOhr6O6rhqLHu79KUHxGFRYWrSnERNVGkkRc/CzLhLIKHTqJo1FXB7bGJ+kbMgPFCmbMhaUYl2qR6LPEpsSmYspXhNDvg7vekCpL9DB/wyTZfRPBaWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754234877; c=relaxed/simple;
	bh=X7fOX3lIvVJ1gywQDBfhlqzR5BuaT+AuZQVj7+jLy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FIeIIOitk5qXOpjlhxkgds6JcKetreQ9nk4Lwi42gtX0Qdgp546K6yWUD5WPucbjJRKrCsNltoq3pVuKliQBSiz+Q1SJxzd9ubDQooJe0IHUEooeGwuoWpMGzz1LdJDPs+P5p/N40xz+5TUYzWT6LtOZpAXm5NBQJeGzBQNZTvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C63xucp1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C63xucp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754234875; x=1785770875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7fOX3lIvVJ1gywQDBfhlqzR5BuaT+AuZQVj7+jLy+k=;
  b=C63xucp1pUGnr1Ew9HDZtQSQoANrXfRSszRQeni8e46IcwxCoXYDLBoH
   +mPpO4OzxeZK2P9Pl/XE5PmNybxncd26Edkj0EvoYzE44w9NjWX05C9S7
   6ZEpIsN02uxvAnZIJiaJJ4C2qPWcfokd/lXVdcFr1oz8jdJONt03OWQ/8
   DoSKUYnlspy1yqHcCmBIXgqw/nrfaaWgcEETCy6eLYMgSgkIoA/wTwjMX
   t5P/E8QMQd2Mn6UcMjWbkxPgdQU2R/CpbUpeaPkAjmxsbrbPdkZS7FDSM
   oSRzOpNZRdiwt/d0Dw6KDissxkTehG0WFx6vt3X4TlIqseGCjhAdJ2b9j
   A==;
X-CSE-ConnectionGUID: bIszaupGRr6l7dSi66iZ5A==
X-CSE-MsgGUID: OxYj4jfRT6um5Uoy0dGFXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="55707633"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="55707633"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 08:27:54 -0700
X-CSE-ConnectionGUID: FYOZe2xmTASiSaP52rTZ2g==
X-CSE-MsgGUID: TMp9kQu0TeGt8bJEX60Dnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194793103"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2025 08:27:54 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiacp-0001dz-2V;
	Sun, 03 Aug 2025 15:27:51 +0000
Date: Sun, 3 Aug 2025 17:27:12 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-libcrypto 7/29] error: the following would cause
 module name conflict:
Message-ID: <202508031751.kMejfbaa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-libcrypto
head:   7fbf88966943cc7f22f9dade58354f59b70be55d
commit: 8c1441e6b8885a77961709b2ce0eb44d68f4bd5c [7/29] lib/crypto: tests: Add KUnit tests for MD5 and HMAC-MD5
config: i386-randconfig-2005-20250803 (https://download.01.org/0day-ci/archive/20250803/202508031751.kMejfbaa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508031751.kMejfbaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031751.kMejfbaa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: the following would cause module name conflict:
     crypto/md5.ko
     lib/crypto/md5.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
