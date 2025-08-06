Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E151257AD1;
	Wed,  6 Aug 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754487957; cv=none; b=qpyaRna/avkqqyZx9OV2yzxKnaIihx3lAS/P1nkEv0YPL1S8MqBgEHr8JXOIsJBQAHaAMkUhQuq/urp12LOjKj+vSwulmPrUU3a1w9aDQcxZbQR1vpT6ODy4490q8OA22uD3Ig0zqMF4yndF2AE31fUFvkJRPMP9IFd9D6wTerc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754487957; c=relaxed/simple;
	bh=t7r8WKKYX5vCaGxAJ5iQ+ncUo6oo/Ggx1tkJqUZof5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UXkGxgmblHbrB4FBSrTu/Y2fNlXHbTmRO2fvKywfTy7ZhHsue6397Wpv9LGPpiniwjOF56Od5jlJO+fYLXVnpytrusprpDldpfJZSJ3dWbQHIvb3AaKyhL4azxfDxs+cfKsEiUX21sGOe5H/j1N11NuFWbxGlFxd4HZIFctJt7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5SsxfiL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5SsxfiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754487956; x=1786023956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7r8WKKYX5vCaGxAJ5iQ+ncUo6oo/Ggx1tkJqUZof5k=;
  b=H5SsxfiLzXC0AXUsJqtwhuxW9+jYR/OR9ze2i3Zu9X5Nwlc0Fxgrs4LV
   9uoDA32oFutIYtNPyQPRSOejIFuC/Kvnfgt1GPklBtF9cyNlGAt1TlUpZ
   tiLOJiKeVTLzNx9HjKeEMTet3sAW1fYfc1L8tMQBHBOsiaq30qGED5AwO
   pTPtw2phNt/YRANxr/YKeEPyt0sGp/LxzK2vbHJCwtDeTCMktoXKGmDJ5
   /2ZRMrGkRKa7wEE8fjpFni9A8Vu4kokPRTsrybcuSMy+lYh6EBlkfsIWg
   4QShtfqTNyK5GxcrsUh+J0qliQmAjRPciozgMtqOxRsP0Bo5oKMRe8UuS
   w==;
X-CSE-ConnectionGUID: DaX7n/lsTbeLWZvEG450CA==
X-CSE-MsgGUID: aar7GFmgT4WdHuN0we1O9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74264618"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74264618"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 06:45:56 -0700
X-CSE-ConnectionGUID: GJIbT+F4Q9q5jPSAVpYJ+A==
X-CSE-MsgGUID: FfgKFEMgTyqCZpCXce4X3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164791120"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2025 06:45:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujeSi-0001jn-2H;
	Wed, 06 Aug 2025 13:45:49 +0000
Date: Wed, 6 Aug 2025 21:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 62/85] error[E0624]: associated function
 `new` is private
Message-ID: <202508062159.3Mv8GqI4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: 6fd37522db75e57a269d63a7230133f86f8018d6 [62/85] Rust: io: Add memcpy_fromio wrapper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250806/202508062159.3Mv8GqI4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508062159.3Mv8GqI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508062159.3Mv8GqI4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0624]: associated function `new` is private
   --> rust/doctests_kernel_generated.rs:4962:36
   |
   4962 |     let devres_mem = IoMem::<100>::new(res, device)?;
   |                                    ^^^ private associated function
   |
   ::: rust/kernel/io/mem.rs:122:5
   |
   122  |     pub(crate) fn new(resource: &Resource, device: &Device<Bound>) -> Result<Devres<Self>> {
   |     -------------------------------------------------------------------------------------- private associated function defined here
--
>> error[E0277]: the `?` operator can only be used on `Result`s, not `Option`s, in a function that returns `Result`
   --> rust/doctests_kernel_generated.rs:4964:38
   |
   4960 | fn test(device: &Device, res: Resource) -> Result {
   | ------------------------------------------------- this function returns a `Result`
   ...
   4964 |     let mem = devres_mem.try_access()?;
>> |                                      ^ use `.ok_or(...)?` to provide an error compatible with `core::result::Result<(), rust_doctest_kernel_alloc_kbox_rs_7::kernel::error::Error>`
--
>> error[E0412]: cannot find type `Device` in this scope
   --> rust/doctests_kernel_generated.rs:4960:18
   |
   4960 | fn test(device: &Device, res: Resource) -> Result {
   |                  ^^^^^^ not found in this scope
   |
   help: consider importing one of these structs
   |
   3    + use kernel::auxiliary::Device;
   |
   3    + use kernel::device::Device;
   |
   3    + use kernel::net::phy::Device;
   |
   3    + use kernel::pci::Device;
   |
   and 1 other candidate
--
>> error[E0603]: struct `Resource` is private
   --> rust/doctests_kernel_generated.rs:4958:22
   |
   4958 | use kernel::io::mem::Resource;
   |                      ^^^^^^^^ private struct
   |
   note: the struct `Resource` is defined here
   --> rust/kernel/io/mem.rs:13:5
   |
   13   | use crate::io::resource::Resource;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   help: import `Resource` directly
   |
   4958 - use kernel::io::mem::Resource;
   4958 + use kernel::io::resource::Resource;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
