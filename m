Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804ED3C1F;
	Wed, 24 Dec 2025 00:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766535056; cv=none; b=X9AfGSYYxSZT8WUCOhx1ZSeoAq731IB4J5SLSXPMff7beq2iwTtWyPhy5xS6urUFZ4QNrf0kUCoQbQuXhXcyfDFj85tFqz3CObwDALC8bhgBaiX414PeFErW2gGL5OLkkPXxyxE7p8zMbnSLth75jbA35rESW2GhHVJTs+8pk8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766535056; c=relaxed/simple;
	bh=J46YX8rBejEb4eSLU0jN20lOng0liBHZ6JnrfwVinX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pye+OVm2UMa68jqAIqllVpyEJtYW+HHcMKO0uVsvJ1rXlJkhbqGhITe/wZOrU2yeJ1zSasXYe8s+xeG0T3PXQAJcccqC2tT8DH/fZ5UBwnkhH8HQBMrctbI8a5Di9KLJ1A5JLs1whuzpFF335d9lEPiHYgSZUjSaCqYKUetfPQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHyUuUJl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHyUuUJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766535055; x=1798071055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J46YX8rBejEb4eSLU0jN20lOng0liBHZ6JnrfwVinX0=;
  b=PHyUuUJl/mD+/lBrHTWsHnnubQcl+FpGayYm2mC4Cn4rBwBCMfMWCjoA
   eCaxyqU1ZyxcJrMhkoJvYhhHJARgeZB2UDQbmx9KZ1xyBxNWVIW+Rwdjn
   RaAt7EDZrvg2KLz+EfYsBgdXBfnyLZJwaUNHYAQMQLXoQjPCXi7zitpY9
   YcRYOtgDJuB1TQt74Ctl8YBECiB7IvVXlXaZlcv34u8EPblTCHZQCMIIE
   97vqi4mBb9u8O/txxf4rG/xFiHRl1cit4upqN2ahHgtJcQm3hPlGC4Azd
   g8b+EnGt4R1I3KUwahupn++uE20/3JMS4cC0kqAlM/JVa+SViN8rCMCWB
   A==;
X-CSE-ConnectionGUID: hTWoVh1BT2mVMLBUy0g8dg==
X-CSE-MsgGUID: UnzGvcANQEqFLeDTyvvuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79016998"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79016998"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 16:10:54 -0800
X-CSE-ConnectionGUID: hC2MU5imSI+IVspllHvqsg==
X-CSE-MsgGUID: 4y7NjTR+QwGahJRdKmo1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199872347"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Dec 2025 16:10:52 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYCSo-000000002V3-2BzJ;
	Wed, 24 Dec 2025 00:10:50 +0000
Date: Wed, 24 Dec 2025 08:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] samples: rust: add Rust serial device bus sample
 device driver
Message-ID: <202512240752.xJxQ9zBO-lkp@intel.com>
References: <20251220-rust_serdev-v1-3-e44645767621@posteo.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-rust_serdev-v1-3-e44645767621@posteo.de>

Hi Markus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Probst/serdev-Export-internal-is_serdev_device-for-drivers/20251221-064940
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251220-rust_serdev-v1-3-e44645767621%40posteo.de
patch subject: [PATCH RFC 3/4] samples: rust: add Rust serial device bus sample device driver
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251224/202512240752.xJxQ9zBO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240752.xJxQ9zBO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240752.xJxQ9zBO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::serdev`
   --> samples/rust/rust_driver_serdev.rs:18:5
   |
   18  |     serdev,
   |     ^^^^^^ no `serdev` in the root
   |
   note: found an item that was configured out
   --> rust/kernel/lib.rs:140:9
   |
   140 | pub mod serdev;
   |         ^^^^^^
   note: the item is gated here
   --> rust/kernel/lib.rs:139:1
   |
   139 | #[cfg(CONFIG_SERIAL_DEV_BUS)]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0433]: failed to resolve: could not find `module_serdev_device_driver` in `kernel`
   --> samples/rust/rust_driver_serdev.rs:169:9
   |
   169 | kernel::module_serdev_device_driver! {
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^ could not find `module_serdev_device_driver` in `kernel`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
