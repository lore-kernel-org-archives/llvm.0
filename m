Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33E231853;
	Sat, 26 Jul 2025 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753524570; cv=none; b=bvQufjqhH/8yHAdZ1eA851LPRcuygwHwLFtn81NdtGylzqN3uSlWfqYBysxCb6M7j6SAQ5e5sb0i4eTcuGN1TCxHghNMA3sH8AWC16t8U6BByXDqhFrRgmQL/Q7lFaGpwcuZPKVgwsrGhgsWH0o/XkRwJOiceQoUerzgxsEAZNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753524570; c=relaxed/simple;
	bh=w4U0/mprFHIkRAkkSZTL6jmyEBat8ybODr/kA8/g8kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7ph0uP5gAwmobLEYp8JN9EyXaPfBX1TYzqn96lGnzvDwzzaYNmSqoaktZHjUHowgGm9L5FLtt/iBAQHsIQ7eukDrPHiFJ2qEWGJNW80r47qOfim1bbBfLMkbap3pM2lEp+E05Ok5/XQpP3pxRvVuhKf2Zhju/9W34+BWD2QBK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4sDiph3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4sDiph3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753524570; x=1785060570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w4U0/mprFHIkRAkkSZTL6jmyEBat8ybODr/kA8/g8kU=;
  b=W4sDiph3UxTGfL10Vp+kn3TdsyU27kYFyS2D/MOT3JIo4rjYf+mYVEMR
   Eq723BZc9jJIv9zpqTr1NbztlRtP2xUTXQ/F/ntdGdZ1IaKZKYXFe3Kji
   tK8K/AwpQiMx2cTzgdo1y4AWOP+q0gamro3caTT0KJKVUhgwXrhdObq90
   Pbk79BfQfxVIZ7mffuP5AAwFNmtOd7+F1Rf5Nnlx2jk50K52PCQJkx4S3
   Hr5EnBFutHb6L+nETckwsy4oBmhhQkMMGL0VgjY/4P4yg28rTDPAw0kpW
   PKHpsMDI1UcnSKQCNZzpV9dkYO+wvlllNl7BP/8n3dF+VX+ub8S1VKAKK
   Q==;
X-CSE-ConnectionGUID: 7ZfJMFI5TpqRkmNUgWmNYQ==
X-CSE-MsgGUID: yS7Hr7o6TBqbVJY8QdjSmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="67281641"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67281641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:09:28 -0700
X-CSE-ConnectionGUID: jEJfJBbZQWKnlUrwnDS6dw==
X-CSE-MsgGUID: jpAnP2YNTKq4WQfSHYMeAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166891360"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 26 Jul 2025 03:09:27 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufbqF-0000GV-37;
	Sat, 26 Jul 2025 10:09:23 +0000
Date: Sat, 26 Jul 2025 12:09:10 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-thread 2/2] error[E0308]: mismatched types
Message-ID: <202507261252.4w5UVJxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-thread
head:   e10d14cf8e24db222ea1b2313c731040f711b1e6
commit: 5515399d39dc536bf93b6d27673a12b027da73cb [2/2] rust: task: Add kernel thread support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250726/202507261252.4w5UVJxb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261252.4w5UVJxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261252.4w5UVJxb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/task/thread.rs:203:17
   |
   199   |             bindings::kthread_create_on_node(
   |             -------------------------------- arguments to this function are incorrect
   ...
   203   |                 c"%s".as_ptr(),
   |                 ^^^^^^^^^^^^^^ expected `*const u8`, found `*const i8`
   |
   = note: expected raw pointer `*const u8`
   found raw pointer `*const i8`
   note: function defined here
   --> rust/bindings/bindings_generated.rs:84978:12
   |
   84978 |     pub fn kthread_create_on_node(
   |            ^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
