Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270950;
	b=3vzUj51xOPSJe50MrUm4v0yYM+DuMTBGLznaaOxPiBvvhwwgdfC4fK2plTFxhGOJZzIW
	 4hRzj5dN/kNyUAonX7Hb3x8xX4cE3PTblJM2DaUYCjL1RcZZgEz0YboHCB+okPGhC8IiW
	 bISdigK543QujQAItlMRenxn1Ug5GrmvBYLnPHiJwEDpo2YuNzrMd3hAstGD4u9KPSDq4
	 AvRV1Rl8ixAhQeSef8a2d3ZnP1tmmhxztY8n6Fh/glr56gnJoAdtAgGlBQZSZY2PHj7L6
	 3EmxJG3UR+faKTYO4v+o119ayY9Ef4lenl/WtRfKZXcbGAI86p8AnxC0XaINPvAvb+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RzaPKKTQ4GfN6XWXG4guu0bvp3Gq2v35OinNt0l3gdg=;
	b=zt9h2U/eqIza3L3l6MiQXVKVkpMOBYzWfZuX0KI6UHAACKVkoMM1q9j8blGcNkO08xCa
	 ueU/ryA8Mu+2ytShpL1IBw+D1wiY5P2M5UHG7NvUCmibXnifAR5WNHDUR+jsrViiPkbpp
	 HKjarJenW5doAhojpKjsw+eMpYaAVzu7cMl7nMEZXSeZ0rO/oC0GKn+b/nTvYHyvMFIX2
	 6cRBUiePgmaanZP780qjHVfcO0jE4/iqgm7bT5isjKPAFOJdqEuBb3j1LC3BxIr2VBhN/
	 9CZBz7rF90j31klxWbg51LvdisPHHwptcrpVxxb1jVlT5f9oPd/YukhbnkPWfpberKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iGlTF+xt;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB1606A32A;
	Tue, 10 Nov 2026 00:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEB1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iGlTF+xt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794270950; x=1825806950;
  h=date:from:to:cc:subject:message-id;
  bh=sviIG1Ms3Yp0ufXaWmm9Ai5bse44yHnD41WOiAfwvg0=;
  b=iGlTF+xt+KgU64s+2MsLgrRaMcUW41HhhS91nJAAZaM08LcHG1nKl2zV
   sWoescV07JipmxSorm0h5t5DV+cee/dNrnK9pv+n15NULq85FL5lkelV2
   FnLVGh85BjG0XfuvBgaJJTJxq8ed2zIoAL8Jw5R3th47+rinYNY8Z0SvL
   YvcvdoH851tladhnuluPbm/qM8vLA8r0POiWVZJ3jfQDxvxOojEM8dRdN
   m4/UDVIfyA63xw2Hm3nsQdHt7HXEcVHbWUmv0Se/XQRB7hqw6Xn5UuWJ/
   gVnCC6C1AkL37UXlt/kIcx3Xzt8hXdviGn1n0pZGIXBKofSV/t/uDz5W3
   g==;
X-CSE-ConnectionGUID: bSfY162jT3S665cSUYmVdA==
X-CSE-MsgGUID: a1/kiVLzQY6g8zuRELSa4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2899938"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2899938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 16:35:49 -0800
X-CSE-ConnectionGUID: slwZEnQLTjyQ6+BE7UahWg==
X-CSE-MsgGUID: /HZh+E9lSR6vEUWm+USvPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8140982"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Nov 2026 16:35:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQZpy-00000000vdZ-0EwJ;
	Tue, 10 Nov 2026 00:35:46 +0000
Date: Tue, 10 Nov 2026 08:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [superm1:superm1/s4-at-s5 3/3] kernel/reboot.c:73:13:
 warning: variable 'shutdown_legacy' set but not used
Message-ID: <202611100819.4dLGt0dr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/s4-at-s5
head:   8dd92ed84c02d78694d091fcc20a976f096bb27e
commit: 8dd92ed84c02d78694d091fcc20a976f096bb27e [3/3] PM: Add shutdown=legacy command line option
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261110/202611100819.4dLGt0dr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100819.4dLGt0dr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100819.4dLGt0dr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/reboot.c:73:13: warning: variable 'shutdown_legacy' set but not used [-Wunused-but-set-global]
      73 | static bool shutdown_legacy;
         |             ^
   1 warning generated.


vim +/shutdown_legacy +73 kernel/reboot.c

    65	
    66	/*
    67	 * This variable is used to indicate if a halt was initiated instead of a
    68	 * reboot when the reboot call was invoked with LINUX_REBOOT_CMD_POWER_OFF, but
    69	 * the system cannot be powered off. This allowes kernel_halt() to notify users
    70	 * of that.
    71	 */
    72	static bool poweroff_fallback_to_halt;
  > 73	static bool shutdown_legacy;
    74	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
