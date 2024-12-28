Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF6035958;
	Sat, 28 Dec 2024 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735375357; cv=none; b=KPUndQjSBzh6ziPdKeou+WhIrVFtRCzCo19BTVJ5CLpJH5da0XB8qn5V2lHuM7B8PVBJkJc7qWjS7BHlPMlgV/2XfZnprXDTZ+SxmVuxuPgxQq1CDeMbEgCshNjDQF0klbF6Ux1ca/AdXMNa3LyG5fAxhd1Eo/Udt8fuzv0nCuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735375357; c=relaxed/simple;
	bh=OAEwJerjvfIwGO8hU0Pdn+Bf0tPG/ptilcGqVf0RKXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lD8nmn5K6C2p99unYw96YC1grSxE2TUqiV3ATKgEeNj2UwzscEeTXrtuxrS86xtOjLnOKwCcc7MArsXwJJnT2IhgXt+aDnioE9ed2CB0S96jAm0NF2DW0m2qLMvrYtFTfYB+XQiNQBHxIzXH5zSt3Lw0IWqreZqhbZRNPCxFAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TiQQPgef; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TiQQPgef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735375355; x=1766911355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OAEwJerjvfIwGO8hU0Pdn+Bf0tPG/ptilcGqVf0RKXs=;
  b=TiQQPgefaa0INM0UzLq7brGcyHvCZD3uh0Eje4MRSFDtXoyrA4O7Tkph
   rnBZIjH02G2sUwOT4mOgurM5tmRKE4v2xbmZ1E92/4ZvrDyS53PBzN+i9
   rkusb0xrNl5AoDrDPnM3bp/MhXdDwLqi4MLEvUOoEJfx4k9ocBtiMiGTC
   JzgwRSCFe1S5AH2AujtuueTYMWBuvgcu/MOM3BZBsjcVsrnn2FxJBNxqg
   HHiD9niHsrRom0KnVW5fzdNorNJ8taeCk5vv6cfGmuPvOFK8nAfleYyMt
   KqjudrCuJNh1S9Paf/BzF9BCtzaoePF8NhpCPxn9Z4mSJemSPcxu+Yly3
   w==;
X-CSE-ConnectionGUID: 4ZmISxlcQpWIlZzIMjEbNg==
X-CSE-MsgGUID: VRthJT6MQsuSQvegq9Lang==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35463556"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35463556"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 00:42:35 -0800
X-CSE-ConnectionGUID: NiwyeTa3Qmepv8BFxLTZBQ==
X-CSE-MsgGUID: e1sV+PhsSKmqZW99UJAQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="100455440"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Dec 2024 00:42:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRSP1-0003xa-0c;
	Sat, 28 Dec 2024 08:42:31 +0000
Date: Sat, 28 Dec 2024 16:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: drivers/tty/n_hdlc.c:145: warning: Function parameter or struct
 member 'write_work' not described in 'n_hdlc'
Message-ID: <202412281640.5vqbPehh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 1ee33b1ca2b8dabfcc17198ffd049a6b55674a86 tty: n_hdlc: make n_hdlc_tty_wakeup() asynchronous
date:   3 years ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412281640.5vqbPehh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281640.5vqbPehh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281640.5vqbPehh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/n_hdlc.c:145: warning: Function parameter or struct member 'write_work' not described in 'n_hdlc'
>> drivers/tty/n_hdlc.c:145: warning: Function parameter or struct member 'tty_for_write_work' not described in 'n_hdlc'


vim +145 drivers/tty/n_hdlc.c

^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  124  
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  125  /**
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  126   * struct n_hdlc - per device instance data structure
724ac070ffc7a1 drivers/tty/n_hdlc.c  Jiri Slaby     2020-08-18  127   * @magic: magic value for structure
724ac070ffc7a1 drivers/tty/n_hdlc.c  Jiri Slaby     2020-08-18  128   * @tbusy: reentrancy flag for tx wakeup code
724ac070ffc7a1 drivers/tty/n_hdlc.c  Jiri Slaby     2020-08-18  129   * @woke_up: tx wakeup needs to be run again as it was called while @tbusy
724ac070ffc7a1 drivers/tty/n_hdlc.c  Jiri Slaby     2020-08-18  130   * @tx_buf_list: list of pending transmit frame buffers
724ac070ffc7a1 drivers/tty/n_hdlc.c  Jiri Slaby     2020-08-18  131   * @rx_buf_list: list of received frame buffers
724ac070ffc7a1 drivers/tty/n_hdlc.c  Jiri Slaby     2020-08-18  132   * @tx_free_buf_list: list unused transmit frame buffers
724ac070ffc7a1 drivers/tty/n_hdlc.c  Jiri Slaby     2020-08-18  133   * @rx_free_buf_list: list unused received frame buffers
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  134   */
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  135  struct n_hdlc {
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  136  	int			magic;
0f238298144250 drivers/tty/n_hdlc.c  Jiri Slaby     2020-02-19  137  	bool			tbusy;
0f238298144250 drivers/tty/n_hdlc.c  Jiri Slaby     2020-02-19  138  	bool			woke_up;
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  139  	struct n_hdlc_buf_list	tx_buf_list;
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  140  	struct n_hdlc_buf_list	rx_buf_list;
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  141  	struct n_hdlc_buf_list	tx_free_buf_list;
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  142  	struct n_hdlc_buf_list	rx_free_buf_list;
1ee33b1ca2b8da drivers/tty/n_hdlc.c  Tetsuo Handa   2021-12-15  143  	struct work_struct	write_work;
1ee33b1ca2b8da drivers/tty/n_hdlc.c  Tetsuo Handa   2021-12-15  144  	struct tty_struct	*tty_for_write_work;
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16 @145  };
^1da177e4c3f41 drivers/char/n_hdlc.c Linus Torvalds 2005-04-16  146  

:::::: The code at line 145 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
