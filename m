Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD46127E30;
	Mon, 29 Apr 2024 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714413238; cv=none; b=tr9v5UsrfykxF8wa7bWefjTJP9fLPN/Eh7AnK8m7wsUw3MuaVBDyppHdl9dDD4KHMax22elbqj7BW68GqPoQJ5VNanfd/0F19joCu1ADUe+GRJbanEjtHE+VMpXbsimlC7fQnY8QTWN8QRaZT97QKeiEyD5ClctuZSxDfCFAeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714413238; c=relaxed/simple;
	bh=3e5YCVBHIgNGltvXksG6o57kgeYIoH07bGWAyMxxodQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVjkeMLXsVktncowQrXx3EVPhj0Kb9pWU8tuGOHr0qYKezQiJ+tR3erhXx8K5Oqlc7U/VTEUTE8ZSPD7MkonIyq7mbAUESTemDJhowoW215SduSWm+1pRR8iAvvYv7zLPHJCcSPjPr0Rk+QTlvUdyfrBsL5yPkjGbA2bcl9UWeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYLxJF/S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYLxJF/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714413237; x=1745949237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3e5YCVBHIgNGltvXksG6o57kgeYIoH07bGWAyMxxodQ=;
  b=cYLxJF/SnX9T+gb6r6rBUJagEzYEbBSA4rGR4NVSh7ksCQnxhdutTGBp
   kgZfKZaDKZp9D8yGNNeX6d0f06kEM1Nh/zXVVU7HI65PUgq9JwREk7h8V
   bNd+Oys5cjBXgpgIxZ0A95p4Uvu6UseZ/+XfoB44iyYf3b/aVNfhAj5DI
   DtMqhSCuE84OCCELcAVE/joqb5JMRBzhVS4Mm/Tcq64LYmkTMbSOm4gEp
   RFVnj1pUX1aItVTJ4gy8DHC+AuwqzGbqHh6WYA0cFVQ+L/ZTJsbiqFeQT
   MBlENcagCaD22ate2HQ3UGI/VGig/Y1MFbFxdgGkUiTa7yYGJDC80xhfV
   A==;
X-CSE-ConnectionGUID: BBDKG3K+Rt+CM7fQ9Aqghg==
X-CSE-MsgGUID: 5jP7wgRwRaOQQnP4UrNfVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9920169"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="9920169"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 10:53:56 -0700
X-CSE-ConnectionGUID: 0lROVAQoT+KQBNJpuJNeVA==
X-CSE-MsgGUID: qn3Om09URwS3ktw4yIBZ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26696950"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2024 10:53:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1VCK-0007MC-1f;
	Mon, 29 Apr 2024 17:53:52 +0000
Date: Tue, 30 Apr 2024 01:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:asahi-wip-6.8 1789/2549] error[E0658]: use of unstable
 library feature 'offset_of'
Message-ID: <202404300119.uJjiyP11-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip-6.8
head:   72909db13b2e258b69eae8e33b5af02376829f82
commit: 25b2644bec0d50b333482f1db86a4f5618eea576 [1789/2549] rust: kernel: Rust 1.77 avoid offset_of stable warnings
config: x86_64-buildonly-randconfig-003-20240429 (https://download.01.org/0day-ci/archive/20240430/202404300119.uJjiyP11-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300119.uJjiyP11-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300119.uJjiyP11-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0658]: use of unstable library feature 'offset_of'
   --> rust/doctests_kernel_generated.rs:4996:1
   |
   4996 | / impl_has_work! {
   4997 | |     impl HasWork<Self> for MyStruct { self.work }
   4998 | | }
   | |_^
   |
   = note: see issue #106655 <https://github.com/rust-lang/rust/issues/106655> for more information
   = help: add `#![feature(offset_of)]` to the crate attributes to enable
   = note: this error originates in the macro `impl_has_work` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0658]: use of unstable library feature 'offset_of'
   --> rust/doctests_kernel_generated.rs:5077:1
   |
   5077 | / impl_has_work! {
   5078 | |     impl HasWork<MyWorkItem, 1> for MyWorkItem { self.work_field }
   5079 | | }
   | |_^
   |
   = note: see issue #106655 <https://github.com/rust-lang/rust/issues/106655> for more information
   = help: add `#![feature(offset_of)]` to the crate attributes to enable
   = note: this error originates in the macro `impl_has_work` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0658]: use of unstable library feature 'offset_of'
   --> rust/doctests_kernel_generated.rs:5135:1
   |
   5135 | / impl_has_work! {
   5136 | |     impl HasWork<MyStruct, 17> for MyStruct { self.work_field }
   5137 | | }
   | |_^
   |
   = note: see issue #106655 <https://github.com/rust-lang/rust/issues/106655> for more information
   = help: add `#![feature(offset_of)]` to the crate attributes to enable
   = note: this error originates in the macro `impl_has_work` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0658]: use of unstable library feature 'offset_of'
   --> rust/doctests_kernel_generated.rs:5200:1
   |
   5200 | / impl_has_work! {
   5201 | |     impl HasWork<Self, 1> for MyStruct { self.work_1 }
   5202 | |     impl HasWork<Self, 2> for MyStruct { self.work_2 }
   5203 | | }
   | |_^
   |
   = note: see issue #106655 <https://github.com/rust-lang/rust/issues/106655> for more information
   = help: add `#![feature(offset_of)]` to the crate attributes to enable
   = note: this error originates in the macro `impl_has_work` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
