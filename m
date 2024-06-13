Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4808312F382;
	Thu, 13 Jun 2024 03:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718249867; cv=none; b=nA5Q+YdF1EXLx6T6Bd7Yo5K9xlm/ldEARzzH6yekucAMW8UDD6PvGPvORNWQfhMnnnwYKJ8kAWb+frrhHvLNziLShuSVYfzGuJreRVMlWtiiG3Jp7yRJe2AOe/vZXFMb9Jlu7SZ29y8inpRjwUFYfXftsrnNt0jp8B5mzrd+LM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718249867; c=relaxed/simple;
	bh=4/CL6lRks8ztFx1UfKQBzJOo523brhSa7xRrrcJWrTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2wRsukNVKTY/cOKoMGfIdwuq/1S6Zp3EOFxzpIuRxQIoyuIowpSe90NcpZjy6CRiHTEPfCDwGbqoJ7xQsLqfWiE/Ynl03sVkLxys7ZTZYDkqZkvb3y/S/t7z3AA3J9Ovcs1qndwNW8HyXnwgZ+8r7Qg3A45BlItSHE07t4Z+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSaf5UqN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSaf5UqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718249865; x=1749785865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4/CL6lRks8ztFx1UfKQBzJOo523brhSa7xRrrcJWrTI=;
  b=JSaf5UqNf79cav5eBRIUMNJW3f+CDao78QoNuU/WkjK+YvY/H8j7jvY7
   16mQyiNqd04Wj9FfGYsocJ2QnDZaq6aQSxhXGjNhpvK8M4sU1/Asscv6y
   PeS99etXrp7xLRbtJu5aqu2SGCF8dWuGZ68GZK+GOUeNUBuKTF/f+D7af
   W8lCz6BH48BSwu5SgaANs8fzGtJ6wr3ATDa2NyT/wGH4m8d9NltTP5vRv
   JgIVjhpmKpSF4mFAw0Sv1eZENYVWEdoVIuGxQcA955kE5XaaykHmlkFtv
   mgpVEqL2CJxuMepajVUtCsd5oIY48eWRaP3B1Fg8LkXsSKdOY8wrlRCv1
   g==;
X-CSE-ConnectionGUID: kdSF2mImRvWE0jbXOY3zdA==
X-CSE-MsgGUID: AS6IvNRZT3+Z5aECN8Z/TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18901590"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18901590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:37:31 -0700
X-CSE-ConnectionGUID: GQMUOQAsS626hxui3M/khg==
X-CSE-MsgGUID: 4sPgCB/PRoCAyIK/MEVH/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40470099"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 20:37:30 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbHD-0002BL-0z;
	Thu, 13 Jun 2024 03:37:27 +0000
Date: Thu, 13 Jun 2024 11:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] rust: add firmware abstractions
Message-ID: <202406131300.xHLArQd8-lkp@intel.com>
References: <20240610180318.72152-3-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610180318.72152-3-dakr@redhat.com>

Hi Danilo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/rust-add-abstraction-for-struct-device/20240611-020558
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240610180318.72152-3-dakr%40redhat.com
patch subject: [PATCH v2 2/2] rust: add firmware abstractions
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240613/202406131300.xHLArQd8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131300.xHLArQd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131300.xHLArQd8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `dev` in this scope
   --> rust/doctests_kernel_generated.rs:373:52
   |
   373 | let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
   |                                                    ^^^ not found in this scope
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:373:28
   |
   373 | let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
   |          ----------------- ^^^^^^^^^^^^^^^^^^^^^^ expected `&CStr`, found `&str`
   |          |
   |          arguments to this function are incorrect
   |
   = note: expected reference `&rust_doctest_kernel_build_assert_rs_0::kernel::prelude::CStr`
   found reference `&'static str`
   note: associated function defined here
   --> rust/kernel/firmware.rs:53:12
   |
   53  |     pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
   |            ^^^^^^^
--
>> error[E0277]: the `?` operator can only be used in a function that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> rust/doctests_kernel_generated.rs:373:65
   |
   370 | fn main() { #[allow(non_snake_case)] fn _doctest_main__kbuild_src_consumer_rust_kernel_firmware_rs_27_0() {
   |                                      -------------------------------------------------------------------- this function should return `Result` or `Option` to accept `?`
   ...
   373 | let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
   |                                                                 ^ cannot use the `?` operator in a function that returns `()`
   |
>> = help: the trait `FromResidual<core::result::Result<Infallible, rust_doctest_kernel_build_assert_rs_0::kernel::error::Error>>` is not implemented for `()`
--
>> error[E0425]: cannot find function `driver_load_firmware` in this scope
   --> rust/doctests_kernel_generated.rs:374:1
   |
   374 | driver_load_firmware(fw.data());
   | ^^^^^^^^^^^^^^^^^^^^ not found in this scope

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
