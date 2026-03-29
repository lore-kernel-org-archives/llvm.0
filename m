Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A123803DE;
	Sun, 29 Mar 2026 20:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774814635; cv=none; b=R+3zCwF+VXg7F3KsQUd7Lo9xYHkuZIC8B0qhA9GL5kn6+MwldYB9sm2VgqcdZkRriRlZBnP6hgDBVj9IOWf6BXCemWuhn4tqt7CUjOvh1IS4FL+LbbT/jqGJEALRM8VYgg+Fw6jpHG1GsWMuVwSjLf+v3S4Al8jLxmSZc2jUxKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774814635; c=relaxed/simple;
	bh=O7U2Bjoez/wHT4Uyw55BMWeW8hLhvS/pD2bS+x8l8x4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cfZQlZgmxxQK27AtOfc/ugX8ocz/c1JuY801OrXlTPxwp97/CxR2FFfpaVRkFH3gI4/cRoReiwjlhv+Oun0EFd/HIXB5ugoViwpsgSFphfIlI1iRIWhd0tLTuqdLRJP3ONSat51LlcbRcAQNQ3igJuUHbjqcMyRpbRj5E6PAmsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUFVW3gk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUFVW3gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774814634; x=1806350634;
  h=date:from:to:cc:subject:message-id;
  bh=O7U2Bjoez/wHT4Uyw55BMWeW8hLhvS/pD2bS+x8l8x4=;
  b=VUFVW3gkUEsMarPqrMpbhYcHl/GXBvwNTcSrFfxZoGeRARoX0vNwHeD9
   bx9Q/3dyTMfWNMqcWqBDArd4tUXma5X6PnnP+PsNy6VyBdb/8QXd/4UEb
   DXCOVMJo0VBRAnlVKD/ccBWKjim1kzPfpf8HliOUgNW/9HjQO0lV+NGR0
   LUeMm3lsMwaRBKpY7VzE9Zuz7j70g+3R8yt/TXDokhv8jMHCXrHerUAPF
   XbwZP1ZIdCG9sVVCU7C+txo2ERWCCQsfNhpOp4PDoUj3QADgjer4d22fh
   WZZr3RoKp5gxtANPvWhHVdUW8t98CuZ+hBGb1lDEt8mHabERr9HQwMqXJ
   g==;
X-CSE-ConnectionGUID: KxylrIV6QSetgj4R5CxhXw==
X-CSE-MsgGUID: xtZplPTJQ22Us+P50U/4oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75708674"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75708674"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 13:03:52 -0700
X-CSE-ConnectionGUID: iYZk8nNxSGmjqWBSHgjjVw==
X-CSE-MsgGUID: SOYAjNX0Qr20rbcAyHnU1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="229927056"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Mar 2026 13:03:49 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6wMM-0000000007F-2m0M;
	Sun, 29 Mar 2026 20:03:46 +0000
Date: Mon, 30 Mar 2026 04:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Matt Gilbride <mattgilbride@google.com>
Subject: Warning: drivers/android/binder/rust_binderfs.c:229 function
 parameter 'arg' not described in 'binder_ctl_ioctl'
Message-ID: <202603300355.MIT20sJc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Alice,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f242ac4a09443c6e2e0ec03d7e2a21b00cbb3907
commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
date:   6 months ago
config: x86_64-randconfig-003-20260329 (https://download.01.org/0day-ci/archive/20260330/202603300355.MIT20sJc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300355.MIT20sJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300355.MIT20sJc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/android/binder/rust_binderfs.c:229 function parameter 'file' not described in 'binder_ctl_ioctl'
   Warning: drivers/android/binder/rust_binderfs.c:229 function parameter 'cmd' not described in 'binder_ctl_ioctl'
>> Warning: drivers/android/binder/rust_binderfs.c:229 function parameter 'arg' not described in 'binder_ctl_ioctl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
