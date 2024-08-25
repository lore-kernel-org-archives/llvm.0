Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF91DFEB;
	Sun, 25 Aug 2024 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724586820; cv=none; b=nQhwubMm7l9PZf0Bl+lp6A60mG04mPHt+MHop6Hr4TYlk5eyK5Gn8XdpnXmzIWNqKX5pFqd5lXfhuB8wkHVfF75ydOyE3YbaeqpDaTUygoQ7c+yv+9QXNtSrt4P2yVOdvlxWwQLIkqAW4taRm/PXTj1hHz8OUduKm/HVltan2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724586820; c=relaxed/simple;
	bh=DL5woH7X/DvXU3TbyJsZ519GzpH6qR7sVLryG+gxeug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjf9BFjiP4w1Uv+dzYHCmWPZUVZAto785p8mS83Z5PE/9mcrXluf3zwFi0NWOKgDJZVMminMroGXsO2km5w7xfO9DlKwg1/ThIuK1UIuARHumzZ4DAHzt/8MT+4pQJzC02kgrTDGjeg6did+7ygAbnEelmL7fwUDsg3Tx6cGiw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpR+1CXk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpR+1CXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724586818; x=1756122818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DL5woH7X/DvXU3TbyJsZ519GzpH6qR7sVLryG+gxeug=;
  b=OpR+1CXke8z0c0xw5kQY6+/3YuGztq8VzMoR6ZQ16Med673vbC908IGj
   gXSL/M2+CQRxKJNwqK9RLLipkbyOYAmigq2cxJIFmBVjIgkRdkJHWhEl9
   XU+x/eAdOc74a3IZmLYqGKjucLIOYzaiDe7KMO1AZ7AKa3g0q6JPJsZdc
   yt4Kv41gCfliLLYboXqArc+gnKjDnZB58HyBCvsjWHsCSgYNh3GulmPy7
   M8vVTC0d6MtBts6y1iYZ8Oa38uMAyBXzSE14PBEbMQyI/E0CR/dVAsiE2
   GOApPoTh5xyrlD37JuASFX4PRHo/fOGXmGa/KHNOFkhTWwGcWBXMmu6Y1
   g==;
X-CSE-ConnectionGUID: Hv6e2OEzTuOgSWFIKoiSzg==
X-CSE-MsgGUID: DnXmnxRRRj23pl1LNkgovQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="48401684"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="48401684"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 04:53:38 -0700
X-CSE-ConnectionGUID: AJ8rFAAbSG6GFeLwaKcBog==
X-CSE-MsgGUID: nxSRUmnfQH+TcayZmtvILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="85439709"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Aug 2024 04:53:36 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siBoM-000F9T-0v;
	Sun, 25 Aug 2024 11:53:34 +0000
Date: Sun, 25 Aug 2024 19:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fabien.parent@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1040 22/23] error[E0277]: the trait bound
 `rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device:
 AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>` is
 not satisfied
Message-ID: <202408251945.uQADGa9Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1040
head:   53444cbc3fd2c22b56d4e9ab8b8c0f2b643cb9a7
commit: e1082f6340c60e6fe9e9e8730f63bbc6515c5020 [22/23] rust: regulator: add Regulator Driver abstraction
config: x86_64-buildonly-randconfig-006-20240825 (https://download.01.org/0day-ci/archive/20240825/202408251945.uQADGa9Q-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408251945.uQADGa9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408251945.uQADGa9Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the trait bound `rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>` is not satisfied
   --> rust/doctests_kernel_generated.rs:3726:46
   |
   3726 | let config = Config::<Arc<DriverData>>::new(&dev, Arc::try_new(DriverData(128))?);
   |              ------------------------------  ^^^ the trait `AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>` is not implemented for `rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device`, which is required by `&&rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>`
   |              |
   |              required by a bound introduced by this call
   |
   = note: required for `&rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>`
   = note: 1 redundant requirement hidden
   = note: required for `&&rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>`
   note: required by a bound in `rust_doctest_kernel_alloc_box_ext_rs_0::kernel::regulator::driver::Config::<T>::new`
   --> rust/kernel/regulator/driver.rs:346:19
   |
   346  |     pub fn new<U: AsRef<Device>>(dev: U, data: T) -> Self {
   |                   ^^^^^^^^^^^^^ required by this bound in `Config::<T>::new`
--
>> error[E0277]: the trait bound `rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>` is not satisfied
   --> rust/doctests_kernel_generated.rs:3727:34
   |
   3727 | let reg = Registration::register(dev, desc, config)?;
   |           ---------------------- ^^^ the trait `AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>` is not implemented for `rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device`, which is required by `&rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>`
   |           |
   |           required by a bound introduced by this call
   |
   = note: required for `&rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_alloc_box_ext_rs_0::kernel::device::Device>`
   note: required by a bound in `rust_doctest_kernel_alloc_box_ext_rs_0::kernel::regulator::driver::Registration::register`
   --> rust/kernel/regulator/driver.rs:362:57
   |
   362  |     pub fn register<T: ForeignOwnable + Send + Sync, U: AsRef<Device>>(
   |                                                         ^^^^^^^^^^^^^ required by this bound in `Registration::register`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
