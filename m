Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A63C8738;
	Tue,  2 Jun 2026 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390897; cv=none; b=Xrlvpcu1mtP9CuzfB1YtQBoSjFa+vOcUlLhV5Iko7kB+cZsS9cXoTsEMhv5EuWnpgxHnrWhEPIzgwYAb8iomEYYdYCMaD0bwgxeDH6DMrJy1xYwQMr+Yd5UTjnsRI6beQ9CqBDSaZOWo4BTuZGtqgIHmszcNtS4lfl/duRwRDq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390897; c=relaxed/simple;
	bh=o5blz5T5OliYkaRp5/whRefPMt5SIUAasU43HIuexuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j8ZNMEEevkzHsiVQqzBSbM6KOUdjK5SfhIlgzs0wPwLeJnyn1FMBw9EC3WNlPCzgKRuPfdlkzvUuGguzHIp2RNZNfL3ZPf8vTswMG3nU2ofFFrq6KjxGyzL2lEpSRIavZBYkziTdU3Oh6odq5UtQuaYvdzzt6IjRKsKMgZNZV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebJGnq+e; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebJGnq+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780390895; x=1811926895;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o5blz5T5OliYkaRp5/whRefPMt5SIUAasU43HIuexuY=;
  b=ebJGnq+eo+JbCyEwjCkeShajGGWR6D/AQ/OqBN95Rh2oRZ9AAvfFE86z
   kOgWQMPxh3rMY4zv2aVQIeO8g89SlppQeBC0VcCvi+zkCOFQoilzGEBe2
   AQLG6u9tV24eq2huQw5Z2Pna1eaHCa+lax9QBXn4JQS7Urxa1bPB31yP6
   dMtWxJbfo/Aj8YG9vbM7wzTQ4k7lKdkoAO4JGMDyu+TTWt2a1iHJBo/su
   0zVPrS4lvWq+GIz8hgaVcNvlK+I3kt9MsG5lzGyQr0q8Bt7L9wWd/4dwB
   6/qWYwyNa3Vuk/poEY+ynBLEg0Ojzk072f93xLfaq5KRgaXiVG9ggSS9M
   A==;
X-CSE-ConnectionGUID: JM355aRSRn2BDljjBnHYnw==
X-CSE-MsgGUID: dcCPZdzERJClaZ+bLez5fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81032521"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81032521"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:01:34 -0700
X-CSE-ConnectionGUID: P/8NjcKxRaCX/V/LnVrvNg==
X-CSE-MsgGUID: sCKMInyyQiGXkFJ4hc3q3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="242823911"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jun 2026 02:01:32 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUL05-00000000Bmk-0oxf;
	Tue, 02 Jun 2026 09:01:29 +0000
Date: Tue, 02 Jun 2026 17:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Askar Safin <safinaskar@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs-7.2.vmsplice 2/4] fs/read_write.c:1219:1:
 warning: alias and aliasee have different types 'long (unsigned long, const
 struct iovec *, unsigned long, unsigned int)' and 'long (typeof
 (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned
 long)0), typeof (0LL...
Message-ID: <202606021605.feT4WbtH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.2=
.vmsplice
head:   2d4099641dbaed4b98711fc7d8ec94c5aec0a0f0
commit: e2c0b2368081bef7d1f6758cc9e7edde8521237c [2/4] vmsplice: make vmspl=
ice a trivial wrapper for preadv2/pwritev2
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260602/20=
2606021605.feT4WbtH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5a=
b4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260602/202606021605.feT4WbtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021605.feT4WbtH-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   fs/read_write.c:1176:1: warning: alias and aliasee have different types =
'long (unsigned long, const struct iovec *, unsigned long, unsigned long, u=
nsigned long)' and 'long (typeof (__builtin_choose_expr((__builtin_types_co=
mpatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_comp=
atible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__b=
uiltin_choose_expr((__builtin_types_compatible_p(typeof ((const struct iove=
c *)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((const struct=
 iovec *)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__b=
uiltin_types_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __bui=
ltin_types_compatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L=
)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((un=
signed long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsi=
gned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__=
builtin_types_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __bu=
iltin_types_compatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0=
L)))' (aka 'long (long, long, long, long, long)') [-Wattribute-alias]
    1176 | SYSCALL_DEFINE5(preadv, unsigned long, fd, const struct iovec __=
user *, vec,
         | ^
   include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   fs/read_write.c:1176:1: note: aliasee is declared here
   include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:43:1: note: expanded from here
      43 | __se_sys_preadv
         | ^
   fs/read_write.c:1184:1: warning: alias and aliasee have different types =
'long (unsigned long, const struct iovec *, unsigned long, unsigned long, u=
nsigned long, rwf_t)' (aka 'long (unsigned long, const struct iovec *, unsi=
gned long, unsigned long, unsigned long, int)') and 'long (typeof (__builti=
n_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0), type=
of (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), typeof=
 (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compat=
ible_p(typeof ((const struct iovec *)0), typeof (0LL)) || __builtin_types_c=
ompatible_p(typeof ((const struct iovec *)0), typeof (0ULL))), 0LL, 0L)), t=
ypeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigne=
d long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned =
long)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__built=
in_types_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin=
_types_compatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), =
typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsign=
ed long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned=
 long)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__buil=
tin_types_compatible_p(typeof ((rwf_t)0), typeof (0LL)) || __builtin_types_=
compatible_p(typeof ((rwf_t)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (lo=
ng, long, long, long, long, long)') [-Wattribute-alias]
    1184 | SYSCALL_DEFINE6(preadv2, unsigned long, fd, const struct iovec _=
_user *, vec,
         | ^
   include/linux/syscalls.h:230:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     230 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   fs/read_write.c:1184:1: note: aliasee is declared here
   include/linux/syscalls.h:230:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     230 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:73:1: note: expanded from here
      73 | __se_sys_preadv2
         | ^
   fs/read_write.c:1196:1: warning: alias and aliasee have different types =
'long (unsigned long, const struct iovec *, unsigned long, unsigned long, u=
nsigned long)' and 'long (typeof (__builtin_choose_expr((__builtin_types_co=
mpatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_comp=
atible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__b=
uiltin_choose_expr((__builtin_types_compatible_p(typeof ((const struct iove=
c *)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((const struct=
 iovec *)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__b=
uiltin_types_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __bui=
ltin_types_compatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L=
)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((un=
signed long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsi=
gned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__=
builtin_types_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __bu=
iltin_types_compatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0=
L)))' (aka 'long (long, long, long, long, long)') [-Wattribute-alias]
    1196 | SYSCALL_DEFINE5(pwritev, unsigned long, fd, const struct iovec _=
_user *, vec,
         | ^
   include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   fs/read_write.c:1196:1: note: aliasee is declared here
   include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:104:1: note: expanded from here
     104 | __se_sys_pwritev
         | ^
   fs/read_write.c:1204:1: warning: alias and aliasee have different types =
'long (unsigned long, const struct iovec *, unsigned long, unsigned long, u=
nsigned long, rwf_t)' (aka 'long (unsigned long, const struct iovec *, unsi=
gned long, unsigned long, unsigned long, int)') and 'long (typeof (__builti=
n_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0), type=
of (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), typeof=
 (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compat=
ible_p(typeof ((const struct iovec *)0), typeof (0LL)) || __builtin_types_c=
ompatible_p(typeof ((const struct iovec *)0), typeof (0ULL))), 0LL, 0L)), t=
ypeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigne=
d long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned =
long)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__built=
in_types_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin=
_types_compatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), =
typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsign=
ed long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned=
 long)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__buil=
tin_types_compatible_p(typeof ((rwf_t)0), typeof (0LL)) || __builtin_types_=
compatible_p(typeof ((rwf_t)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (lo=
ng, long, long, long, long, long)') [-Wattribute-alias]
    1204 | SYSCALL_DEFINE6(pwritev2, unsigned long, fd, const struct iovec =
__user *, vec,
         | ^
   include/linux/syscalls.h:230:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     230 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   fs/read_write.c:1204:1: note: aliasee is declared here
   include/linux/syscalls.h:230:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     230 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:134:1: note: expanded from here
     134 | __se_sys_pwritev2
         | ^
>> fs/read_write.c:1219:1: warning: alias and aliasee have different types =
'long (unsigned long, const struct iovec *, unsigned long, unsigned int)' a=
nd 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeo=
f ((unsigned long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof =
((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_ex=
pr((__builtin_types_compatible_p(typeof ((const struct iovec *)0), typeof (=
0LL)) || __builtin_types_compatible_p(typeof ((const struct iovec *)0), typ=
eof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_com=
patible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_compa=
tible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__bu=
iltin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int)0), t=
ypeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int)0), type=
of (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long, long)') [-Wattribute=
-alias]
    1219 | SYSCALL_DEFINE4(vmsplice, unsigned long, fd, const struct iovec =
__user *, vec,
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   fs/read_write.c:1219:1: note: aliasee is declared here
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:165:1: note: expanded from here
     165 | __se_sys_vmsplice
         | ^
   fs/read_write.c:1423:1: warning: alias and aliasee have different types =
'long (int, int, off_t *, size_t)' (aka 'long (int, int, long *, unsigned i=
nt)') and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_=
p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((i=
nt)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin=
_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compa=
tible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choo=
se_expr((__builtin_types_compatible_p(typeof ((off_t *)0), typeof (0LL)) ||=
 __builtin_types_compatible_p(typeof ((off_t *)0), typeof (0ULL))), 0LL, 0L=
)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((si=
ze_t)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((size_t)0), =
typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long, long)') [-Wattri=
bute-alias]
    1423 | SYSCALL_DEFINE4(sendfile, int, out_fd, int, in_fd, off_t __user =
*, offset, size_t, count)
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   fs/read_write.c:1423:1: note: aliasee is declared here
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:56:1: note: expanded from here
      56 | __se_sys_sendfile
         | ^
   fs/read_write.c:1442:1: warning: alias and aliasee have different types =
'long (int, int, loff_t *, size_t)' (aka 'long (int, int, long long *, unsi=
gned int)') and 'long (typeof (__builtin_choose_expr((__builtin_types_compa=
tible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(type=
of ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__b=
uiltin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_types=
_compatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builti=
n_choose_expr((__builtin_types_compatible_p(typeof ((loff_t *)0), typeof (0=
LL)) || __builtin_types_compatible_p(typeof ((loff_t *)0), typeof (0ULL))),=
 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typ=
eof ((size_t)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((siz=
e_t)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long, long)') =
[-Wattribute-alias]
    1442 | SYSCALL_DEFINE4(sendfile64, int, out_fd, int, in_fd, loff_t __us=
er *, offset, size_t, count)
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   fs/read_write.c:1442:1: note: aliasee is declared here
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:85:1: note: expanded from here
      85 | __se_sys_sendfile64
         | ^
   fs/read_write.c:1673:1: warning: alias and aliasee have different types =
'long (int, loff_t *, int, loff_t *, size_t, unsigned int)' (aka 'long (int=
, long long *, int, long long *, unsigned int, unsigned int)') and 'long (t=
ypeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((int)0),=
 typeof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), typeof (0UL=
L))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_=
p(typeof ((loff_t *)0), typeof (0LL)) || __builtin_types_compatible_p(typeo=
f ((loff_t *)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr(=
(__builtin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_t=
ypes_compatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__bu=
iltin_choose_expr((__builtin_types_compatible_p(typeof ((loff_t *)0), typeo=
f (0LL)) || __builtin_types_compatible_p(typeof ((loff_t *)0), typeof (0ULL=
))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p=
(typeof ((size_t)0), typeof (0LL)) || __builtin_types_compatible_p(typeof (=
(size_t)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__bu=
iltin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL)) || __built=
in_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))), 0LL, 0L)))=
' (aka 'long (long, long, long, long, long, long)') [-Wattribute-alias]
    1673 | SYSCALL_DEFINE6(copy_file_range, int, fd_in, loff_t __user *, of=
f_in,
         | ^
   include/linux/syscalls.h:230:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     230 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   fs/read_write.c:1673:1: note: aliasee is declared here
   include/linux/syscalls.h:230:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     230 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:145:1: note: expanded from here
     145 | __se_sys_copy_file_range
         | ^
   16 warnings generated.


vim +1219 fs/read_write.c

  1215=09
  1216	/*
  1217	 * Legacy preadv2/pwritev2 wrapper.
  1218	 */
> 1219	SYSCALL_DEFINE4(vmsplice, unsigned long, fd, const struct iovec __us=
er *, vec,
  1220			unsigned long, vlen, unsigned int, flags)
  1221	{
  1222		if (unlikely(flags & ~SPLICE_F_ALL))
  1223			return -EINVAL;
  1224=09
  1225		CLASS(fd, f)(fd);
  1226		if (fd_empty(f))
  1227			return -EBADF;
  1228=09
  1229		/* We do do_writev/do_readv, so it is okay to pass "false" here */
  1230		if (!get_pipe_info(fd_file(f), /* for_splice =3D */ false))
  1231			return -EBADF;
  1232=09
  1233		if (fd_file(f)->f_mode & FMODE_WRITE)
  1234			return do_writev(fd, vec, vlen, (flags & SPLICE_F_NONBLOCK) ? RWF_=
NOWAIT : 0);
  1235		else
  1236			return do_readv(fd, vec, vlen, (flags & SPLICE_F_NONBLOCK) ? RWF_N=
OWAIT : 0);
  1237	}
  1238=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
