Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1793C18732E;
	Sun, 22 Dec 2024 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734867057; cv=none; b=fftLdARLXE8dbEOhSf+Nf1zGliH25fiBiXQ+1u2O/x/yASWxHzd4hlmF9Ddc2pFH/a5L8mdkC+3g4alAjmub4hZ8tDGqjqBzdAMUS1PGDmQIE04lH6bPhAByQvG2U1XrmIpY5ASZNtMsoXwknc2sTnISQltnsQ3VGrLtPf/poM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734867057; c=relaxed/simple;
	bh=YnvPVm1s+4W45VlHuSRO4GkuEbWIUgE3/3+zMdnz7aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNyQdJIUq8I1cBJfJtgbzSVwJqW44H+TM3r0du1N/oPyTsMGunBLiJI9w86nBdDF99qcgoAYZKfygV3/lRfYac/OfFEff/Rb7F12+wz3g//1MZ5uuz5S7oJLekTeO+lATMdMzjpo5nR35AHSPoW2GRxiRrUojZMyUgYlU4n8cOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmZxAUdD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmZxAUdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734867055; x=1766403055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YnvPVm1s+4W45VlHuSRO4GkuEbWIUgE3/3+zMdnz7aQ=;
  b=PmZxAUdDYu5Q8YWv5BgNG9elqSO5Z33eKKMAntVpWdcGNi35TI0X3HC2
   QSifgccqSpdoD9kQlltVNnAi4nBNuydYFuKOC9ykQVXMRQo12+lJwvi+2
   D0j3rDEsAe7cHxcQiYsyr+Knh1uNFh2G5G0Ykk3DBf0R4yTMqzx/It5P+
   8Een8xOoEvBozfGn85qVqHb0Q57jCMsReYgwf98gilGVZ/SRPvHM5ZDmg
   sSfVMQHyZ2LaodkyfDOBkpO+eET9+u7GnvZMD0TY3MGi1k9Kq3TbLTQxa
   y4Ltt1lGQPACfPBq/Ox+wdTniyEcR0C/Yu88DMTKlFowO9Ge8zAOpYNwM
   Q==;
X-CSE-ConnectionGUID: F0t9OeXzRLmJFw9XnrX4Og==
X-CSE-MsgGUID: O9rbmGF0Qpe7vHEYRqEwiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35498769"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="35498769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 03:30:54 -0800
X-CSE-ConnectionGUID: U0X4XKUURkygL2Z5EhOp0w==
X-CSE-MsgGUID: ekmDfC9rQUGIeqhQmNHC+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103933925"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2024 03:30:53 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPKAd-0002tP-0o;
	Sun, 22 Dec 2024 11:30:51 +0000
Date: Sun, 22 Dec 2024 19:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/5] samples: rust: Provide example using the new Rust
 MiscDevice abstraction
Message-ID: <202412221934.QGXsH2pw-lkp@intel.com>
References: <20241213134715.601415-3-lee@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213134715.601415-3-lee@kernel.org>

Hi Lee,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on lee-leds/for-leds-next soc/for-next linus/master v6.13-rc3]
[cannot apply to next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lee-Jones/Documentation-ioctl-number-Carve-out-some-identifiers-for-use-by-sample-drivers/20241213-215003
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20241213134715.601415-3-lee%40kernel.org
patch subject: [PATCH v6 2/5] samples: rust: Provide example using the new Rust MiscDevice abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20241222/202412221934.QGXsH2pw-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221934.QGXsH2pw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221934.QGXsH2pw-lkp@intel.com/

All errors (new ones prefixed by >>):

   error[E0050]: method `open` has 2 parameters but the declaration in trait `open` has 0
   --> samples/rust/rust_misc_device.rs:55:20
   |
   55 |     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<KBox<Self>> {
   |                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected 0 parameters, found 2
   |
>> = note: `open` from trait: `fn() -> core::result::Result<<Self as MiscDevice>::Ptr, kernel::error::Error>`
--
   error[E0050]: method `ioctl` has 4 parameters but the declaration in trait `ioctl` has 3
   --> samples/rust/rust_misc_device.rs:64:13
   |
   64 |           me: <Self::Ptr as kernel::types::ForeignOwnable>::Borrowed<'_>,
   |  _____________^
   65 | |         _file: &File,
   66 | |         cmd: u32,
   67 | |         _arg: usize,
   | |___________________^ expected 3 parameters, found 4
   |
>> = note: `ioctl` from trait: `fn(<<Self as MiscDevice>::Ptr as ForeignOwnable>::Borrowed<'_>, u32, usize) -> core::result::Result<isize, kernel::error::Error>`
--
>> error[E0599]: no method named `device` found for reference `&MiscDeviceRegistration<RustMiscDevice>` in the current scope
   --> samples/rust/rust_misc_device.rs:56:35
   |
   56 |         let dev = ARef::from(misc.device());
   |                                   ^^^^^^ method not found in `&MiscDeviceRegistration<RustMiscDevice>`
--
>> error[E0282]: type annotations needed for `ARef<T>`
   --> samples/rust/rust_misc_device.rs:56:13
   |
   56 |         let dev = ARef::from(misc.device());
   |             ^^^
   57 |
   58 |         dev_info!(dev, "Opening Rust Misc Device Samplen");
   |         --------------------------------------------------- type must be known at this point
   |
   help: consider giving `dev` an explicit type, where the type for type parameter `T` is specified
   |
   56 |         let dev: ARef<T> = ARef::from(misc.device());
   |                +++++++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
