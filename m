Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B61547E7;
	Tue, 24 Sep 2024 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168234; cv=none; b=ld+6ciMkBk6vn8GFkKd2gqc72i9jrpYbU2rLTM93hZqvpLeI2WMSC1zSG1gspAffvsnkvPFRYRZa5C1daQqFB9I/cdH0re8/cdla7kDaBoZJI3pxarTVIm+gxvtPhZr8hUYmVFyepuU7GttOdqn/MHW1vt+eItMqTVkSQMBtxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168234; c=relaxed/simple;
	bh=c5V/FhKYmN/NiWbuZqcPh2gHFeHCO0C+1fUnB5C/rZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jw/L5d2IZ+Rf9QwpaLUDVsJmTTATovd0NrBYrTDyrVAwmA5RLEVqxNjXBIRFxhl+KvuGvp9wSQgVJHpBy914K9tbIGoAkKWQRUfTm4MfIbfRx7x8iPo9KTV2vvk8EffzzlEPERhXKB15jyvK7bfNteQ7M8ncrg2FKsGj6KEZU1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXjOowxZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXjOowxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727168233; x=1758704233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5V/FhKYmN/NiWbuZqcPh2gHFeHCO0C+1fUnB5C/rZQ=;
  b=BXjOowxZdVEsBOAvRnTqBHXwcFYRu3zGFVM0tLYMEsIO2kgXarCn+LwM
   PFUakVSLcxRAZ11ioMMeDKs6BwmQxbyd3KE4uJ3MLBkYoBj6yDeuOomil
   ezWNYuzdfIg+IgrF6kWZnYrITq2Vro0oY2whHJxq0z0EoGcJGorlUogJB
   Z0MEW7KbyXk6VNaj6Io1ZF9y1e+S6pDm3kACTj6zkd+bW7wbB+KojWw2S
   AZH8uYbBoXr+2OEuNgMh90k7UI79sn1a2XdZh8GvveOex4ZT161axD5NS
   5wfThHAhFz152e4xX8caOXg7H7bB/f+jDn4gHkjXi8u5giUzo+4kkGeUI
   w==;
X-CSE-ConnectionGUID: RTHwILYcRXqmIJaEaVlfTA==
X-CSE-MsgGUID: TBfGHULuR4mc1bgZP8Rugw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48681196"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="48681196"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 01:57:11 -0700
X-CSE-ConnectionGUID: 9rvvElBZQwacdskS1TqtvA==
X-CSE-MsgGUID: xVhQmANoShub5WDLAIn3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="108802264"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2024 01:57:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st1M3-000I8l-0Q;
	Tue, 24 Sep 2024 08:57:07 +0000
Date: Tue, 24 Sep 2024 16:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi 2767/2965] error[E0599]: no function or associated
 item named `new_with_class` found for struct `Lock` in the current scope
Message-ID: <202409241627.RpTCQos9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi
head:   3416d14cd345b3311b6020714a3bfad7f3dc8b58
commit: 8bf419c887bc5cf6785503b7436ef4328d94702e [2767/2965] rust: sync: Classless Lock::new() and pin_init()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240924/202409241627.RpTCQos9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241627.RpTCQos9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241627.RpTCQos9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no function or associated item named `new_with_class` found for struct `Lock` in the current scope
   --> rust/doctests_kernel_generated.rs:3949:18
   |
   3949 |             d <- new_spinlock!(Inner { a: 20, b: 30 }),
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ function or associated item not found in `Lock<_, SpinLockBackend>`
   |
   = note: this error originates in the macro `new_spinlock` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: there is an associated function `new_with_key` with a similar name
   -->  rust/kernel/sync/lock/spinlock.rs:14:33
   |
   14   |         $crate::sync::SpinLock::new_with_key(
   |                                 ~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
