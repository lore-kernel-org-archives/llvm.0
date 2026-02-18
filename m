Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1229730BF78;
	Wed, 18 Feb 2026 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771397444; cv=none; b=gsXMM6eVox5dTuTRQtMGwKg8Fhvp5umAQD6QHJoM1Ib21THQ2apWhcFETJiMQwy5nzzhbX8Dzo2nk3ovjmZvrQa/DbNMPpt0pwubd4c4n4gFKSct546t4QE6l5vbAL2zBsO48rXn0+JQMHgJR0UlO64QYGCGQ9/b7I9+bT2yojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771397444; c=relaxed/simple;
	bh=cDrKyuwhjzj8UndbdvLrVaTzZTR+JTRxcEn1qWsUoco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eNgQzGQFsMHbIZDXl8Z8wKZIOU4feWEHBRA+pdd6f9vSof6IvppaY33jaZEnQZQN+694q/Ai2iPL/1vIVsWcUhiXsdn/N/0Q5U4aQYkkX7WE3dIvRjkGRjEMLYKf+8RrjUxHqBfckxGnB4CqH0fnROiO93ToBTpK/DM4yVv3M3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kg6GQLRA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kg6GQLRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771397442; x=1802933442;
  h=date:from:to:cc:subject:message-id;
  bh=cDrKyuwhjzj8UndbdvLrVaTzZTR+JTRxcEn1qWsUoco=;
  b=Kg6GQLRAbrY4+SpSw+DdgteP/Hs4fdZS57lHyVeXKspDb1VoywcXbWGV
   LJN3HRvrVqA4LiDGdajQagE5yPK2huBDtXbcUW5MtLV2RtNJQnPYryd9t
   kaNfHDwJ3WPeyPeX7OzkkCn74/AfIJ8cE4ENovFCinaiEZmUjqF0gvO3L
   hmjh/Ad+fJ9aDDrlPgyy1oAPa8liOPmpRedVOr7pcGKDf3GqJXTAYAgzI
   S3KBd0/SidwMDPDKzdGKXr+VXwU9cEocjfqHIOHYX8MdoB5Iew47xqDDu
   w15x9uGcTUI5H1acODnQ/UI2XumOjCfmZyBQua5gT/UENjtz+Kyy7SAzW
   Q==;
X-CSE-ConnectionGUID: pfv5BfNORnSFf36qtGBpRw==
X-CSE-MsgGUID: D6xpP3eQQQKUaEYjruBbiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72381381"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72381381"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 22:50:40 -0800
X-CSE-ConnectionGUID: qP/QtNcDRoKaphT2BFBCFg==
X-CSE-MsgGUID: BArb0bIQROi2jX8zaCEEJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="212928567"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2026 22:50:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsbOO-0000000128A-0wsS;
	Wed, 18 Feb 2026 06:50:36 +0000
Date: Wed, 18 Feb 2026 14:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 21/28] error[E0599]: no method named
 `try_read32` found for reference `&'a Bar<268435456>` in the current scope
Message-ID: <202602181458.GzFY2Z40-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   37b89e17139395c3a1a0871785230f02e8c65622
commit: 8a2656fc4534f37b3461b9f1b5be347f689f26a7 [21/28] nova-core: mm: Add BAR1 user interface
config: riscv-randconfig-001-20260218 (https://download.01.org/0day-ci/archive/20260218/202602181458.GzFY2Z40-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181458.GzFY2Z40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181458.GzFY2Z40-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `try_read32` found for reference `&'a Bar<268435456>` in the current scope
   --> drivers/gpu/nova-core/mm/bar_user.rs:122:18
   |
   122 |         self.bar.try_read32(self.bar_offset(offset)?)
   |                  ^^^^^^^^^^
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Io` which provides `try_read32` is implemented but not in scope; perhaps you want to import it
   |
   6   + use kernel::io::Io;
   |
   help: there is a method `read32` with a similar name
   |
   122 -         self.bar.try_read32(self.bar_offset(offset)?)
   122 +         self.bar.read32(self.bar_offset(offset)?)
   |
--
>> error[E0599]: no method named `try_write32` found for reference `&'a Bar<268435456>` in the current scope
   --> drivers/gpu/nova-core/mm/bar_user.rs:127:18
   |
   127 |         self.bar.try_write32(value, self.bar_offset(offset)?)
   |                  ^^^^^^^^^^^
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Io` which provides `try_write32` is implemented but not in scope; perhaps you want to import it
   |
   6   + use kernel::io::Io;
   |
   help: there is a method `write32` with a similar name
   |
   127 -         self.bar.try_write32(value, self.bar_offset(offset)?)
   127 +         self.bar.write32(value, self.bar_offset(offset)?)
   |
--
>> error[E0599]: no method named `try_read64` found for reference `&'a Bar<268435456>` in the current scope
   --> drivers/gpu/nova-core/mm/bar_user.rs:132:18
   |
   132 |         self.bar.try_read64(self.bar_offset(offset)?)
   |                  ^^^^^^^^^^
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Io` which provides `try_read64` is implemented but not in scope; perhaps you want to import it
   |
   6   + use kernel::io::Io;
   |
   help: there is a method `read64` with a similar name
   |
   132 -         self.bar.try_read64(self.bar_offset(offset)?)
   132 +         self.bar.read64(self.bar_offset(offset)?)
   |
--
>> error[E0599]: no method named `try_write64` found for reference `&'a Bar<268435456>` in the current scope
   --> drivers/gpu/nova-core/mm/bar_user.rs:137:18
   |
   137 |         self.bar.try_write64(value, self.bar_offset(offset)?)
   |                  ^^^^^^^^^^^
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Io` which provides `try_write64` is implemented but not in scope; perhaps you want to import it
   |
   6   + use kernel::io::Io;
   |
   help: there is a method `write64` with a similar name
   |
   137 -         self.bar.try_write64(value, self.bar_offset(offset)?)
   137 +         self.bar.write64(value, self.bar_offset(offset)?)
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
