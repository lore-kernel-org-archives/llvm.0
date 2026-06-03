Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116E1A681E;
	Wed,  3 Jun 2026 01:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451893; cv=none; b=F7QqCKWuHxJPZQOYGh5wmYSulBuRY08yBYC0dpvpDnQgWJsEKdUpjhwjSl08OHpRDtF8sJczj126fbMDFSPsFFj4XmsBu6SRs5JpOiSCnUyL+kNG0f/TmEjWXlk7gOq30b2/uN6jMUe42qtB/yRwaJe2XjdsrRqmPJPNYl7jnFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451893; c=relaxed/simple;
	bh=+h3rclTF76gBnOvYMdz0vo8VD0QRYeI0DIJd2MpaaCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ir7vWOopOKDEzkHC5e6iVWPsR47YvUgUjS1e0zIonvNiXmOuXDmLGWha+eWPCNGApTq4+KluGYWiWXzVTZsKxbIILBK9LMvLaWLsZHO/hIR7ZUvfz0F/uFtm1fpoPmqkLiI3NCDFa4+w5tBGNKm0xQWdYCY4w/1hlAFwLYG4R+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4WYRoTg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4WYRoTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000A31F00893;
	Wed,  3 Jun 2026 01:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780451892;
	bh=lO9jgRvdbaXrj8NP9zKcqARk0nBYwUf384UtP/TRNr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K4WYRoTggFGEkqv3KBw3RkVMbyFVNmZ7Y8Xy9rq8P3C9Vpu/oes2161BjhUXIvEyd
	 647rhjs0WUE0AcgV/dR1iol4VxLe25Amax0oN76gbodc29Fv1PkMM1EWa7GaqSo9F5
	 YV48iqJyzmoC+ygssBBviel71CU/uM0wjuRsWtbpaXRPyPBpM4VzUpQDbejfwLpqSV
	 Bm36y5EymfG9YnNnAaD8t96hSJOtzKMWQ4b5GuS7Tl3dzwVTaw7F+/BBvwEjNnwJZE
	 vhmTHM7/jEaQrRyhD5bKaSzjyHHjN0sGVFpmwtXO+ZsCrFBsyE04iT+fBwOb3YvE90
	 yMl2HZ1LEQIYg==
Date: Tue, 2 Jun 2026 18:58:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Askar Safin <safinaskar@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [brauner-vfs:vfs-7.2.vmsplice 2/4] fs/read_write.c:1219:1:
 warning: alias and aliasee have different types 'long (unsigned long, const
 struct iovec *, unsigned long, unsigned int)' and 'long (typeof
 (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned
 long)0), typeof (0LL...
Message-ID: <20260603015808.GA3014010@ax162>
References: <202606021605.feT4WbtH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202606021605.feT4WbtH-lkp@intel.com>

On Tue, Jun 02, 2026 at 05:01:04PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7=
=2E2.vmsplice
> head:   2d4099641dbaed4b98711fc7d8ec94c5aec0a0f0
> commit: e2c0b2368081bef7d1f6758cc9e7edde8521237c [2/4] vmsplice: make vms=
plice a trivial wrapper for preadv2/pwritev2
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260602/=
202606021605.feT4WbtH-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e=
5ab4f8a1f766febdc65ce89c00dec85393cfd68)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260602/202606021605.feT4WbtH-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606021605.feT4WbtH-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    fs/read_write.c:1176:1: warning: alias and aliasee have different type=
s 'long (unsigned long, const struct iovec *, unsigned long, unsigned long,=
 unsigned long)' and 'long (typeof (__builtin_choose_expr((__builtin_types_=
compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_co=
mpatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (_=
_builtin_choose_expr((__builtin_types_compatible_p(typeof ((const struct io=
vec *)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((const stru=
ct iovec *)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((_=
_builtin_types_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __b=
uiltin_types_compatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, =
0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((=
unsigned long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((un=
signed long)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((=
__builtin_types_compatible_p(typeof ((unsigned long)0), typeof (0LL)) || __=
builtin_types_compatible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL,=
 0L)))' (aka 'long (long, long, long, long, long)') [-Wattribute-alias]
>     1176 | SYSCALL_DEFINE5(preadv, unsigned long, fd, const struct iovec =
__user *, vec,
>          | ^
>    include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DE=
FINE5'
>      229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name,=
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
>    fs/read_write.c:1176:1: note: aliasee is declared here
>    include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DE=
FINE5'
>      229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name,=
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
>    <scratch space>:43:1: note: expanded from here
>       43 | __se_sys_preadv
>          | ^

This should be addressed in Linus's tree with

  175db11786bd ("Disable -Wattribute-alias for clang-23 and newer")

--=20
Cheers,
Nathan
