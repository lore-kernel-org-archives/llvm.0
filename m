Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461935;
	b=rB4lYO+fx3vE2g2I/lFW+EkzUsDYwlCO8O2mAtn8jC1H46x5dtU+g318E7peF97aj3zm
	 T3iD1G51Do6k4GXhsqkQtnv9TOj6SJR8HFwRKp9HhT35sFm3Q8a0J/9xMNJZP9QQ+Y4Nb
	 E8xb16C3W2lGMRdt/77G9uwuS1y4ccd9KUAQOFLBGcQMUTW9M2EBF9dmn4HAgoYB7n5uY
	 skNwZIdwuzRP3WIXoaBGsvIh6sOxAW6K/QAohGTGjwTPm05lSFvWIUoubTcwsKNXkEHOH
	 mky8YzaRasxCqDGBmSgtIRZTFkrXVk/kh0KbI3+derWNEieim+sDi+f4g8qpS12UYpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461935;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xnJZ15KS4TYJMaU1eDR9zd5vS9ipPVJHhMtBkp123IM=;
	b=cNTcyKrpdVn7mv8XpPyLDdiEk2InxTdy9q+FvZqugFWLbwQt2XP0raYNv3Oi00co2yVS
	 g470ZfJvqV75ojWPysisqEWgeS3mcO2OCvCwFyiTpLZJ/XWxjRZS8uYew9Eu34M2ghFA3
	 z4bnJHyR8fCUPmYoioG6sVIkhUNgMRh/+rA8847uVbk80RUvMJj9WN9bbtKigvTw3dcm5
	 U7m+IHF0t/YMuJIMr4QdBzojnqgBVQbVbgOWpti0kiZFyy8tbyRGKY/X+Mtny1ctDZiOk
	 Tnwnt5Dp+SBZT96znUpIbHmYR+yqw9oa+Ou/wb8K/uRj+mtQbsoujp4ReDK+ToRAVkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U4XztdjH;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77330606A322;
	Tue, 20 Oct 2026 02:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77330606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U4XztdjH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792461934; x=1823997934;
  h=date:from:to:cc:subject:message-id;
  bh=4eX9K6NIFZtmF0Tfll+rIpMPL8Yw/fhscspaCCiG3sk=;
  b=U4XztdjHo73UN7spQzzZ5jsA6dMnhHlguticKDMszGUXezz7/qyRNhMN
   LYhmE7va6boR0zs2cfxdVynktVBJ3hATCQWFhFwMZ13Nq3Atl0uEQ/qXh
   W0B7JdC5LOKerpk3b9EUtLNV1xV9aIMCGPEmRBQZ9CHmUii4gSO9nLstJ
   JBylhkVPO+DMqU7mJi7R/jqAZBOfDt0avoRq3zttOig+W5FRybneFRmzU
   ZimFAg9T0a0cuangeRWJghdiZK94w7d13ahT38oKB31H1+CoGoGhLMD41
   R0Nd0DK2enqWuWj3OARF0i688gHdUTdc8uhl2JH8urbhPxbriCDZpHiw+
   Q==;
X-CSE-ConnectionGUID: 64Gs9j2NRLaE+hVW6oc6PQ==
X-CSE-MsgGUID: OB2qEB6wSESF+k2Pg7KLDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1060718"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1060718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 19:05:33 -0700
X-CSE-ConnectionGUID: mDuMqh8gRJmA4FJx15VQPA==
X-CSE-MsgGUID: LZ9o/13XQZCpeGI+qOrEwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3097855"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Oct 2026 19:05:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIzEG-00000000MjK-0boh;
	Tue, 20 Oct 2026 02:05:28 +0000
Date: Tue, 20 Oct 2026 10:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rm-mmx 1/1]
 lib/raid/xor/xor-core.c:58:undefined reference to `xor_block_sse'
Message-ID: <202610200957.9LSVeYFv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rm-mmx
head:   6f82cce65eef74ed32bdf4f86b884f3fabe950c6
commit: 6f82cce65eef74ed32bdf4f86b884f3fabe950c6 [1/1] raid: remove MMX optimized code
config: um-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200957.9LSVeYFv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200957.9LSVeYFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200957.9LSVeYFv-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: lib/raid/xor/xor-core.o: in function `xor_register':
>> lib/raid/xor/xor-core.c:58:(.init.text+0x2ac): undefined reference to `xor_block_sse'
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: lib/raid/xor/xor-core.c:58:(.init.text+0x2b2): undefined reference to `xor_block_sse_pf64'
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: lib/raid/xor/xor-core.c:58:(.init.text+0x2b6): undefined reference to `xor_block_sse'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: lib/raid/xor/xor-core.c:58:(.init.text+0x2bb): undefined reference to `xor_block_sse_pf64'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: lib/raid/xor/xor-core.o: in function `xor_force':
>> lib/raid/xor/xor-core.c:72:(.init.text+0x2e4): undefined reference to `xor_block_avx'
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: lib/raid/xor/xor-core.c:72:(.init.text+0x2e9): undefined reference to `xor_block_avx'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +58 lib/raid/xor/xor-core.c

^1da177e4c3f41 drivers/md/xor.c        Linus Torvalds    2005-04-16  47  
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  48  /**
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  49   * xor_register - register a XOR template
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  50   * @tmpl:	template to register
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  51   *
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  52   * Register a XOR implementation with the core.  Registered implementations
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  53   * will be measured by a trivial benchmark, and the fastest one is chosen
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  54   * unless an implementation is forced using xor_force().
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  55   */
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  56  void __init xor_register(struct xor_block_template *tmpl)
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26  57  {
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26 @58  	tmpl->next = template_list;
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26  59  	template_list = tmpl;
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26  60  }
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26  61  
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  62  /**
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  63   * xor_force - force use of a XOR template
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  64   * @tmpl:	template to register
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  65   *
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  66   * Register a XOR implementation with the core and force using it.  Forcing
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  67   * an implementation will make the core ignore any template registered using
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  68   * xor_register(), or any previous implementation forced using xor_force().
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  69   */
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  70  void __init xor_force(struct xor_block_template *tmpl)
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  71  {
a21921dd02d305 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27 @72  	forced_template = tmpl;
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  73  }
35ebc4de105989 lib/raid/xor/xor-core.c Christoph Hellwig 2026-03-27  74  

:::::: The code at line 58 was first introduced by commit
:::::: 524ccdbdfb52608e9b98fcd64f4337add7009f41 crypto: xor - defer load time benchmark to a later time

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
