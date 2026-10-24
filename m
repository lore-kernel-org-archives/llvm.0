Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792811449;
	b=usig5yWd2J7fcuO/ULNNT+ujXyNSxNpOkeZFy3j5JRTB9a/j8WGFE33N6NUgXobHgXkE
	 csTeQVV6bRXTXOAKMQz8LxzDA6fgMOzA4EQjTY+UiDxzTdJ+x5aRkxDfxpAwQB2/LdA8+
	 gsXwfvh143px7iCyeLy1bF4U58Rap5RCpMpRQ8xUKuwsCwJifUmv226guKY4FAqnMA3Ur
	 daScJODmcPWNvUglLrH1lnd9qpZulwhZetW+JnDB5FO2kcDPYTaPbBBzlw7dB69Kig3Io
	 MRu5T6YOA2khmGjlZZpAJXcHPvmnpUBurMsXleNALLnVQbeztabVx+PgqvibO98Clwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792811449;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FuQWEQ8NfRd9spVST/QkaLS5lmee+T4fW47LXXtUoWg=;
	b=k7AcK+EXU70QLulrR2mB3w1TfmIn7ZsEXh3JsFQ1DeXXTuDHZgharyX/uRex1CSKRn1b
	 c9S/uZ464Ic6REM1wJZQKazXmCXqD+F4Q0aLsScbMca2LpWYUFNTfInc/ZsMw8XOERfnC
	 nS1jpLVCccExQTe85ICSl0npsgeVYBXQQltI6XpABlUMFbWeb690WZNKs9GXcCxVE+QI/
	 0Lz5h103/XgG+9Hws2gSrX9y5kT27MgN9dXyYtqIVEPZyYEahgYzzyADDr8vtZu6SucJa
	 NPzslgCg54TL8JuBOwh0yfDUg+fgHs2psQ0CklzC8zMbhFNcakLrUdMcTR+Blf588mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dBjmwa5o;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F5E606A31D;
	Sat, 24 Oct 2026 03:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F5E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dBjmwa5o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792811449; x=1824347449;
  h=date:from:to:cc:subject:message-id;
  bh=jVM9oydvQ19TtUJnCqVbSAH0i/DmF7TuS02KL/H+GYk=;
  b=dBjmwa5o3Bq89i6p15rO3Mc5Mrpr64xzEbNLYBA/nxBlHEjExW2I+amK
   43BRrS86/OZWnOq6llxQRVlwj11C0YXiPUNaM4JtNb3UklIVFT5OH8Q8z
   eAYbO1/OK07NW7ER4qdbytKCD89XKI7oliMmABhC7V/zgfotdn0qP80UJ
   gF9j1Ntad9IJ8uTQmwV95eq8Dced4uHLjlDNcUROPrQCOxuDN4trrg+iB
   oC+urqXVHg7vcnTSWwshP6kTJ7PtXcVm/tzsAj5L34Vm3A2HawRZ9BcD1
   wofeXIuj+0j9p2RcSy61nOxvDIIvcPqHCieGk+tmTGFv9QXgjMdygvyuH
   Q==;
X-CSE-ConnectionGUID: XAr+LRrTTduVqn8MHteBXw==
X-CSE-MsgGUID: GQOKKg31TMKNbYopvYiV7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1588001"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1588001"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 20:10:48 -0700
X-CSE-ConnectionGUID: 0VyYXDyAT9mVg/c1Y6Qorg==
X-CSE-MsgGUID: rxXYwzp9RfydWHbthX4MRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5641589"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Oct 2026 20:10:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKS9b-00000000TWw-2bH9;
	Sat, 24 Oct 2026 03:10:43 +0000
Date: Sat, 24 Oct 2026 11:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Eliot Courtney <ecourtney@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Subject: [linux-next:master 4098/19853] warning: associated function
 `from_raw` is never used
Message-ID: <202610241133.L9VWoFcD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

Hi Joel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
commit: 3f1e12fce16f6e88fbaab3404df33f65c8f4df87 [4098/19853] rust: pci: add resource_flags accessor
config: x86_64-buildonly-randconfig-1005-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241133.L9VWoFcD-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241133.L9VWoFcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241133.L9VWoFcD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated function `from_raw` is never used
   --> rust/kernel/io/resource.rs:240:25
   |
   216 | impl Flags {
   | ---------- associated function in this implementation
   ...
   240 |     pub(crate) const fn from_raw(value: c_ulong) -> Self {
   |                         ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
--
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
>> warning: associated function `from_raw` is never used
   --> rust/kernel/io/resource.rs:240:25
   |
   216 | impl Flags {
   | ---------- associated function in this implementation
   ...
   240 |     pub(crate) const fn from_raw(value: c_ulong) -> Self {
   |                         ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
