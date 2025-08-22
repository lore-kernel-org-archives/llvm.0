Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7920821256B;
	Fri, 22 Aug 2025 04:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755835968; cv=none; b=EgvuUV+j1ojRsro68DdOyUtdRLkS7vdobMqx/WdOLj5qpUzvDlpXRB5ptyJ2adJAKNE+lZx2uFL2oobs/+x2pWox9xQvG65JPHeFVKQxdhfan+WYjJdV1ZmeYH2OcIPTw/w6uVNavMZYcMhxc8NrOWfH0+TFfcrlNl45h6FeT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755835968; c=relaxed/simple;
	bh=DAyR4m4HN8T8yeQtB4ORGmpQ4lB4ogbo2hNGA1KkAw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j1phjqcAG6YM58PwDz6IQ6V0ArSQ6VyLI5Gic+pU6CLKO6pAU11HxWuwQnnSB0e9M5ECcC61vR9shbR+2tWidXWt/P2lYI/dCbGrj5ugP2MeyInxhA0JHfd77wYfqJck3yICaaQwszxxNUoGo87VyDE5ZrMFV9nSU7P1WrCUmo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ko/W5LeN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ko/W5LeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755835967; x=1787371967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DAyR4m4HN8T8yeQtB4ORGmpQ4lB4ogbo2hNGA1KkAw4=;
  b=ko/W5LeNlKlkyC1gg+0kOf1dV84EIR2aTqR7QzOmGdQ8ihbPkuk2Dx5B
   oyRzYyuRu34BvtJg2JLrWgE98qesnWPskc9I4mLyzzxfKuZ2fn2wZsST2
   7ad1U+x6fruUtVoKphWT8A2kRHCpS1ds3sOOrNvgzqDFMr5+hsrbuGOFJ
   ZjgkKaOE0GrKoJGa+uJ+RSxyOETXaYT51tnx5xvy07QKbFmC2yZt/hetH
   TUc0zf+spKmnsLxx0hgN4FPK6AoZzp+3I17DAmKi57q8UkH3xU2jkwQ5F
   NxSfHhOi0j6ey8tWJRgwIoTa2uJNEulLoBPWHn5Spq7XnVwodMKIXvXIn
   g==;
X-CSE-ConnectionGUID: AMwMeZFISbGLGBJCBT+rgg==
X-CSE-MsgGUID: bk1IvWrrSIGVCqzyp/enCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69577631"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69577631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 21:12:46 -0700
X-CSE-ConnectionGUID: f/t17z/ISWie5y/Oc28GBA==
X-CSE-MsgGUID: IGOYKVXcRCqt0DuxCM9sQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168956369"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2025 21:12:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upJ7L-000Ktv-1d;
	Fri, 22 Aug 2025 04:11:25 +0000
Date: Fri, 22 Aug 2025 12:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 12/48] drivers/char/mwave/3780i.c:516:17: warning:
 variable 'temp' set but not used
Message-ID: <202508221222.Tc0teO71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   0926f0595441527a1b067314368d6b4afd949a09
commit: b2c762cc6cdcc18426a8a17cb0c6d7f765a869f0 [12/48] mwave: remove tracing
config: x86_64-buildonly-randconfig-003-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221222.Tc0teO71-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221222.Tc0teO71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221222.Tc0teO71-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/mwave/3780i.c:516:17: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
     516 |         unsigned short temp;
         |                        ^
   1 warning generated.


vim +/temp +516 drivers/char/mwave/3780i.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  509  
^1da177e4c3f41 Linus Torvalds  2005-04-16  510  
^1da177e4c3f41 Linus Torvalds  2005-04-16  511  int dsp3780I_GetIPCSource(unsigned short usDspBaseIO,
^1da177e4c3f41 Linus Torvalds  2005-04-16  512                            unsigned short *pusIPCSource)
^1da177e4c3f41 Linus Torvalds  2005-04-16  513  {
ae6b95d4d86565 Alexey Dobriyan 2007-02-20  514  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds  2005-04-16  515  	DSP_HBRIDGE_CONTROL rHBridgeControl;
^1da177e4c3f41 Linus Torvalds  2005-04-16 @516  	unsigned short temp;

:::::: The code at line 516 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
