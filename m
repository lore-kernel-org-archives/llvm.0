Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9398936A03B;
	Tue, 30 Jun 2026 01:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782783282; cv=none; b=cEMj2z3po8+PDxcYCwHgF6N0n1cmRcuIz8Nh7R2uODh5VB4aLjcD1Tn8MwSKasVjbl5pmUN5KLl6KvTFHjmgNtNa45hLqOqWJ30tGKHxrj1PikSqoSkb1kYAUAocFBap4OTRlaEcLzHraDFTk81XQDhncXMpSAWoEa5eKCL4Tf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782783282; c=relaxed/simple;
	bh=uUX69cllilBLvsllLW6uqTgruI1b0utQ3XfYTYh2crA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qyHm+yBuyjjCnQq5CHUpVbpTX++dsUa0+fyV+pMxCtEgYRuzx/qadDvivRPHlLdtlt19aY5Ehpp0Zbl0+v9w2LoK7iZFhDz62FdMTyt2dNej4YHO8WzjC+8cCzvXSVYr/Z/MXOldBVyE2u/TXo8HE40ZuC8cC+z1n2v2wG7ccj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEGrtQDK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEGrtQDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782783276; x=1814319276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uUX69cllilBLvsllLW6uqTgruI1b0utQ3XfYTYh2crA=;
  b=lEGrtQDK4bos5/VEfn3YHkbnhoiD8klNWZSAx8bG+iXW686UCXSsxoPF
   EDBnIQeHBDOuDiR2aYahTF9jEMC3yY9yfhNxzR9qRPlsUOOR0m8kjwRAC
   bWncnMJmf+ny7x8X9+qjJt/pFNDr57oCN//XXcU8cHPs5qvbUsWUady8s
   AgNxSntRysWxr+V8giynXRfkLWfZr0U0cUl2zi5A/uM6ZRch7MrkSXEqW
   6dyuIgSxWTPHJMY1Z+l1La2SE2CtI+AjDsgu2n7N9Q1syqOX+pJZiS1Io
   13SpF7Jc7Kdh/rcD3unUc6999cdjGwxif5wxatpOcY8tQ28rckFjTLexH
   Q==;
X-CSE-ConnectionGUID: 6cuFMzcGQ9Ke7mnxsYazzw==
X-CSE-MsgGUID: EsSXr2YiRWyCn5vJDCq//A==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94871290"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="94871290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 18:34:34 -0700
X-CSE-ConnectionGUID: ynI0SXufSrGNoombHe+9iw==
X-CSE-MsgGUID: VwN5T+88RfCeFaSLd6eU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="290241371"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Jun 2026 18:34:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weNMs-000000007v3-1XQz;
	Tue, 30 Jun 2026 01:34:30 +0000
Date: Tue, 30 Jun 2026 09:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-arch-clockmodes 8/9]
 arch/loongarch/kernel/time.c:216:45: error: unexpected ';' before '}'
Message-ID: <202606300910.k9oX8NNw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-arch-clockmodes
head:   eff49b51a77d9c6c1fc86147e587f0305e9f0236
commit: 422d4770226b98d9c78b4bd420adc8bd86b0d450 [8/9] LoongArch: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260630/202606300910.k9oX8NNw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300910.k9oX8NNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300910.k9oX8NNw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/time.c:216:45: error: unexpected ';' before '}'
     216 |                                 VDSO_CLOCKMODE_CPU : VDSO_CLOCKMODE_NONE;
         |                                                                         ^
   1 error generated.


vim +216 arch/loongarch/kernel/time.c

   208	
   209	static struct clocksource clocksource_const = {
   210		.name = "Constant",
   211		.rating = 400,
   212		.read = read_const_counter,
   213		.mask = CLOCKSOURCE_MASK(64),
   214		.flags = CLOCK_SOURCE_IS_CONTINUOUS,
   215		.vdso_clock_mode = IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) ?
 > 216					VDSO_CLOCKMODE_CPU : VDSO_CLOCKMODE_NONE;
   217	};
   218	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
