Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A62D8766;
	Fri, 21 Nov 2025 10:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763720145; cv=none; b=jbBNK7SY5XMAlGINalkLdWGSyfyCgIIJZ0QojZrtq8wdKQ63ZPmrN6XwdJ8lY9WIiirHBOd/DwV+uHMc/tyCmtaOd9DB5W9IyCEiruEzaW75FM78n6f/TG8C0Mj9MiqOxyzqr0EF02Rjx/91DSXpYpS8SaPlaCynDi5DGGgQmbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763720145; c=relaxed/simple;
	bh=D8RegbU7kxKRprPZ8sPF8w5YKftnRVFcqfQ2UNLuI98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JlYmEok6HK0JiUKq9praftz7IKfQs98jzBYhYbUn4fBoFWbE/LAtpEKpZL+lNw30kbVlr/vPLW8MI50mEIDRrlXeGxjmIMAxqKr7lY6jJoF8L2eX8+/sL1Ses5AfOKdn519WAqPZAk8cv3rS+vDpD/2Zz5QzVmDsgbMhSLsJ7Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJIeHJD8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJIeHJD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763720144; x=1795256144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D8RegbU7kxKRprPZ8sPF8w5YKftnRVFcqfQ2UNLuI98=;
  b=KJIeHJD8Woo3dKeKPitL8piASQIWYKYCdZOj6YhDB67wlRNzM5HtM6+k
   PUo994Bw6iGRYE5BGm3i9KoTGZgrhcoy/IGUZNPBIEIeik0TPOVrSIESN
   nJvRYGr5f3VUXA4ozaRcHBquSR+07wqfDe+KaT/86qMrBL/dnW4Chf3QY
   4x9x66vGzZo9UjajHs333SXEGtCaBRaMt71kxzVpR+X4ZUBsQijAUsgSe
   qYm9fpckS5g10ZjqidamjGRyql3vGv2C/r+xDsdyGKbi1WRy+A/Hh+dOc
   8rqN0UDCbvFKgzHpErj1MujBzI/8ZwqKZfqMdppd8AXPewmYaFN1JrseC
   Q==;
X-CSE-ConnectionGUID: Xh5QuFnwR5GkRp/jjYH21w==
X-CSE-MsgGUID: CKHEtf3eQgmFSu4Tx19WNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65848569"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65848569"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:15:43 -0800
X-CSE-ConnectionGUID: XcPf6zgKSc6FYzTGBnJkxg==
X-CSE-MsgGUID: nyNEdnDiRXydgNuAU/ooog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191904416"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2025 02:15:42 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMOB2-0005D6-0K;
	Fri, 21 Nov 2025 10:15:40 +0000
Date: Fri, 21 Nov 2025 18:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: error[E0609]: no field `i_private` on type `bindings::inode`
Message-ID: <202511211855.b00OHWgV-lkp@intel.com>
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
commit: 5e40b591cb46c0379d5406fa5548c9b2a3801353 rust: debugfs: Add support for read-only files
date:   2 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211855.b00OHWgV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211855.b00OHWgV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211855.b00OHWgV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `i_private` on type `bindings::inode`
   --> rust/kernel/debugfs/file_ops.rs:77:34
   |
   77 |     let data = unsafe { (*inode).i_private };
   |                                  ^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `private` on type `bindings::seq_file`
   --> rust/kernel/debugfs/file_ops.rs:99:35
   |
   99 |     let data = unsafe { &*((*seq).private.cast::<T>()) };
   |                                   ^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:115:13
   |
   115 |             read: Some(bindings::seq_read),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `bindings::file_operations` has no field named `llseek`
   --> rust/kernel/debugfs/file_ops.rs:116:13
   |
   116 |             llseek: Some(bindings::seq_lseek),
   |             ^^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
