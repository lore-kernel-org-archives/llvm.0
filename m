Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058B239E9B;
	Mon,  1 Dec 2025 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764618636; cv=none; b=doqV8jmFW/OaunLuabDaU2oESrgdCMVJrQ0hyRMtK3O0ggzoaDowazguKPR7wGwgjUgnpET9KJVS5TmAbGbh2Qg7BXyqkQpxd44kO3Yhj9BOn/+kS4BmWaIiBklYSUffXRPwlSxU3/aI6niqEVcjjbavE8pZY++W2bVt6vMcu14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764618636; c=relaxed/simple;
	bh=LjizdvqfSSZxNOdDQn7ozcwTXPHs8IKemF6D49sxZrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTNTXUT1NHVjcpHX1vRTkIdAQq541dFZ2Ositm47kbz78nt9nx+TFQSh124Abb/Zl277EZuhIm3ofv4u5RgjvEdY9TzrJDV3dpQPQaMNMI+3npMzhbwvtcyCdBPQu+BbJjKiS7x2MUyjTGWbABksPVSxCIKX3NnnJn47NwB5EuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9euGQFg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9euGQFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764618635; x=1796154635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LjizdvqfSSZxNOdDQn7ozcwTXPHs8IKemF6D49sxZrI=;
  b=K9euGQFgq4MPYuRSdLAqaaQtEbYfEVUo6y81HiaK+Nw/FcVqZWNwwzqv
   c2JJFOsC+RUp3s1r/Oacmlz/z79IUcH2ANEmkSblJMsSLCwpCdZSDbLy7
   Elc8t9ZMlT1SRJ6RXz23OqCWu1YtNqHootWFEurJxOBoXmEa5IKikuRYl
   /ls4NXMGAUyFmTIqHcvaO8kzsHvmH41K6tUd+zrfRhUjcrdg7qAf5M0Ee
   5ustO12HGOaOL6MZnuYuLOfTC/7bHNxak4VMPjs/MIktNH8kEovTURgvp
   EPuNrQm0Gj0HbZBVhtEAE1X9SdsZgq44Z5W4VaAlO6TjweCHIYFLHWJ5v
   g==;
X-CSE-ConnectionGUID: MOD6QCrqRSqrK619uM/Lzg==
X-CSE-MsgGUID: wJvhhZtBT3i2wAZ0dsvIWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66464732"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66464732"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 11:50:35 -0800
X-CSE-ConnectionGUID: erE9KD0DQQyioTD+ExtB8w==
X-CSE-MsgGUID: 0pl8Mgo9QISXQK+NRtCs2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="224861304"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Dec 2025 11:50:33 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ9uo-00000000961-2QrE;
	Mon, 01 Dec 2025 19:50:30 +0000
Date: Tue, 2 Dec 2025 03:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: error[E0609]: no field `revision` on type `bindings::pci_dev`
Message-ID: <202512020342.nribsUGj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alistair,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
commit: b6a37d1d4694111895248b771513153ccace606a rust: Add several miscellaneous PCI helpers
date:   4 months ago
config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020342.nribsUGj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020342.nribsUGj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020342.nribsUGj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `revision` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:411:35
   |
   411 |         unsafe { (*self.as_raw()).revision }
   |                                   ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `subsystem_vendor` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:427:35
   |
   427 |         unsafe { (*self.as_raw()).subsystem_vendor }
   |                                   ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `subsystem_device` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:435:35
   |
   435 |         unsafe { (*self.as_raw()).subsystem_device }
   |                                   ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
