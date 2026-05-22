Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253C0382F12;
	Fri, 22 May 2026 21:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484301; cv=none; b=UmQxRHUnUBvwNHWxAOnRtchPst9Am2t+tyzE/DqUHVmL3BYcErsFlRFdQsmSob4JRoRz1a3gWv60f0aDNvdtoXtPEhn+Sqn4qT0MooCglT3lm9fuP7gYAthxlaISuNf0yMYM7yvor8B74WaEqcKz15fOnf7i75TCKY+YI1WUyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484301; c=relaxed/simple;
	bh=Ah79+5DKZ2T0ha6yDQ4zTUqo5X5P7ocYPtOpPmsMKMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uwOXNRryxdnPWmFtwPoD5ifz8oAUmf4szaqVc7EI5IjKB/rQ3O1Y8cr4n6Hhu22ZunfY3uSMzQZwhQO1CKfR3UBCZqugKwnU/SBqXMTxTFZpdfUipB+Ho4cn3IdYSDh7g8xbUt9Em42JeZH4jnoz8kitVUPZ4Dor11RJ5cCcwLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP6hoX5X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP6hoX5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779484299; x=1811020299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ah79+5DKZ2T0ha6yDQ4zTUqo5X5P7ocYPtOpPmsMKMg=;
  b=LP6hoX5Xuol7wBBxwbb9djA81Bbl2AmCiNlpgl64aYVUf8vuX7/flEwJ
   9K3850NLBCjwzsRSBuH++iYZNDXcbqs4amLPbWIhZJycTAdbaO47GyPv5
   FbXfnuG9u5IYdYw0vfm7jvDbTYtTp/Fovi1Ro5Lj+ITxBGIj6ZkW8IKFS
   QYJJ5i9r18R8pjyq57WSU8bLQgDecrj8anZwVJYPYp/UgmgMpM7+ZyJjo
   8QgcaMmVyFrhoeOF9CWqcbm4WjEA89CIJ81FiEoq5NmC6/XXL/rgCB1Cd
   ccaIR2bI2Rgs8ToHdCoOpjZ/RwXURuMtfKskzdY/K2fBSbma+6gmDKYI+
   g==;
X-CSE-ConnectionGUID: VaN9XWS7Q1WrPZFMWnkK/w==
X-CSE-MsgGUID: aNJL77zBS2ud/OpJA+hQ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="97843599"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="97843599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 14:11:39 -0700
X-CSE-ConnectionGUID: 0Xl74xHuRpyMJ6kXJFyd+Q==
X-CSE-MsgGUID: LXIRj7RhSeqdvjgaKWsoww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="245994973"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 May 2026 14:11:36 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQX9a-000000002z5-0Tgw;
	Fri, 22 May 2026 21:11:34 +0000
Date: Sat, 23 May 2026 05:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 10/11]
 =?us-ascii?Q?/usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/?=
 =?us-ascii?Q?include/signal.h:220:42:?= error: '__nonnull__' attribute
 requires parameter 1 to be an integer constant
Message-ID: <202605230529.npkFTpqc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   f6b7770edc4a637c416f4cfb201214e40362d05c
commit: 087823f2faa752ac115b05a355521c06210535ae [10/11] cleanup: Annotate guard constructors with __nonnull()
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260523/202605230529.npkFTpqc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230529.npkFTpqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230529.npkFTpqc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:220:42: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     220 |                       const sigset_t *__right) __THROW __nonnull ((1, 2, 3));
         |                                                        ^          ~~~~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:224:41: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     224 |                      const sigset_t *__right) __THROW __nonnull ((1, 2, 3));
         |                                                       ^          ~~~~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:256:6: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     256 |      __nonnull ((1, 2));
         |      ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:302:13: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     302 |     __THROW __nonnull ((2, 3));
         |             ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:573:36: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     573 |                    char *const __envp[]) __THROW __nonnull ((1, 2));
         |                                                  ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:585:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     585 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:590:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     590 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:595:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     595 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:600:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     600 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:606:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     606 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:613:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     613 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:820:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     820 |      __THROW __nonnull ((1, 2)) __wur;
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:827:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     827 |      __THROW __nonnull ((2, 4)) __wur;
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:833:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     833 |      __THROW __nonnull ((1, 2)) __wur;
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:840:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     840 |      __THROW __nonnull ((1, 2)) __wur
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:848:35: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     848 |                       const char *__to) __THROW __nonnull ((1, 3)) __wur;
         |                                                 ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:853:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     853 |      __THROW __nonnull ((2, 3)) __wur
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:903:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/getopt_posix.h:27:
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/getopt_core.h:92:16: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
      92 |        __THROW __nonnull ((2, 3));
         |                ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/elf_aux.c:16:
   In file included from arch/um/os-Linux/internal.h:7:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:328:
   In file included from /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/bits/sigstksz.h:24:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/unistd.h:1163:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
    1163 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from arch/um/os-Linux/mem.c:20:
   In file included from arch/um/os-Linux/internal.h:7:
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:220:42: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     220 |                       const sigset_t *__right) __THROW __nonnull ((1, 2, 3));
         |                                                        ^          ~~~~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/mem.c:20:
   In file included from arch/um/os-Linux/internal.h:7:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:224:41: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     224 |                      const sigset_t *__right) __THROW __nonnull ((1, 2, 3));
         |                                                       ^          ~~~~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/mem.c:20:
   In file included from arch/um/os-Linux/internal.h:7:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/signal.h:256:6: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     256 |      __nonnull ((1, 2));
         |      ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   3 errors generated.
--
   In file included from arch/um/os-Linux/time.c:19:
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:44:28: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
      44 |                      size_t __n) __THROW __nonnull ((1, 2));
         |                                          ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:48:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
      48 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:56:13: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
      56 |     __THROW __nonnull ((1, 2)) __attr_access ((__write_only__, 1, 4));
         |             ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:65:33: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
      65 |      __THROW __attribute_pure__ __nonnull ((1, 2));
         |                                 ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:81:33: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
      81 |      __THROW __attribute_pure__ __nonnull ((1, 2));
         |                                 ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:142:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     142 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:146:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     146 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:150:14: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     150 |      __THROW __nonnull ((1, 2));
         |              ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:153:29: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     153 |                       size_t __n) __THROW __nonnull ((1, 2));
         |                                           ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:157:33: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     157 |      __THROW __attribute_pure__ __nonnull ((1, 2));
         |                                 ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:160:33: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     160 |      __THROW __attribute_pure__ __nonnull ((1, 2));
         |                                 ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:164:33: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     164 |      __THROW __attribute_pure__ __nonnull ((1, 2));
         |                                 ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:176:33: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     176 |      __THROW __attribute_pure__ __nonnull ((1, 2, 3));
         |                                 ^          ~~~~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:180:27: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     180 |                          locale_t __l) __THROW __nonnull ((2, 4))
         |                                                ^          ~~~~~~
   include/linux/compiler_attributes.h:237:42: note: expanded from macro '__nonnull'
     237 | #define __nonnull(x...)                 __attribute__((__nonnull__(x)))
         |                                                        ^           ~
   In file included from arch/um/os-Linux/time.c:19:
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/include/string.h:294:33: error: '__nonnull__' attribute requires parameter 1 to be an integer constant
     294 |      __THROW __attribute_pure__ __nonnull ((1, 2));
         |                                 ^          ~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
