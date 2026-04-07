Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B13375F82;
	Tue,  7 Apr 2026 03:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534191; cv=none; b=BYvBkkyF+yLh8Tb+P9DtCH60LmsbrRPSkTz8ilBuIPm1tz9Zkpo7U1CZtfbw/zFMC+w0Euws9644eEwlhAlmRVjX0Y4f7yaCmjScxaCdGrnKTYnB2sea/VsPwzGgPe/Zlw7dFalQurl+A5ibPzf0aGft86fVD0P8Q4tsNdamH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534191; c=relaxed/simple;
	bh=kCQdQ0lekeYOMeQ0P/gBb7pKvaXPo1paVF11aVepTOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DavNq6h4JE2nKj/TaFpyiRoBiRxMYb3/xKgOepKbv492PA/+7oeCMx4HqI+iu6IcXD4I1jO2GDfwdfv/bPoo6yYS4w64Lw97D4+V93FSxDiB3R2QxgVeDfPqTY0ikQFGmnYIrcnOD1UsRjbog0h9Wk13vJx+fOCRcTklP/GEhHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mxh2uchF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mxh2uchF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534190; x=1807070190;
  h=date:from:to:cc:subject:message-id;
  bh=kCQdQ0lekeYOMeQ0P/gBb7pKvaXPo1paVF11aVepTOM=;
  b=Mxh2uchFGB3p8ia2Ptlbs/RU4/C2A5YRN/hfdJcPk0sgAeZxKPLknO7v
   4+bGAytWCApxZSElhM4OpVOTMwrlwMEYOaRwagPqDL3064BDkCuKZc/kR
   U8a8EW+726ppT9PMz0BSk9P7LeNmw3mUmviu8XwhgkwvHp4wMQe6s6CKk
   LigS0XdrxaTJk9Efxh9qNrVAdlF+6ZfbAjPb/OEMNLSDoAfvGIoAorz+C
   H4/W1nuia5Pfpa5Pe06f5MNrsG1Yaf5TGXeS8SIht5O8xc5OGOIDuH9/n
   n/OeHdQT3qZ/1/Ko1bwde8qxG4rBSiObOOtM0e0O1ldYu4u3B4iDs1Jz2
   A==;
X-CSE-ConnectionGUID: DPaG0/IZT0KkGF4PATKn4Q==
X-CSE-MsgGUID: txDj11GxQc2YsKN/tq01Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87563826"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87563826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:28 -0700
X-CSE-ConnectionGUID: X2lmoIbyRQ2eO7PbqSfgOA==
X-CSE-MsgGUID: h3kSaTHRT+SzyhcOOkGgNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232926676"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 20:56:26 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xY7-0000000004d-4418;
	Tue, 07 Apr 2026 03:56:23 +0000
Date: Tue, 07 Apr 2026 11:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 30/68] warning: associated items
 `zeroed` and `as_raw` are never used
Message-ID: <202604041929.qLVyIvqG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   f7a3080ba37b989ad2fd83054a4b458af97b635d
commit: 0c779dbcbbeaccf8c0ef734565b512942d3ddeb8 [30/68] rust: io: resource: Add owned Resource initialiser
config: x86_64-buildonly-randconfig-001-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041929.qLVyIvqG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041929.qLVyIvqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041929.qLVyIvqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   rust/core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/core.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/build_error.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/build_error.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
>> warning: associated items `zeroed` and `as_raw` are never used
   --> rust/kernel/io/resource.rs:83:19
   |
   81 | impl Resource {
   | ------------- associated items in this implementation
   82 |     /// Create a new zeroed [`Resource`]
   83 |     pub(crate) fn zeroed() -> Self {
   |                   ^^^^^^
   ...
   90 |     pub(crate) fn as_raw(&self) -> *mut bindings::resource {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
