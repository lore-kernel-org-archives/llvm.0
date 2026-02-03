Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B1E2F5311;
	Tue,  3 Feb 2026 20:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149205; cv=none; b=b8ANcieapWrrf7ABDkx1cDYInFyXgXyX0GiW5rHkDP0DN6QgfjYe1Yi5El+f0wi+qEnt9P7GXhuEbwFPwiSDJgeQs7ro5i+VmTyQIJmszHoXloNd//nawdQzzOPpiusDrGIpXBmTwUajdWUq1u0GbMRZN2vtM5ewHchXnlFHW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149205; c=relaxed/simple;
	bh=oTUttBJTQNeAcl8FyFeDmAbW7EwLrgPcBhqsx+D+0pI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Aermttc9PSL78FF6z/GYITt7K9r58NEuxW0T0rU/L59aNu2BMQatcaqBYeeph53OyO787q2nJYA4UUHWZ21WDq1rXrSu/bBlvU3y73QY7vqp7RctywuqxAU5+wkKYfb1LwOufoeHPMHCifUBMSiaU7OhZWSTVODwYiyYttpKYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhggE5i3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhggE5i3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770149205; x=1801685205;
  h=date:from:to:cc:subject:message-id;
  bh=oTUttBJTQNeAcl8FyFeDmAbW7EwLrgPcBhqsx+D+0pI=;
  b=mhggE5i3qBCDg3zA7Sn8CI91dOgCUBKgAckYV7IBhhTkdkTVfHghTzQh
   yhnlvUwl6L/2UWgoyehbZL+lrvB9uB1jo62VCj/NYbAgx8gKn72QEEibL
   wDszj2oIHZC8TIf8BWfEz7bChyg0ALGHcXXpSL9uQDcvQmuXtn58T8WM+
   E5Q6RiFGOExtkBQTCLRuWYUIHy68USlsusb/PHRzPvbGJXC/KEoNffiZV
   ytymULQHWbCuA9SZ9E5FI7XKMF0AjVXk90BnSVWMLx9+TOwqNCs0kWiKG
   NFm/TDQZCaXcmIlJMpsHZnfI/QtDiByLBbVTFZZT3fYGDp69unmlG0Wey
   w==;
X-CSE-ConnectionGUID: 1ZLXeEj2Qp+ct7IzmL0x1g==
X-CSE-MsgGUID: O0RC8NT1Tv61TJD160cVqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71052637"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71052637"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 12:06:44 -0800
X-CSE-ConnectionGUID: 4dKkNWvJRM6kQHyGVEMZtw==
X-CSE-MsgGUID: 8FzvLQIuQnmWkoInWr1ogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210043902"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Feb 2026 12:06:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnMfX-00000000h2q-1Dlw;
	Tue, 03 Feb 2026 20:06:39 +0000
Date: Wed, 04 Feb 2026 04:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Alice Ryhl <aliceryhl@google.com>
Subject: error: kernel-address sanitizer is not supported for this
 target
Message-ID: <202602040358.gVbDUXXQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de0674d9bc69699c497477d45172493393ae9007
commit: ccb8ce526807fcbd4578d6619100d8ec48769ea8 ARM: 9441/1: rust: Enable Rust support for ARMv7
date:   10 months ago
config: arm-randconfig-001-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040358.gVbDUXXQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040358.gVbDUXXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040358.gVbDUXXQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
   28 | #define __SANITIZE_ADDRESS__
   |         ^
   <built-in>:367:9: note: previous definition is here
   367 | #define __SANITIZE_ADDRESS__ 1
   |         ^
>> error: kernel-address sanitizer is not supported for this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
