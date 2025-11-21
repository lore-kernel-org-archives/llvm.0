Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50F2D94B8;
	Fri, 21 Nov 2025 02:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763693401; cv=none; b=ojaXu8/EweppTu7ZV82w7+q+eR8qt5w7Klh/g+cItp6Sjv08jyIa4ypb4092KP8xy9n+9LUPgHdwzqkkMlbIx5kfDUn/WRxKlQIGxyvBiuRLqeK9iDK9gAwcS3llOMxhWJY/vNXIdZpjGAkD/C54epS3M+PieIv1zSnK1sjdoPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763693401; c=relaxed/simple;
	bh=K94SV6QMRUsgclNuzA+uawtb5vLliCETVk2q+6FBiPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mjJb4hdRmofSAeb8g+OTl+FLsUqEHCpzWtdQ9qT5ZcbAPDeO/Mq6vxPRQwvYjI2rn23AJAOtyu4uAx3q3LzK22KMiiMsZjAog0VQCBZMaeH1r3CAl0G9MSt0DlBnrcH8VhbNd6zwt6J96r6QRCyT5oFaR+4BrJnWqXx5mujmjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKuml+9P; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKuml+9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763693400; x=1795229400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K94SV6QMRUsgclNuzA+uawtb5vLliCETVk2q+6FBiPQ=;
  b=NKuml+9PO1FArtAIG3ep6xnqk6kKE0Cx4AnK+2A/4L1xoOrcXVi3Kxh7
   Tp9aAy4eMYtsUnEeQmLFHku+htiZc+wtJthUnwu3cUzzo5lDMrFSK8DQL
   MVETsf/wwdT6DD3zMRb4DJ1X0/kHAFrdCl3FcelfQtHeiONALqrBUEyXj
   II45X6+BK44h7NK/FW0tTZ3hIxWv0I7xz/Xe+1dDzE/jnJaq2QeTNG3P9
   eRhxFhDEgR5aj+6Bt1EYUvaNCY6RkP8PzoL4lP/MoXpgG58RJZUI2jK9x
   Zr1TUA0kFeWlzcjOzdfMlKf5nQTiZTsJ7rKMqmCUJjth9u7FAwujHLHBh
   Q==;
X-CSE-ConnectionGUID: eIYg30rjR3yvB8eI5WsKtA==
X-CSE-MsgGUID: WTe+ZXStTviW0OMk68DV4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69647081"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69647081"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 18:49:59 -0800
X-CSE-ConnectionGUID: MZYcnEf9R3K4ZNCITvmalg==
X-CSE-MsgGUID: qJ1axJZvShCPEE6KzU/tRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191994606"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2025 18:49:57 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMHDe-0004rk-3A;
	Fri, 21 Nov 2025 02:49:54 +0000
Date: Fri, 21 Nov 2025 10:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jann Horn <jannh@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Gary Guo <gary@garyguo.net>
Subject: error[E0609]: no field `vm_mm` on type `bindings::vm_area_struct`
Message-ID: <202511211004.JW70Scx4-lkp@intel.com>
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
commit: 040f404b731207935ed644b14bcc2bb8b8488d00 mm: rust: add vm_area_struct methods that require read access
date:   6 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211004.JW70Scx4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211004.JW70Scx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211004.JW70Scx4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `vm_mm` on type `bindings::vm_area_struct`
   --> rust/kernel/mm/virt.rs:58:56
   |
   58 |         unsafe { MmWithUser::from_raw((*self.as_ptr()).vm_mm) }
   |                                                        ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `__bindgen_anon_2` on type `bindings::vm_area_struct`
   --> rust/kernel/mm/virt.rs:68:35
   |
   68 |         unsafe { (*self.as_ptr()).__bindgen_anon_2.vm_flags }
   |                                   ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::vm_area_struct`
   --> rust/kernel/mm/virt.rs:76:35
   |
   76 |         unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_start }
   |                                   ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::vm_area_struct`
   --> rust/kernel/mm/virt.rs:84:35
   |
   84 |         unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_end }
   |                                   ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
