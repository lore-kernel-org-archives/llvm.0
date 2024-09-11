Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A04C1E51D;
	Wed, 11 Sep 2024 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726064462; cv=none; b=gVRuBguKO0DLZL7kRLuo+2PL4dg6uJbi3UKR1mMvlwJcLLyHexqbO9MJkU0Z994fylNq2RtXY7dE+XUyvkN9uDg+Ro3ts5oiy52jDczYF298Wpq2tIYmG5KT+fFo/x5yZboaTA9KCx0OHxyhWmrPhldIH4lAAJFxsNZjoAIHj1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726064462; c=relaxed/simple;
	bh=hCydF1+P5OifbZ65eRZ1ya0BPYCaNltPcb3RgiODn58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHcZwBCaqlqVRKfXpu2H8BTNIfHMoxVEw71xVCiqeT7f0KVOnNOxp1JiYbo4k8eOCtn4xUhbH/gi7EZhIHGvEfyrnJ8xMSHlbX3TqnWss7LZwczakpMaritNHeGUtC3UxDv0/X9tSV5/SsQMdvAkZTRh9znJsMmnmVDA9y8fq4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGkBef8F; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGkBef8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726064460; x=1757600460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCydF1+P5OifbZ65eRZ1ya0BPYCaNltPcb3RgiODn58=;
  b=DGkBef8FHfARBDow6XRFxxLctpALcKasRs+VL5noRZGDsCZN7jqAZ5NK
   73EVmyLq6FhRLvdvsYDCkeZVnahrK3b4agGzj+MmjVyQWNtS0cr/N9ehm
   B++2/k2dVBFzDxryOit1RNpocfQtlBsEfpSNk1fAWTK5rG/XUy/ADNTCM
   MtiQjpY7JbyCZFalOVGL31bgNS8rIyNVN1vCt209oJH3tMakx4kBryMFw
   sEL/0l0Z3cKm/y9rM9khDiYAB/LjShsXXkNL8UXmeJys9++qRytrukhvh
   yAefPLi+bU2lUip+yEdzF6rTTU4fUqyoPSnZO99nuh+u+8rpx6bD5B2Kw
   A==;
X-CSE-ConnectionGUID: sO4nMfwgQnKto0tI5w8vvw==
X-CSE-MsgGUID: g0+D/evuRQqNT4zxX28nng==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28754607"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="28754607"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:20:59 -0700
X-CSE-ConnectionGUID: efMV1vx4Q3CPIf7x1WVivg==
X-CSE-MsgGUID: 32WcEvsqTf+CD0y2JcWrzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67624780"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2024 07:20:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soODI-0003hG-06;
	Wed, 11 Sep 2024 14:20:56 +0000
Date: Wed, 11 Sep 2024 22:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build-v1.5 30/32] check.c:11:10: fatal error:
 'xxhash.h' file not found
Message-ID: <202409120059.B0trKsB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-v1.5
head:   2abe29f4f173c4090c0030c43c30053694b1658a
commit: b28bcdc0e8e9cad411975854148e76e0957ad16c [30/32] objtool: Calculate function checksums
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240912/202409120059.B0trKsB1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120059.B0trKsB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120059.B0trKsB1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:11:10: fatal error: 'xxhash.h' file not found
   11 | #include <xxhash.h>
   |          ^~~~~~~~~~
   In file included from special.c:16:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.hIn file included from builtin-check.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   >   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
--
   |          ^~~~~~~~~~
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
   In file included from objtool.c:18:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/special.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/builtin-check.o] Error 1
   11 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_gen.o] Error 1
   error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/objtool.o] Error 1
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/special.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
   In file included from arch/x86/orc.c:5:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/weak.o] Error 1
   1 error generated.
   In file included from elf.c:23:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/orc.o] Error 1
   In file included from orc_dump.c:8:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/orc_dump.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/elf.o] Error 1
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:106: tools/objtool/check.o] Error 1
   In file included from arch/x86/decode.c:18:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:16:10: fatal error: 'xxhash.h' file not found
   16 | #include <xxhash.h>
   |          ^~~~~~~~~~
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:106: tools/objtool/arch/x86/decode.o] Error 1
   make[5]: *** [tools/build/Makefile.build:158: arch/x86] Error 2
   make[4]: *** [Makefile:77: tools/objtool/objtool-in.o] Error 2
   make[3]: *** [Makefile:72: objtool] Error 2
   make[2]: *** [Makefile:1361: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
