Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A91B1A9F90;
	Fri, 20 Feb 2026 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771607666; cv=none; b=Dxr9uQx3IYl1P69C29/lND2hRM/LlD88KD384VXKJSoQUBaLEeLEHPm9SSwoDeRMk/EJl4vEDkx6Phy948nWBJjau1m1F55BEophmGw0/jfDK/GbIyCplEI1e9nCvsIA8taPCvJcVqk+SMTWqadBvC/3Tycq/nE8eRUTbE1Y7zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771607666; c=relaxed/simple;
	bh=2PyiiqoKKokVUJ5Sr42u3Zy+yVrInWDENbjNBPL34Nk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LcVd9/NPkHChq5RlkM6nXNpFVwGtTM+Pg7Ou4FDXrhpcJrzysngPFhX5mTcmtLkH/qgKhwKylqOXMAJihwVGu/XYWLZimj71rb+KtQG9X7T9KTGm1KfhRqX2SpdbV4avRK5GSyuwJJ+pUXwP4tiUYNBW8shmbUWVZrRz+ccRVTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAv18rEq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAv18rEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771607663; x=1803143663;
  h=date:from:to:cc:subject:message-id;
  bh=2PyiiqoKKokVUJ5Sr42u3Zy+yVrInWDENbjNBPL34Nk=;
  b=AAv18rEqLj943p+ybDpgsM91Dbla1u94UHXD7ukwTJGC3UhluzojxtC7
   10kyeKprTu4kW94mYsV2QjzmJjrYIcyPYoP4QiBA71q6sK5jBhWyRxb0m
   EGYLhZncvUnEOLoHRUiY1oe0X6awrf0Amsc+A/iEpJsTQBeUgWKY4qm6x
   onbzX0TK2zV0aSSPdM1287jQOZTFnbu43U5Xk8MwdZ+KVL4uDb0RvEa6V
   nDEzIIhbxwwwA9g905GdIJJC5XbmI9RSxojZC5lyZYzL+tu35VkacCGwU
   eAt7uWDb2b1CJKIxbkUC8ylz4OQ9C9rkp9UjTxLoE1x1m71qNPHs/SZn/
   A==;
X-CSE-ConnectionGUID: 5tQhHmv8QJ6JKHeTk0Q7hw==
X-CSE-MsgGUID: L3URusqwSdGLV30oHXCvYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72687091"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72687091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 09:14:23 -0800
X-CSE-ConnectionGUID: aEmbOAtnStmodQw23m1obQ==
X-CSE-MsgGUID: cwqdp3U3Se6XdLLFCCkCHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214752624"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Feb 2026 09:14:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtU54-000000014Iy-3umI;
	Fri, 20 Feb 2026 17:14:18 +0000
Date: Sat, 21 Feb 2026 01:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 6/31] error[E0133]: access to union field is
 unsafe and requires unsafe block
Message-ID: <202602210130.86eZe0Gi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   d44aeb89db2e47449220a4721f5e89202bd7b128
commit: 6e05d1c7b5efa36e6e1c8581e1645c00eb6ab0f9 [6/31] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260221/202602210130.86eZe0Gi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210130.86eZe0Gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210130.86eZe0Gi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0133]: access to union field is unsafe and requires unsafe block
   --> rust/kernel/ffi/clist.rs:331:28
   |
   331 |               |p| &raw const (*p).$($field).+;
   |                              ^^^^^^^^^^^^^ access to union field
   |
   ::: rust/kernel/gpu/buddy.rs:433:21
   |
   433 |           let clist = clist_create!(unsafe {
   |  _____________________-
   434 | |             self.list.as_raw(),
   435 | |             Block,
   436 | |             bindings::gpu_buddy_block,
   437 | |             __bindgen_anon_1.link
   438 | |         });
   | |__________- in this macro invocation
   |
   = note: the field may not be properly initialized: using uninitialized data will cause undefined behavior
   = note: this error originates in the macro `clist_create` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
