Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A433438AF;
	Thu, 28 May 2026 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954649; cv=none; b=S/gHpr8rtAffp1s6hfylSrYLf1CrnDu55b0kwK0sFruDI+ibTF3tdh24QlG6db7uRFQNytAnuuIqFq8Ffb/q9S238lrv940oL2pbT3TASueg0v39Ktxag9IyS9GrR7AxuwG36dGchlN0NI6Ao03fmfsSDbsIbVUmHm1QiCq0v6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954649; c=relaxed/simple;
	bh=7Zs5soTd+sfUGLIUoQVZFQQ9QpRrVSSpZW7l1EkGz7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaC74tvfQqguSdvzjrCOzew3nG6pvCM5wiREixd4Iv2GBKHvw237ooayY0h3mUp4FxhhL1dibNl3xb00mS0b1qbxjS7V5Vcj65FQ8tAQkd14zgfxLRvJDng7Z/bvpziqBc1ITytX0nopw8uCkf4Me6qHP0E4qaL7AXVDuOh+M8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NyBSmmOO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c55buQWK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NyBSmmOO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c55buQWK"
Date: Thu, 28 May 2026 09:50:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779954643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jycUB8TPd2j0kckGzRJwivvEPNeBXnEXHnUlstUvcKM=;
	b=NyBSmmOOnkpU8upwqTkr25R3HTsLqMG0oBYASGO1RFlzhlmpD4WjMH14z2JQygCjxUwRJ2
	/PfPYeKGQ5uoB74yHQa/KF/JO1sf/aIUWsbTL9l7BQMfNxlKBq0b0wE4S71bMcZKCLjK9q
	xwKyyUKL7iRpnVaCxHmdlBU33O+pmsy9cH1Ade6GwtpKxy8fhcUniw5ntscElgIQlIYw6G
	XkfLZ+340vgdrQcBIz8wIlVREZ46DSbT7fjFODTf2Whhu4fOmTSieAjQVmKj955ZJ7vliZ
	p6uLHJFSlQPgEElotFW2kxfHqQX5kASR1fUahlliuFXJVNlJN9wWCjF1PYvSvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779954643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jycUB8TPd2j0kckGzRJwivvEPNeBXnEXHnUlstUvcKM=;
	b=c55buQWK2Cn88o3JM1W4gBQD1RLP8+cU2frbELiptms0tB0QjYgk2e4nYyrov816WtWvaY
	7HED7JoAsxCeiVAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [tip:timers/vdso 10/18] kernel/sys.c:2878:1: warning: alias and
 aliasee have different types 'long (unsigned int *, unsigned int *, void *)'
 and 'long (typeof
 (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int
 *)0), typeof (0LL)) || __builtin_types_compat...
Message-ID: <20260528094452-62bd9d27-bacf-4bc4-a6c2-3ff60a6eb073@linutronix.de>
References: <202605281540.qUDQmxib-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202605281540.qUDQmxib-lkp@intel.com>

On Thu, May 28, 2026 at 03:22:06PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timer=
s/vdso
> head:   034779fb06aba5bc45faf366922bd77e4d36543a
> commit: 7158fc54b2c6f124eec0d7cd13bff69da0172e59 [10/18] vdso: Remove str=
uct getcpu_cache
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260528/=
202605281540.qUDQmxib-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5=
bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260528/202605281540.qUDQmxib-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605281540.qUDQmxib-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    kernel/sys.c:1793:1: warning: alias and aliasee have different types '=
long (unsigned int, struct rlimit *)' and 'long (typeof (__builtin_choose_e=
xpr((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL)) |=
| __builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))), 0=
LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeo=
f ((struct rlimit *)0), typeof (0LL)) || __builtin_types_compatible_p(typeo=
f ((struct rlimit *)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long=
)') [-Wattribute-alias]

(...)

>    kernel/sys.c:1933:1: warning: alias and aliasee have different types '=
long (int, struct rusage *)' and 'long (typeof (__builtin_choose_expr((__bu=
iltin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_=
compatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin=
_choose_expr((__builtin_types_compatible_p(typeof ((struct rusage *)0), typ=
eof (0LL)) || __builtin_types_compatible_p(typeof ((struct rusage *)0), typ=
eof (0ULL))), 0LL, 0L)))' (aka 'long (long, long)') [-Wattribute-alias]
>    kernel/sys.c:1959:1: warning: alias and aliasee have different types '=
long (int)' and 'long (typeof (__builtin_choose_expr((__builtin_types_compa=
tible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(type=
of ((int)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long)') [-Wattribute-=
alias]

(...)

>    kernel/sys.c:2517:1: warning: alias and aliasee have different types '=
long (int, unsigned long, unsigned long, unsigned long, unsigned long)' and=
 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof =
((int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), ty=
peof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_co=
mpatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_comp=
atible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__b=
uiltin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0),=
 typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), t=
ypeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_c=
ompatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_com=
patible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__=
builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0)=
, typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), =
typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long, long, long)') [-=
Wattribute-alias]

(...)

> >> kernel/sys.c:2878:1: warning: alias and aliasee have different types '=
long (unsigned int *, unsigned int *, void *)' and 'long (typeof (__builtin=
_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int *)0), type=
of (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int *)0), typeo=
f (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compa=
tible_p(typeof ((unsigned int *)0), typeof (0LL)) || __builtin_types_compat=
ible_p(typeof ((unsigned int *)0), typeof (0ULL))), 0LL, 0L)), typeof (__bu=
iltin_choose_expr((__builtin_types_compatible_p(typeof ((void *)0), typeof =
(0LL)) || __builtin_types_compatible_p(typeof ((void *)0), typeof (0ULL))),=
 0LL, 0L)))' (aka 'long (long, long, long)') [-Wattribute-alias]
>     2878 | SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __us=
er *, nodep, void __user *, unused)
>          | ^
>    include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DE=
FINE3'
>      227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name,=
 __VA_ARGS__)
>          |                                    ^
>    include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEF=
INEx'
>      236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>          |         ^
>    include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_=
DEFINEx'
>      251 |                 __attribute__((alias(__stringify(__se_sys##nam=
e))));    \
>          |                                ^
>    kernel/sys.c:2878:1: note: aliasee is declared here
>    include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DE=
FINE3'
>      227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name,=
 __VA_ARGS__)
>          |                                    ^
>    include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEF=
INEx'
>      236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>          |         ^
>    include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_=
DEFINEx'
>      255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_=
ARGS__))  \
>          |                         ^
>    <scratch space>:132:1: note: expanded from here
>      132 | __se_sys_getcpu
>          | ^

(...)

> vim +2878 kernel/sys.c
>=20
>   2877=09
> > 2878	SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __user *=
, nodep, void __user *, unused)
>   2879	{
>   2880		int err =3D 0;
>   2881		int cpu =3D raw_smp_processor_id();
>   2882=09
>   2883		if (cpup)
>   2884			err |=3D put_user(cpu, cpup);
>   2885		if (nodep)
>   2886			err |=3D put_user(cpu_to_node(cpu), nodep);
>   2887		return err ? -EFAULT : 0;
>   2888	}
>   2889=09

This warning is reported for  many/all system call definitions in this file.
The *new* warning is reported as the prototype of the system call has
changed and the warning is now slightly different from before.
So this report can be disregarded in my opinion.

It might be good to figure out why this warning happens in general,
but that shouldn't be urgent.

Also this patch is not in the current tip tree, but already released.
Is there an issue with the bot testing the wrong code?


Thomas
