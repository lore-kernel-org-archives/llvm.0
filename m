Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B717552;
	Sat, 10 Aug 2024 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723292110; cv=none; b=J1MPYqEB53/rqHjnSKXu2GInmGb/m9rQ3TaldZ1vF2Ly6UczoGbqSAv9G/mRkCdbvUF9DDYVrrG5SzcPYqJ1HqorIVe2GUVgjaaj8QzbR8Dq9fkjEJaGn4FKH6Ij777nTlr2EQD3IKSTxBFLpvSbqDJOWo9QdP1ZiLCIyDQz/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723292110; c=relaxed/simple;
	bh=t87NGs8500+on2svTt2R16maDA1TdNqLmmEQkyB6ojM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0IsSen0apjBmvJ9OdRvwaBUPVXV38vjFGdbz8ZsaE0+rCy4BQGsjxtDbGc+c1XMc5436FsnXKTmcezhIfro4wPtlYkV1sxYsCsf9N5tUQYi50DXVLdl+sdjL1ohhpiBPt0azNQbV1kdvqGGQbXgvGp03CwQejad4W2csGNwohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAl8R+Jo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAl8R+Jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723292108; x=1754828108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t87NGs8500+on2svTt2R16maDA1TdNqLmmEQkyB6ojM=;
  b=kAl8R+JobnSwZDPw1rMJQjl19B97dNAnhHmUSyk3bci9Z3CP6rRNiNTC
   NveNbfvIf+/qjT4U51C94iUGN9pTbh78h/TjgydsL4EyrAGc3X3Ny793e
   KCkr68k0rJIS6/45llaYlMKV6Rup4IYe5M0gYBFX2wpQhIX5WxL/p9ugZ
   CuqB/VB/6s+AnKMN9T7pdQ4HbHIKqYs4e1bDC7ikMc6DuxfvvHm9QVtmT
   HgKN0i5TEaiziPjE3/vvZgb3axAiU8EoSjG9flsRJxs1J7CK64Ewv4AFB
   Z7mP30Vp3HIPKoZ8N4OlF4exQ9cVeDQF2Tx0JiWSlydbGkyFx6MqShXvX
   A==;
X-CSE-ConnectionGUID: ACPAgxQ8Rn6gDCddH7q7rQ==
X-CSE-MsgGUID: 5Qa+JYLwTQmfIcXbtSgorg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="25255552"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="25255552"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 05:15:07 -0700
X-CSE-ConnectionGUID: wihbScBmTU+Vl/ZKPDUtTA==
X-CSE-MsgGUID: 2wEp4kguT2aJ4xwQ5hxUVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57485275"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Aug 2024 05:15:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sckzv-0009uh-2H;
	Sat, 10 Aug 2024 12:15:03 +0000
Date: Sat, 10 Aug 2024 20:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fabien.parent@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1040 22/23] error[E0277]: the trait bound
 `rust_doctest_kernel_block_mq_rs_0::kernel::device::Device:
 AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>` is not
 satisfied
Message-ID: <202408102032.0Wnsc8lW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1040
head:   2419018fe244d9eaee250fc03cb145b474c575b8
commit: 382c05f6c5f566df73ea6a2ce546c7038fa1b5e5 [22/23] rust: regulator: add Regulator Driver abstraction
config: x86_64-randconfig-001-20240810 (https://download.01.org/0day-ci/archive/20240810/202408102032.0Wnsc8lW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408102032.0Wnsc8lW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408102032.0Wnsc8lW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the trait bound `rust_doctest_kernel_block_mq_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>` is not satisfied
   --> rust/doctests_kernel_generated.rs:3567:46
   |
   3567 | let config = Config::<Arc<DriverData>>::new(&dev, Arc::try_new(DriverData(128))?);
   |              ------------------------------  ^^^ the trait `AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>` is not implemented for `rust_doctest_kernel_block_mq_rs_0::kernel::device::Device`, which is required by `&&rust_doctest_kernel_block_mq_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>`
   |              |
   |              required by a bound introduced by this call
   |
   = note: required for `&rust_doctest_kernel_block_mq_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>`
   = note: 1 redundant requirement hidden
   = note: required for `&&rust_doctest_kernel_block_mq_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>`
   note: required by a bound in `rust_doctest_kernel_block_mq_rs_0::kernel::regulator::driver::Config::<T>::new`
   --> rust/kernel/regulator/driver.rs:346:19
   |
   346  |     pub fn new<U: AsRef<Device>>(dev: U, data: T) -> Self {
   |                   ^^^^^^^^^^^^^ required by this bound in `Config::<T>::new`
--
>> error[E0277]: the trait bound `rust_doctest_kernel_block_mq_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>` is not satisfied
   --> rust/doctests_kernel_generated.rs:3568:34
   |
   3568 | let reg = Registration::register(dev, desc, config)?;
   |           ---------------------- ^^^ the trait `AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>` is not implemented for `rust_doctest_kernel_block_mq_rs_0::kernel::device::Device`, which is required by `&rust_doctest_kernel_block_mq_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>`
   |           |
   |           required by a bound introduced by this call
   |
   = note: required for `&rust_doctest_kernel_block_mq_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_block_mq_rs_0::kernel::device::Device>`
   note: required by a bound in `rust_doctest_kernel_block_mq_rs_0::kernel::regulator::driver::Registration::register`
   --> rust/kernel/regulator/driver.rs:362:57
   |
   362  |     pub fn register<T: ForeignOwnable + Send + Sync, U: AsRef<Device>>(
   |                                                         ^^^^^^^^^^^^^ required by this bound in `Registration::register`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
