Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58702276050;
	Fri, 27 Mar 2026 01:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774576314; cv=none; b=BbvyP92SrDhEfQI/JekwY5AuE0cyT8BVLqyT9k9etJ42nt0Keg/Cpfbno0kCvpuG493gDF3irpgYiINt7vkbFPFo9L5oQ28wIkGc3+TC5KR2FptVeHHkeNVvb22Bs/ziCVHfMfRB9SUEfr0wwTNRp3Uh2UTm9qYvbxB0npzmotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774576314; c=relaxed/simple;
	bh=SZpKju/I8Pz2REnSInEB4qUIFbKAa3ondD3Kf8hFRn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kcbe1c1xgnNf3CoDetVSiQITbidL4EbfjXiqO6PD75pt/LwXWBuS5FmdHfIdEn+Uj1GGFM8sYFQ2S12VpxlFo/H+4k04CZ21x8ROPJj/rP66qPxsLWcoGwFbhTS+fLtnaRfsDXXcs8v3y+4O6QmdkRH/4ysS59rNH4nF0PqsTi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HK0LKGpG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HK0LKGpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774576313; x=1806112313;
  h=date:from:to:cc:subject:message-id;
  bh=SZpKju/I8Pz2REnSInEB4qUIFbKAa3ondD3Kf8hFRn8=;
  b=HK0LKGpGabPtGf4ueX63/vvjhz5rJv2yuXfDogI8ZfNiAiuRvf2U53nu
   T0IJBO9m2DBec2Lsq+5xEdmEcLVeKDatbR0XyPF6UQMlxnmls9pKTY1o5
   UW2/XyIOo27YUQ3qr3o6oJOIaHZygiNLGK8kskeajWLJD4Ld4L6xLQTiC
   nqKOGL1OGSn47CTz9KxqVujzey79jLzA9z0qDv4z/FL6UFV474QF9PMY0
   wqXo5L91qef078dCG4WLLT0Dm322n13SovrzcFDH+I27JOhQosGXUeoju
   Y0aGznShOcA4bkJPgc2bhce2xDilcNtsds/chIz7gdJMGzk24wxyr+wCS
   w==;
X-CSE-ConnectionGUID: R+pl07VNTVKsGvwaut/8RA==
X-CSE-MsgGUID: hCXL5YUTSXqKNj1ZZ9YuYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75760864"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75760864"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 18:51:52 -0700
X-CSE-ConnectionGUID: 4gkJHcdQQ/O0XOvi52Sl7A==
X-CSE-MsgGUID: gOlRJUzDTaeldGoigpEWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="229954175"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 18:51:38 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5wMJ-000000009e7-0ydH;
	Fri, 27 Mar 2026 01:51:35 +0000
Date: Fri, 27 Mar 2026 09:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 9713/9801] error[E0277]: the trait bound
 `Object<T>: aref::AlwaysRefCounted` is not satisfied
Message-ID: <202603270920.ZuE0FYNM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e77a5a5cfe43b4c25bd44a3818e487033287517f
commit: 4b9d7feab6e745f6959e8b205159f522c70de18f [9713/9801] Merge branch 'drm-rust-next' of https://gitlab.freedesktop.org/drm/rust/kernel.git
config: x86_64-randconfig-014-20260327 (https://download.01.org/0day-ci/archive/20260327/202603270920.ZuE0FYNM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270920.ZuE0FYNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270920.ZuE0FYNM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the trait bound `Object<T>: aref::AlwaysRefCounted` is not satisfied
   --> rust/kernel/drm/gem/mod.rs:142:41
   |
   142 | impl<T: DriverObject> IntoGEMObject for Object<T> {
   |                                         ^^^^^^^^^ the trait `aref::AlwaysRefCounted` is not implemented for `Object<T>`
   |
   = help: the following other types implement trait `aref::AlwaysRefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 10 others
   note: required by a bound in `IntoGEMObject`
   --> rust/kernel/drm/gem/mod.rs:96:59
   |
   96  | pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
   |                                                           ^^^^^^^^^^^^^^^^ required by this bound in `IntoGEMObject`
--
>> error[E0277]: the trait bound `Object<T>: aref::AlwaysRefCounted` is not satisfied
   --> rust/kernel/drm/gem/mod.rs:320:37
   |
   320 | impl<T: DriverObject> AllocImpl for Object<T> {
   |                                     ^^^^^^^^^ the trait `aref::AlwaysRefCounted` is not implemented for `Object<T>`
   |
   = help: the following other types implement trait `aref::AlwaysRefCounted`:
   Credential
   FwNode
   I2cAdapter
   I2cClient
   LocalFile
   Mm
   MmWithUser
   MmWithUserAsync
   and 10 others
   note: required for `Object<T>` to implement `IntoGEMObject`
   --> rust/kernel/drm/gem/mod.rs:96:11
   |
   96  | pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
   |           ^^^^^^^^^^^^^
   note: required by a bound in `AllocImpl`
   --> rust/kernel/drm/driver.rs:90:47
   |
   90  | pub trait AllocImpl: super::private::Sealed + drm::gem::IntoGEMObject {
   |                                               ^^^^^^^^^^^^^^^^^^^^^^^ required by this bound in `AllocImpl`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
