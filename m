Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BBE32720C;
	Thu, 28 May 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779952987; cv=none; b=l2joeshWNHxspPOVX4nTH/JxY5eYMLvpsQzoIE1l+LDkq5OXbjDzCNb8MVUSsvN/bHhhjvkwBcl0tMs/0lBhWqnEwUTTtuqnlmwTC55MWOUlrTyRtj45YC/Xvva8IN/avKrqMhXzeRWA0Bn6TFRi253Sw4mVP4syl8IO+LBb94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779952987; c=relaxed/simple;
	bh=8gO9OFosoNPSAgZQatlSa4o21QvJ/pd6Qrsi3dKieqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S97nnhGqLcrwXtwQ8myUp+u6c7nC8XMlo5icv5JvISN7x7vMvXj9lTFdod0ZCMj2FeutS8wx6CUNK3HNbT8IVdcbkZYcx8cBQGlzMmC2LFEKafndX4J3RG+ts9RK/AbZT4hk6sQx1jtH8pAbUrWPZdGKu6McGUYa6dWdWvGgmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oqemg4O3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oqemg4O3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779952984; x=1811488984;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8gO9OFosoNPSAgZQatlSa4o21QvJ/pd6Qrsi3dKieqI=;
  b=Oqemg4O36iQ5/2ge+Z/DNICioiVlwrLtmthHUE3FHYuSFKipyHeXzN7e
   8B7M0WEpgAOveLB/XJverBaaxT2ISPCD7K0HKemC/F2wE/C5ZkEPoqNyr
   b1YVKKGD6VOma/pkicw5WxCQBYJqSFw3aBkhNgb6+62nfTLu7XJp3xJch
   3pxB3AGB8/QDBB8rX/9zF+9JjDsz8gPpC/wiZAfNI9Fm/ykafXZAL9WSD
   yo4sFxRG2JDPo5AhvKF6PwkpLCLFbvFr4zRnu0b+8YtfMlQqXOianPBUO
   HM+7Djp0PqZx9K4JzjCHuQOKNnqxZ/kHhg7VWSz0m8rAj9ApvCRnLSB8k
   w==;
X-CSE-ConnectionGUID: tQG34OrmSiCicAU7yxTPVA==
X-CSE-MsgGUID: c9JZal1TSE+hH1fSbLgW8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84417281"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84417281"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 00:23:03 -0700
X-CSE-ConnectionGUID: 24XA7NGiQRCNsGR5Fi0rgw==
X-CSE-MsgGUID: vw55Oy1LQc2tNoPxWwEF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="241438967"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2026 00:23:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSV50-000000005gC-1rGq;
	Thu, 28 May 2026 07:22:58 +0000
Date: Thu, 28 May 2026 15:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/vdso 10/18] kernel/sys.c:2878:1: warning: alias
 and aliasee have different types 'long (unsigned int *, unsigned int *, void
 *)' and 'long (typeof
 (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int
 *)0), typeof (0LL)) || __builtin_types_compat...
Message-ID: <202605281540.qUDQmxib-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/=
vdso
head:   034779fb06aba5bc45faf366922bd77e4d36543a
commit: 7158fc54b2c6f124eec0d7cd13bff69da0172e59 [10/18] vdso: Remove struc=
t getcpu_cache
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260528/20=
2605281540.qUDQmxib-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260528/202605281540.qUDQmxib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281540.qUDQmxib-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   kernel/sys.c:1793:1: warning: alias and aliasee have different types 'lo=
ng (unsigned int, struct rlimit *)' and 'long (typeof (__builtin_choose_exp=
r((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL)) || =
__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))), 0LL=
, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof =
((struct rlimit *)0), typeof (0LL)) || __builtin_types_compatible_p(typeof =
((struct rlimit *)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long)'=
) [-Wattribute-alias]
    1793 | SYSCALL_DEFINE2(setrlimit, unsigned int, resource, struct rlimit=
 __user *, rlim)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
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
   kernel/sys.c:1793:1: note: aliasee is declared here
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
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
   <scratch space>:109:1: note: expanded from here
     109 | __se_sys_setrlimit
         | ^
   kernel/sys.c:1933:1: warning: alias and aliasee have different types 'lo=
ng (int, struct rusage *)' and 'long (typeof (__builtin_choose_expr((__buil=
tin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_co=
mpatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_c=
hoose_expr((__builtin_types_compatible_p(typeof ((struct rusage *)0), typeo=
f (0LL)) || __builtin_types_compatible_p(typeof ((struct rusage *)0), typeo=
f (0ULL))), 0LL, 0L)))' (aka 'long (long, long)') [-Wattribute-alias]
    1933 | SYSCALL_DEFINE2(getrusage, int, who, struct rusage __user *, ru)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
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
   kernel/sys.c:1933:1: note: aliasee is declared here
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
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
   <scratch space>:15:1: note: expanded from here
      15 | __se_sys_getrusage
         | ^
   kernel/sys.c:1959:1: warning: alias and aliasee have different types 'lo=
ng (int)' and 'long (typeof (__builtin_choose_expr((__builtin_types_compati=
ble_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof=
 ((int)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long)') [-Wattribute-al=
ias]
    1959 | SYSCALL_DEFINE1(umask, int, mask)
         | ^
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, _=
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
   kernel/sys.c:1959:1: note: aliasee is declared here
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, _=
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
   <scratch space>:42:1: note: expanded from here
      42 | __se_sys_umask
         | ^
   kernel/sys.c:2517:1: warning: alias and aliasee have different types 'lo=
ng (int, unsigned long, unsigned long, unsigned long, unsigned long)' and '=
long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((=
int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), type=
of (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_comp=
atible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_compat=
ible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__bui=
ltin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0), t=
ypeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), typ=
eof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_com=
patible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_compa=
tible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__bu=
iltin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0), =
typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), ty=
peof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long, long, long)') [-Wa=
ttribute-alias]
    2517 | SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigne=
d long, arg3,
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
   kernel/sys.c:2517:1: note: aliasee is declared here
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
   <scratch space>:93:1: note: expanded from here
      93 | __se_sys_prctl
         | ^
>> kernel/sys.c:2878:1: warning: alias and aliasee have different types 'lo=
ng (unsigned int *, unsigned int *, void *)' and 'long (typeof (__builtin_c=
hoose_expr((__builtin_types_compatible_p(typeof ((unsigned int *)0), typeof=
 (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int *)0), typeof =
(0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compati=
ble_p(typeof ((unsigned int *)0), typeof (0LL)) || __builtin_types_compatib=
le_p(typeof ((unsigned int *)0), typeof (0ULL))), 0LL, 0L)), typeof (__buil=
tin_choose_expr((__builtin_types_compatible_p(typeof ((void *)0), typeof (0=
LL)) || __builtin_types_compatible_p(typeof ((void *)0), typeof (0ULL))), 0=
LL, 0L)))' (aka 'long (long, long, long)') [-Wattribute-alias]
    2878 | SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __user=
 *, nodep, void __user *, unused)
         | ^
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
     227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, _=
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
   kernel/sys.c:2878:1: note: aliasee is declared here
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
     227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, _=
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
   <scratch space>:132:1: note: expanded from here
     132 | __se_sys_getcpu
         | ^
   kernel/sys.c:2957:1: warning: alias and aliasee have different types 'lo=
ng (struct sysinfo *)' and 'long (typeof (__builtin_choose_expr((__builtin_=
types_compatible_p(typeof ((struct sysinfo *)0), typeof (0LL)) || __builtin=
_types_compatible_p(typeof ((struct sysinfo *)0), typeof (0ULL))), 0LL, 0L)=
))' (aka 'long (long)') [-Wattribute-alias]
    2957 | SYSCALL_DEFINE1(sysinfo, struct sysinfo __user *, info)
         | ^
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, _=
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
   kernel/sys.c:2957:1: note: aliasee is declared here
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, _=
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
   <scratch space>:160:1: note: expanded from here
     160 | __se_sys_sysinfo
         | ^
   31 warnings generated.


vim +2878 kernel/sys.c

  2877=09
> 2878	SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __user *, =
nodep, void __user *, unused)
  2879	{
  2880		int err =3D 0;
  2881		int cpu =3D raw_smp_processor_id();
  2882=09
  2883		if (cpup)
  2884			err |=3D put_user(cpu, cpup);
  2885		if (nodep)
  2886			err |=3D put_user(cpu_to_node(cpu), nodep);
  2887		return err ? -EFAULT : 0;
  2888	}
  2889=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
