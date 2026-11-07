Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064736;
	b=yKTPGbBs8ycrIASDuetfzpuKo6GPCJusKoiz64MD0lGgRMkMjVygNLgAP0o+r+fl6/p+
	 G9fbu4Zb/yhi1Sf+otOVhoXHsvTy6GchERUhYfKDtaanWJ/SjOaduUrRNRLUtvm9mGQIr
	 udhxNKnMz6r7dBxvPeRKvUH5heV7BwjqU89a77bLYah3IkYfQx5MpEh46Ot4Mcadu93h+
	 ClvuCNsRdf8gi5onobFfnRc8gbYKe8o3CSmq/ShBOGi/krETEVrnlRLOHmAYrrUYoirxh
	 WsTc9liU3D9svsG2zvxX2o4AL9lTHCefFtPzmH+DDPTV3xLDXOzdgujXKZJGadb+OYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064736;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/6wXiR/wb4FHeTOeE7I+EQVYa1s7x+v3iI6D7EVRsMk=;
	b=TCgevRFh2K0CZIrp6jtIhBJlY6S3V5tWvaa0pIgGPraSQWY7gh5ZXkjrp6ajuzjKiV4X
	 6ABnbubTAqfSbuAEtDm+oDzO6wwTpPlwuY5PAuS/hl3CgO5aor8dRk+0K9KPwgh1/O43j
	 2eMgE91syYV/N2fJoJIRvljYpc91kVkODFJPJTzEqT2kk7BfK7pKWqj8FfC5dePiw0Sgp
	 MhxomyOJvmMwwJcYF+OuZN4rfzpFZv3CGnWfCeaTBoQhKNqef6wjKlqG7PBMQZ97/gvv2
	 o/1wRIR1bE+cnggHrbvy0zr36rPeiNRxalsCP2ynvz7zCw6o9VZWX5eCHJJkL4kEipg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DoThOWUR;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DA3606A9E1;
	Sat,  7 Nov 2026 15:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DA3606A9E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DoThOWUR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794064734; x=1825600734;
  h=date:from:to:cc:subject:message-id;
  bh=9mNlYNZ/xZ7bVe9/c/eZjr3BTb8RfVSjPGvI7lCaY1Y=;
  b=DoThOWURrBUmNVs89Fy9IkoKWhC74hjs8irQrqFZIjVru8FC18lf11rz
   eOknEwoCIY5yldwsa0lIMKVTYz68UydLJa++c2kFbxNJppAHlwANFBOKZ
   Ay6GjJu6MScUxvk2x8TjNOYyecyUxD03QmwvHlYziE8cLxYXkH8TSY9ot
   ZBXHtQRvjuCJCwg3dsVISSHAywIiQoXjFdAFP+aL613/pXgq/WsXMUgy7
   AyK0JLwuFb3jZMEgUw8V0Kmzvem9Wn3mfCHth+hvNa8FgmmhEgZiWKkuw
   npkFolttvW7D3FWaJCSBa3RD8beaC6qZTRtMb9Ly5wtaDVTEsWgYuAkAQ
   Q==;
X-CSE-ConnectionGUID: ZKIpR7EdSpumENT2gP79DQ==
X-CSE-MsgGUID: UboilEgfSESMVefpd8Hteg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2736218"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2736218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 07:18:53 -0800
X-CSE-ConnectionGUID: PRW7U6GIRpq/d6N37LxOWg==
X-CSE-MsgGUID: 5pfOZH8LRdGzPbUiDSvycQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7509768"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2026 07:18:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPiBs-00000000r5a-3snk;
	Sat, 07 Nov 2026 15:18:48 +0000
Date: Sat, 07 Nov 2026 23:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:test/sound-rust-v7.3 7/56] error[E0425]: cannot
 find function `__pm_runtime_disable` in crate `bindings`
Message-ID: <202611072326.mCG6WGQe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: d5dd8d4a1fbe95ad79dc47b8b6606b6fcece0c82 [7/56] rust: add runtime PM support
config: x86_64-randconfig-1013-20261107 (https://download.01.org/0day-ci/archive/20261107/202611072326.mCG6WGQe-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072326.mCG6WGQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072326.mCG6WGQe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> error[E0425]: cannot find function `__pm_runtime_disable` in crate `bindings`
   --> rust/kernel/pm.rs:1003:23
   |
   1003 |             bindings::__pm_runtime_disable(self.ctx.inner.dev.as_raw(), true);
   |                       ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `pm_runtime_barrier` in crate `bindings`
   --> rust/kernel/pm.rs:1004:23
   |
   1004 |             bindings::pm_runtime_barrier(self.ctx.inner.dev.as_raw());
   |                       ^^^^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1615:5
   |
   1615 |     pub fn pm_runtime_active(dev: *mut device) -> bool_;
   |     ---------------------------------------------------- similarly named function `pm_runtime_active` defined here
   |
   help: a function with a similar name exists
   |
   1004 -             bindings::pm_runtime_barrier(self.ctx.inner.dev.as_raw());
   1004 +             bindings::pm_runtime_active(self.ctx.inner.dev.as_raw());
   |
--
>> warning: unused variable: `dev`
   --> rust/kernel/pm.rs:380:15
   |
   380 |     fn active(dev: &device::Device<device::Bound>) -> bool {
   |               ^^^ help: if this is intentional, prefix it with an underscore: `_dev`
   |
   = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
--
>> warning: unused variable: `dev`
   --> rust/kernel/pm.rs:385:18
   |
   385 |     fn suspended(dev: &device::Device<device::Bound>) -> bool {
   |                  ^^^ help: if this is intentional, prefix it with an underscore: `_dev`
--
>> warning: unused variable: `dev`
   --> rust/kernel/pm.rs:408:22
   |
   408 |     fn get_if_active(dev: &device::Device<device::Bound>) -> Result {
   |                      ^^^ help: if this is intentional, prefix it with an underscore: `_dev`
--
>> warning: unused variable: `dev`
   --> rust/kernel/pm.rs:416:24
   |
   416 |     fn runtime_disable(dev: &device::Device<device::Bound>) {}
   |                        ^^^ help: if this is intentional, prefix it with an underscore: `_dev`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
