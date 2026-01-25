Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716D24B28;
	Sun, 25 Jan 2026 01:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769303326; cv=none; b=OZqpjGRHInvfmwRayxIzZUsEsWxaNhe10JhepO78lcGlwxecwNVAeSyp2VlblS7Z6H9S4gviD/BGc9QLmRO6omEiINR+x9nRgpnfwy6jRdg4dg8gG0gnKlfMr+WLOX5N7EmRI5dGuPWHcpDWaFWbe2AXu7D5t9zx2sn/hSzjEyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769303326; c=relaxed/simple;
	bh=dOlMji1cbfZuJXBQtqg4KH5bvaGdN51WTw0/duYYg+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L5ckuP+6FNPZs03LmSjE/dq14uXCXOywv059NeCwgoBop3cKX/hN1DMUar3s5MnY1QRKbR/KeAUJKVqs4kLxt24fd2VE1IKlaC4WaWL9wWmvoUJrjbQITnp9Ty14COrS4Ro3iUs7Ga0W9cn/hR7NQvqNn4PycruGy0/30voORXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MO3qtC5w; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MO3qtC5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769303324; x=1800839324;
  h=date:from:to:cc:subject:message-id;
  bh=dOlMji1cbfZuJXBQtqg4KH5bvaGdN51WTw0/duYYg+8=;
  b=MO3qtC5wbwXQxFhM2syQojPfYgtHSiL5EGAfbuxVhY0bhIEjwBLJjDVb
   wt0VZjQ7Dyy7jNsVhE1pbXoxlSGGbOrg2ptYZ3jrlvuV1zH1+OkzzO6Ok
   msFLg7Ut2RWhoMYz4Nkh4y6k9KIsXq7WEP6AwTg0xQpm9pIsAjy4DEQtN
   MblVKjoqjBgfaLPxT8+i9gcnJsqhiLBwaYGFcR3xzS8kXLzwinI4ws5E4
   a6uz8xLKEaiEbNc4Fe+VlxdmalSPRBgkN1lDaqYx1duvzs43IiFUxc+NA
   lOObBRuuEGPBmsAeE0MSEhxlzWLVt86LoX+gK682ijwCYnLQziS27NEfv
   Q==;
X-CSE-ConnectionGUID: H7GIkJGHQea+a8VTkjV8dg==
X-CSE-MsgGUID: iJdjWascS12lZtcobnRZjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="88091061"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="88091061"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 17:08:44 -0800
X-CSE-ConnectionGUID: 0qLA5uXeSx23cH1oMUV7YA==
X-CSE-MsgGUID: PSTmkor6TbiCnZKrPDR16w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="211858038"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Jan 2026 17:08:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjocJ-00000000Vec-2YGv;
	Sun, 25 Jan 2026 01:08:39 +0000
Date: Sun, 25 Jan 2026 09:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 5/30] warning: associated items `from_raw`,
 `next`, and `new` are never used
Message-ID: <202601250810.q4eMSFkF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   b94c5d9b67e466e13a0e7ab9ac11c4bbc1cac1a9
commit: 39d0c149fcf8f63632522435df53e3648999d824 [5/30] rust: clist: Add support to interface with C linked lists
config: x86_64-buildonly-randconfig-004-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250810.q4eMSFkF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250810.q4eMSFkF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250810.q4eMSFkF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `from_raw`, `next`, and `new` are never used
   --> rust/kernel/clist.rs:113:26
   |
   105 | impl CListHead {
   | -------------- associated items in this implementation
   ...
   113 |     pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
   |                          ^^^^^^^^
   ...
   128 |     pub(crate) fn next(&self) -> &Self {
   |                   ^^^^
   ...
   145 |     pub(crate) fn new() -> impl PinInit<Self> {
   |                   ^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: struct `CListHeadIter` is never constructed
   --> rust/kernel/clist.rs:179:8
   |
   179 | struct CListHeadIter<'a> {
   |        ^^^^^^^^^^^^^
--
>> warning: associated items `from_raw` and `iter` are never used
   --> rust/kernel/clist.rs:231:26
   |
   220 | impl<T, const OFFSET: usize> CList<T, OFFSET> {
   | --------------------------------------------- associated items in this implementation
   ...
   231 |     pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
   |                          ^^^^^^^^
   ...
   247 |     pub(crate) fn iter(&self) -> CListIter<'_, T, OFFSET> {
   |                   ^^^^
--
>> warning: struct `CListIter` is never constructed
   --> rust/kernel/clist.rs:260:19
   |
   260 | pub(crate) struct CListIter<'a, T, const OFFSET: usize> {
   |                   ^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
