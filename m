Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FE192B75;
	Fri, 21 Nov 2025 02:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763691478; cv=none; b=Obeuui5M1PvTcV8TmJzjcO71Zqx/erkGxKQte8+qsV+YhYSGgCksGMD7rEP9bBFfHihbngwPj6ZaZOghHafqUgELqCqglTpwJ5+/+mLpRhIqIaKr1gxDSx1R4QBBqm/MvGJNhnm9M/qud1sFNFgjxjdxhrWnixssBBH37/UuFZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763691478; c=relaxed/simple;
	bh=KKFkoZ0CkpXxzdLpgdAaS2bWx4sQivysV7gL/LituU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hl6gFKspotmyAUkvvbNSCIXyCJ4riiZzvV8hhlBSX7lrJbYdFx42o1A2GTavqthpCYVUuxmoXHc0svnrj7aNIfhRwLoVaQ9KDE1zHdFzJRY/iCiq+nVr9zwuRzQ5x2gRzC8pyLCE9a9qWfJ+dlm0vD+zjQpvHvMWJyRnXMJ6iAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8ZUkk8m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8ZUkk8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763691476; x=1795227476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKFkoZ0CkpXxzdLpgdAaS2bWx4sQivysV7gL/LituU4=;
  b=T8ZUkk8mKu15Hj3a9/ft6p1FA5DwQnca9hyreCiJhKS1EYM1ZCAxxF7K
   RHWDfwQ33xHTFz/dClQ98YwiQS0IIhQkL8ku1W29MCWS3PaqdmFsfAt/0
   kz2U5BtD+4cirwRK2nh3wB1w3W3Op5ZSJqkns//oSHEtwj8KneAEeA+SF
   oxg9vLRmQSzTvaGW+HrQy7h86T5VNqe3dyqLdnIygaujyEJEVNK74YM5A
   suV2pA/6gTqKBbIty/6+Tq3Pu24cHsliAn6+ufKPU2A5KKn6mwJo8QXhT
   Ov0bkTMbQzb4Z7Mpt+ZgPhL8hjH6NWzEinAn+bSoTnrfxj7js5SMBt12u
   A==;
X-CSE-ConnectionGUID: SUrM9uB1STWsqIRPPET3Hw==
X-CSE-MsgGUID: 7JToWW6oTHKmiCUCJctmnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65867109"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65867109"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 18:17:55 -0800
X-CSE-ConnectionGUID: htcue1W8QKqHRGrUcIvyvQ==
X-CSE-MsgGUID: +G1xQ2ePQQ6Wdh0lVZCRYA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2025 18:17:54 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMGie-0004qV-0t;
	Fri, 21 Nov 2025 02:17:52 +0000
Date: Fri, 21 Nov 2025 10:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: error[E0609]: no field `driver_data` on type `acpi_device_id`
Message-ID: <202511211001.ultbf9IZ-lkp@intel.com>
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
commit: a74931eb59cf6b914e1b9471d9abd4429176f6af rust: acpi: add `acpi::DeviceId` abstraction
date:   5 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211001.ultbf9IZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211001.ultbf9IZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211001.ultbf9IZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `driver_data` on type `acpi_device_id`
   --> rust/kernel/acpi.rs:22:87
   |
   22 |     const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::acpi_device_id, driver_data);
   |                                                                                       ^^^^^^^^^^^
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `driver_data` on type `acpi_device_id`
   --> rust/kernel/acpi.rs:25:16
   |
   25 |         self.0.driver_data as _
   |                ^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `id` on type `acpi_device_id`
   --> rust/kernel/acpi.rs:45:18
   |
   45 |             acpi.id[i] = src[i];
   |                  ^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
