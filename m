Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1206A328A0;
	Thu,  8 Aug 2024 03:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723086413; cv=none; b=E6dwG3WJqkwpNpEc6Rk6vK9/+c1c2CN06eLSBUL71ZUQKET2+8hR788Zu2o6vH4kON2AACmUHeC0PtnqM2gl1S9jWQcjxoJZO0HeBwBCEmlFXEFM4rzq/jdO2Qkdbhrw3HVclu7hKHEs3BQwS6HwwXe/Gu0/PVmzfYO+RJCCkZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723086413; c=relaxed/simple;
	bh=IRd8B6kQEi24KXfg+96lABuFFbFBwInyPSMbF4Tf0n8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtlcXmbk9IeGvS1rbsM27ijOR2iyNmtdwVAr0ZWC9gF1ADXQqEUHMHKZh8GkATEY4/Gtw4h/BmWQYLhzljfnTTZyhwtmcV4uYCIBCPwBsMN1+t5s/APNfD3GBjl9C/utIbPFd5+1IMOqHTD1wNosCBFe5A6JCbXaLw61eMlUfGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvGvzMTs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvGvzMTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723086411; x=1754622411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IRd8B6kQEi24KXfg+96lABuFFbFBwInyPSMbF4Tf0n8=;
  b=lvGvzMTsPWOwTNrBi4C4D2XnHodfzxfypwB/0Ld72g7yBbpsc+L10BYI
   5cJbAKnxZJK5sbMoHOz3BbOCIxHQZxOI6vbO8VVb8WogcfLZVHB42BkBM
   e+tAaGspu7f2npiZkLTAMgATEL3kx67CYbtTah3c1dW9xvOkbKrYDa+SE
   sKeAxlxMyb7LU4+VQRGjub+8gmT3Bk1ISQ1+h1rdYYamMuNBEDPSoZXcy
   SK7Z5YGwan8j3iehajYMebIo2HlSjLM26WSrAlXDnsO/noGYtsEEd1Y2U
   EUKdrbg+TBOF5apWSvtUnx6A2p1eO59EWCoVzuUy1qBYVy879iha03eDB
   Q==;
X-CSE-ConnectionGUID: OQzMX6AxRuG6XgPMW3eELg==
X-CSE-MsgGUID: ZvjSQY8MSuyV8oMXUvTLUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38696785"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="38696785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 20:06:46 -0700
X-CSE-ConnectionGUID: MU0MFDdbSC+QdfZXmPyPtA==
X-CSE-MsgGUID: 8PcHWu8mSHWXgBRFYXGCiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="61724614"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2024 20:06:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbtUA-0005ss-1M;
	Thu, 08 Aug 2024 03:06:42 +0000
Date: Thu, 8 Aug 2024 11:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fabien.parent@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1040 19/23] error[E0425]: cannot find function
 `regmap_init_i2c` in crate `bindings`
Message-ID: <202408081155.xtVtZhAc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1040
head:   75eed45d343ba14a3bac1b23323dbc0ef0ec6569
commit: 83ed0d3c4051a20d48f76dcc1f4de31b2169a7aa [19/23] rust: Add new abstraction for regmap
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240808/202408081155.xtVtZhAc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081155.xtVtZhAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408081155.xtVtZhAc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `regmap_init_i2c` in crate `bindings`
   --> rust/kernel/regmap.rs:43:41
   |
   43    |           let regmap = unsafe { bindings::regmap_init_i2c(i2c.raw_client(), &config.raw) };
   |                                           ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `__regmap_init_i2c`
   |
   ::: rust/bindings/bindings_generated.rs:96297:5
   |
   96297 | /     pub fn __regmap_init_i2c(
   96298 | |         i2c: *mut i2c_client,
   96299 | |         config: *const regmap_config,
   96300 | |         lock_key: *mut lock_class_key,
   96301 | |         lock_name: *const core::ffi::c_char,
   96302 | |     ) -> *mut regmap;
   | |____________________- similarly named function `__regmap_init_i2c` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
