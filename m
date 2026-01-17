Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A6331A79;
	Sat, 17 Jan 2026 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768649218; cv=none; b=L3Mp5sPlzLgr/PJ2MkiLJzjn4wGGReEMGUSHbQIVcl+O0gCD+cfLJxUNi0WjKlZFAYh8BeIYGzw1w65QRwtvQHKATyH0E+jddeuJ36BZO56XW/0r6jaSBASDz4RehowF9It45/kZzD6fh0ItapAZpoj74gMkZAsPR9IqEMpIihM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768649218; c=relaxed/simple;
	bh=WuTYo7ffcE+7s13hGulNO/OdBJX2PKRDy7lVdwRqOlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VUaMsX9u9axuKPr9kVFSRAVavL6ILHTz62dnaQscXJ7hYh3T68MbQ2U8FcWpPIu2z0XhMMl6EqJORb1aO02xXDepHXsfed32odxZDuv4+DSBgwgewE7XvyqpUFwRrKRYJLqMxr/WG6MTP6SmMKrfyQ5ATLuAobPN21DeJeHgDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ft3KXv8s; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ft3KXv8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768649217; x=1800185217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WuTYo7ffcE+7s13hGulNO/OdBJX2PKRDy7lVdwRqOlw=;
  b=ft3KXv8s+zOj7hRSaotggi3MURDOfXcYaeTSOZerYj/ZW8lzd4OVaKo1
   b1HWDiFmvtNlO0wRNvi100pduRFY0lA1wOnFGPZvVsfkhl+vZx8/Ij77S
   xblvo30hbw81JTgxIhgWt2AMvX7xSl1rXBdl52GUlKt31Wl+EXb7Bwbrs
   Y9o1Dhxf4XcNgEBz3JGONQduN/qKBp5/dIkqnWv3g4g8eom1IKoRWHyvM
   T1XfFrROu4XWevdoy+x3h9FV0Tytg9VOpW528t5akW8NVw0FzNMm8Axvq
   y1VVtMyYr8Tmq2pxA209IwmBziEG9sRFO6M+jmSlE535DshXRlk3pxYlv
   Q==;
X-CSE-ConnectionGUID: czN9FppuSOOF8EqNhzumSA==
X-CSE-MsgGUID: daa83dJKTrSHJcGEIjnY6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87516970"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="87516970"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 03:26:54 -0800
X-CSE-ConnectionGUID: QqR7X2h4Q8muz+u670fKRA==
X-CSE-MsgGUID: AgAqgOQXRty48yfGoqjlbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205357053"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2026 03:26:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh4SB-00000000Lnx-10wl;
	Sat, 17 Jan 2026 11:26:51 +0000
Date: Sat, 17 Jan 2026 19:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/bits-per-long-check 6/7]
 include/asm-generic/bitsperlong.h:16:2: error: Inconsistent word size. Check
 asm/bitsperlong.h
Message-ID: <202601171904.UBwfIzFw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/bits-per-long-check
head:   de3b5648f18c5ced9bf1a64922ed073b70669455
commit: 706abbfcc19056ba08b8c29bf693cc2f6924acd4 [6/7] BUILD_VDSO
config: x86_64-randconfig-073-20260117 (https://download.01.org/0day-ci/arc=
hive/20260117/202601171904.UBwfIzFw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260117/202601171904.UBwfIzFw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171904.UBwfIzFw-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/realmode/rm/header.S:8:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   In file included from arch/x86/include/asm/ibt.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
>> include/asm-generic/bitsperlong.h:16:2: error: Inconsistent word size. C=
heck asm/bitsperlong.h
      16 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^
   1 error generated.


vim +16 include/asm-generic/bitsperlong.h

c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  13 =20
706abbfcc19056 Thomas Wei=C3=9Fschuh 2026-01-14  14  #ifndef BUILD_VDSO
706abbfcc19056 Thomas Wei=C3=9Fschuh 2026-01-14  15  #if BITS_PER_LONG !=3D =
__BITS_PER_LONG
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13 @16  #error Inconsistent word si=
ze. Check asm/bitsperlong.h
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  17  #endif
706abbfcc19056 Thomas Wei=C3=9Fschuh 2026-01-14  18  #endif
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  19 =20

:::::: The code at line 16 was first introduced by commit
:::::: c31ae4bb4a9fa4606a74c0a4fb61b74f804e861e asm-generic: introduce asm/=
bitsperlong.h

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@klappe2.(none)>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
