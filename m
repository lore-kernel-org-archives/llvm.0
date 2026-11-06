Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793930202;
	b=oMBli2nyhKX7J4V9Tbk0Pa7Wv34Bmcvo6yl02y1ufU6i9ISiSmhkfEoI/U/jaX8Gpn1/
	 9V363IkY7hilSBTiQPEGu5bPj9hTpNSmGoRnH4wZqoaFdwZG/YGhhSK6h92YGbVyKS+1E
	 jVf1nXnwupxZ0J0shf2NHY88w5pHCc4mprImy5u7tWQY4FRvIhFPMjW7s0xt3uOEvBMNg
	 mLmB3CccwLF9feG7HeYBqiqXWVRwuw+uKWwsvDG6IxKaH/YG3QabIG0/g2UEeFCbye2w/
	 zroDY6SQE3UyY/nRXHFSYRfaaJ6zAiSOzqZVvhZQc1CJjJWyZ0eVgWWSqtLDoBZ8zOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930202;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9uSER3KHp7evnz5IrQsPFl6gBun0+2+KKWfdV49F5ss=;
	b=1KgBfUwYkCY9aF1+YzsoeJMK74g2aggaKgGyRBcMAk9hAkZDoGB682R26bsOFife6cdC
	 kmz49c50KTB/AE765bQ28cbOt39vLupuiodPms6LF580HUx9bRaklPeU8S8YAahhdN631
	 QMpYkpLI1kB3v2CFs6twkJewfa5A4Rd/Wx5z9ljmc8TjoExzXPtKpBgI2TXBbOfYaqO5+
	 GhUgCLg2FxrWD7yOdfUjmyvBQ4qtgzPECDGZH7cWM4YTk1sIGA4yWfefGxgnCI9Pje53R
	 rJV+NBJ8JiciQO3MrU0zTZLfIBv09OVjNqf72bY1W8mgxyCEiuv/0aZn2tKpiYwvPgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PwMtJm0x;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5FA606A328;
	Fri,  6 Nov 2026 01:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F5FA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PwMtJm0x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793930202; x=1825466202;
  h=date:from:to:cc:subject:message-id;
  bh=dbQeZFEndgkCrTQbe1Pp2dQY0hHVPftsiz/wri0Ui3A=;
  b=PwMtJm0x4ahgNy8jKU3PWv1pQ9jKWcQGNcxAe/Z/s4vU1kIayr59p3N1
   n6rpQMrd3yHP1rIYmUZ9XXRfeUruHARaVmHh4cdDPaHFfdz8bOU0Nc/Px
   I+M58cfezq+gGLmuvnCDbcqSiWGvDLFTqOAIACvzYuQZy4/lpdILbmciY
   VHK04RsuQYLo1XfTMZaZm8xq6/WUbX+Sxgnnm+bNjQcRFFlIp+8ELGM8G
   Fh43YAzyAAkl0Vtwe2FUluhSJNopSCIKC2Pzj+Uhlx3LODE3URj0nHXJ2
   xUvieB7iC/bv5CHb5fhcu98upt2pnrRt0kf/dq9PMw3N3Md1anfVuKWRY
   g==;
X-CSE-ConnectionGUID: tqy3iTt+QCO7NANJ1/RcRw==
X-CSE-MsgGUID: NZaDEeLpTv6itSOuR+6YGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2740553"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2740553"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:56:42 -0800
X-CSE-ConnectionGUID: 7SWns9zdTZGhnyS9dejAJg==
X-CSE-MsgGUID: vCGrFNzGTxyFt4Ddai0BrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7068398"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2026 17:56:40 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP9C1-000000009xh-0N3P;
	Fri, 06 Nov 2026 01:56:37 +0000
Date: Fri, 06 Nov 2026 02:55:46 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 32/56] error[E0425]:
 cannot find function `snd_ac97_suspend` in crate `bindings`
Message-ID: <202611060233.tMHVzepz-lkp@intel.com>
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
commit: 213e33e4c0ede930090f9d3988c53fc5fc6bdeb6 [32/56] ALSA: rust: add AC97 codec abstraction
config: s390-randconfig-2000-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060233.tMHVzepz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060233.tMHVzepz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060233.tMHVzepz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `snd_ac97_suspend` in crate `bindings`
   --> rust/kernel/sound/ac97.rs:223:28
   |
   223 |           unsafe { bindings::snd_ac97_suspend(self.0) };
   |                              ^^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_generated.rs:147923:5
   |
   147923 | /     pub fn snd_ac97_bus(
   147924 | |         card: *mut snd_card,
   147925 | |         num: ffi::c_int,
   147926 | |         ops: *const snd_ac97_bus_ops,
   147927 | |         private_data: *mut ffi::c_void,
   147928 | |         rbus: *mut *mut snd_ac97_bus,
   147929 | |     ) -> ffi::c_int;
   | |____________________- similarly named function `snd_ac97_bus` defined here
   |
   help: a function with a similar name exists
   |
   223 -         unsafe { bindings::snd_ac97_suspend(self.0) };
   223 +         unsafe { bindings::snd_ac97_bus(self.0) };
   |
--
>> error[E0425]: cannot find function `snd_ac97_resume` in crate `bindings`
   --> rust/kernel/sound/ac97.rs:229:28
   |
   229 |           unsafe { bindings::snd_ac97_resume(self.0) };
   |                              ^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_generated.rs:147973:5
   |
   147973 | /     pub fn snd_ac97_reset(
   147974 | |         ac97: *mut snd_ac97,
   147975 | |         try_warm: bool_,
   147976 | |         id: ffi::c_uint,
   147977 | |         id_mask: ffi::c_uint,
   147978 | |     ) -> ffi::c_int;
   | |____________________- similarly named function `snd_ac97_reset` defined here
   |
   help: a function with a similar name exists
   |
   229 -         unsafe { bindings::snd_ac97_resume(self.0) };
   229 +         unsafe { bindings::snd_ac97_reset(self.0) };
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
