Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3061E517;
	Wed, 22 Jan 2025 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737508802; cv=none; b=m28R/7pSWsGlkfS24FURVzeLipwX4JGLuwUuXfabTJTBaCMQNXr8B6yMLlvZKGnR21SPqlNxTAIEqLS7lyIIW/guARTKw1Hi6ia/49QSYf5iPCt1j6Pd/SgvZCttON5ZQPKftDTRpvcdZOYWmMtDDRTtohQZTx65fArNv/3GGkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737508802; c=relaxed/simple;
	bh=iouE1wI6zITHL6xCq/YRZTXhAJ1PL4up/SSriXdXEZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ips0lSwKZpk7mCVGcqNqcYuYtu/ftpl9u05BKqxBM9+368JyNOX63U7jGgx+0ZyCTNS5VwK1h+wUnIvJWkV/K/UaXbehNfUCoOR19JNesFbbECvIM8v00FXFgnWhoI+GZ0unRvuzz1ie+DG2OOhD3OLxpTI1m680OZUwqAi9boI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjPGdtuP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjPGdtuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737508800; x=1769044800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iouE1wI6zITHL6xCq/YRZTXhAJ1PL4up/SSriXdXEZ8=;
  b=FjPGdtuP50mZRMYBImUPukiOAPFlsoA2u4oJvC9xtKE41rApWt8v8aPn
   BD9VsjNlD6UpCAvgOG0HGZPlbGEzAfbVA6MjQI95R5z6N5wFUr+JyyY8g
   LazdP97IHMCxMKT1JNk+YKk2z/9fFky8dyN6zxnh9mwQa1raqvMbNAjQQ
   4inLMBH7Nb7LvFMnm9Nu64U6Y7YFWFmYY73TCE2uOAAsovKjzuglMqrym
   LCF7CoF39HtHutmq3cWy1sO503LPM5flcM3gsqJIop2Uu7EyMsypET7TZ
   NHqVeevQhb63/WKTlXRS67wqBN0COqV8fdppAHaz/auwLNHCHUyXvFORh
   Q==;
X-CSE-ConnectionGUID: V7JaMfzCQWGaH1m7yhp35A==
X-CSE-MsgGUID: rYRyxBocT+2hnwmAWJwoMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38102569"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="38102569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:20:00 -0800
X-CSE-ConnectionGUID: DopA/NsnQLqOFkXSAoYXww==
X-CSE-MsgGUID: 9LIQssl0TUiH2KdBLGztug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="106801262"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2025 17:19:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taPPQ-000ZF7-0m;
	Wed, 22 Jan 2025 01:19:56 +0000
Date: Wed, 22 Jan 2025 09:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-dangling-jump-table 1/1] vmlinux.o: warning:
 objtool: .text.epat_read_block: unexpected end of section
Message-ID: <202501220959.e11E0ghq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-dangling-jump-table
head:   ee25c0b7e80113e950bd1d4c208b671d35774ff4
commit: ee25c0b7e80113e950bd1d4c208b671d35774ff4 [1/1] objtool: Ignore dangling jump table entries
config: x86_64-randconfig-003-20250121 (https://download.01.org/0day-ci/archive/20250122/202501220959.e11E0ghq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220959.e11E0ghq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220959.e11E0ghq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0e33: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0ea3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0ec4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0ecf: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0ee8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0ef6: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0f0c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0f22: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0f2d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc0f46: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc100f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1064: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc108b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1097: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc10a2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc11d6: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1205: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1213: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc121e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1234: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc124a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1276: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc128c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1297: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc130e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1383: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc13a4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc13af: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc13ba: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc13c5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc13f1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1412: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc142f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1445: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1493: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc14e7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc150d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1523: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc154d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1582: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc158d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc15a6: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc15e8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc15f3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1602: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1612: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc17a1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc17b7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc17d4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1819: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc185b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc188d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1b6a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1b75: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1bb7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1bf9: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1c3b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1d12: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1d75: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1e47: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1e52: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1e6a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1e80: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1e96: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1eac: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1ec2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1ecd: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1ed8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1ee3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1f0f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1f30: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1f3b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1f7d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1f88: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1f9e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc1fd3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2002: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc202a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2040: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc206a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc207c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc20c5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc23ab: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc23d7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc243d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2459: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc24bf: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2501: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc251a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2528: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2575: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc25b7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc260b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc262c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2637: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc264d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2663: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc266e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc26b3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc26e3: redundant UACCESS disable
>> vmlinux.o: warning: objtool: .text.epat_read_block: unexpected end of section
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc26ef: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2715: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2720: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2780: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc278c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc27b3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc27c2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc27e8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc27f3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc27fe: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc282a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2856: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc286c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc28b1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc28bc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2914: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2931: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc295d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc29a3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc29ae: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc29c7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc29d2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc29e8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc29f4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc29ff: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2a42: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2a4d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2a63: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2abc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2ae6: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2afc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2b12: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2b1d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2b33: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2b54: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2b60: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2b8f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2bd2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2be4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2c0f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2c3f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2c4b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2c9a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2ca5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2cbb: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2ccd: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2cf1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2cfc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2da4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2dba: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2dc5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2dd7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2dfe: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2e8a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2e95: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2ebc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2eca: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2ef1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2eff: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2f0a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2f18: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2f23: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2f2e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2f47: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2f55: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2f6b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2f81: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2fbd: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2fd6: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc2fef: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3012: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc30fc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc310a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3115: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3120: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc312b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc314f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3165: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3170: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc317e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3194: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc319f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc31aa: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3208: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc325c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc331e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc33d4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc33ea: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3400: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc342c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc347f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc348e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc34af: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc34ba: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc34c5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc34d0: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3507: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc351d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3528: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc3544: redundant UACCESS disable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
