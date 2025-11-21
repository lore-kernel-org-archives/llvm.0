Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1890723AB8A;
	Fri, 21 Nov 2025 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763711192; cv=none; b=eHe4zThD4baHGBkugEt70GTmOiTVYik5Ji97Cr+8hS+jC+vc1XCxhk/7h7Gq5M231iDphEtEpx4mp2MU7g7GJ1UWtBaz3GWQFBypgoEHr3BUWsFhhAEvwbcvE7+9AgLCklXPf1Y/BYNKYZ/yka4x28XzQl06nacCthbVbbq3xkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763711192; c=relaxed/simple;
	bh=758owg6Uln4p10srjHlihJGGKUBXvqN48Kdezn62XI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gTSyNa3DtSHSg6+eAtsOc+NxPgNgIJ03i/alhQhzxnOrO8Ztq2dlZ/dQc0nhPWwCwD6IeXK8Oj32nvsN4RFBG/j0Lfi7tnhStQTMJ8ByvDDdvXUolNtUSRMLmPGIA0r+qItCSb0rV0D+Bv2/fOjjWArN9EKi29vqpJRXGDSQa6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl8Kdw/1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl8Kdw/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763711189; x=1795247189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=758owg6Uln4p10srjHlihJGGKUBXvqN48Kdezn62XI4=;
  b=Hl8Kdw/12AS/AQRjQhJU7Chythb6xMPqOW7bt8bARoC6hvkD7Rg0o9+a
   rTazHzJyADsC9VfFuGCtRYwymtssVh3jENo+7bl5R8U5n+sELVxfQ8u5/
   cOl7H5qXtctS9jQ08phlbTDmPX45k6iWQYBOEKnI+TD+sAWwbC7LqBkAz
   lWnO0H9e+KqF/78AkSVY6fsRpJKsjQPgzm2WARgO8VwbHntmYrm66/dFG
   NDMd0dxisdUJGMMIv8CrtEmpImtLuav9qQLQGb11DohpH3XWW/+MISH23
   XK6IuG7PwQKPji9RABscTztJWlmTV0apwegl2p6FChlroIjfRdlVNu5yI
   w==;
X-CSE-ConnectionGUID: 0nk7fGWLS3qaOPtWl3maJg==
X-CSE-MsgGUID: CQwQVckKQ/e9DW2kJSpWXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65732888"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65732888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:46:28 -0800
X-CSE-ConnectionGUID: 1yy6WW1mTWG4UU4LHkbYIg==
X-CSE-MsgGUID: ECscD4sSTZm3PmhQiVjtig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="190837512"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2025 23:46:27 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMLqZ-00055L-1m;
	Fri, 21 Nov 2025 07:46:23 +0000
Date: Fri, 21 Nov 2025 15:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Gary Guo <gary@garyguo.net>
Subject: error[E0609]: no field `mm` on type `bindings::task_struct`
Message-ID: <202511211538.sHKbv5Gl-lkp@intel.com>
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
commit: 6acb75ad7b9e1548ae7f7532312295f74e48c973 task: rust: rework how current is accessed
date:   6 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211538.sHKbv5Gl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211538.sHKbv5Gl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211538.sHKbv5Gl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `mm` on type `bindings::task_struct`
   --> rust/kernel/task.rs:286:44
   |
   286 |         let mm = unsafe { (*self.as_ptr()).mm };
   |                                            ^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
