Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1772AE90;
	Sat, 23 Nov 2024 04:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732335968; cv=none; b=Knmz7IoKQfHk9POgySpigJTiduurJJP/t1AtV5lPQhm61lF/Ox6ox4CmqWKnU4KALPBFTBsSbWV+jsbgu2pGJebh8TMu2l0NBYav5mV4luqHzqn//cTzekd2uwsSDIPtyxajSPuSwOG2wRgRGKXQkPRiWyAhMZSwfGqt/Yj2Fbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732335968; c=relaxed/simple;
	bh=kEc3NiGD30qCCoUikQXrc2VbFYvxuFkdqjkGd5wIXTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khgnRzUtR1BZBMgQHBhh5aAgep76wcwrZRoNM7+pAKe2Pgi8pp95VuyZl9NjLmn3l+5e39RwD8NRuVF+KI0Sxbwd1aPfYwJE07deWntEpDI5iAfiUNLfw9xaInMsrvGK2UCEGy+pKXEWKzo2TpWgo2paM2clIFmR/pDaPJIZLN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuxVTOIS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuxVTOIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732335966; x=1763871966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kEc3NiGD30qCCoUikQXrc2VbFYvxuFkdqjkGd5wIXTs=;
  b=KuxVTOISlmNWgd5cH7Ylohv7DhZ3w2G//jfoHgefqvs00oLtiaEKpyLP
   vUWea6J6K2nitr4R3UJcYO3xc/UmAcIux4snaGH0jt6bJx7SJHDZs5+Lb
   FEfMpNo4V8mXnyNC7KMcLN8/VC3rWiVkiEclNgOBVCOrx75TXsfFAF4qr
   2ciytRbtDfxQocUPy1NHvPub583vz13e7S8sbRbyw8TukBjQ58YL4CqeE
   iaeCJttYPJuwG390ld9c0ese2Q4XUIofxuvVd9AJj9y5TfbX4t4bdJV2c
   TBd2whRmBoBytvJEwEYcaxCTx6UQ6iSlkxLTczOgjzNzivcp75TFF5GbW
   g==;
X-CSE-ConnectionGUID: +dOTA3QmQiq7v0LB7pW+kQ==
X-CSE-MsgGUID: zAKXPGZbTjOcmivE5FTWvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20089618"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="20089618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 20:26:05 -0800
X-CSE-ConnectionGUID: YXAslTA+RJy8LN9ZgUfaOw==
X-CSE-MsgGUID: ots/bJDtQOqIk8eoTy7s7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="94840225"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2024 20:26:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEhic-0004Qd-20;
	Sat, 23 Nov 2024 04:26:02 +0000
Date: Sat, 23 Nov 2024 12:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ding Xiang Fei <dingxiangfei2009@protonmail.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1130 2/2] error[E0658]: use of unstable library feature
 'dispatch_from_dyn'
Message-ID: <202411231237.ai30ZJhv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1130
head:   22607a75f562e7ffa92b8b44ac1574bcb214134d
commit: 12eb3c1dbaf6cc396bc5bbc93a9cffaf1eaa56d1 [2/2] gating behind version 1.83.0
config: x86_64-randconfig-006-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231237.ai30ZJhv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231237.ai30ZJhv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231237.ai30ZJhv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0658]: use of unstable library feature 'dispatch_from_dyn'
   --> rust/kernel/sync/arc.rs:186:40
   |
   186 | impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<U>> for Arc<T> {}
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: add `#![feature(dispatch_from_dyn)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
--
>> error[E0658]: use of unstable library feature 'dispatch_from_dyn'
   --> rust/kernel/sync/arc.rs:492:40
   |
   492 | impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<ArcBorrow<'_, U>>
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: add `#![feature(dispatch_from_dyn)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
