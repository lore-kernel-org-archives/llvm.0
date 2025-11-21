Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2FD239085;
	Fri, 21 Nov 2025 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763684685; cv=none; b=HZKouKbcXAQ4bQ5L7ZmYIWXRu4xqQN3h75sYoKyevsO0mZdnrEmzS5PYH+xNuKsyeoAbOZZ5wvd1po7Bn1BeTzy8dGlvg3P+z0jpJsqp2LGJ9bPBgcATYRRXmCUeJeQifrdZORRmBJYc5U7PVq9AapzcxxXl7Eh4+n7R0XC/iMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763684685; c=relaxed/simple;
	bh=IBsJuhS5L4hTi1gvqRDDpez25K9RD7ujYzmzquJJ740=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQuIxLIAxpCtlPaMQ9byJSBTCTTJSAgQteVbFXzQUeVZZL6hBmQqBtfjVNksB2yVXSsE2b9a91+8VxhSOG3dMrWdRWMCR+LEubhmch1O0GPoZMYBrb5NDH4CJGabNJ6Q2DgOfqqFMl80g6mVwqT2oe3qbCNvD1SUdnOnsKH1KTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ToWlZ9qE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ToWlZ9qE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763684683; x=1795220683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IBsJuhS5L4hTi1gvqRDDpez25K9RD7ujYzmzquJJ740=;
  b=ToWlZ9qEgy206iAa2Ur5wzkDVFoLcs08E6ATOUJQWxucvYeYwbEs+1Lc
   H57f7OIui5C44P7RaRlHL7adCwgXTgidQZEOOTqhkAj+OmE+Ss+JMzOtT
   9PUeOBMQAsw5UVELesclwdBtnf7ml7ib0UK+Emjg8NJQnaDdxy1AqugwE
   6rbVp7T9KmOwsYl0m5lFGJ7TIBDeGWyntxoyHVdNWqywBapZ8X5/mepyL
   jJhI1VK801fbX84YVHYN4nmMNDn0JgfUOEe21nrqO3T1iX2Tkp8G4j9bc
   r9DuuoJWQ8tt9SYVDruO+H/Gk9ElN+GYYA/be2OB1NTs8OLigrU1R3Y+C
   Q==;
X-CSE-ConnectionGUID: ZOJzpZzpQUab171M/Le54Q==
X-CSE-MsgGUID: 1h4IEMz+TX2qAHclcerh2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64779192"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="64779192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:24:43 -0800
X-CSE-ConnectionGUID: e8CII8TEQ2OuXTbINoh+HA==
X-CSE-MsgGUID: ZW0Smk93QNuXiUnGR4bRHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="195684303"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2025 16:24:41 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMEx4-0004kl-2y;
	Fri, 21 Nov 2025 00:24:38 +0000
Date: Fri, 21 Nov 2025 08:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Gomez <da.gomez@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Subject: [linux-next:master 4806/10599] error[E0560]: struct
 `bindings::kernel_param_ops` has no field named `get`
Message-ID: <202511210858.uwVivgvn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: 0b08fc292842a13aa496413b48c1efb83573b8c6 [4806/10599] rust: introduce module_param module
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210858.uwVivgvn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210858.uwVivgvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210858.uwVivgvn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `get`
   --> rust/kernel/module_param.rs:166:13
   |
   166 |             get: None,
   |             ^^^ `bindings::kernel_param_ops` does not have this field
   ...
   177 | make_param_ops!(PARAM_OPS_U32, u32);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `free`
   --> rust/kernel/module_param.rs:167:13
   |
   167 |             free: None,
   |             ^^^^ `bindings::kernel_param_ops` does not have this field
   ...
   177 | make_param_ops!(PARAM_OPS_U32, u32);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `flags`
   --> rust/kernel/module_param.rs:164:13
   |
   164 |             flags: 0,
   |             ^^^^^ `bindings::kernel_param_ops` does not have this field
   ...
   178 | make_param_ops!(PARAM_OPS_I64, i64);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `set`
   --> rust/kernel/module_param.rs:165:13
   |
   165 |             set: Some(set_param::<$ty>),
   |             ^^^ `bindings::kernel_param_ops` does not have this field
   ...
   178 | make_param_ops!(PARAM_OPS_I64, i64);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `get`
   --> rust/kernel/module_param.rs:166:13
   |
   166 |             get: None,
   |             ^^^ `bindings::kernel_param_ops` does not have this field
   ...
   178 | make_param_ops!(PARAM_OPS_I64, i64);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `free`
   --> rust/kernel/module_param.rs:167:13
   |
   167 |             free: None,
   |             ^^^^ `bindings::kernel_param_ops` does not have this field
   ...
   178 | make_param_ops!(PARAM_OPS_I64, i64);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `flags`
   --> rust/kernel/module_param.rs:164:13
   |
   164 |             flags: 0,
   |             ^^^^^ `bindings::kernel_param_ops` does not have this field
   ...
   179 | make_param_ops!(PARAM_OPS_U64, u64);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `set`
   --> rust/kernel/module_param.rs:165:13
   |
   165 |             set: Some(set_param::<$ty>),
   |             ^^^ `bindings::kernel_param_ops` does not have this field
   ...
   179 | make_param_ops!(PARAM_OPS_U64, u64);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `get`
   --> rust/kernel/module_param.rs:166:13
   |
   166 |             get: None,
   |             ^^^ `bindings::kernel_param_ops` does not have this field
   ...
   179 | make_param_ops!(PARAM_OPS_U64, u64);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `free`
   --> rust/kernel/module_param.rs:167:13
   |
   167 |             free: None,
   |             ^^^^ `bindings::kernel_param_ops` does not have this field
   ...
   179 | make_param_ops!(PARAM_OPS_U64, u64);
   | ----------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `bindings::kernel_param_ops` has no field named `flags`
   --> rust/kernel/module_param.rs:164:13
   |
   164 |             flags: 0,
   |             ^^^^^ `bindings::kernel_param_ops` does not have this field
   ...
   180 | make_param_ops!(PARAM_OPS_ISIZE, isize);
   | --------------------------------------- in this macro invocation
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `make_param_ops` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
