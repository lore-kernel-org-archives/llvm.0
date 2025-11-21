Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0512F1FCA;
	Fri, 21 Nov 2025 06:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763705481; cv=none; b=VPOC1TsdDZG5O+rBI0IqqGMXv/lZs14TwDgcmaKNnJzFc53HRbhJxPS868+bOgozgSZ6kSyNPw5aKdx4dS9KbxJvh3vuBuxtdlkxgXq9R3FShW9P4xP3hnp83LzS8jLZ+0zUZmxXTKOkQ4FqcDApvx3ae3+Soyx3t2ZzZJDPNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763705481; c=relaxed/simple;
	bh=O2s8gRGNVCOJVzRZfhZ7IBunGWc12YvcMoUEWTxc3z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T2odh/umvQZ5agV2b3K+4VDhtjeYswtarJUb21sPKCv3WRuGQTC6YPdNqIrB9NaJswwWKPKRviZAPMtHbjB64bCYBFN+otYQLWaSpmBdgJnkLRgUqw+NS+veEd1l3+2VD0aGwWvMoilBhA2g5F0m6XSvYhYLMi0lFCwTXhCPvbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gi/e00yq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gi/e00yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763705480; x=1795241480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O2s8gRGNVCOJVzRZfhZ7IBunGWc12YvcMoUEWTxc3z4=;
  b=gi/e00yqUUJkyFAcQf/T2rW6Qmihpf9jnghtTs/2gM0CZ/Cygcm+mp5c
   Muhunap1ttufl8pr51ijESjhSHv4JrtaOYoILVjn4kxExc5jU2CJMTqVw
   MQ0HIv6qoASCN4QraMx2KK/jYMvjFfhErKjebJZxYeVym+XBeiGs06J68
   q/3Cy6FPgNitcPVNnCZywk47zSjU9dHAEx0JrUkfRlh1P6lfSfclrBH6x
   MXgJdzDX+Hmj0JqA/b2L8+YgRP1aDiKAGoxFPmeQzmCZNHCTolbSLlJwy
   trqnm7ds3YBFyLqcihpsu0+L32iqH2bVEhDkfJiJA967/jVnlSvvXhHDU
   A==;
X-CSE-ConnectionGUID: 9cchQG3sRYSWYRpRlxXaUw==
X-CSE-MsgGUID: u4VXV0C5T4uPn5kXt2X42A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83184403"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="83184403"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 22:11:19 -0800
X-CSE-ConnectionGUID: BgTipryjSsSokuRXfl3qPg==
X-CSE-MsgGUID: j1cqXrjSSJaAnngHBKCYPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191481418"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2025 22:11:17 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMKMV-00051t-12;
	Fri, 21 Nov 2025 06:11:15 +0000
Date: Fri, 21 Nov 2025 14:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: error[E0609]: no field `revision` on type `bindings::pci_dev`
Message-ID: <202511211427.qHtUtZAb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: b6a37d1d4694111895248b771513153ccace606a rust: Add several miscellaneous PCI helpers
date:   3 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211427.qHtUtZAb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211427.qHtUtZAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211427.qHtUtZAb-lkp@intel.com/

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
