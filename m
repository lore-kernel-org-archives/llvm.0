Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30FC3BCD17
	for <llvm@lists.linux.dev>; Fri,  3 Jul 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074886; cv=pass; b=s4olzhP7tjO5l2Ttm4ZI5XMKO+zfiU4uzrohEGEAg2IxnzLZQppDbeG2ZqErpxp294FbT2TglajKwdf0FOUJVmWhRlAWZVGuNJ6wQs7BEyrYxISZYPpq+AnRUw3J4pxjPqCdfjc3s47N1AJajVaHqXEgfLs7KhXjIpcjgWGCig8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074886; c=relaxed/simple;
	bh=Fs2CmYxbU+mlQVEyAgokNOpFSjVBOFACynX9Hr/8NwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClYmc55b2qSLDIacxCWimTQ56MMWkURPqIyIElgu03dBJyKaP5L0nrq3rxMn8ZiGJW7swv3fM4tNduBImIWVQM43OZ8Oh20dqYV8WhhtNr9WX9jZrDYo1qlEDWaRUrI4rNWHFE6px8iBLLwpWyUNB2EzUc8oFu75o0wj8E086hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqaJvQ6p; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqaJvQ6p"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso865438a12.0
        for <llvm@lists.linux.dev>; Fri, 03 Jul 2026 03:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783074883; cv=none;
        d=google.com; s=arc-20260327;
        b=moqvcndNpQfPpG4TU88WYLAilyHmDwWPI6GEKJytGldRznn/m0gIImwiLunuNDkdG/
         eDmTFUGsF42CqHlJeCgoioNPiCZNNvEuKev0Vg6HI8SSEGt0H+ykNUWqU9yZeSq4eUSk
         +FvTHHPXH8vgKouNneIppF8UPcNLQC30KhacZaf7Nj/tlTwZSOFGXJFzVniTo98ne13A
         ksxNy3eBA5aBgdrKM+77oowIdxA6zHpiOkxHo3QYuD644fg+9t/i7mF4kt9aqh8jYOEt
         YfkwE2TltPVPvNqSK8Qtec15wSs6QudXu9zA9xHSGO6E+kKud2rH9bZxKw9Yzj2c8UnX
         HM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h8LUR4Sbsf/2HA6eQ/tW5neVxNihHuerj3teR8ao+Zg=;
        fh=H2VLI8x2nipITaneJ7uEZMNrq73h8+MWQPT+7sHdk2k=;
        b=HgGeuBKcdxwSt/1CPOQcIVGFewEPEpZ+tG0aka/2pkd+vevOD6jOYs3hPfpNUaGBzP
         9fDSK7pbEnf302EfDY0awn9LBlqmWhAK0P9bFP23GIUWY+8YOv6k+yUIKdq0DONpX1z6
         h/8mdjAXy6bdTQBCl+rawFDkg+gYFTgyV6pnB35aotw11pkCFL/bFNVh47WlWrRakDa6
         drG9j7fGJlo/ecvM3IvkQc8JpZrJLFq8buNHl0dFLieDHrgOwz89MC4gUwfi0/tb93lG
         w0aWqNhJRyATxjok+kDwqMfvdv0ARokZQO9CJvbFjprqHXUgdVuaJA/XpDdkSa2VG9W4
         TPBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783074883; x=1783679683; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8LUR4Sbsf/2HA6eQ/tW5neVxNihHuerj3teR8ao+Zg=;
        b=aqaJvQ6p9rhSteJcp3IaJGp8AtiVxmE9w6814o/1rSkJY3W2tP7ut9YLLI4IfqFP6H
         7Je9I+tVIXvHzGj3ejz8NZjEhKxJHdMvi7DOG+urb+jIWSgElGy1aPGhMvV3SPEGv96P
         hf3bJeumfxBMByB4blPtspOL705sGuKKB5aQ6SJxUjNUuKDy4q2WbkEdwTKB5wxPnDl7
         BrmJIq1o+ry1tXbcSpwvoUDQSE/XwZgCaemfSRYx129flr2XwUj8lb+cwsOve09imUZE
         6PuUo9L7sl5PY1LYdFcgu+2GZVOK15WVBJCerlYjyegyLK5qT8x/3OPRnHsKbWpeRiIR
         DpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074883; x=1783679683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8LUR4Sbsf/2HA6eQ/tW5neVxNihHuerj3teR8ao+Zg=;
        b=I6WuLqlAo9ODBGGuAlSxVnRazXvSlRV7jSxN0vV8CyaMaYbFYrvrrETQOSP3uCZPXU
         Vp7/zGSplr0tKd5Bos5hnY8o7lQ8HDYYLV0PQBMSKynQc62Va8VYpIx0dzAPVH5GE2ht
         R3W3Sc+6YO4X17a4Xhv6kf9od2ssrwuoczW7beA6rj6Ft9OP279CqjSEWe3lLaf7aqTr
         LTdBtpIroCQDnM0qF0GHv6UFJmwB6ttwEehtQ3BazFKy6jPhW8LxkKOS0jFYcZdGIR1W
         H2u79Z9vCi04rwHL3caMFgrrg6zMkhCKiOafQRplDXTKbljYlHLvsekU+CH1wMDrojSO
         O31A==
X-Forwarded-Encrypted: i=1; AHgh+RoxzqNRGG0alN+il0Jwg6baLaToypBJULAUJkTOvWxXpLoozfjHBnixAYhyS3Yi52VSPo6V@lists.linux.dev
X-Gm-Message-State: AOJu0YxXUsnicDEF37jmCzOwKx1SfayQe3JEtuk/TcgMdbqjuWj1j6QH
	u/E4AlUfp200/5dR9QayNaOO8LAB+cPa/eyQCb4ADHjXKZFEH7Pc7pAO3PesuGlMis0Zykw/Rjc
	dD43R96Tv4mwfY4dqKklxkfn+4mGnI5Y=
X-Gm-Gg: AfdE7ckwieq8NjTpcqWI/wuE90mk4i+g5kgxerTL4rPdvej/BJL+KTREPkpUjXSKvRg
	bjPNX+1Yjqj9cdzK+G8DDlCXJoj1XJ5wrH9yzzgZvHaPkjvNEBYZM6M77qu4jfbru8Jacmdelpe
	9IiwGcmHKj3S/9GoDNKhNvHoXWpxXlxf0TnOp12s1PRurwuFXidlp0zOrGrDAtIxEbJ8+4pmYqr
	NdvOqwrkCfrN1aJ+2izYz36CSOlYSQUdROGwzxkeJgkG7rtVv6Kcxv+ifjSTT5k6MOBTyIoXlGZ
	QEXf3dhvA+yOmLqs3GzcOlFZ8Dh9jePePB7UyxWFkXlxcdMH3rtEM6OGAcWQDqFcW5OT4UQdftB
	pE5YJGXky0wW+Q0yyV8TY
X-Received: by 2002:a17:907:3c96:b0:c12:39b4:413a with SMTP id
 a640c23a62f3a-c12ae4a691dmr467743866b.23.1783074880994; Fri, 03 Jul 2026
 03:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701125151.352632-1-voytikd@gmail.com> <20260702025342.GJakXStrsCmIRnEwFD@fat_crate.local>
 <CAAX90H0V-=Gy1FyBT9qop2=RvhBxbOPLu6+DYpPH2pTehT=nRw@mail.gmail.com>
 <20260702111550.GH751831@noisy.programming.kicks-ass.net> <87se61npie.ffs@fw13>
 <87mrw9nonk.ffs@fw13>
In-Reply-To: <87mrw9nonk.ffs@fw13>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Fri, 3 Jul 2026 12:34:14 +0200
X-Gm-Features: AVVi8CeNxREOJYVsvGFt7qdLJ3ZpuKcTnebSQ9SjudTefEGZU-k9b63Ysrg3hes
Message-ID: <CAAX90H3Nw+=gKOxPXpOwvDrbvWzUjgtyGoRJhCwsWz61s2XbQw@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankur Arora <ankur.a.arora@oracle.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, Jul 2, 2026 at 10:05=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Thu, Jul 02 2026 at 21:46, Thomas Gleixner wrote:
> > On Thu, Jul 02 2026 at 13:15, Peter Zijlstra wrote:
> >> A quick test with folio_zero_user() seems to suggest the
> >> ASM_CALL_CONSTRAINT movement (your patch) generates the same code for
> >> defconfg as does the unmodified code. The change from the thread linke=
d
> >> above (input constraint on __builtin_frame_address(0)) generates
> >> different code.
> >>
> >> A third option is to force FRAME_POINTER=3Dy for KMSAN builds -- for n=
ow,
> >> until clang is taught to be less insane.
> >
> > With FRAME_POINTER=3Dy I get now with clang-22
> >
> > vmlinux.o: warning: objtool: folio_zero_user+0xa7b: stack state mismatc=
h: reg1[4]=3D-1+0 reg2[4]=3D-2-336
> > vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x64: relocation to !END=
BR: machine_kexec_prepare+0x8f0
> >
> > That's with your objtool patch applied. When I remove that then the
> > folio_zero_user one goes away. The relocation to !ENDBR stays.
> >
> > Oh well...
>
> And none of this boots when KMSAN=3Dy ....

Thanks for checking this!
I wonder if we are debugging clang here because I just retested the patch w=
ith
CONFIG_FRAME_POINTER on the current Linus' tree and it works in my env:

clang --version
clang version 22.1.6

git pull -r
git show -s --oneline -2
21f3d2b2069e (HEAD -> master) x86/mm: fix objtool failure with KMSAN enable=
d
d2c9a99135da (origin/master, origin/HEAD) Merge tag 'device-id-rework'
of git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux

make mrproper
make LLVM=3D1 defconfig
./scripts/config \
  -e CONFIG_KMSAN \
  -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
  -e UNWINDER_FRAME_POINTER
make LLVM=3D1 olddefconfig
make LLVM=3D1 W=3Dce -j(nproc) bzImage

grep -e CONFIG_KMSAN=3D -e CONFIG_FRAME_POINTER \
  -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT .config

CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
CONFIG_FRAME_POINTER=3Dy
CONFIG_KMSAN=3Dy

qemu-system-x86_64 \
  -kernel arch/x86/boot/bzImage \
  -accel kvm \
  -append "console=3DttyS0" \
  -nographic \
  -m 8G -smp 4 \
  -serial file:serial_out.log

grep -e 'Linux version' -A1 -e KernelMemorySanitizer -e 'append a
correct' serial_out.log

[    0.000000] Linux version 7.2.0-rc1-00009-gb0b29f0286be
(voyt@voyt-laptop-dell) (clang version 22.1.6, LLD 22.1.6) #1 SMP
PREEMPT_DYNAMIC Fri Jul  3 11:55:02 CEST 2026
[    0.000000] Command line: console=3DttyS0
--
[    0.218380] Starting KernelMemorySanitizer
[    0.218382] ATTENTION: KMSAN is a debugging tool! Do not use it on
production machines!
--
[    4.037384] Please append a correct "root=3D" boot option; here are
the available partitions:
[    4.037772] 0b00         1048575 sr0


Could another CONFIG_ be the culprit on your side? Or, has your clang
version some different (buggy?) behaviour?
