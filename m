Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B3A3A1CED;
	Thu,  5 Mar 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716381; cv=none; b=N9TtvfFQB3o06h99shKS3cGwSVJwx+fjOmVOSGek7CUTqiiaCkY1SZCNryA5uN1mTF56Wv4z+lkVsfJO+/JxaU5vdppgkhEWloYwkLNaj8aometY0V2oiN4Fyu67GNB2sIecUBpcsjlLn3AQwWuuSpL9TAqayLYOQd+3Pb//ZTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716381; c=relaxed/simple;
	bh=JObdb+m9ClVNxpjnBzA2ku67CZREKj08yg5gOEcYeK8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AhuGRPO7IBMXCFvubt8yXWfcUpraZLK7hT9j6XhRrB17MRsjsDF1lmBkYp4npK5LC+W+GlnG6q/m2G8iAeE7AsfEk8h/kIw/gdHq0xIKlPtEKmPv3f5oXnu+fYr5+6aDOwRNla0wCzwMyLJsyc5J6pOBt9xYsYBYp42QMT19qZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbfCN52U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbfCN52U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772716380; x=1804252380;
  h=date:from:to:cc:subject:message-id;
  bh=JObdb+m9ClVNxpjnBzA2ku67CZREKj08yg5gOEcYeK8=;
  b=MbfCN52UWWgEBNsjqhxSboX6iwoyrn1XY2PmjL01UdZG0OxVNPqbu4ZK
   XzIF8ttRXEEAzDlj4PawbIAJYpfwuINmlg1oexfjE60+swT5ybU0G31kr
   SOCkXIfrLQKAaDbsiKswEIBMjeQ2WNBXUDxPJXJpoB06EQZn7nlY/U3Y6
   aeNQU/0OnKi+p0UFy2y22/RkoTUvSmkEQ0L9BK20IVmutvxT4mbJ439Z3
   mtwpzQmjDqc5jOYmiYBtj0pZjoTIUhWIQ2tGeOr3J8porJdB7O3GeO3LU
   RVyDMNfUmY7gVggKz+C88vzh1zHGATQavWtms8OtUzbdmg6tIRr5M0pYk
   w==;
X-CSE-ConnectionGUID: 3QQ58HrARz62yJy/MgollA==
X-CSE-MsgGUID: w2r+wNVwTMqzJYnXnkkUxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73992804"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73992804"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:12:59 -0800
X-CSE-ConnectionGUID: Wqft5699RBmFLD3bcvncnw==
X-CSE-MsgGUID: xUDrUEWySGKo00npvo/9+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223370182"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2026 05:12:57 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy8Va-000000000dq-3XTA;
	Thu, 05 Mar 2026 13:12:54 +0000
Date: Thu, 05 Mar 2026 21:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 464/467] error[E0425]: cannot find value
 `seq_read` in crate `bindings`
Message-ID: <202603052115.AL2rYS7e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 1248b180312701c655e99defd535922cb603adc5 [464/467] seq_file: remove seq_read()
config: x86_64-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052115.AL2rYS7e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052115.AL2rYS7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052115.AL2rYS7e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `seq_read` in crate `bindings`
   --> rust/kernel/debugfs/file_ops.rs:134:34
   |
   134   |             read: Some(bindings::seq_read),
   |                                  ^^^^^^^^ help: a function with a similar name exists: `ec_read`
   |
   ::: rust/bindings/bindings_generated.rs:70948:5
   |
   70948 |     pub fn ec_read(addr: u8_, val: *mut u8_) -> ffi::c_int;
   |     ------------------------------------------------------- similarly named function `ec_read` defined here
--
>> error[E0425]: cannot find value `seq_read` in crate `bindings`
   --> rust/kernel/debugfs/file_ops.rs:186:34
   |
   186   |             read: Some(bindings::seq_read),
   |                                  ^^^^^^^^ help: a function with a similar name exists: `ec_read`
   |
   ::: rust/bindings/bindings_generated.rs:70948:5
   |
   70948 |     pub fn ec_read(addr: u8_, val: *mut u8_) -> ffi::c_int;
   |     ------------------------------------------------------- similarly named function `ec_read` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
