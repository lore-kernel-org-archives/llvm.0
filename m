Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E543B1DF273;
	Mon, 19 Jan 2026 02:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791129; cv=none; b=UdIOIAxz0j/dCMfwlhQiuYr6Pbp/dIpgRV+44KTnH3kdPrPCJQf6Szq7KAEWkRCvOKWK9GwFsPKc2o8rPvvnboXCVvq4vzK8KSD26+xXesGrj8KCv/bDm60jN9ClG9tffmeV4xBGHRg3d4Ae5JSsh7A0xImJTBmbMuTCWRqx5Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791129; c=relaxed/simple;
	bh=GRuK4bWyvnwwvWC3OLwBQH59yqCpA3FnHdT+xQ0oQGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKgDdfSEADZKsdRnVtZCI+CAhtlJyTs9Qo83RBH0tyMvU5cMFkr12D2E6ULddB5t0S5T3732QU56ZpO7DBQgb2NwpBcu6YnEkUWq5SO0d4KjihMZBbpThF5pJBIV2xT3rQ7Ql00Ob4P9AKdAnU7F67ZCJQeHO9MYXKAT43cSY6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS2Kh1Sz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS2Kh1Sz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768791127; x=1800327127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GRuK4bWyvnwwvWC3OLwBQH59yqCpA3FnHdT+xQ0oQGc=;
  b=dS2Kh1SzRTaR1qRClpZhqhEYq56qIZKzLJj5FtWi60H9NO5imOQoHYPl
   6h2CP/ypaTy5n/S/j5zCLCPmKE7DT5tmMPaMjXdUZzzGBGhE8W5SyOWdR
   OGF0ndGFxZMOJGSXn8JMU+hLufbIZoSW5ZWhoQG/uCLV/8lBgqRIvvwqv
   xTA3w5RyPfVdZ0VsDWJXAIHrVxIHU9G4OSOp9WtMaUtWICvbCzZA8O7uB
   xsp2ontPt44h4a0vZbYBJ/0c1q1yW6bAF5HD6AwR56X1Imb/9CQVIl4g/
   dZYS0nYuxSAl+ipKsUNfzpkXmpdIb0g46r0ZxPbthAmgSyUZQP5FoZzup
   w==;
X-CSE-ConnectionGUID: BfrPkUV7QR2zXAo5PmG6FQ==
X-CSE-MsgGUID: 1H7FwmZNS7mrn6f22LdW9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="57553678"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="57553678"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 18:52:03 -0800
X-CSE-ConnectionGUID: 2KwHrG7mS/W8kgvMOyCU5w==
X-CSE-MsgGUID: EKo2G7hTT46x3Bb+GXWuUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="205785001"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jan 2026 18:52:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfN1-00000000NNt-3zJJ;
	Mon, 19 Jan 2026 02:51:59 +0000
Date: Mon, 19 Jan 2026 10:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/5] rust: add RTC core abstractions and data
 structures
Message-ID: <202601190910.Jll9sC63-lkp@intel.com>
References: <20260116162203.296844-5-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116162203.296844-5-sunke@kylinos.cn>

Hi Ke,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 944aacb68baf7624ab8d277d0ebf07f025ca137c]

url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/rtc-add-device-selector-for-rtc_class_ops-callbacks/20260117-124838
base:   944aacb68baf7624ab8d277d0ebf07f025ca137c
patch link:    https://lore.kernel.org/r/20260116162203.296844-5-sunke%40kylinos.cn
patch subject: [RFC PATCH v3 4/5] rust: add RTC core abstractions and data structures
config: x86_64-randconfig-014-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190910.Jll9sC63-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190910.Jll9sC63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190910.Jll9sC63-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0412]: cannot find type `rtc_time` in crate `bindings`
   --> rust/kernel/rtc.rs:39:34
   |
   39 | pub struct RtcTime(pub bindings::rtc_time);
   |                                  ^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `rtc_time64_to_tm` in crate `bindings`
   --> rust/kernel/rtc.rs:49:28
   |
   49    |         unsafe { bindings::rtc_time64_to_tm(time, &mut tm.0) };
   |                            ^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `time64_to_tm`
   |
   ::: rust/bindings/bindings_generated.rs:33077:5
   |
   33077 |     pub fn time64_to_tm(totalsecs: time64_t, offset: ffi::c_int, result: *mut tm);
   |     ------------------------------------------------------------------------------ similarly named function `time64_to_tm` defined here
--
>> error[E0425]: cannot find value `RTC_FEATURE_CNT` in crate `bindings`
   --> rust/kernel/rtc.rs:438:27
   |
   438  |                 bindings::RTC_FEATURE_CNT as usize,
   |                           ^^^^^^^^^^^^^^^ help: a constant with a similar name exists: `VMX_FEATURE_EPT`
   |
   ::: rust/bindings/bindings_generated.rs:6776:1
   |
   6776 | pub const VMX_FEATURE_EPT: u32 = 65;
   | ------------------------------ similarly named constant `VMX_FEATURE_EPT` defined here
--
>> error[E0425]: cannot find value `RTC_OPS_USE_RTC_DEV` in crate `bindings`
   --> rust/kernel/rtc.rs:441:33
   |
   441 |         flags.set_bit(bindings::RTC_OPS_USE_RTC_DEV as usize);
   |                                 ^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_time` in crate `bindings`
   --> rust/kernel/rtc.rs:640:28
   |
   640 |         tm: *mut bindings::rtc_time,
   |                            ^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_time` in crate `bindings`
   --> rust/kernel/rtc.rs:667:28
   |
   667 |         tm: *mut bindings::rtc_time,
   |                            ^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_wkalrm` in crate `bindings`
   --> rust/kernel/rtc.rs:694:31
   |
   694 |         alarm: *mut bindings::rtc_wkalrm,
   |                               ^^^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_wkalrm` in crate `bindings`
   --> rust/kernel/rtc.rs:721:31
   |
   721 |         alarm: *mut bindings::rtc_wkalrm,
   |                               ^^^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `rtc_param` in crate `bindings`
   --> rust/kernel/rtc.rs:852:31
   |
   852    |         param: *mut bindings::rtc_param,
   |                               ^^^^^^^^^ help: a struct with a similar name exists: `btf_param`
   |
   ::: rust/bindings/bindings_generated.rs:106639:1
   |
   106639 | pub struct btf_param {
   | -------------------- similarly named struct `btf_param` defined here
--
>> error[E0412]: cannot find type `rtc_param` in crate `bindings`
   --> rust/kernel/rtc.rs:879:31
   |
   879    |         param: *mut bindings::rtc_param,
   |                               ^^^^^^^^^ help: a struct with a similar name exists: `btf_param`
   |
   ::: rust/bindings/bindings_generated.rs:106639:1
   |
   106639 | pub struct btf_param {
   | -------------------- similarly named struct `btf_param` defined here
--
>> error[E0412]: cannot find type `rtc_class_ops` in crate `bindings`
   --> rust/kernel/rtc.rs:903:35
   |
   903 | pub struct RtcOpsVTable(bindings::rtc_class_ops);
   |                                   ^^^^^^^^^^^^^ not found in `bindings`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
