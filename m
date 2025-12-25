Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06657326927;
	Thu, 25 Dec 2025 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766675504; cv=none; b=GXgtSfEx+AuQufKALavmsM0wnD1w9mJ/Mw+pAkBgy1eiMGvlRvlu+LHZTJMnFqRYkUeKM0WqjiafOWwm/A3r2xZRj58m+jwUxBqC0/NerPO0uF1U9TBZqUw8aNOHIcxesf9+pxqqtYfjsQ/pgbGJywxpUPfVrkh8HE73umkGe9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766675504; c=relaxed/simple;
	bh=XvynBruvWowMgTuK426/5H04FFVEyVfDgybA03hM39k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cp3BOnizgAFB0jAIRirW468MhRtsxXqNT41/YuCHR9FLvguMekCSEIt78aVXx0ndEWWNZFIj4ls4vymMwinvzH/pIjVIlfuwFTuR2o+yrGrOyfp1G/sMkNfux4LC0k1xv/WuydgItE894Mb8NkMbk/rvvHDFK130DRQE0HSaH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDCpYQqI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDCpYQqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766675503; x=1798211503;
  h=date:from:to:cc:subject:message-id;
  bh=XvynBruvWowMgTuK426/5H04FFVEyVfDgybA03hM39k=;
  b=hDCpYQqIxtgj/CYGv0fif7aPvgrV6iq+i42MNwJSop2Utycut1FiFE7o
   dC1K3uVfCavoe3gO+NulBkx797Llc16bkvLxM+iddl8aJ+jZI7x8kLJ15
   FnHBl+PwQK74dp4XmSVmhbbnrISzQED3FEaMWsJGzftrCFqsBGQdgbeZQ
   wpxp7Md2dHPgT4zJmbKcgLq6f+B95EVqAqvEfeaWlIuX1I++gmBcTnuZP
   QEY4m1tgeklM7p78gnpRoW7FaWwa2Y4sc01eH4SJrJSclhfHlv9nCg8w7
   bg6D3gSb77QoyFOFRVynp7BpVUYAzsuORMyaS2PeeFhGZcQNV5iurndgQ
   Q==;
X-CSE-ConnectionGUID: 45g1QB/bRRKw69ly+xma8Q==
X-CSE-MsgGUID: h+TpXVh0R8+iF/OQms/O4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71052560"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="71052560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 07:11:41 -0800
X-CSE-ConnectionGUID: dDimkZ9HSRia3pNIAUusHg==
X-CSE-MsgGUID: 86sYHnMYQR+8q2TT3XgBqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="200716317"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Dec 2025 07:11:39 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYn05-000000004Bn-1muP;
	Thu, 25 Dec 2025 15:11:37 +0000
Date: Thu, 25 Dec 2025 23:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 35/62] warning: associated items
 `zeroed` and `as_raw` are never used
Message-ID: <202512260140.s3YzBb69-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 8a33a772f7d73cc9cb83c339652be8d04171e6d1 [35/62] rust: io: resource: Add owned Resource initialiser
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251226/202512260140.s3YzBb69-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260140.s3YzBb69-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260140.s3YzBb69-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `zeroed` and `as_raw` are never used
   --> rust/kernel/io/resource.rs:80:19
   |
   78 | impl Resource {
   | ------------- associated items in this implementation
   79 |     /// Create a new zeroed [`Resource`]
   80 |     pub(crate) fn zeroed() -> Self {
   |                   ^^^^^^
   ...
   87 |     pub(crate) fn as_raw(&self) -> *mut bindings::resource {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
