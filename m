Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCBD2E738F;
	Wed,  2 Sep 2026 01:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312358; cv=none; b=pCytUb3F/iRwllfB5qTlyBRwa+pymNk1pKcA+H4eDhWjvxwDAAlFhqA3KMYiy5iB8r1f09KUjLra01o4itLESOCxY8f0ra5ffeZJwX+3G/XvGRU4aVok0DSceyY9BGan5tPiCxXp3vU/1fG1BSQ/Ep8GZZ0ZyO5owCtzucyyURc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312358; c=relaxed/simple;
	bh=gpKdqR6YMs8qMn7zfNdNfWn66q7zEhgiNuV7x3IrTp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RTdK6WdSsp/+g8XirPIsrUjbPTRJs38DM5jfvBQjW2ilxdGbhFw/C2OPZ7Lo9R/fNYETBNovL3zX/LyI/J7EegluUnuy54fpJ61iLprrOkdiuacP7uzSjWk3rh0CM5zLDj8rg1Ckuyp2XQbvsMHAJXZCay/f3kuhlP6Tb+ZqrJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECIhKC42; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECIhKC42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788312356; x=1819848356;
  h=date:from:to:cc:subject:message-id;
  bh=gpKdqR6YMs8qMn7zfNdNfWn66q7zEhgiNuV7x3IrTp0=;
  b=ECIhKC42MBOvhU2G19wazmgPsxGGBO/F8LJBGfi/WR33M2Ic8UisNu2b
   UX3I3kQTCXhT7ZZilB376tudvDixYk7GkXcHVQOMrlCVXXd3StJZiH7zI
   lAyD9qd1igZXqDr8oWTXBl1qez6QEEt4QBWk9L0pZs+ffbACF3T1MBl1C
   cJGOvDrqAd7Qoe9QTkuZS0Th3NXd57KTJD0F1+wReT9fYH94fYRY3nNo9
   /SgN10JqMP6/uAeURC8pge2iFdTKllxl5qPE6xzM/73grp1Pi4vUwq6jz
   91jt9tvXgFZM/eN9DT1IQn/BkFbbi2jcGqXs+bGuzC+xvfLubD41YpqyN
   g==;
X-CSE-ConnectionGUID: mAcMgb/8Ti2TFGUez4IBbg==
X-CSE-MsgGUID: iu1tnjq/SZmkups5E/J6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100271668"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="100271668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 18:25:53 -0700
X-CSE-ConnectionGUID: M+slTJxkR12xZbqU+zqzvg==
X-CSE-MsgGUID: d6BtQqXYTF2PvONljQJ6yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="265544962"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2026 18:25:51 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1ZjY-000000001iE-2Mnj;
	Wed, 02 Sep 2026 01:25:48 +0000
Date: Wed, 02 Sep 2026 09:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>
Subject: [asahilinux:pr/583 588/972] error[E0432]: unresolved import
 `crate::io::IoKnownSize`
Message-ID: <202609020935.63ffCCms-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux pr/583
head:   cddf57e96d46510a9378b0fda93f6db65e4976a8
commit: 65e2da0cff882c45431405284caa8875b5e7e15c [588/972] rust: drm: gem: shmem: Add vmap functions
config: arm64-randconfig-002-20260831 (https://download.01.org/0day-ci/archive/20260902/202609020935.63ffCCms-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 316b0edee400b3ef72ed0a082dae9bd337ac01a0)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609020935.63ffCCms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020935.63ffCCms-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::io::IoKnownSize`
   --> rust/kernel/drm/gem/shmem.rs:26:9
   |
   26 |         IoKnownSize, //
   |         ^^^^^^^^^^^ no `IoKnownSize` in `io`
   |
   help: a similar name exists in the module
   |
   26 -         IoKnownSize, //
   26 +         KnownSize, //
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
