Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9363A3546EF
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917149; cv=pass; b=J4mwNenMzsIFBtUhPSyLaOX7ipasjVrLSdxZ4tWBkpNbfqwLDA+m/VgRf1uu3WRClugBmvbEgsua5wwKi04WuT0xHJYtJA2LV+etHknxOVReR/rhWsIzfHcd+MAvdcA84F2IfCuWXtkB0p9lI0oWBA9OSAlIqB04FYUphWRF9CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917149; c=relaxed/simple;
	bh=bJEO/oQ7yFm0w+qdUyGr0FNMTVhZro5QNGVVzwLHYEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MagUsa6/l2HNRMoIjFWMfWJDD+UyQh8L4nDCX6EIW+zCp/iptHWcFnPcyxsQhd2zQfJevy4xxTNBg+YQmPTd10zMLnMx57CreJ/bKbMYTHaalXFr5geveHZ2IawlhesI7+lfVEFEBmf40t6ny3DUrhdOn+nYlmJZZAv+68KSMjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riraaef6; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riraaef6"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c125bce2294so93213566b.3
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 07:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782917145; cv=none;
        d=google.com; s=arc-20260327;
        b=DwlO34lUqqtj82OrVxc6glyjuxuR3mdMpbiaNRSgUGCu+ryEBZxITPODtpmKwykvGe
         0zJFJ5+RI9rh/Z6eYrSi/Yhq3Unh+wLukrtMXfhwYbEEYS9qap2GA6XUo0qZzQPGYmoY
         N+wpjv5i9i1ZcwNF9Lrtd9ZmPbUDHNYnh40zaepfy/iEF6l6jn9Bm29U/TwYsSZNwKi7
         5PuG+qywWEB2OUe7qz2hBfKBiaMFG51zHBWn9ucMs2VBXLqbZ9m9+umgE25HG4ug34KC
         TTe/1NsaAcI3llRkiMVo0nxHys2lZYP0flnAT21WliyXvgTUasmwMWGKcG413WmRlvm/
         d8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e4VxbfrJ8p894B+QfqkDR2gI77xQ9xtwNKhqCLX8M/Y=;
        fh=Dnj9fl3hRyKvXIQwC6agtPkiDWaCi3da42eY8X2p75E=;
        b=m3mdg+4h+1UwQJPX0PVKdGrENCXGofZdsfp76OnDOl01D7Tn3WN8wct7pTrFzp4fIE
         kE1ufHSAKdBVu1RteYHZhx8GUnXzs99OeKrzZpQy+ymq4APxnoU4A0r5hENjp7ZXL0dw
         PPGhRcyV9Ej8QgHh7Bp7yKQ2VyY48ArQbJ5TIjgKC0xYlevenqN0uKty7XTXZmB+sbo4
         dedADbj3lX3GqqPeIXVFxIBVRYetHRXMLdw/uUmOyO0gwV6PYp1Hz7bYsZKp/Wf3SBkD
         jnpFkowgQPzJkPi764JiA443bTxI4jpxgL93McGPBL1q1gc6cqt4PrrM/eJFkH7PqDMb
         LWjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782917145; x=1783521945; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4VxbfrJ8p894B+QfqkDR2gI77xQ9xtwNKhqCLX8M/Y=;
        b=riraaef6ibuY3bmrNiDQR9SYYg3Z7odDI/UOoTlKsozlEOh0LjYs+Luohp9Jsw9hk4
         WPKii6s0+WpGNdMjUCZIk8n+42Rk/IH53yqNHA2MzMdy97PYpgENouJT5hTpr4VHRQWJ
         BwLFCn2nKzHNMg+UCpQWKoLNy9hHwE/KAdGtSFdj4A16+2oJaX44gp2exB3hb90+gLMQ
         b/1cdjwsitJbNdhqLTZI80RpasKQxioWwKMfCJVnaOlzQQ+cvRcxxWVoa8BNSSZqNJ00
         tTHCdahZUWj134cND5+ubfPc/UVbncjqo57mctSifARTCCAe/+P1clqWSDyTPyPqMyvg
         YAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917145; x=1783521945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4VxbfrJ8p894B+QfqkDR2gI77xQ9xtwNKhqCLX8M/Y=;
        b=jnhkSqN/4ck5e9qYJYpvVzvd1CPhZXKDycxkYoCyKo7D6l6Gv/1IyowDjXu7QYNR/I
         xzuRMumDS4GycoEZtusBpT+Wa7GvqZ5x5596jMU7GMEnceH/McgcuTl2sWBNGqrTLGVj
         qnHEvsMhLoxCWxRxPaiuWo4nbmKW7bcrLuqZnom2cvLK+dOmrD0VhPAxDETeMFu15lVU
         36t83isPQPMZhIupSmf6UK7WQLbW3EQ1d8pGVTtBd0IQiU7esvxjlAI7QgxNkxWd2GUN
         09oumMHRJx/rch7m80kgNyeDwf6Wj7C+kQgYasdMIPFpFdVyn+ay555LI5trw3aLWYQ1
         pwsg==
X-Forwarded-Encrypted: i=1; AHgh+RropO0bYx8If+/Bbaoeja5rE/mnne8uLV9m4FiE6oAU8ZKXtYR7jZgSmLBH+DdRMFoSBeCh@lists.linux.dev
X-Gm-Message-State: AOJu0YzBa+Xaqgm72gxEGap3y4UWowV3+yMslr7n4zWd3iVJIpbHuLe8
	5/ba1jp1NyWj3hoJsM5ZVUsiHQ08gZ0yyMvS9qHiwq7zjYBhRIKQp7aN4ooKIa+oXnFa6o+Lp7r
	+VqXh7aOQHM9DWNj12FluJibQz51SWHk=
X-Gm-Gg: AfdE7cly1d/O3whDHzAwlvRyo41pNlzub4Gau6tX3j2VuhZEa82mW+In90twdiBJYpD
	n9pSu7i6dg4vJW3zuxz6Z3IXDu8REPFbwsiUsZHJ2AcXobruHFIyARADfqnX2nC+Cz3yDXacClH
	EHneT7mKHbb6a9cwjrGu7ow1CS3LVpeWXfXSqad5CMm0t+o6eJN5TCdit/T+/cW4h5IhJf+FMpa
	IXDTi4RBg6UylBSniDUDwblotMjM/xWVbaehlhGPi2H5LPsGp7fbST9JxUkQQMdoCqihpk/hXW8
	shs0HWQXfSPE8hIdVNfPjTSSfyvmDN832GNmAyWs63bPUCrlOLAs8AMsGkItqBrNFxJBiqKaIni
	qYHuAH4x9ZA==
X-Received: by 2002:a17:906:209c:b0:bd5:7c2:7622 with SMTP id
 a640c23a62f3a-c12ae84ed2emr37794766b.49.1782917144825; Wed, 01 Jul 2026
 07:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701125151.352632-1-voytikd@gmail.com> <CAG_fn=Wor0586c077D+0D+NYh+bkhqPhVVzoAANsaLGxbjLpTQ@mail.gmail.com>
In-Reply-To: <CAG_fn=Wor0586c077D+0D+NYh+bkhqPhVVzoAANsaLGxbjLpTQ@mail.gmail.com>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Wed, 1 Jul 2026 16:45:18 +0200
X-Gm-Features: AVVi8Cc5uxeIqIiWFOkSKOfAxIKeqvxsA19JWQ6Lc_aOQEpsu8EAzjAqokjWnsY
Message-ID: <CAAX90H31D3y-q1RJ=ah+hhPj2_apUh-rGtmwwp8vBzDNZcLH5A@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
To: Alexander Potapenko <glider@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Marco Elver <elver@google.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Wed, Jul 1, 2026 at 3:18=E2=80=AFPM Alexander Potapenko <glider@google.c=
om> wrote:
>
> On Wed, Jul 1, 2026 at 2:51=E2=80=AFPM Dmitry Voytik <voytikd@gmail.com> =
wrote:
> >
> > This patch fixes broken builds with defconfig + CONFIG_KMSAN +
> > CONFIG_DEBUG_INFO_*.
> >
> > To reproduce the issue before the fix:
> >   make mrproper
> >   make LLVM=3D1 defconfig
> >   ./scripts/config -e CONFIG_KMSAN \
> >     -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> >   make LLVM=3D1 olddefconfig
> >   make LLVM=3D1 -j(nproc) vmlinux
> >   ...
> >     LD      vmlinux.o
> >   vmlinux.o: warning: objtool: folio_zero_user+0x801: undefined stack s=
tate
> >   vmlinux.o: error: objtool: folio_zero_user+0x801: unknown CFA base re=
g -1
> >   make[2]: *** [scripts/Makefile.vmlinux_o:76: vmlinux.o] Error 255
> >
> > objtool in verbose mode shows how the frame pointer is omitted:
> >   make LLVM=3D1 OBJTOOL_VERBOSE=3D1 -j(nproc) vmlinux
> >   ...
> >   b15a2c:  folio_zero_user+0x7fc      xor    %eax,%eax
> >   b15a2e:  folio_zero_user+0x7fe      mov    %rcx,%rsp
> >   b15a31:  folio_zero_user+0x801      mov    %r14,%rdi
> >   b15a34:  folio_zero_user+0x804      mov    %rbx,%rcx
> >   b15a37:  folio_zero_user+0x807      call   0xb15a3c <__clear_pages_un=
rol
> >
> > After the fix, the frame pointer is back:
> >   b15a37: 31 c0                       xor    %eax,%eax
> >   b15a39: 48 89 ec                    mov    %rbp,%rsp
> >   b15a3c: 4c 89 f7                    mov    %r14,%rdi
> >   b15a3f: 48 89 d9                    mov    %rbx,%rcx
> >   b15a42: e8 00 00 00 00              call   b15a47 <folio_zero_user+0x=
817>
> >
> > It seems the issue was introduced by
> > commit 54a6b89a3db2 ("x86/mm: simplify clear_page_*")
> >
> > The actual fix is to revert the change how ASM_CALL_CONSTRAINT is
> > positioned.
> > Additionally, reintroduce asm_inline to prevent potential compiler
> > rejection of inlining.
> >
> > Link: https://lore.kernel.org/CAAX90H2_RPnZL_dFYN7cQF6yt-wAweKKSx2=3D6e=
2aZ0kv+Pm+NQ@mail.gmail.com
> > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> Have you tried running KMSAN with this fix?
>
> I tried running with the config that Thomas posted at
> https://lore.kernel.org/all/87tsqjq3i3.ffs@fw13/
> (https://tglx.de/~tglx/config.fail), and it still hangs for me.

I only tested the fix with defconfig + CONFIG_KMSAN +
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT + olddefconfig.

qemu-system-x86_64 \
    -kernel arch/x86/boot/bzImage \
    -append "console=3DttyS0" \
    -nographic \
    -m 8G -smp 4 \
    -serial file:serial_output.log

Booting from ROM..
[    0.000000] Linux version 7.1.0-14280-g3dd2bc904bda
(voyt@voyt-laptop-dell) (clang version 22.1.6, LLD 22.1.6) #2 SMP
PREEMPT_DYNAMIC Wed Jul  1 16:25:28 CEST 2026
...
[    2.274314] Starting KernelMemorySanitizer
[    2.274356] ATTENTION: KMSAN is a debugging tool! Do not use it on
production machines!
[    2.357699] Dynamic Preempt: lazy
[    2.390793] rcu: Preemptible hierarchical RCU implementation.
[    2.391032] rcu:     RCU event tracing is enabled.
[    2.391256] rcu:     RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_id=
s=3D4.
...
[   53.009112] /dev/root: Can't open blockdev
[   53.012357] VFS: Cannot open root device "" or unknown-block(0,0): error=
 -6
[   53.013186] Please append a correct "root=3D" boot option; here are
the available partitions:
...
