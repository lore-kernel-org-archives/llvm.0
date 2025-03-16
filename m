Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2218B47C;
	Sun, 16 Mar 2025 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742127593; cv=none; b=fENrAWOGUpGXdo4zawqnZh+vutgGcGPJSXnrYmL6W59AiW2BJ7pw17gGLLYiGWcthlUOh9hG3ZdzxKHh5mMmBCgfX76BFsMNI7uOVEntZJszVqYVZgovMoBY6n9XSAey6dQ2S0WvmqfUkDzCiRxFTXXrVjnCqMEy2sjUTYak/P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742127593; c=relaxed/simple;
	bh=F6HRxRqANZA7BaAg95+LR+aEiMya186eBR4506hAj7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBvkyadVhWc8yaD4w8Pqe4Yrz8AcknM2hI5WpgOnviUfDdHu6qjGAeW9fnpU8q8WR3ij4xrK6f9vHnBimgcZgjbEg3oJq15remB31du1Tu5h+3HE19ab4lJhqnI60ymsMnt0rfsDXKpwnUaJp5hz6HxQTB2ZFwL4IPgLmrIgRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQecm6B6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQecm6B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742127592; x=1773663592;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F6HRxRqANZA7BaAg95+LR+aEiMya186eBR4506hAj7Y=;
  b=VQecm6B6992kQJZUGb8me6GcIIZ1xBqroccCp5WLMxNX5tfUf/91GEYj
   p3p/hAr8ruGMESMpnQkM5iaULXFkITIhbFmlPyvPRd5afMEMKVj1ZKb5u
   oken7lcFWO9vuQ5FAPiCjr5kUtcmdgsjSqH3Dp21NrwZno0x5+bfVRu7z
   AEHafnJ2MAe0JGZFW8Iv52QyqHdefXmsU5pnOOZNPrx0bOeyuyRHMz6uR
   VhGopDoqTPnOUettCbC7jNOqNMmyWovlPN2mHXRj9r4T18gdY1O9B5xFN
   1XijwQUiausl9nMjQvwgMyTFeifvG+MNBfeUhVT14kgkWJWhBCUufZNj+
   g==;
X-CSE-ConnectionGUID: SKuh9HAUQb67Rt6MvDZ+ZA==
X-CSE-MsgGUID: jsy+xmakTV6roNR+n6BGpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43138667"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="43138667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 05:19:51 -0700
X-CSE-ConnectionGUID: bOvllIKjSB6o3vlL2qE+Rg==
X-CSE-MsgGUID: O58xrd80TJSk6NGd6jrO1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="126563261"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Mar 2025 05:19:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttmxd-000BzZ-2D;
	Sun, 16 Mar 2025 12:19:21 +0000
Date: Sun, 16 Mar 2025 20:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Justin Stitt <justinstitt@google.com>
Subject: [linux-next:master 8662/11207] /bin/bash: line 1: 1478183
 Segmentation fault      clang -Wp,-MMD,arch/s390/lib/.test_modules.o.d
 -nostdinc -Iarch/s390/include -I./arch/s390/include/generated -Iinclude
 -I./include -Iarch/s390/include/uapi -I./arch/s390/include/generated/uapi
 -Iinclude/u...
Message-ID: <202503162044.aJj0sZEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   da920b7df701770e006928053672147075587fb2
commit: 47f4af43e7c0cf702d6a6321542f0c0d9c4216e3 [8662/11207] ubsan/overflo=
w: Enable ignorelist parsing and add type filter
config: s390-randconfig-002-20250316 (https://download.01.org/0day-ci/archi=
ve/20250316/202503162044.aJj0sZEn-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30d=
aaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250316/202503162044.aJj0sZEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503162044.aJj0sZEn-lkp@i=
ntel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   In file included from arch/s390/lib/test_modules.c:3:
   In file included from include/kunit/test.h:24:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enu=
meration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-en=
um-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enu=
meration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-en=
um-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enu=
meration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-en=
um-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> /bin/bash: line 1: 1478183 Segmentation fault      clang -Wp,-MMD,arch/s=
390/lib/.test_modules.o.d -nostdinc -Iarch/s390/include -I./arch/s390/inclu=
de/generated -Iinclude -I./include -Iarch/s390/include/uapi -I./arch/s390/i=
nclude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include in=
clude/linux/compiler-version.h -include include/linux/kconfig.h -include in=
clude/linux/compiler_types.h -D__KERNEL__ --target=3Ds390x-linux-gnu -finte=
grated-as -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu1=
1 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -=
m64 -fPIC -mpacked-stack -mbackchain -msoft-float -march=3Dz14 -mtune=3Dz14=
 -Wa,-Iarch/s390/include -pipe -Wno-sign-compare -fno-asynchronous-unwind-t=
ables -DCONFIG_AS_CFI_VAL_OFFSET=3D1 -fno-delete-null-pointer-checks -O2 -f=
no-stack-protector -fomit-frame-pointer -fno-stack-clash-protection -falign=
-functions=3D16 -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-ch=
eck -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplici=
t-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-securit=
y -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing=
-declarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-gnu -Wno=
-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wvla -Wno-=
pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-tim=
e -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wextra -Wunused -=
Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -W=
no-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -W=
no-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -Wtautologi=
cal-compare -Wno-error=3Dreturn-type -Wreturn-type -Wcast-function-type -fu=
nsigned-char -Wundef -fstrict-flex-arrays=3D3 -Wformat-overflow -Wformat-tr=
uncation -Wenum-conversion -fsanitize=3Dkernel-address -mllvm -asan-mapping=
-offset=3D0x1C000000000000 -mllvm -asan-instrumentation-with-call-threshold=
=3D0 -mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-me=
m-intrinsic-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dlocal-bounds =
-fsanitize=3Dshift -fsanitize=3Dunreachable -fsanitize-trap=3Dundefined -fs=
anitize-undefined-ignore-overflow-pattern=3Dall -fsanitize=3Dsigned-integer=
-overflow -fsanitize=3Dunsigned-integer-overflow -fsanitize=3Dimplicit-sign=
ed-integer-truncation -fsanitize=3Dimplicit-unsigned-integer-truncation -fs=
anitize-ignorelist=3Dscripts/integer-wrap-ignore.scl -Iarch/s390/lib -Iarch=
/s390/lib -DKBUILD_MODFILE=3D'"arch/s390/lib/test_modules"' -DKBUILD_BASENA=
ME=3D'"test_modules"' -DKBUILD_MODNAME=3D'"test_modules"' -D__KBUILD_MODNAM=
E=3Dkmod_test_modules -c -o arch/s390/lib/test_modules.o arch/s390/lib/test=
_modules.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
