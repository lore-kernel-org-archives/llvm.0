Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459991;
	b=3mNdtospGhRCI23Zb5+OGrHM//LTl4v0XxMSts5is/Zk+S44AeiMpo3T7eVv+SJf7BM8
	 Iw3t7GrF9B+A8det8mF5FVCC36nUwlZeH1TRTbkSp8spvbuq7B9esq+b+NSVpYtjarlhq
	 qFqaDqbWOyNKM4WQrUXSQodMM2C35yKAfJb4aIW/+Ko+FqeL0QQ9EcQD2K4hz1R5uqOAu
	 i6EKveSkoPuQiffxi1r5JAxoPSWklZNb2DTA+vLJ8QZwsJOOLesGI1RhPaJz6AeuICDBY
	 mYjIffIG29UkqssTeKNDzEvT5vChMZwdqUCcPRsIT8JGXBRO5f7TCKXljB4037BV8kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
	b=AtjVem83n3N70X7gSvU8CwO+BZbTZZ8pjJhzKAF3cHqqArZkt/A2UyUygpVOiaep5Qe9
	 e7acLmKmVaTDDD8QXToiQxGK+5bAAKRbGPYqjjx1PX8Pne2X7lDqxr8WVcYDT1jIXeU/M
	 n8jsdsOvLJPcqQ2MTBvu23hZxTvfIQZXrnnJOg5CijM+E+vwb/2fFNQOGSn/igJChkWpQ
	 B8BhhnDnbBbY07kJDnL/B0JjvxpjPoiLkmPTRT+iPryARfPJNASONr9+Z8A2CNerzv3Kx
	 AQUQYcqcBwDslT4/2nhmhog88m0RETwSnAaEHZoXaQqxUKuPCX43bZqapjoJFRm3m0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fgXb6eCr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE69606A327
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 18:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE69606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fgXb6eCr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so29179835e9.3
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 10:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459989; cv=none;
        d=google.com; s=arc-20260327;
        b=qk8cC4ESxsl+NTLD3/77b8jrDYEJ/D8mSA0hkh8k4DskyCOZRSnBpgEWG2mDbz5xt3
         Eu3f5nQdDMu3PC6xEawVtz/h8VWW+QkNxTskD3/WBDmEnzrj3vJHexv9B+HmULm7SGny
         mn6VlY3f+DSy4cBaVqPUWw+Z06IJnjaEpfRGmqHujViXoiEzsmDLLe3UVGLoPbo6QyCK
         G2EU016vGRKDFyCYoHNW+97s9/Wgzbc2Hkj8mar0Ev1wFGJF4AQ272A/bfEnLuOnrjhu
         ADYWwEulO+g91wdRgaJjI97xCPLCiFbwT2eR7DgYrVHvxksu9eijtG2q/SPCSOW6bRYi
         +uSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        fh=FPnqavAbvE76UC8s/ruUySocWuuo+dPZTLhqxiuNoPE=;
        b=WIXPQto+Ol0M7JsghoiP1grTMokQOV8hV8WwQdLdSJLqqMLaV3IofORLDcdQhnRAEF
         MS2fulz5lmkM2oObxuzE+ceCTvzeKmNj9faHhfA0zG4VhuUET/emcx9wjHjEWxjfrRmP
         Uy5XYOg5pzH9t8y2jDP5uSP9UNU7KvwLlTI+0qs5pujrL2ID2BzONKFBVx5MlCDF9POG
         zw1wnaDVxllYcG+wRiRTvJLjlrIl9F0SHYMB4tBEkXCdPDCH5X0NzLON9wBKcbLrda09
         EdHrsjUoLPoj/TTcg3HHLYjAO+862As7EmUv4zVFRcorskOMQY2ty6JA9TgKtthVRLPu
         +mvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795459989; x=1796064789; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        b=fgXb6eCrc8f/ujeRFYpXZpaxpYm4wT9uUY1FGV5RAHW3vTZvC/OwMoaVQmT71J5aAD
         hayBOMBNW6ItAgHbcvshDMkOwBq9RgwLSQF/Tmn80VutYqeoYzqcIq6RZfBeXxI7nU5d
         mWCMYqmJZnswkisMjpSl96LJD6gk6m5R6yjRGw3ZaWA7uzqwCJAbleFGZGnapThHBnOM
         bICdRK0Miba20+jvY5PRaNOiu8jBGffwcLtLR0riaLfCO1yweag1TXIi1q+YDJTtK2lG
         ox6TPcEVoDHPtR0F/vMa5fVBAXMUYm0g6AFB0VOg5PZbKOgeRm1u4nsJ0hrtO4udAHAN
         ariw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459989; x=1796064789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        b=RES3bZu3oqFua+bNPakuwZTH6BWzi/8e5SBFl3umvQ6/zSqhbnT+r+8ziIXCwftbjW
         MVPp6n5x2ekJ/2fT7KFEq5YN5ZhQwesrPSndENF7Kctxu0Ho6Jgs+S7CUl6739EdIbcZ
         rA+yW27uNzcE5+DgByd7MLuY9iv+g8Z7MIqSDIIu9HHmDOOH8MqAPOrdERZceR7uc7/s
         HTzESKLuLMiaXlgsKoz7SqohyLV1psDR26BXSDkQwXaGflnZKnL4jDcC8rnEzZxtOfvj
         hjD65Kp7oSdVppESgXVuJy0Lkbemz21jP1bTLdF7JSSNjAKIzCP6pTmAkw/muLwn5cVs
         ivoA==
X-Forwarded-Encrypted: i=1; AL+hErEvV6bjOKP8lMy/0mc3vZzHlae/XLtx9qd2A6HBLn2DuPXxkL9NgH0dUfrEbNCzmftes069@lists.linux.dev
X-Gm-Message-State: APuU4Z8/0QNNMTslZyYm0oQsmHvN/owEPid8jZcNjAW/G2WDVJCMflA4
	C3vi1A5Lewtu2KzeAbLCtng7leIA8gmWbwvVPZYFUG/wh6897ed9/eJU2QrXGSu3c/lXFpOLLbV
	c/LdV9IGm5DX7pBUNHfLqHVEHAvfs03+imSOhhGXI
X-Gm-Gg: AZFdTZcYAVZZLohSEMM6CpcuY3zMi6am+h8d8dbTUKGqplsqME/iA1vXyjf1niIl5Zb
	kzuSihNW70pclKBizSpQXhDIDS2tm+as+qvZVa076Jey1OZP7M7p7gz60yrfa6iPrgfXglTzNym
	Ls+Zc0pwyHOFiC13gUsb/pajRtH5Af+EuCqtf8j0ZFzeS9XOzYFe2TmELfA2ZHtNe0bwalwoFzp
	/N+VBxc/nQCYei2RldnJ0tRI6VYyswkACq34y3V+DWCC/sFj92bgOHFtVQsBbP96RiT59hvcpD6
	4H7lgphpNvxOK6x9ziLFW48JQ0m1geapf0Y9ZzHTHEsg1q6YGl6LiUw0PZgLENPW/bKD8mqwonL
	gbYPJiNNpbKnNXL5RSrWSrElRLcWvvi2uebZxDOPfCpiavQmywG6SceiOHc4VocXBGe5aDjCQ1L
	g+oa6Sl3QYUqQv5Mkkj5zI4lSwe8bSRF0xv6ddA0bDLlm+JzX1Zut/GKys6gOJDtsZ1pY4qxrlJ
	m8J/kfHbu3nhqvB7YNLUPM8UItOJ9ZvZdENMQ==
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id
 5b1f17b1804b1-4bb8893a963mr247968845e9.30.1795459987961; Mon, 23 Nov 2026
 10:53:07 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123025645.2385330-1-shingekinocore@gmail.com>
In-Reply-To: <20261123025645.2385330-1-shingekinocore@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 10:52:56 -0800
X-Gm-Features: Aa3M54rjSx1yo0dE65bPncdIJw5ozLFQnetXM2ws-XF0yEzirPrTrGmtq_bnHFU
Message-ID: <CAKwvOd=aZam1UR8O5okim1PJqjm5Biv+cBQUmA8ydctUd0v=QA@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Fix genex.S build with LLVM before 21
To: Tzu-Ching Yang <shingekinocore@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Marco Crivellari <marco.crivellari@suse.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 6:57=E2=80=AFPM Tzu-Ching Yang <shingekinocore@gmai=
l.com> wrote:
>
> Since commit 56651128e2fb ("MIPS: Fix idle VS timer enqueue"),
> BUILD_SKIPOVER_PROLOGUE uses label differences as the immediates of ORI
> and PTR_ADDIU. The LLVM integrated assembler accepts such an immediate
> only from LLVM 21 on, so LLVM=3D1 builds of every MIPS configuration fail
> with LLVM 17 to 20 unless LLVM_IAS=3D0 is set:
>
>   <instantiation>:7:11: error: expected an immediate
>    ori $26, r4k_wait_idle_size - 2
>             ^
>   <instantiation>:10:14: error: expected an immediate
>     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                ^
>
> Wrap both expressions in %lo(). For that operator, LLVM 17 to 20
> emit a LO16 fixup instead of rejecting the operand, and resolve it when
> writing the object, since both expressions are constants by then; no
> relocation is left. Both values are between 2 and 30, so %lo() does
> not change them. GNU as and LLVM 21 to 23 emit the same code as
> before, except on microMIPS, where GNU as now uses the 32-bit ADDIU in
> the delay slot instead of the 16-bit one. With GCC, the 2 extra bytes
> replace the 16-bit NOP that padded the end of the prologue, so all
> symbols keep their addresses; with Clang and LLVM_IAS=3D0, except_vec_vi
> and the code after it, up to nmi_handler, move by 4 bytes.
>
> Fixes: 56651128e2fb ("MIPS: Fix idle VS timer enqueue")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505071331.Z0N2eSkr-lkp@i=
ntel.com/
> Link: https://github.com/llvm/llvm-project/commit/b65e0947cade9bd39036a77=
00b54c1df4ec00756

Thanks for the patch.
Confirming that landed in clang-21.

Link: https://github.com/ClangBuiltLinux/linux/issues/2201
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> Cc: stable@vger.kernel.org # 6.6.x: 56651128e2fb: MIPS: Fix idle VS timer=
 enqueue
> Cc: stable@vger.kernel.org # 6.6.x: b713f27e32d8: MIPS: Move r4k_wait() t=
o .cpuidle.text section
> Cc: stable@vger.kernel.org # 6.6.x: 2b6d718c8dbe: MIPS: Fix whitespace da=
mage in r4k_wait from VS timer fix
> Cc: stable@vger.kernel.org # 6.6.x
> Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
> ---
> v2: only the stable tags change; the code and the rest of the changelog
> are those of v1 [v1]. The tags now start at 6.6.x and name the two
> prerequisites Maciej suggested [review] plus b713f27e32d8.
>
> What each stable series has today, and what it will get with the tags:
>
>   series  56651128e2fb  b713f27e32d8  2b6d718c8dbe  will get
>   ------  ------------  ------------  ------------  --------------------
>   7.3.y   yes           yes           yes           this patch
>   6.18.y  yes           yes           no            2b6d718c8dbe + this
>   6.12.y  no            no            no            all three + this (a)
>   6.6.y   no            no            no            all three + this (a)
>   6.1.y   no            no            no            nothing (b)
>
> (a) On 6.12.118 and 6.6.162 the three cherry-picks and this patch apply
>     cleanly. For malta_defconfig, genex.o builds with GCC 8.1 and 16.2
>     and with LLVM 13.0.1, 17.0.1 and 21.1.8 (6.6.162: also 11.1.0),
>     and kernels built with GCC 16.2 and LLVM 17.0.1 boot under QEMU.
>     56651128e2fb needs b713f27e32d8: without it, all the code after
>     r4k_wait in genex.S is placed in .init.text. Both were queued for
>     6.12 and 6.6 in 2025 and dropped because of the build failure
>     fixed here ([1] below).
> (b) 56651128e2fb conflicts in idle.c on 6.1.y and older.
>
> [v1] https://lore.kernel.org/r/20261104030147.3117325-1-shingekinocore@gm=
ail.com/
> [review] https://lore.kernel.org/r/alpine.DEB.2.21.2611040746160.6502@ang=
ie.orcam.me.uk/
>
> The notes of v1, unchanged:
>
> > No MIPS hardware here. Against mips-fixes (v7.4-rc1). All builds use
> > W=3D1 and kernel.org toolchains.
> >
> > - genex.o, before and after, with GCC 8.1 to 16.2 and with LLVM 17 to
> >   23, both with the integrated assembler and with LLVM_IAS=3D0. Configs=
:
> >   64r6el, 32r6el, 64r2el, 32r2el, eyeq5, eyeq6, malta (little and big
> >   endian, MIPS32r1, microMIPS little and big endian), ip22, ip27,
> >   loongson3 and cavium_octeon.
> >   - The objects are byte-identical before and after with GCC, with
> >     LLVM_IAS=3D0 and with LLVM 21 to 23. The only exception is the
> >     microMIPS ADDIU above. The 4-byte move with LLVM_IAS=3D0 is harmles=
s:
> >     set_vi_handler() computes the offsets and the length of the vectore=
d
> >     handler from symbols before copying it, and ejtag_debug_handler and
> >     nmi_handler are only referenced through their symbols.
> >   - LLVM 17 to 20 now assemble genex.o for all of these configs except
> >     microMIPS and Octeon, which the integrated assembler rejects for
> >     other reasons. For malta (little and big endian, MIPS32r1), ip22
> >     and ip27, these objects are byte-identical to the LLVM 21 genex.o.
> > - vmlinux of 64r2el, 32r2el and malta, built with GCC 8.1 and 16.2,
> >   LLVM 17, 20, 21 and 23, and LLVM 17 with LLVM_IAS=3D0. Where both sid=
es
> >   build, vmlinux is byte-identical before and after. With LLVM 17 and
> >   20, genex.o was the only object that failed before, and vmlinux links
> >   after. No new warnings.
> > - The malta kernels built with GCC 8.1 and 16.2, LLVM 17, 20 and 23, an=
d
> >   LLVM 17 with LLVM_IAS=3D0 boot under QEMU 6.2 -cpu 24Kf. That CPU use=
s
> >   r4k_wait(), so interrupts go through skipover_handle_int. Each kernel
> >   boots to an init that keeps the CPU going in and out of idle and then
> >   reboots; a QEMU trace shows every interrupt that lands in the idle
> >   region resuming at r4k_wait_exit. A microMIPS kernel does not boot
> >   under QEMU -cpu M14Kc with or without this patch, so the microMIPS
> >   change was not run.
> >
> > In the 2025 thread [2], Nathan suggested requiring LLVM 21 for MIPS in
> > min-tool-version.sh, and Maciej an #error for older Clang. Both would
> > also stop LLVM 17 to 20 builds with LLVM_IAS=3D0, which work today, and
> > the stable trees would need the same change before 56651128e2fb could
> > go back to them.
> >
> > On 6.18.y, which also allows LLVM 15 and 16, the patch applies after
> > 2b6d718c8dbe, and LLVM 15 and 16 fail and are fixed the same way.
> >
> > The 56651128e2fb backport was dropped from the 6.14, 6.12 and 6.6
> > stable queues because of this build failure [1], so 6.12.y and 6.6.y
> > still lack that fix.
> >
> > [1] https://lore.kernel.org/r/2025051415-unloader-likely-b0e6@gregkh/
> > [2] https://lore.kernel.org/r/20250521224450.GA2412476@ax162/
>
>  arch/mips/kernel/genex.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index be1b049d856f..ef27965f6ad9 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -146,10 +146,10 @@ r4k_wait_exit:
>         MFC0    k0, CP0_EPC
>         /* Subtract/add 2 to let the ISA bit propagate through the mask. =
 */
>         PTR_LA  k1, r4k_wait_insn - 2
> -       ori     k0, r4k_wait_idle_size - 2
> +       ori     k0, %lo(r4k_wait_idle_size - 2) /* %lo() for LLVM < 21 */
>         .set    noreorder
>         bne     k0, k1, \handler
> -        PTR_ADDIU      k0, r4k_wait_exit - r4k_wait_insn + 2
> +        PTR_ADDIU      k0, %lo(r4k_wait_exit - r4k_wait_insn + 2) /* dit=
to */
>         .set    reorder
>         MTC0    k0, CP0_EPC
>         .set pop
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
