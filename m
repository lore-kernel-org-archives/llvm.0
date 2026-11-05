Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913957;
	b=ZkZj+u4tfXPtda0gg3QHEMZLdyewBfmvt/Ye3xVKa7a2/9VyaGzxEW7kp/C0KOYd+x8e
	 1u8yoGD7FVIaNte2FUzmaRXDNjM8aOQehqtZgmZVneRYTCL8zpmfg+v8gDzNXA4jDwnxY
	 heeApErem4LmZpPg4boA40pi89NA2mC1lt5D7semgv6+YcD2gSVnRbQ3GSt0Jkt16Qypw
	 hVPpaRIQVLFCKIRoxyQzEPUw4gNeZynz7hJVth22HebvsPCGOSgEa5bnb9waP8FeTUvp8
	 9H9SVRJ9BXHMePkSphahyPgj/9DDpzOFRKEqoPoamVs2rHxTdQ08kBqEn32E3C2C1Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1X2epChlGTt6rA00CERorJJbRYHsnVDLyGw4osaD8pg=;
	b=bRBgQ7nZPk4AjPGOekhafPN4aZDk57XGILmDg9EyeSAO3bguOiLdo47IB0jN+71Rdlqm
	 q090taWLiaQEgj9pEbG82L0W9XHdTIStoVd44zV/iU6PaP5PHICrE8cVTxPLZcNwr2H7r
	 ZddLR77ayf9ioCZ+R4VLM+eJjqaQ0LqeuzRjwN93P1tWAetdgbVZrcak7o0lg1+LWDhnw
	 U5Gl4YzLnrIXFKGe3ku8RHDzYWXrvY6rjNOurxMn8mUI6deja700eS2VxUjTcs8kZel3e
	 CzLX/1RF6ERDParzoVP/y54Etu+a70pH+XEqO/r6twbxaGELJxiWOp0YWsHNSa35jfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="W9/k/EFu";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FF7606A326;
	Thu,  5 Nov 2026 21:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03FF7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W9/k/EFu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793913955; x=1825449955;
  h=date:from:to:cc:subject:message-id;
  bh=goTlMdDDwVSzYjrrufrV1Ronxk1B09FoPYelTQTASN4=;
  b=W9/k/EFueKZ+edYDRgljeOjAotVs+gFbF/4K6Lantyr2Aqimzg9H5dHM
   nNODBOm3FI49jzHC/uKKWHdjb177HCB7MuXkW7e0PUcOcZiVT9Bo72Idn
   l4ldnplAAlVd1MhI1AvNeOE6BZCUvKt6pVZZAu6aQwOuRODXU9JTZg0Pl
   nQjmZSPzSvH/2l+SiCzQUNdOcINemYCW5pg+utRK9asNrj+YRjnA7fOMj
   FluT8eaG2H4Kg6OUd3DnJrLUTa1f0M5m9IF+WCw/m9siCkIoVpMl7Bxy5
   +2yE7SJDgzVSJ5mBUStuDqe2P96+Fbmxev17B4wrNOMd9kOgiCi4TuI5i
   w==;
X-CSE-ConnectionGUID: vRggxALTRHChfJSSR35RRA==
X-CSE-MsgGUID: AilJz7jASSaz/lQYZ6PTUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2606845"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2606845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:25:52 -0800
X-CSE-ConnectionGUID: iMA8ocPQQKiimm152XJFjA==
X-CSE-MsgGUID: N5YXU8IkRTqbpsHIZViTDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7022205"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2026 13:25:51 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP4xw-000000009o9-0KEx;
	Thu, 05 Nov 2026 21:25:48 +0000
Date: Thu, 05 Nov 2026 22:25:47 +0100
From: kernel test robot <lkp@intel.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:test/sound-rust-v7.3 7/56] error[E0425]: cannot
 find function `pm_runtime_barrier` in crate `bindings`
Message-ID: <202611052257.izHDrnRN-lkp@intel.com>
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
config: s390-randconfig-2000-20261105 (https://download.01.org/0day-ci/archive/20261105/202611052257.izHDrnRN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052257.izHDrnRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052257.izHDrnRN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> error[E0425]: cannot find function `pm_runtime_barrier` in crate `bindings`
   --> rust/kernel/pm.rs:1004:23
   |
   1004 |             bindings::pm_runtime_barrier(self.ctx.inner.dev.as_raw());
   |                       ^^^^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1555:5
   |
   1555 |     pub fn pm_runtime_active(dev: *mut device) -> bool_;
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
>> error[E0425]: cannot find function `__pm_runtime_disable` in crate `bindings`
   --> rust/kernel/pm.rs:1003:23
   |
   1003 |             bindings::__pm_runtime_disable(self.ctx.inner.dev.as_raw(), true);
   |                       ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
