Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922272;
	b=SOtSSoVMtlMkAq1Q6mu3VqMXymXsIIJ0bnpAMXal/IK5D4DIxdxxmqqi6eQHkX1lRMJZ
	 n6sIjzgqSAtVq2yQOfJyZHps1IzH8R+TSJweOY9WfP6HkilQxwJgoCv4itYMZP8P1FB99
	 RRBcq876GxgvbseO1n8+KTdG6/CU1NobHHJEKBETAPnf7ETWMaA2EhtDpAFPl2cgTDbkU
	 4eq30tyFN05heV7avMNk4LO2rqWrW2mDS8NpZ2lZwUinFG6xR3uqD/1eOHV4Xmqn9rd8i
	 ihOsKNTod7/uvNKkgR8+v61IpiaiZpInJU9TjyEcVcQSLTXPISQWIEzO051wESXODCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922272;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MjUPmKN6MgnSwzrWnR8H6fImCVp/REMKYCcTdlGBe0g=;
	b=ApJUxbUhW1E49BpfLuXEIhyaF1OSZdYy/81xGV4hw31lo0g9j9g5KCkGsCYzdLP63EgX
	 CjbLTLqwXcAbRNKrcIinaFMcUVXyOmimW5pUYB+wPd9WVEOGnkw+1xmvHD78Jn7MII+G+
	 fLcgJXkOUhHuxdbpvjXDlaicqN2tAhzIWzXYzg7pNxdMWMTYi3d6BClV32ogSGrUkBH5H
	 zreC/WwwcNaZfp+Earpw++/zthHN3rtkBKbsnzSmuKeicegbjdlSAqCcaQnlt26AvTYDR
	 5UxzheS/iJLAf54kHkpg0iuHZVg7mQ9GFNhgjvEfqM1jL6CLSitFOuQpqdLBorjIz6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VGP6nJWD;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414C606A31B;
	Thu,  5 Nov 2026 23:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B414C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VGP6nJWD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793922261; x=1825458261;
  h=date:from:to:cc:subject:message-id;
  bh=/EOF5OTVfOoBzhuw2SJOB6s+/Ruf8F3tuGJElD8ZNsM=;
  b=VGP6nJWDlO8yTJZHW3YETdRWXmse1hteGLbd8BLeKv6JcZTw4FOp+oe5
   AamLDZdEBX3AxOWFMIsY5gbg1EAxf/JC8olR9WeITzwGcw0iJy0J1+Kkz
   EEvTyJzI7OhSBUvShqIkvmidVWwTlzaHBFSYUeMzmV4zXjwXGbOhm6psa
   kjX02lY84UXRe/m/mjWJ+j36M7Kp1usq6SUx5b3UBVUefePcdlWeNUrnv
   XeipahMunJuBHG/7bWUkp9s0qYcXXUHGge0n/CqJEp/jHhHR3Mly6Rj7L
   O9m+8yA7PWoKTLGwpyUoQ2ZoNyk6oXHyHrZYWJ5kKqDRpAXeq0z/9U+/V
   g==;
X-CSE-ConnectionGUID: G/ufYR9FTvW19Rw9rwRZVQ==
X-CSE-MsgGUID: 8cxqvgT0SaiRPwxu9Yr/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2754612"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2754612"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 15:44:20 -0800
X-CSE-ConnectionGUID: 900j8yFLTLWxct0DKZ55+Q==
X-CSE-MsgGUID: 37pA78O3TcyiWqwHrTN5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7309584"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 15:44:18 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP77w-000000009tb-1uld;
	Thu, 05 Nov 2026 23:44:16 +0000
Date: Fri, 06 Nov 2026 00:44:00 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 26/56] error[E0425]:
 cannot find function `snd_pcm_suspend_all` in crate `bindings`
Message-ID: <202611060048.OHu58JrR-lkp@intel.com>
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
commit: 5f8a12175afdf1ad3ab75535be1efc491d89805b [26/56] ALSA: rust: add PM and runtime PM support
config: s390-randconfig-2000-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060048.OHu58JrR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060048.OHu58JrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060048.OHu58JrR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `snd_pcm_suspend_all` in crate `bindings`
   --> rust/kernel/sound/pcm.rs:748:38
   |
   748 |         to_result(unsafe { bindings::snd_pcm_suspend_all(self.as_raw()) })
   |                                      ^^^^^^^^^^^^^^^^^^^ not found in `bindings`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
