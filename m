Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AE027B353;
	Tue, 28 Oct 2025 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681510; cv=none; b=rsQWOtshEKb9/H7pWZCKZkl38KXEwV9dVWF0tJZDRV7nKXOfr7uHna4wx72UEXegJn3wz5n23w0TjwI+fX1Pq03Eybk4HQLGZQEHMBX6Nsdjf/Qh5U/wTMMBWwg6sw7NhSM5LNrb9/nSVinRrbASb30TSx2BEGKAW2AbwtbMmok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681510; c=relaxed/simple;
	bh=wMMvTntSgwNfuuvOMiIJxo0J5BFFIBbRy6fxr1t8h+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rrEqaQexg9rm+jDfHIGMs5a0PSuSzURFibxd+0b/tvOFI974zB3bvbPXoiti4uL0H7rblrB+r009fC1DsWCisThj66xB1atIrb7sYduBuqEtoAiYtvHHO90wXknNJcmwJZsfiPE/SmzoS9YbJzncUb62yP4x6ijax/6yinvXnT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRqnRwCl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRqnRwCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761681509; x=1793217509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMMvTntSgwNfuuvOMiIJxo0J5BFFIBbRy6fxr1t8h+8=;
  b=CRqnRwClS4v0O4BXoZ5FJB8z8FNycAcMakU3KK0SEY8Dl5eXYR8ccn8M
   iw0h+0nREhuxzWgKOqOcm+iGL2L+L4fmM4KVKK95gPoUa8KvI+aMx5qYt
   6nPWLiJFfwkvQyyuMQokr1gv7RrXOZPeBOwQ08oSHNPIKvsNq+0iEtjiK
   810c42dJgE5O/2seBRvpF6BZ8E4iv+rx1jC5yh7DtcNwPZSfjqgwUCR7g
   MRrr0UN11pzMRXMdcNSqF4VVCwfZfhbzqRgSoFYdW6kvTJptmQ9ERG6US
   xWg8YAqUZNXLKVCf/NpC2rOcDOyXadEcoVEb7IJ86Vin75w+YBbxS9bQd
   g==;
X-CSE-ConnectionGUID: 8Yv9uwdZSOes9boHbyBeWA==
X-CSE-MsgGUID: szLIfwl8Rf+vh9iOecsQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62823411"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="62823411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:58:28 -0700
X-CSE-ConnectionGUID: t5ff9eSnSY655swxwGUx1A==
X-CSE-MsgGUID: WG/snN3TSm+qqXTmmqMDsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="216102580"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2025 12:58:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDppj-000Jhf-0H;
	Tue, 28 Oct 2025 19:58:20 +0000
Date: Wed, 29 Oct 2025 03:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [linux-next:master 1638/4391] Warning:
 drivers/gpio/gpio-mm-lantiq.c:90 function parameter 'chip' not described in
 'ltq_mm_save_regs'
Message-ID: <202510290348.IpSNHCxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7d2388eeec24966fc4d5cf32d706f0514f29ac5
commit: 8d0d46da40c878d082b92771355faba8036aecc7 [1638/4391] gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header from GPIO driver
config: mips-xway_defconfig (https://download.01.org/0day-ci/archive/20251029/202510290348.IpSNHCxr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290348.IpSNHCxr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290348.IpSNHCxr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpio/gpio-mm-lantiq.c:60 function parameter 'offset' not described in 'ltq_mm_set'
   Warning: drivers/gpio/gpio-mm-lantiq.c:60 function parameter 'value' not described in 'ltq_mm_set'
   Warning: drivers/gpio/gpio-mm-lantiq.c:81 function parameter 'offset' not described in 'ltq_mm_dir_out'
   Warning: drivers/gpio/gpio-mm-lantiq.c:81 function parameter 'value' not described in 'ltq_mm_dir_out'
>> Warning: drivers/gpio/gpio-mm-lantiq.c:90 function parameter 'chip' not described in 'ltq_mm_save_regs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
