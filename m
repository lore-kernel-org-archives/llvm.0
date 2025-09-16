Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319B31BCA4;
	Tue, 16 Sep 2025 21:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758058445; cv=none; b=V8AcWiS9s3TSlOPg10lUrksAdlVeybBIIJzehwRS2rxXPrcFYN8kuVUYwnw0A+7ir0Kj9Osz92fFO+VAGo44NlzHEiJFnF/3Qi9aaaGlMlsqhIgYQO6k2c8S2eaUf5jmrDwqQIz0aH+MJImruqyWZbkUdqa5TG+ztWTOd8t8n/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758058445; c=relaxed/simple;
	bh=JA2hEQgg+np62BmGePj/ztCpTMEXcA1X+iAb34kkRj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GcDWo0KbPw9Ter0ZaBGePZwOHOE/1M8ED+MmBTemZM9e1YBAJlzj6jwvkWC6pAFiKhs4/+bQV9FsPAK02HScYEjcLWUBuGdD2fiiXlQYZ1us+fudm2RCjThWJoxHnnh/Y+h7PswttEmIfu0FQsp9OtkbwiNS7F0Uz8GMUmC4Kyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+CywYTw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+CywYTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758058445; x=1789594445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JA2hEQgg+np62BmGePj/ztCpTMEXcA1X+iAb34kkRj4=;
  b=N+CywYTwHkmmqWf5CMkxXOvV27wIif15sDQQgk1gO3K7xdeiJIVZrLqN
   eBBSKxV+yNI2zxyGghvQyGwULZkle+3Q2HfuLV4OkacA7E6vkWcIryCFw
   Om/0kAGbAs5VQZu0wp1+EoDfkAZB3IJumkKbFRvNtmHlUyMetRjttNkCm
   D+X7D5Qt7sUKHtLWTZwrlQgT0W4CoY9ObX+NI1/X11f5EKuc+aAXYfGe7
   xjKfWz5EiE4IU42cO1plBwDV9uWhg6X8LIrI6AogrBk8mgr8CrDKn/Eoy
   nprFXNEX9QO2ZB89aQ4Y2CtvwoHlT2+8FsRNOgsVFfEmFxDRdtRj2TNuB
   w==;
X-CSE-ConnectionGUID: OmYHr81oT6mldeC64Q6Rsg==
X-CSE-MsgGUID: 7+/5NItgS3CcQT3GnVZXWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="77793107"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="77793107"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 14:34:00 -0700
X-CSE-ConnectionGUID: L0+mz4L2Rae+gze1dd9DOw==
X-CSE-MsgGUID: KSgTmauXRIa+9FXKUny9uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="179061560"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Sep 2025 14:33:59 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uydJE-0000l1-0C;
	Tue, 16 Sep 2025 21:33:56 +0000
Date: Wed, 17 Sep 2025 05:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 9685/9696] error: expected one of `,` or `}`,
 found `;`
Message-ID: <202509170551.2EGIPK6b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   05af764719214d6568adb55c8749dec295228da8
commit: 6e86e08cdc19804be3701feb04f96f332b31503a [9685/9696] Merge branch 'rust-next' of https://github.com/Rust-for-Linux/linux.git
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250917/202509170551.2EGIPK6b-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170551.2EGIPK6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170551.2EGIPK6b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: expected one of `,` or `}`, found `;`
   --> rust/kernel/block/mq/gen_disk.rs:12:23
   |
   12 |     fmt::{self, Write};
   |                       ^
   |                       |
   |                       expected one of `,` or `}`
   |                       help: missing `,`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
