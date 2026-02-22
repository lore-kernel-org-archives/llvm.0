Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A91624C5;
	Sun, 22 Feb 2026 23:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771801550; cv=none; b=WDU2XlLuFm6yvbbyLC02y9d9kkccyQEApe4zD9bzkEsFWWPAENnoFLxPHbIt5hP065UUJc+b1W/ct6RK70+vcBZCUWoGyg8xuFfRvZNZ2XUg2xYYddREGYVQX+E6PvwdVebUjSNwi65UQLajuL3FIkkkrglRfB7fB1YrkJBe7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771801550; c=relaxed/simple;
	bh=bd2sTvK3CFiA3InaUoknfemsJKuImjXq+nE/Tw6Jq0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fPAqIn8iDe5azaCniEEbbyFncS31dwC55RdeOOPp/oXT9SCV6p4HSzvNyxHKqsTCoxMKeVOObj6jNQKpf8GVbehVFc220pcGsTFsSUpm2+J+XjSweC9KDn0UEon3ybtEqYmEVbbsJV4l/cSDC/8fFxTN735EF1RNgAcnEfyqttY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPkelegg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPkelegg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771801548; x=1803337548;
  h=date:from:to:cc:subject:message-id;
  bh=bd2sTvK3CFiA3InaUoknfemsJKuImjXq+nE/Tw6Jq0k=;
  b=UPkelegg9gyu4I1j0ePCKtSedL5Ioj54VIuXmL9vuZcUFGCPZifN0a9V
   Kh/7D5ICC/d9FKT5sl2NOl/OaHH0JQv8WDvt2zNVgRVGuPZCqWPyipS47
   DGV0fFqHjk+HTsImdmPWM+cq8WZzNMi8gzB0Ri51vLJcHMmVQGC48HEq0
   Hxbw5FaLcO/g670tcx7KBqGsY0j/HdqDj6UNhHyeTq+T+J/o3AiYaKso/
   i1b8Twsj6ze3NcU9R9J2G5NNdGJu1SFEBQnovfWZ34O/ECCQ+Mg3xB4GY
   2mUb75t5He019gxe/LjZfg7s12RWCgeiKdSsGASZmE8bnPVUBKPE4VTPK
   A==;
X-CSE-ConnectionGUID: 6jksnUDmQOKGaE5ueCC9JA==
X-CSE-MsgGUID: bMdpeqS6SLeBKDxlJ/VmLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90384025"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="90384025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 15:05:45 -0800
X-CSE-ConnectionGUID: g4JMYarRS9qu3yWYJLqc/Q==
X-CSE-MsgGUID: mwaQ3/b2RxuGpzMhAqnn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="214483612"
Received: from lkp-server01.sh.intel.com (HELO c63097897875) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2026 15:05:43 -0800
Received: from kbuild by c63097897875 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuIWD-0000000006K-0KHK;
	Sun, 22 Feb 2026 23:05:41 +0000
Date: Mon, 23 Feb 2026 07:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:io_projection 16/19] error[E0405]: cannot find
 trait `FromBytes` in this scope
Message-ID: <202602230700.rbcI2qkz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux io_projection
head:   c4a22eafa4aa47b5c3c75d57488c44e653827fc6
commit: d12fb6412e5338bb69eab42f45ede455a57fbfbf [16/19] rust: io: add view type
config: x86_64-randconfig-073-20260222 (https://download.01.org/0day-ci/archive/20260223/202602230700.rbcI2qkz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230700.rbcI2qkz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602230700.rbcI2qkz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0405]: cannot find trait `FromBytes` in this scope
   --> rust/kernel/io.rs:667:24
   |
   667 |         T: KnownSize + FromBytes + AsBytes,
   |                        ^^^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use crate::transmute::FromBytes;
   |
--
>> error[E0405]: cannot find trait `AsBytes` in this scope
   --> rust/kernel/io.rs:667:36
   |
   667 |         T: KnownSize + FromBytes + AsBytes,
   |                                    ^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use crate::transmute::AsBytes;
   |
--
>> error[E0405]: cannot find trait `FromBytes` in this scope
   --> rust/kernel/io.rs:668:12
   |
   668 |         U: FromBytes + AsBytes,
   |            ^^^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use crate::transmute::FromBytes;
   |
--
>> error[E0405]: cannot find trait `AsBytes` in this scope
   --> rust/kernel/io.rs:668:24
   |
   668 |         U: FromBytes + AsBytes,
   |                        ^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use crate::transmute::AsBytes;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
