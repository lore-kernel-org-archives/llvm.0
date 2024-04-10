Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67E7180A7F;
	Wed, 10 Apr 2024 19:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776228; cv=none; b=TO/BW8Ksp/xyYf0bzdpS2hvYG1djp6ZgzWaLB8snxI6toOAfD0UnfHlcU0x5uTIG59h1Dco8AA2nAnD7Nuhryte2FWaM15AmntpztLmmmRkUrplzz5k2IO5EX/h84srTlWg891MyEq1M9SW8WxNOQNQcMnk8rVzT+eEQwmA1dhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776228; c=relaxed/simple;
	bh=12Zq7/YbPuriOTTBuu7dsjEtzonBgPCmxNIN1io6ugo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CotdnQZWgrETJO2wuTyzRviTmqQDkzBzhVVh3Q70xyieD3WaLTLdcPStAQj5xlbKQqDXQBQylFfUIqPYiW50do2pH36Fl5XKBHz/IjLvjQQ28LG+mMQrD2C0WeXVjHjbzkdtSx7jrAkNLT6+qnXXNHqKlqkX5QPRFoY9N0EVnSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjrtuJ2H; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjrtuJ2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712776227; x=1744312227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=12Zq7/YbPuriOTTBuu7dsjEtzonBgPCmxNIN1io6ugo=;
  b=kjrtuJ2HnlEEnoKpS/h95kDvtjB2x+WgqFd4GW4No6a0hiJylpdA0Hvp
   FSB9F4OfWe75cNpaYz+pfykhQSWwToNdNSdZGaX9Jtz8yu88zHe3TahSP
   Xp8cGKiDU5yAISRCi2aMqgz2QY9aN8GmpZpKO+QZuC+4XOf1gxg8zzM6R
   DqngkbUrdeYIigcS5oT3NwvIR3Vab63llH7W6ZW4TxMTDWDIgkZKtf2Wm
   jXQJuQVSSkBWDHwB2x3b2XddNixjcvzJv/Ub7CXNb3BQFeeFfEsiFQQCy
   yc5CjO7Cl7PY7leMQ5E9YkI31U7HQWF7WFMlFVObKDwzcBLoWlCKg/0tT
   A==;
X-CSE-ConnectionGUID: eSkKJyu7RmavOmRuHQ9zOA==
X-CSE-MsgGUID: hBYB80blQYyP6gpCLPtOlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18873163"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="18873163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 12:10:26 -0700
X-CSE-ConnectionGUID: YrEGZoP7QBqdAhtzQKi20g==
X-CSE-MsgGUID: LbL6BXMhR/uf9ngEu/zRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="20719421"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2024 12:10:24 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rudKw-0007iI-2P;
	Wed, 10 Apr 2024 19:10:22 +0000
Date: Thu, 11 Apr 2024 03:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 16/24]
 arch/x86/um/../kernel/module.c:194:3: error: call to undeclared function
 'text_poke_sync'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202404110328.KCxmzIGY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   13d2b8d66a446feea7be64ed52c5e4c7204b0852
commit: 296dbfcae865d60710448a9ffdde1300da93cc77 [16/24] asm-generic: introduce text-patching.h
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240411/202404110328.KCxmzIGY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110328.KCxmzIGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110328.KCxmzIGY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/um/../kernel/module.c:186:11: error: use of undeclared identifier 'text_poke'; did you mean 'next_zone'?
                   write = text_poke;
                           ^~~~~~~~~
                           next_zone
   include/linux/mmzone.h:1573:21: note: 'next_zone' declared here
   extern struct zone *next_zone(struct zone *zone);
                       ^
>> arch/x86/um/../kernel/module.c:194:3: error: call to undeclared function 'text_poke_sync'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   text_poke_sync();
                   ^
   2 errors generated.


vim +/text_poke_sync +194 arch/x86/um/../kernel/module.c

88fc078a7a8f67e Peter Zijlstra 2020-04-29  173  
0c05e7bd2d017a3 Song Liu       2023-01-25  174  static int write_relocate_add(Elf64_Shdr *sechdrs,
88fc078a7a8f67e Peter Zijlstra 2020-04-29  175  			      const char *strtab,
88fc078a7a8f67e Peter Zijlstra 2020-04-29  176  			      unsigned int symindex,
88fc078a7a8f67e Peter Zijlstra 2020-04-29  177  			      unsigned int relsec,
0c05e7bd2d017a3 Song Liu       2023-01-25  178  			      struct module *me,
0c05e7bd2d017a3 Song Liu       2023-01-25  179  			      bool apply)
88fc078a7a8f67e Peter Zijlstra 2020-04-29  180  {
88fc078a7a8f67e Peter Zijlstra 2020-04-29  181  	int ret;
88fc078a7a8f67e Peter Zijlstra 2020-04-29  182  	bool early = me->state == MODULE_STATE_UNFORMED;
88fc078a7a8f67e Peter Zijlstra 2020-04-29  183  	void *(*write)(void *, const void *, size_t) = memcpy;
88fc078a7a8f67e Peter Zijlstra 2020-04-29  184  
5b384f933590a08 Josh Poimboeuf 2020-04-29  185  	if (!early) {
88fc078a7a8f67e Peter Zijlstra 2020-04-29  186  		write = text_poke;
5b384f933590a08 Josh Poimboeuf 2020-04-29  187  		mutex_lock(&text_mutex);
5b384f933590a08 Josh Poimboeuf 2020-04-29  188  	}
88fc078a7a8f67e Peter Zijlstra 2020-04-29  189  
0c05e7bd2d017a3 Song Liu       2023-01-25  190  	ret = __write_relocate_add(sechdrs, strtab, symindex, relsec, me,
0c05e7bd2d017a3 Song Liu       2023-01-25  191  				   write, apply);
88fc078a7a8f67e Peter Zijlstra 2020-04-29  192  
5b384f933590a08 Josh Poimboeuf 2020-04-29  193  	if (!early) {
88fc078a7a8f67e Peter Zijlstra 2020-04-29 @194  		text_poke_sync();
5b384f933590a08 Josh Poimboeuf 2020-04-29  195  		mutex_unlock(&text_mutex);
5b384f933590a08 Josh Poimboeuf 2020-04-29  196  	}
88fc078a7a8f67e Peter Zijlstra 2020-04-29  197  
88fc078a7a8f67e Peter Zijlstra 2020-04-29  198  	return ret;
88fc078a7a8f67e Peter Zijlstra 2020-04-29  199  }
88fc078a7a8f67e Peter Zijlstra 2020-04-29  200  

:::::: The code at line 194 was first introduced by commit
:::::: 88fc078a7a8f67e47020d73d8d14ed11f03754ab x86/module: Use text_poke() for late relocations

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
