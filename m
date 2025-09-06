Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144031E231E;
	Sat,  6 Sep 2025 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757182576; cv=none; b=UbnYS459wJgzrnieyVMP1lcEEw6o6up5P73gQ4Y48qZxnNw+UgGT3MYAJBCgQTK+dVEApSYLyOGJLyoHEM93CKu3gacZygTQVA07ipYt7OQ5rCmb6/cj+n6OFnWzGvAQW7iC0M2wyxZTgwqzXsLZ2Fkkx4MbNSAetFUwedgkB94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757182576; c=relaxed/simple;
	bh=sL8/bmzQusb9d14KArmE0Rh/2OC/1QklsoQdiKSyUMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ir8UX3ToN2luK4V1o+4hh2MnRBaQjRXfR/ILCmAX2XV2fWdAdKjVJesVpBuYGhFLRLpgE8O1mflkXObyVZKgFJ9lA7sTUHSe/KxRtDlmXB2ESkZ+nKJp+TybpaGYIk8kiz9KQrfZnxCxLPW3m6YQfdNJblmTzzazQLJLFBSxnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwRhSxdT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwRhSxdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757182574; x=1788718574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sL8/bmzQusb9d14KArmE0Rh/2OC/1QklsoQdiKSyUMY=;
  b=KwRhSxdTJVi1oGhwBB9b1KAhZSalLfiGK4jvBJgyr3TyEF+ydwaXpD7V
   DIyn9SQmW25B6t1fzVxBC6AyZo22nKmtG1aTxVXFczS6GC8rVwvDJYfxL
   oZJ8HHGsRi/Blti6CHhcgshf8ePT5Ujo8OyL1nC8k4aIeHH/HnfwCxNPD
   yIzbgE7AyY7xSihFvPhtvDSkjTV7wQoIlFxyeThtRzx+p69FVyo8bWpJZ
   BspogBEOyOTIiQfdog0+qpis6n03RxmnaRwtl+QGK085/vhnjYfDwmdSZ
   4eDVd+8khX4VgfWCht2RLP2zwqy02T0uVC/Ds1ZmtCynjIxddse0VWv0O
   w==;
X-CSE-ConnectionGUID: NiDYi7wfQDaU2Bp+ZGCtrQ==
X-CSE-MsgGUID: 6ON2as3KTou/6eD14mlUFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="77113043"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="77113043"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 11:16:13 -0700
X-CSE-ConnectionGUID: +6QqIyqhQveRlqJr2+jvWg==
X-CSE-MsgGUID: 6D15CrjNQ/WY570kEaVF/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="173236469"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Sep 2025 11:16:12 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuxSL-0001jH-39;
	Sat, 06 Sep 2025 18:16:09 +0000
Date: Sun, 7 Sep 2025 02:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Burak Emir <bqe@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v15 3/5] rust: add bitmap API.
Message-ID: <202509070216.nS8FpK8d-lkp@intel.com>
References: <20250904165015.3791895-4-bqe@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904165015.3791895-4-bqe@google.com>

Hi Burak,

kernel test robot noticed the following build errors:

[auto build test ERROR on 08b06c30a44555a8b1d14950e4462a52bfa0758b]

url:    https://github.com/intel-lab-lkp/linux/commits/Burak-Emir/rust-add-bindings-for-bitmap-h/20250905-005312
base:   08b06c30a44555a8b1d14950e4462a52bfa0758b
patch link:    https://lore.kernel.org/r/20250904165015.3791895-4-bqe%40google.com
patch subject: [PATCH v15 3/5] rust: add bitmap API.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250907/202509070216.nS8FpK8d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070216.nS8FpK8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070216.nS8FpK8d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `owned_bitmap_out_of_bounds` in this scope
   --> rust/kernel/bitmap.rs:469:1
   |
   469 | #[kunit_tests(rust_kernel_bitmap)]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in this scope
   |
   = note: this error originates in the attribute macro `kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
