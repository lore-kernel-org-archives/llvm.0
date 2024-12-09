Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96716F288;
	Mon,  9 Dec 2024 04:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719291; cv=none; b=iAOFDefH3i1kwLU5aIPdkq79aC2OUEEvWZMQUwZzZdGJ6ucNnZfiOjvWsu2EBaxtQOaFN9zHposdHkzHExpnhTb9tuRscDWksvPN14WOxAn6Ytxnl1wTE3the8P6G9RoQmmklFodMoZ6eDNaPmizsHrXXjkoM70o+b6Ko0szcAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719291; c=relaxed/simple;
	bh=TxSI6ZUE2p7M4GO/TrO1xVQJHa+cmBsSsin7ihdDBUE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pp8v+JTz9o2qEiSVhwYL0t287PyW4liqNrXezmzUanYVHUqi/dhrCeHmyApSkZWzSVUHscfeGeOSa+WNFnxJQl1nyOaUxrH+4NnMBh3kmuuzr2Mhup1jZkG9SabsA/PvajIW5kIwuZ17leNcPi6RMLbFXk2wHflNOGs94gEBcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yex8SjhN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yex8SjhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719291; x=1765255291;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TxSI6ZUE2p7M4GO/TrO1xVQJHa+cmBsSsin7ihdDBUE=;
  b=Yex8SjhNZtH1i9o9z/WRH4kdEMCiK/kupKAL9bgMbBSwBZ0fUNpM36Ej
   wZvp0nr0Jqk/QDAlTB6/mbOjD121QslAM/eTjfAt5KMC3DEW5V/SScDmA
   KsMSTw9IBVDQ5JwuUV8MM74MNQsSboXfPJb1v6JsQogBO3svNgEij4xc/
   0EnMkPSY276fkHkp+ckNn3vvActfx+aRwBT7EG3wgnd2XyD9cD0dDyWcx
   mr1tP2HkREYROoY2yuciuy4Yb4oCFccQLTXMz992+2ch8U8tsBpn3Je/A
   G5E8x1WnhUMWxxKVwyKZmIHcTXCNdohxQ5+WeGxZrQ0+CZoPKJCl1RZwf
   g==;
X-CSE-ConnectionGUID: HZiwMqg2QD2UjxXovWyFbw==
X-CSE-MsgGUID: ERqcCt3EQG+IsfKNaeAmVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45381154"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45381154"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:41:30 -0800
X-CSE-ConnectionGUID: zKUUDGwASQ+teuToxY8EOg==
X-CSE-MsgGUID: yVKWhCZPS8GDPicItaZJsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99011296"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:41:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVaI-0003tn-1j;
	Mon, 09 Dec 2024 04:41:26 +0000
Date: Mon, 9 Dec 2024 12:41:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: .text.cdns_mrvl_xspi_setup_clock:
 unexpected end of section
Message-ID: <202412081341.t1CW02YJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: fcc22ac5baf06dd17193de44b60dbceea6461983 cleanup: Adjust scoped_guard() macros to avoid potential warning
date:   6 weeks ago
config: x86_64-randconfig-005-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081341.t1CW02YJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412081341.t1CW02YJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081341.t1CW02YJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text.cdns_mrvl_xspi_setup_clock: unexpected end of section
>> vmlinux.o: warning: objtool: .text.bmi160_setup_irq: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
