Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E026848A2C2
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918982; cv=pass; b=myuCn3kt6glvfm9kAEHW8LPpvqSD6WdxvPdMb6XueCBZyj19PzFVGU4xUB8VHjqMXN1jXTjvacVc00rdjFzCnu3e/fYB96USgVc/hYo9HduiUswgo7TRSMsbwx8VHbyBTUwtg8kmpYnbh9sqa0TqEibosYvVlpQcspJuetbVAEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918982; c=relaxed/simple;
	bh=mvkodHBxlLf/UgS7Colns3TvsFcgtHHOxTmj5HzEZMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbQVcBJ3g200ceudFJIOuLIu+x+vTWuXYzJHe5YNiN6/T6AuCapNqxn63P6SV+gFXDYOiqLavWh4l1rIfoYj1uwmKBpEB4S4UltDJo3PXfW+PB08KleiZjmeqmTMpy3AX9Uwg/HMWdCWuFejKemll6qoBvvBP0hGljay0n/TYZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K3feaDKb; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K3feaDKb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-697ebe536b6so1486211a12.1
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 08:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782918977; cv=none;
        d=google.com; s=arc-20260327;
        b=S+ywvfy9TMGWg4PsUohhTVNup2AZWxm2F50pRFgiwbEToCUtkTkj+lBJ3rlJ3SC5Ve
         r87vlD2BZsACa2oRds0Qpnvfck7JM7M8FZoYexYt3ixTDKLJg9vBLytFIBAlorT97H9v
         jllKcnM2tHiE937iFnq38WxsDHHvhFwiYXp8qpD3jzMcku7a63GT/b9bC80vDaCWKEKK
         45zneQHEVmNtIJc/TEglbTJFpN8h7aufH+vh3kseihoH+k1J9GgCgHa1eZG7cWTw3BuJ
         d7pF8oZzPVByjBfuerDjuQ7YWGcY2nVJ28ulZLmHq2PppdjyELsXqTRs14AIiDUmMdsy
         pEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g9Ct1t4oI3eGFO4X7XoqoWi2Q8Pv35qR9dPP8CVLRfQ=;
        fh=VRmZjeB+eq6AFYypHb6Cly5fsSHuL8DfgjBz/P1n7Xg=;
        b=U8Fvqo0eN1SM2uAXHWKwf47fwdq23NJjBGePSD+IhFLTpcbgHRBHdB4LS5fM2E9hC8
         j1BVp64mqIVSOaOMwyqNv0A9dP82jRBNRfHHLKujlGmvoo+JZxECA7LQRAevwoXgEahD
         hmoxpqGA6JlHsUAIzVgooRn0pRx4WYLXSZ0ktPliKK6eouxPC3gZnBYf9GmNE72JTLu2
         Um3MIC3UiY5AotPu5OftzEgiAqZVl8TqqnAAe8b0jDeLsdr/wbPST/h+k8Jwi0nCHinD
         23KfN6+mQYRxrObSocp+CUO2XtPdLXlxHdK6eN6THKZXdEb6yxsrKVUFa5XZ1vqWiWPj
         oBeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782918977; x=1783523777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9Ct1t4oI3eGFO4X7XoqoWi2Q8Pv35qR9dPP8CVLRfQ=;
        b=K3feaDKbzKFTbIzowjkWqt23KX/7HaR0cv3fo+F3IQgXBXpt3XrEWEb9OFlE8wytQz
         YVsoU/pKdlGVn80bAgO3WnWgYWnJ46YhaTcHAAtwiYigtRM4jlJm5hWPOQVTPGqS6tou
         vyBTceLqSUP5QQarddJuuHldafv2A1SNmGqzlxPjv+zKSpsx5SS51L85mY7+4UNk6unH
         BZM1N+Q6NPakfLD2fCWKA+7vOJIFfDYDKHgI3048Tv8l3Iu3jD7iPATZ4/QGd0WCENKL
         yPxwazPoWUVW8FI6NcWYpyCQfj2+qYUeknK9Nw10CiBUC8/7AmDXEJPbHtYkvQk/dC73
         /0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782918977; x=1783523777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9Ct1t4oI3eGFO4X7XoqoWi2Q8Pv35qR9dPP8CVLRfQ=;
        b=py/NrAtMYzM0VQnB6vQlMBphF+nwTlfyH2lbFaqOUGmoA92pMCnmb8fEs+IXCFAPST
         cMrKHQkk7FKPaSQD4/QOSVgF8it4c+EcFOSiEhV0jQJGSOZOUcq0mdZZtS3sDfi9ZpwU
         8LQddhGvRFSXm9YnV+yIUolsEOExeD/nTPkwaydU2EsQy4sTetZSK5Vk52RQItQ76fKY
         fKQKETeUy49LNhaNBxE/UcGbpZJyGztWU+VCu/CkuombatiT8MKf/SW9vn7r5YAIMFaq
         SdD/48d0g1gTU5QGReO+DrfKI5VlKmf5NjdJogKm4cU2Rd/wZnEQQhbkns3RRghDdCXb
         KwsA==
X-Forwarded-Encrypted: i=1; AHgh+RpzyETK/7C2qzvoKbxz5WZRyeV7AvAdlI6fUJR706G5SVntr33IbyXmdA/zhtg414HS8A+n@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4C1PwiwXpwIlsTvy3JytfesLz7fbVsgfNd9+VsO2+TWTZtiE2
	zZfTlMtws7hIYArcKk4XfI5TDYZ/9CQtCygaZaUKheUciU1c5OaT4YhyOsarN+m9l/GwJTbdNqE
	MpuLSaym/2UXuvkXhM7KBwYFVtNCPq0rGuuMpsj+D
X-Gm-Gg: AfdE7cm1s5v5aSlVLAl4J4dxx1h0DyiCA37kQW1/QVlsKX5WhUCb1vr4g5pSHarQB0g
	vk/luoS/tx4IbsTJF76ODpFywK0XJtt+ICg2MXt7zxKyKfwqpk7xxPQSYLGqARNXm2EyCbpuXkk
	iYrlna4rUic5n37eqh6G2DCLD6iKgLicEp7PmME5BDsyJevsYMDtJUpUAOh5oeS1vlBNQYPJ/aD
	5+V7QyEzlq+X9nWUvwo3TA4cSMfsQ8EBxL1knzG0ilhkqegKqZ4f64P3hQjtQxCJVPp1ueI9n1f
	JWBvwtEA4pwnBHuGp9dIkyqLr+RenUlYLeCq
X-Received: by 2002:a05:6402:34d2:b0:698:4699:59d with SMTP id
 4fb4d7f45d1cf-6989f33c106mr1053721a12.17.1782918976573; Wed, 01 Jul 2026
 08:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701125151.352632-1-voytikd@gmail.com> <CAG_fn=Wor0586c077D+0D+NYh+bkhqPhVVzoAANsaLGxbjLpTQ@mail.gmail.com>
 <CAAX90H31D3y-q1RJ=ah+hhPj2_apUh-rGtmwwp8vBzDNZcLH5A@mail.gmail.com>
In-Reply-To: <CAAX90H31D3y-q1RJ=ah+hhPj2_apUh-rGtmwwp8vBzDNZcLH5A@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 1 Jul 2026 17:15:36 +0200
X-Gm-Features: AVVi8CcT-ikLzaLh0i71cpWmg-Xsyf2H8TgZcmrLinyuDA6tKonIkBw_YC0GzxI
Message-ID: <CAG_fn=VA4P2YVNHSHxzeChFg45LhoYLnj4jrLMq+jVGnt__wPQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
To: Dmitry Voytik <voytikd@gmail.com>
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

On Wed, Jul 1, 2026 at 4:45=E2=80=AFPM Dmitry Voytik <voytikd@gmail.com> wr=
ote:
>
> Hi Alexander,
>
> On Wed, Jul 1, 2026 at 3:18=E2=80=AFPM Alexander Potapenko <glider@google=
.com> wrote:
> >
> > On Wed, Jul 1, 2026 at 2:51=E2=80=AFPM Dmitry Voytik <voytikd@gmail.com=
> wrote:
> > >
> > > This patch fixes broken builds with defconfig + CONFIG_KMSAN +
> > > CONFIG_DEBUG_INFO_*.
> > >
> > > To reproduce the issue before the fix:
> > >   make mrproper
> > >   make LLVM=3D1 defconfig
> > >   ./scripts/config -e CONFIG_KMSAN \
> > >     -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > >   make LLVM=3D1 olddefconfig
> > >   make LLVM=3D1 -j(nproc) vmlinux
> > >   ...
> > >     LD      vmlinux.o
> > >   vmlinux.o: warning: objtool: folio_zero_user+0x801: undefined stack=
 state
> > >   vmlinux.o: error: objtool: folio_zero_user+0x801: unknown CFA base =
reg -1
> > >   make[2]: *** [scripts/Makefile.vmlinux_o:76: vmlinux.o] Error 255
> > >
> > > objtool in verbose mode shows how the frame pointer is omitted:
> > >   make LLVM=3D1 OBJTOOL_VERBOSE=3D1 -j(nproc) vmlinux
> > >   ...
> > >   b15a2c:  folio_zero_user+0x7fc      xor    %eax,%eax
> > >   b15a2e:  folio_zero_user+0x7fe      mov    %rcx,%rsp
> > >   b15a31:  folio_zero_user+0x801      mov    %r14,%rdi
> > >   b15a34:  folio_zero_user+0x804      mov    %rbx,%rcx
> > >   b15a37:  folio_zero_user+0x807      call   0xb15a3c <__clear_pages_=
unrol
> > >
> > > After the fix, the frame pointer is back:
> > >   b15a37: 31 c0                       xor    %eax,%eax
> > >   b15a39: 48 89 ec                    mov    %rbp,%rsp
> > >   b15a3c: 4c 89 f7                    mov    %r14,%rdi
> > >   b15a3f: 48 89 d9                    mov    %rbx,%rcx
> > >   b15a42: e8 00 00 00 00              call   b15a47 <folio_zero_user+=
0x817>
> > >
> > > It seems the issue was introduced by
> > > commit 54a6b89a3db2 ("x86/mm: simplify clear_page_*")
> > >
> > > The actual fix is to revert the change how ASM_CALL_CONSTRAINT is
> > > positioned.
> > > Additionally, reintroduce asm_inline to prevent potential compiler
> > > rejection of inlining.
> > >
> > > Link: https://lore.kernel.org/CAAX90H2_RPnZL_dFYN7cQF6yt-wAweKKSx2=3D=
6e2aZ0kv+Pm+NQ@mail.gmail.com
> > > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > Have you tried running KMSAN with this fix?
> >
> > I tried running with the config that Thomas posted at
> > https://lore.kernel.org/all/87tsqjq3i3.ffs@fw13/
> > (https://tglx.de/~tglx/config.fail), and it still hangs for me.
>
> I only tested the fix with defconfig + CONFIG_KMSAN +
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT + olddefconfig.
>
> qemu-system-x86_64 \
>     -kernel arch/x86/boot/bzImage \
>     -append "console=3DttyS0" \
>     -nographic \
>     -m 8G -smp 4 \
>     -serial file:serial_output.log
>
> Booting from ROM..
> [    0.000000] Linux version 7.1.0-14280-g3dd2bc904bda
> (voyt@voyt-laptop-dell) (clang version 22.1.6, LLD 22.1.6) #2 SMP
> PREEMPT_DYNAMIC Wed Jul  1 16:25:28 CEST 2026
> ...

In fact I think the hangs are being caused by CONFIG_UNWINDER_ORC=3Dy,
sorry for the noise.
