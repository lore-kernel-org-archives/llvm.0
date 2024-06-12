Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B98B15624C;
	Wed, 12 Jun 2024 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718191973; cv=none; b=JjGrhxkX/kJe5dHpz/Mzg5vslvOHoPAvOZA5dZ7pnN5TBfEjFBXSIbLobIDNhMo9cd9ZsKE82512caO17p2PDFdY3Iqc30eHVkStgV/21xd1VXpGf5Yeamhb0LKr2Ukj7/4iBkNB80xVRhFB7TgGA9jud3r4pB//YITHiwEbGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718191973; c=relaxed/simple;
	bh=ynq7JZEcu4dCn5nBDJ2/hiUKsuF+17am3ds3FvNCRQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joQtW57mduFD5sq2ofqeFwK9EtuXL8T6jB4dnVyvsac8rz9qWbLkFPbdd8i3Rjq3roiL1NxrIlgMYUixo3A0xoT5m6BQ2TDJW7QPKwT3l7xp4gvDTxhA1csNATCXi//O8q+P1uv6caxXrh09gdhrCiZ94tfVjAa8J3GntL12M/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHgYv12S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHgYv12S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718191972; x=1749727972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynq7JZEcu4dCn5nBDJ2/hiUKsuF+17am3ds3FvNCRQ8=;
  b=MHgYv12SwogRKZkwvsuhDbbDLTzfsdP+cm7TEHqrBBdvIoo/82EEHts/
   Tl+LH1ItwJhwXag6AQ0Uk/r7B9OhQ3UR/iDmGwe/qUZSXyh8uGoh2rKF2
   nc3kpYSiaTj7z79H0nF23W6pQ6tCOqfN8UEeAIquptBad+XmDGq6SmJoA
   Jv6Ch3krOqjWZYVcnMRIzSw2yCoaVpOgyELKz4LrtvZEBqvaT8qH0yFzU
   U7UjOApm4qZzlh9kRbcJLZCtddSEOft8uinzZ68g33ZaHQeCrT+tvtnxH
   nnba8SrWfObjyGJmczDofD5Ah0pQkh0cFjq45zGeK3P+iculpZO+bVIvd
   w==;
X-CSE-ConnectionGUID: gvvSRfcoRWazskfGTqhMZQ==
X-CSE-MsgGUID: zj2irvSZRq+M2kXM5w9OSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26066863"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="26066863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 04:32:49 -0700
X-CSE-ConnectionGUID: QB8JRPOiReKFJyxZg8NW7A==
X-CSE-MsgGUID: 5XM8o6sFQaO9s/Rsx3yTaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="70567021"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2024 04:32:47 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHMDd-0001V4-0n;
	Wed, 12 Jun 2024 11:32:45 +0000
Date: Wed, 12 Jun 2024 19:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] rust: add firmware abstractions
Message-ID: <202406121959.hSkfmD0s-lkp@intel.com>
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
config: x86_64-randconfig-012-20240612 (https://download.01.org/0day-ci/archive/20240612/202406121959.hSkfmD0s-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121959.hSkfmD0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121959.hSkfmD0s-lkp@intel.com/

All errors (new ones prefixed by >>):

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
