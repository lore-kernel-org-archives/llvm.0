Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E181266B67;
	Fri, 22 Aug 2025 05:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755839270; cv=none; b=AG7muVb07HCqQwBD1I9MjPfF7AuO/dwaL+hqk71H0cRqR8SXo6o7jdnLZ+tGOYMF1TL5b0M+GtnWYpmFJ8T028xYqV26tPbislf61V5BKeyxC8MLxpkO1XZIBA4IKfuVs9Or/p7ess9puNSaKV4l9d2keOS89+VTxiaAXGo/NBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755839270; c=relaxed/simple;
	bh=i2yzbZqDm9I+AmlF53Gv4YsdPzigV+oS0jvaGn4Sk38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZD05r+n58S2DI+QwvOHyBqJ+eZJqKFm9nadzsGyxc/8OiCfS1BoUsBYRjKd0GpKJj9Rxm2/DaPHSCXhVK41p+Vie3NP/CvgPuLPLTkeOcVdL3YTr1lMxBlU9c0442wwZ2lFoQ4+GPQZv0xjdrHgIZufmIwvyRYRr9p5YNWhZ5Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBiHhnvr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBiHhnvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755839269; x=1787375269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2yzbZqDm9I+AmlF53Gv4YsdPzigV+oS0jvaGn4Sk38=;
  b=FBiHhnvr52ti20edta9ZYT8wbLqj2a6eKOxOXGHsQ4509b2bREWAq0g7
   AgxMB1BiCRd23X95FpGN49q+SaS8d6uZqwvG39d9h9F/zuNLW8vLrPd29
   9ayQVIVYv5uoMRzUnJ6S1jOtizMXqNnhoFkeqAUhyZhKszZhOY1OxwgHw
   0HKU1oDBjOfht8KB0q6fTMj1phAM7EkdLmvk4HS7mXZywX17HKozhXJeN
   jbfwgydDH02FpP3FavSrKUq3+b5i3d1O8anIuuIjzsQE5FDUTrLk6HwyE
   pSH2MPUDLvaWX+aI9mjB1GQCjma3Ptk5taSgxeFwTmN+/9Y8EFRr5QlAU
   w==;
X-CSE-ConnectionGUID: 6eTr0lQTQOeD4SvzI4sQQg==
X-CSE-MsgGUID: NqIXXmApTHKsjQA6/16lrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69512712"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69512712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 22:07:49 -0700
X-CSE-ConnectionGUID: iJrHRR4PSlOb4tZBNfPkMg==
X-CSE-MsgGUID: XTwRAvRpRPaBz35vcQTsrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="192278885"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 22:07:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upJzo-000KwB-2v;
	Fri, 22 Aug 2025 05:07:30 +0000
Date: Fri, 22 Aug 2025 13:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 14/48] drivers/char/mwave/smapi.c:119:25: error:
 unknown type name 'SMAPI_DSP_SETTINGS'
Message-ID: <202508221234.kaAvoHbe-lkp@intel.com>
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
commit: ab9741df5941a43ffaa548a45bbd4aa35db0cbe6 [14/48] mwave: drop typedefs
config: x86_64-buildonly-randconfig-003-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221234.kaAvoHbe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221234.kaAvoHbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221234.kaAvoHbe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/mwave/smapi.c:119:25: error: unknown type name 'SMAPI_DSP_SETTINGS'
     119 | int smapi_query_DSP_cfg(SMAPI_DSP_SETTINGS * pSettings)
         |                         ^
   1 error generated.


vim +/SMAPI_DSP_SETTINGS +119 drivers/char/mwave/smapi.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  117  
^1da177e4c3f41 Linus Torvalds    2005-04-16  118  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @119  int smapi_query_DSP_cfg(SMAPI_DSP_SETTINGS * pSettings)
^1da177e4c3f41 Linus Torvalds    2005-04-16  120  {
7ca78630a1ae08 Colin Ian King    2020-06-11  121  	int bRC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  122  	unsigned short usAX, usBX, usCX, usDX, usDI, usSI;
caa97be1a2052f Colin Ian King    2017-07-10  123  	static const unsigned short ausDspBases[] = {
caa97be1a2052f Colin Ian King    2017-07-10  124  		0x0030, 0x4E30, 0x8E30, 0xCE30,
caa97be1a2052f Colin Ian King    2017-07-10  125  		0x0130, 0x0350, 0x0070, 0x0DB0 };
caa97be1a2052f Colin Ian King    2017-07-10  126  	static const unsigned short ausUartBases[] = {
caa97be1a2052f Colin Ian King    2017-07-10  127  		0x03F8, 0x02F8, 0x03E8, 0x02E8 };
^1da177e4c3f41 Linus Torvalds    2005-04-16  128  
^1da177e4c3f41 Linus Torvalds    2005-04-16  129  	bRC = smapi_request(0x1802, 0x0000, 0, 0,
^1da177e4c3f41 Linus Torvalds    2005-04-16  130  		&usAX, &usBX, &usCX, &usDX, &usDI, &usSI);
^1da177e4c3f41 Linus Torvalds    2005-04-16  131  	if (bRC) {
96468c7796f1be Jiri Slaby (SUSE  2025-08-20  132) 		pr_err("%s: Error: Could not get DSP Settings. Aborting.\n", __func__);
^1da177e4c3f41 Linus Torvalds    2005-04-16  133  		return bRC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  134  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  135  
^1da177e4c3f41 Linus Torvalds    2005-04-16  136  	pSettings->bDSPPresent = ((usBX & 0x0100) != 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  137  	pSettings->bDSPEnabled = ((usCX & 0x0001) != 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  138  	pSettings->usDspIRQ = usSI & 0x00FF;
^1da177e4c3f41 Linus Torvalds    2005-04-16  139  	pSettings->usDspDMA = (usSI & 0xFF00) >> 8;
caa97be1a2052f Colin Ian King    2017-07-10  140  	if ((usDI & 0x00FF) < ARRAY_SIZE(ausDspBases)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  141  		pSettings->usDspBaseIO = ausDspBases[usDI & 0x00FF];
^1da177e4c3f41 Linus Torvalds    2005-04-16  142  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  143  		pSettings->usDspBaseIO = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  144  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  145  
^1da177e4c3f41 Linus Torvalds    2005-04-16  146  	/* check for illegal values */
^1da177e4c3f41 Linus Torvalds    2005-04-16  147  	if ( pSettings->usDspBaseIO == 0 ) 
96468c7796f1be Jiri Slaby (SUSE  2025-08-20  148) 		pr_err("%s: Worry: DSP base I/O address is 0\n", __func__);
^1da177e4c3f41 Linus Torvalds    2005-04-16  149  	if ( pSettings->usDspIRQ == 0 )
96468c7796f1be Jiri Slaby (SUSE  2025-08-20  150) 		pr_err("%s: Worry: DSP IRQ line is 0\n", __func__);
^1da177e4c3f41 Linus Torvalds    2005-04-16  151  
^1da177e4c3f41 Linus Torvalds    2005-04-16  152  	bRC = smapi_request(0x1804, 0x0000, 0, 0,
^1da177e4c3f41 Linus Torvalds    2005-04-16  153  	   	&usAX, &usBX, &usCX, &usDX, &usDI, &usSI);
^1da177e4c3f41 Linus Torvalds    2005-04-16  154  	if (bRC) {
96468c7796f1be Jiri Slaby (SUSE  2025-08-20  155) 		pr_err("%s: Error: Could not get DSP modem settings. Aborting.\n", __func__);
^1da177e4c3f41 Linus Torvalds    2005-04-16  156  		return bRC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  157  	} 
^1da177e4c3f41 Linus Torvalds    2005-04-16  158  
^1da177e4c3f41 Linus Torvalds    2005-04-16  159  	pSettings->bModemEnabled = ((usCX & 0x0001) != 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  160  	pSettings->usUartIRQ = usSI & 0x000F;
caa97be1a2052f Colin Ian King    2017-07-10  161  	if (((usSI & 0xFF00) >> 8) < ARRAY_SIZE(ausUartBases)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  162  		pSettings->usUartBaseIO = ausUartBases[(usSI & 0xFF00) >> 8];
^1da177e4c3f41 Linus Torvalds    2005-04-16  163  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  164  		pSettings->usUartBaseIO = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  165  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  166  
^1da177e4c3f41 Linus Torvalds    2005-04-16  167  	/* check for illegal values */
^1da177e4c3f41 Linus Torvalds    2005-04-16  168  	if ( pSettings->usUartBaseIO == 0 ) 
96468c7796f1be Jiri Slaby (SUSE  2025-08-20  169) 		pr_err("%s: Worry: UART base I/O address is 0\n", __func__);
^1da177e4c3f41 Linus Torvalds    2005-04-16  170  	if ( pSettings->usUartIRQ == 0 )
96468c7796f1be Jiri Slaby (SUSE  2025-08-20  171) 		pr_err("%s: Worry: UART IRQ line is 0\n", __func__);
^1da177e4c3f41 Linus Torvalds    2005-04-16  172  
^1da177e4c3f41 Linus Torvalds    2005-04-16  173  	return bRC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  174  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  175  

:::::: The code at line 119 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
