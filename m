Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D0448033C
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905667; cv=pass; b=ZAGIAXldmIS5arRgCWn/huVS9cmYcP/Hc800rEDZxThVr1m8YbmyBVDlJ+zHQnzbwThQ7l7NQ9Xe8mIROZ5N70z3O9HrTYAzl77f1E8SWTtPwQm6hFRqpV275JYCF55KkAldwMqIurw3K1JugSk7I2Hb6lXtIEdLpgcyHc+iwQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905667; c=relaxed/simple;
	bh=W4jIRWkMkdIsGUUuTl5uhgAhh9gHu3V6CoJE+iqvjRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIw7wetlt3QxHTA2gaRgzOzUfll4Eja1bgmsQaTiamFAY41YRlXvGiWAQJtehz3gtcf/uFwxjiLbOCLlhpm5nC4Xg1AFJEsoWmqD2jGau8cOcOmvXYQPEFt+DHL3nHS3WvAhY7pdeZ7Q3ce4Ydas361qL4b2nQRm3CJwELnh91c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ju2xzqce; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ju2xzqce"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9ed64d490so217641a34.3
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 04:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782905664; cv=none;
        d=google.com; s=arc-20260327;
        b=b4b4cYdZqExKh7ztDIKBAMRgMxuVp0xxkRxVLN9+w5T89EYJiSinteFKhdijNUb4HN
         tjQ/1u+TBOWduW77dSAyyymDDaXbYJsCvmCcJT90tbWRiELAc761gL25DdSVaNzKMAdP
         HlpRMa+wUfrkxEjFdeE66Op+vtsRGc++WXCdlWPlTbLI8DqwPrLb7zqb2RPmTagAknbG
         DEbztDe3NpIjDaa8NW5ADrIrSC8hrdZPDVO30ZQUn1q3aYlcd0dlIuPJRKBqbp0h0anS
         QoAzjqHEs+DzD2farU9d9a5JH+JG9bnZ7O097fWSoReoUfyPFa8cF9Yi4kWHHRdSpzpo
         HRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4faTMgKNiTFwecAROGzTjTqdDKLQ5/Ado1VdunwSeFg=;
        fh=9J9zQdEqEhCNC95NoWnmwpYktVFUuXG5Mtw5PQQkCj0=;
        b=SbaAcH0c/WCGUNLjqdGoTu6zKmkYgJnujH6+PV9Uiwv2Jay6DgY+nBZOTAZdGYSxfG
         iPbXutwBXzlXIoukA6J6V46/TGSrYZI45s2OYJwF3IWLlsgiLd1sbgww3hXshCXTaUc+
         qjiF0tBabUcaQozI6HL/jdl+wQHbt2v1eyyfAFlAmNrwqpjnh6KPPYcseMIt4oUCOQPG
         1p0Ioi6fMRwj8jidkKlTXD/OKEuFhIiKlzuAJ+5StewjT3JafpmIm8ViL6JOJnBh2QZ1
         5+DgbUDKrkEhzt33f6bVeutEbmLNNIzt8IZXhAc0DCNtWZnf0sRdYqIf2Y/z8a0jmmE1
         BV3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782905664; x=1783510464; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4faTMgKNiTFwecAROGzTjTqdDKLQ5/Ado1VdunwSeFg=;
        b=ju2xzqcewDaTftte4382fM2hpXFmOuHpIqJTp/s0yemONpr/fsVn8U8QQMeRLbm2x0
         f6psroMwoohINtIuxKOw6SOCYbQRuC9rYSVt6tRPkrMuyTtwaxTuw9ge5xwYNF7imfm4
         wnM7g06GAOvUwmR0gAseE0iVFf1807StTDrJv+F88O9nqip07TiimGbJEZOHoIAQnP0c
         CdCGMzx9NTYq/uR3rktSAdJIr65SSUrwJWPQOl9NGZ5CYXeRQ9qwkk4JNXD3rkOLDglt
         IAVojM8EWDns8mRpG3Rs8xVufyRr35nPKKJPXIkyVDDWtH3ZjG33jX2YH8N6Petc2cBW
         dyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905664; x=1783510464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4faTMgKNiTFwecAROGzTjTqdDKLQ5/Ado1VdunwSeFg=;
        b=M8DUxDDFZevbFVKyuo3YbTvQZyfYiR6urG/W22cvsOkm7+6U/ysmnJePbAYmF0F3q2
         Qo6KXnbOKpzyGpgjLePkT2nzoVkqIHJuPEYJ+4IRh22Gshhrdi+Yud2u508XjNMAuc1a
         UF+0D0RuWqsNfLjfOSwtlFpYT1ljN3mILQEyvpL1Y2BO7r+IaWK/xtaJArSSuJLl8S7i
         HJSps9OEhXRX//e1OTITpie9qaSqp+F7jStVOGnuKwn+L+nykJXyOM2NtAz8G4L74FH1
         lzReMzcHXfVPPErhLynhIGZMjVJM+Y9lbrmgm0r3vEmbZrYPbIGIFYmJL4MtKm7xg0+2
         y07A==
X-Forwarded-Encrypted: i=1; AFNElJ8OfSisb9Cr/I7vqWQFBqYxvp8ovU5Brh9VDVtnKGL0zeysriBvqOGkqUw4XcjyX1wpm3/U@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl1PsOu/nK+sJv0XBAv28jfh8HcOeEewlofxsWRqMK6NLd/24Q
	fhPvrx0/P4CAJtQlE9WKotEV84DUxVSPcScsSiC4GwzOQVdtcTYSv9Q8Zw7v65TqtlrWWfBEF0b
	DePHonfr9JhwSKqCkPjAOhsfujYg1qZzWuolmtiXrtQ==
X-Gm-Gg: AfdE7clTgzVNstxt2Jp1vyhHgatsupZWmPJceS2w0tcaxRG88nQ1FIAXBWATtb/bo8j
	aRYEREcCuSvFdoNW9Wr1ZN7Hi7NmJwNJdshnQhxCTZ6v/DvJMqXlK4jLDEnDkN89Thxtjj0sSb6
	R7gpLMLZLu4pxV5U/zOtUNFCF/i4MEbjlZuDFBZOADwqIE/clEo3tZCroVIQ68IOm4bsWMPoNsV
	aKHtJ6UaotZo/ZuLOtKLFSkTzzjw5yL/UpKw1TuNaa/ZryKzprJ1GcWzGcVHfIYJDCuoqODApI=
X-Received: by 2002:a05:6830:268c:b0:7e9:eaf2:ee22 with SMTP id
 46e09a7af769-7eb4cc4c951mr544254a34.22.1782905664119; Wed, 01 Jul 2026
 04:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d6afed2c271de42efe2a3580ea30c7601cae9c0c.1782877663.git.cuiyunhui@bytedance.com>
 <bf03528b891e5f09ec46d075649474ce5f2228e80afe1d6fe5481789e9dca9d3@mail.kernel.org>
In-Reply-To: <bf03528b891e5f09ec46d075649474ce5f2228e80afe1d6fe5481789e9dca9d3@mail.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 1 Jul 2026 19:34:12 +0800
X-Gm-Features: AVVi8CdSDzogNfvB7WcojkNKIVGKoMGTBqHUYhLn3ECuyFSx3CWlfNAiYqksifk
Message-ID: <CAEEQ3w=d_t2WDAa7Zmemm9fk-guMmwdX11wUFG2odFaCwz6y8w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 2/3] riscv: introduce percpu.h into include/asm
To: bot+bpf-ci@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	llvm@lists.linux.dev, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi bot+bpf-ci,

On Wed, Jul 1, 2026 at 1:06=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/p=
ercpu.h
> > new file mode 100644
> > index 000000000000..46f1901d3bb8
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/percpu.h
> > @@ -0,0 +1,283 @@
>
> [ ... ]
>
> > +#define PERCPU_8_16_OP(name, amo_insn, sz, sfx, val_type, new_val_expr=
, asm_op)                      \
> > +static inline void __percpu_##name##_amo_case_##sz(void *ptr, unsigned=
 long val)             \
> > +{                                                                     =
                       \
> > +     if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&                        =
                       \
> > +             riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {     =
                       \
> > +             asm volatile ("amo" #amo_insn #sfx " zero, %[val], %[ptr]=
"                      \
> > +                     : [ptr] "+A"(*(val_type *)ptr)                   =
                       \
> > +                     : [val] "r"((val_type)((new_val_expr) & PERCPU_8_=
16_GET_MASK(sz)))      \
> > +                     : "memory");                                     =
                       \
> > +     } else {                                                         =
                       \
> > +             u32 *ptr32 =3D PERCPU_8_16_GET_PTR32(ptr);               =
                         \
> > +             const unsigned long shift =3D PERCPU_8_16_GET_SHIFT(ptr);=
                         \
> > +             const u32 mask =3D PERCPU_8_16_GET_MASK(sz) << shift;    =
                         \
> > +             const val_type val_trunc =3D (val_type)((new_val_expr)   =
                         \
> > +                                        & PERCPU_8_16_GET_MASK(sz));  =
                       \
> > +             u32 retx, rc;                                            =
                       \
> > +             val_type new_val_type;                                   =
                       \
> > +                                                                      =
                       \

This does not impact functional correctness. I will rename LR/SC
fallback local variables to use consistent naming, and keep the return
helper separate since it only handles add operations for now.

> > +             asm volatile (                                           =
                       \
> > +                     "0: lr.w %0, %2\n"                               =
                       \
> > +                     "and %3, %0, %4\n"                               =
                       \
> > +                     "srl %3, %3, %5\n"                               =
                       \
> > +                     #asm_op " %3, %3, %6\n"                          =
                       \
> > +                     "and %3, %3, %8\n"                               =
               \
> > +                     "sll %3, %3, %5\n"                               =
                       \
> > +                     "and %1, %0, %7\n"                               =
                       \
> > +                     "or %1, %1, %3\n"                                =
                       \
> > +                     "sc.w %1, %1, %2\n"                              =
                       \
> > +                     "bnez %1, 0b\n"                                  =
                       \
> > +                     : "=3D&r"(retx), "=3D&r"(rc), "+A"(*ptr32), "=3D&=
r"(new_val_type)             \
> > +                     : "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mas=
k),                    \
> > +                       "r"(PERCPU_8_16_GET_MASK(sz))                  =
                       \
> > +                     : "memory");                                     =
                       \
> > +             }                                                        =
                       \
> > +}
>
> [ ... ]
>
> > +#define PERCPU_8_16_RET_OP(name, amo_insn, sz, sfx, val_type, new_val_=
expr)                  \
> > +static inline val_type __percpu_##name##_return_amo_case_##sz(void *pt=
r, unsigned long val)  \
> > +{                                                                     =
                       \
> > +     if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&                        =
                       \
> > +             riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {     =
                       \
> > +             register val_type ret;                                   =
                       \
> > +             asm volatile ("amo" #amo_insn #sfx " %[ret], %[val], %[pt=
r]"                    \
> > +                     : [ptr] "+A"(*(val_type *)ptr), [ret] "=3Dr"(ret)=
                         \
> > +                     : [val] "r"((val_type)((new_val_expr) & PERCPU_8_=
16_GET_MASK(sz)))      \
> > +                     : "memory");                                     =
                       \
> > +             return ret + (val_type)((new_val_expr) & PERCPU_8_16_GET_=
MASK(sz));             \
> > +     } else {                                                         =
                       \
> > +             u32 *ptr32 =3D PERCPU_8_16_GET_PTR32(ptr);               =
                         \
> > +             const unsigned long shift =3D PERCPU_8_16_GET_SHIFT(ptr);=
                         \
> > +             const u32 mask =3D (PERCPU_8_16_GET_MASK(sz) << shift);  =
                         \
> > +             const u32 inv_mask =3D ~mask;                            =
                         \
> > +             const val_type val_trunc =3D (val_type)((new_val_expr)   =
                         \
> > +                                        & PERCPU_8_16_GET_MASK(sz));  =
                       \
> > +             u32 old, new, tmp;                                       =
                       \
>
> This isn't a bug, but the two LR/SC fallback loops name the same roles
> differently.  The non-return loop uses:
>
>         u32 retx, rc;
>         val_type new_val_type;
>
> while the return loop above uses:
>
>         u32 old, new, tmp;
>
> The loaded word, the scratch/merge register and the computed field play t=
he
> same role in both loops.  Could they use one consistent set of names (e.g=
.
> old/new/tmp) so the two loops read as clearly parallel?  As a smaller poi=
nt,
> new_val_type reads like a type name rather than a value, and new shadows =
a
> common keyword.
>
> > +                                                                      =
                       \
> > +             asm volatile (                                           =
                       \
> > +                     "0: lr.w %0, %3\n"                               =
                       \
> > +                     "and %1, %0, %4\n"                               =
                       \
> > +                     "srl %1, %1, %5\n"                               =
                       \
> > +                     "add %1, %1, %6\n"                               =
                       \
> > +                     "and %1, %1, %7\n"                               =
                       \
> > +                     "sll %1, %1, %5\n"                               =
                       \
> > +                     "and %2, %0, %8\n"                               =
                       \
> > +                     "or %2, %2, %1\n"                                =
                       \
> > +                     "sc.w %2, %2, %3\n"                              =
                       \
> > +                     "bnez %2, 0b\n"                                  =
                       \
>
> This isn't a bug, but the read-modify-write LR/SC sequence here is nearly
> identical to the one in PERCPU_8_16_OP, differing only in operand numberi=
ng.
> The non-return loop parameterises the operation via #asm_op, but this loo=
p
> hardcodes add:
>
>         "add %1, %1, %6\n"
>
> Was the intent to keep the return path add-only, or could the two loops s=
hare
> one templated sequence?
>
> > +                     : "=3D&r"(old), "=3D&r"(tmp), "=3D&r"(new), "+A"(=
*ptr32)                      \
> > +                     : "r"(mask), "r"(shift), "r"(val_trunc), "r"(PERC=
PU_8_16_GET_MASK(sz)), \
> > +                     "r"(inv_mask)                                    =
                       \
> > +                     : "memory");                                     =
                       \
> > +             return (val_type)(tmp >> shift);                         =
                       \
> > +     }                                                                =
                       \
> > +}
>
> [ ... ]
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/284940=
34360

Thanks,
Yunhui
