Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301C2F7F13;
	Thu, 28 May 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986646; cv=none; b=SODqKlGHXC26AFJMG1byPWBNCxe+qKOSkp/MidliPm8L/mpbMvhsgefJ+20zJxi7B0KdRs1iZ3/ffsxbIFOzGEI7DL9QJc9BJ3PLOriaCm42hITCrqK6PtyZHI8csJbrEFmOhubPVCc/gXtQiO8fRNxov/TiCF2x/8Gnxt9bFFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986646; c=relaxed/simple;
	bh=eHyM/ZOktpZtpi4ZGcSERtKFio43kQZhDQiIcKDT7as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4ogRbEq9jRtVSB4Rp/pEQnH8vM8TWDmyRe01YHxNzSl8R6qKjzaoruzyIs2uzHkp/FYdNSueODCqaW1Wvjo9jvW4rU6St3kAQ+OX0kcr5hObtKmHLC1d1Sk06h6J2UQNKyFbhu40zRNt4vAu/JpjBH7OxLxXJ6vjqBRI2KS6+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSg6Aw9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSg6Aw9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0E71F000E9;
	Thu, 28 May 2026 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779986645;
	bh=oSQQQK0xIp517yq4BVvco281GyViuiXg6k3M8TceXrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jSg6Aw9gejUw63G2BHFUh4DGzStLx3MdoDzdVdNZdNyg5iIWoe0QYM5ncPQoTYEfX
	 3PY5AdUd8e6GUYG8NyORjnqVc2AfrtGy5/mFJwy5SvHTN4wqbiJymdWvc1keO7WR3K
	 KYXLcmGYev5gSKB/uTrxL5ISpX8fp09gZu57ts9cwR/G4Ph2nrQQmUu7h3h8WzJZjj
	 +8cuN03bGLRT97x07pViZ3Mu+rP/5IWthGDR8Y8k5Wscp+E/SkfqVmKlTegKoOzmoT
	 nsjQbaKFWprVRSvMgHDRM9CjJ1NbIdrKyu4ZxIXfbWJOQOTPrVuM5fC22YOEpxxkXq
	 zyqzyCOEBAuMw==
Date: Thu, 28 May 2026 09:44:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [tip:timers/vdso 10/18] kernel/sys.c:2878:1: warning: alias and
 aliasee have different types 'long (unsigned int *, unsigned int *, void *)'
 and 'long (typeof
 (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int
 *)0), typeof (0LL)) || __builtin_types_compat...
Message-ID: <20260528164400.GA1342076@ax162>
References: <202605281540.qUDQmxib-lkp@intel.com>
 <20260528094452-62bd9d27-bacf-4bc4-a6c2-3ff60a6eb073@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260528094452-62bd9d27-bacf-4bc4-a6c2-3ff60a6eb073@linutronix.de>

Hi Thomas,

On Thu, May 28, 2026 at 09:50:43AM +0200, Thomas Wei=DFschuh wrote:
> On Thu, May 28, 2026 at 03:22:06PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tim=
ers/vdso
> > head:   034779fb06aba5bc45faf366922bd77e4d36543a
> > commit: 7158fc54b2c6f124eec0d7cd13bff69da0172e59 [10/18] vdso: Remove s=
truct getcpu_cache
> > config: um-allnoconfig (https://download.01.org/0day-ci/archive/2026052=
8/202605281540.qUDQmxib-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project=
 5bac06718f502014fade905512f1d26d578a18f3)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260528/202605281540.qUDQmxib-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605281540.qUDQmxib-l=
kp@intel.com/
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> >    kernel/sys.c:1793:1: warning: alias and aliasee have different types=
 'long (unsigned int, struct rlimit *)' and 'long (typeof (__builtin_choose=
_expr((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL))=
 || __builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))),=
 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typ=
eof ((struct rlimit *)0), typeof (0LL)) || __builtin_types_compatible_p(typ=
eof ((struct rlimit *)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, lo=
ng)') [-Wattribute-alias]
>=20
> (...)
>=20
> >    kernel/sys.c:1933:1: warning: alias and aliasee have different types=
 'long (int, struct rusage *)' and 'long (typeof (__builtin_choose_expr((__=
builtin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_type=
s_compatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__built=
in_choose_expr((__builtin_types_compatible_p(typeof ((struct rusage *)0), t=
ypeof (0LL)) || __builtin_types_compatible_p(typeof ((struct rusage *)0), t=
ypeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long)') [-Wattribute-alias]
> >    kernel/sys.c:1959:1: warning: alias and aliasee have different types=
 'long (int)' and 'long (typeof (__builtin_choose_expr((__builtin_types_com=
patible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(ty=
peof ((int)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long)') [-Wattribut=
e-alias]
>=20
> (...)
>=20
> >    kernel/sys.c:2517:1: warning: alias and aliasee have different types=
 'long (int, unsigned long, unsigned long, unsigned long, unsigned long)' a=
nd 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeo=
f ((int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), =
typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_=
compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_co=
mpatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (_=
_builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0=
), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0),=
 typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types=
_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_c=
ompatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (=
__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)=
0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0)=
, typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long, long, long)') =
[-Wattribute-alias]
>=20
> (...)
>=20
> > >> kernel/sys.c:2878:1: warning: alias and aliasee have different types=
 'long (unsigned int *, unsigned int *, void *)' and 'long (typeof (__built=
in_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int *)0), ty=
peof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int *)0), typ=
eof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_com=
patible_p(typeof ((unsigned int *)0), typeof (0LL)) || __builtin_types_comp=
atible_p(typeof ((unsigned int *)0), typeof (0ULL))), 0LL, 0L)), typeof (__=
builtin_choose_expr((__builtin_types_compatible_p(typeof ((void *)0), typeo=
f (0LL)) || __builtin_types_compatible_p(typeof ((void *)0), typeof (0ULL))=
), 0LL, 0L)))' (aka 'long (long, long, long)') [-Wattribute-alias]
> >     2878 | SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __=
user *, nodep, void __user *, unused)
> >          | ^
> >    include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_=
DEFINE3'
> >      227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##nam=
e, __VA_ARGS__)
> >          |                                    ^
> >    include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_D=
EFINEx'
> >      236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
> >          |         ^
> >    include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCAL=
L_DEFINEx'
> >      251 |                 __attribute__((alias(__stringify(__se_sys##n=
ame))));    \
> >          |                                ^
> >    kernel/sys.c:2878:1: note: aliasee is declared here
> >    include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_=
DEFINE3'
> >      227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##nam=
e, __VA_ARGS__)
> >          |                                    ^
> >    include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_D=
EFINEx'
> >      236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
> >          |         ^
> >    include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCAL=
L_DEFINEx'
> >      255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__V=
A_ARGS__))  \
> >          |                         ^
> >    <scratch space>:132:1: note: expanded from here
> >      132 | __se_sys_getcpu
> >          | ^
>=20
> (...)
>=20
> > vim +2878 kernel/sys.c
> >=20
> >   2877=09
> > > 2878	SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __user=
 *, nodep, void __user *, unused)
> >   2879	{
> >   2880		int err =3D 0;
> >   2881		int cpu =3D raw_smp_processor_id();
> >   2882=09
> >   2883		if (cpup)
> >   2884			err |=3D put_user(cpu, cpup);
> >   2885		if (nodep)
> >   2886			err |=3D put_user(cpu_to_node(cpu), nodep);
> >   2887		return err ? -EFAULT : 0;
> >   2888	}
> >   2889=09
>=20
> This warning is reported for  many/all system call definitions in this fi=
le.
> The *new* warning is reported as the prototype of the system call has
> changed and the warning is now slightly different from before.
> So this report can be disregarded in my opinion.
>=20
> It might be good to figure out why this warning happens in general,
> but that shouldn't be urgent.
>=20
> Also this patch is not in the current tip tree, but already released.
> Is there an issue with the bot testing the wrong code?

Sorry for the noise. This is from a compiler upgrade, as tip of tree
clang has implemented -Wattribute-alias like GCC, which means it needs
to be turned off in the same way:

  https://git.kernel.org/nathan/c/175db11786bde9061db526bf1ac5107d915f5163

I plan to send that to Linus soon.

--=20
Cheers,
Nathan
