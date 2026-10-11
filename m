Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17644305670
	for <llvm@lists.linux.dev>; Sun, 11 Oct 2026 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734197; cv=pass; b=CnkvT75dpAT+NmuPzyvUbILfUHNhpAO5B8QrebSxTfBEyGUXcRLNmOJYNQhgX8uP1CIPXnuvoRwAIvSOjZlse66PLtY++/NicnLeHrL+hw9xg7Rs1t9ulMAqxNeFtm+5JbJk+W9qh5YxxSNNAtXfWikO79xx8F+4g3HnGGgcvPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734197; c=relaxed/simple;
	bh=b/XiBDakbF89lmmL/yg7QBDutdCfHhvS3E5SYWziYTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIFX+nRt9nzXBrcipxcJ0eNOkm/VSiAaDvO/bomUCjMvZqUgjWBmFxj4UUJcNpfl9XF1UFBq9iiSlKf95ZXsS0j07o+2dqt0BQRIk5XiUDv6teLtj6JB6dKxW515FuBhbO2RyyiyhiXZ2Fal1mMkhv5/vkIM5oVrN7drehCIkDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RAQ1yM1Z; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RAQ1yM1Z"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso124450266b.2
        for <llvm@lists.linux.dev>; Sun, 11 Oct 2026 08:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791734194; cv=none;
        d=google.com; s=arc-20260327;
        b=HlFjIodWjrlljRxeliBxoq+kZ1XzD8BtmWay/nmOmAF/gRFwiEnkvcdRRGL8RgUPGw
         Ws8P9hI0EbZdnXTxQKX1glpyMtIARY5eAyV0BAPyfRbFMHjshroFTPLAvJZZqfJMcO2R
         fYuaSkzedsRAGNQouG3W+dxjhUzLUl1oozRDzYhl/05T4YRL6JnabDsLjy5k2tMUO3HW
         d8KztgnlPgVk+9zWkDHqVxWhv8HcyUpBKkeGNQqvqwRZ5N/0TlsBjBp18IOXQpqYtcdL
         tXv8suqlOvZZW7i+d3Nr5Tdqo+jCgkc6YA361VfowNC2LZz3GyhbcFmNShGqa391vq9x
         7aMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=69mUEVb+FPSu/fh8u3XwQJFXzwo7HE5rlDkjRk+VJx4=;
        fh=tKLtpn/YkmlIjICNUr8KVXDklG4KWbt7kjJGeSIDcf0=;
        b=EnAAXO4F4a2OHsJZDdnFS9I68wnI8KiCnxK/pv2/bIegxsuJ50dfM9qo0JAa2JMGvZ
         q4i/268CpCd/NHUy91X+we+sw00GMnQdCiWKmwBxMAw+OGQSTmmgUbtSfL1PsX/W/YgG
         ucHTLvmlcwOhWPN88wLf5wwoLjwHRCe6+dWTufauZcUV6/DFX/VIMvK06C7RPQ8jklCk
         8Brbb9ISzvZuT1vPoXjv3zsUab/Qo765ouMgSr4GvjdcdXuvXvjFh3tn6FIgFGQxtqkM
         U5403qtiTVlCwGJws8MOzC8c56EP/bPNDBeAagTbEV1uHoZsDgXmt5aCZx6LkZoH0S4X
         SsEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791734194; x=1792338994; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=69mUEVb+FPSu/fh8u3XwQJFXzwo7HE5rlDkjRk+VJx4=;
        b=RAQ1yM1ZGvNGRGDxdi3ioGxzqzaruNEjbXsvyBvs0qKKoREVwEIyhnXyvEWlABR96y
         nMAZeRMamAMCiukwYulOMxVoVCdTCGL/o3298Qqdzefmn4QPHdou/wCtgv7GMsbXXKCe
         VVXta6PkgkL+adr3WnPQiBgpQyX6rppMXRx+R948fg7ljmFxqxBMFqFcS/SbDwcycuir
         jTAdUCyTCt8zNjjz7U0YGJIazkmnwE6Jzn8Kjpa8EFU3vyXJ/sCcOPTNxeqFq+p+o0zM
         f5NrN5J92DXOlj0mZyFD40dox+KtShzDLTis3Dn4jm4Es8nDiSoMVCqzkf1Ej4Y4lWFH
         UIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791734194; x=1792338994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69mUEVb+FPSu/fh8u3XwQJFXzwo7HE5rlDkjRk+VJx4=;
        b=DmmwER5UrvnSoPtgUSfEANv7unR6IfNVs3Qt3ftK/bda3nKSImaj6W+Mex2ofnv0D7
         C1FVG7nKre3Rfgh7NPZNJTq41s4U0aVAhK9lD02X18cVRLnq/wbQpQ6vDm3NmYzKurdN
         mPaFhv8dad89LDhzdsOJz5m3gDiVK/Ibrap8o2Io7/niJ263MarSO4pODZ3G3zS9PKCx
         PkOhVahkIDn5oddCZtz2SGNA5acwcrUipa5nDjIWOYc0Rm5fdyInd2GAvRFHrQnSnt20
         /ytivAk2jIi5VV9oMKHlo/uoghlNVqQp2eWlq+aVt+JEskjkoVgTOQQ2cVDzXGiXhV6K
         dMnA==
X-Forwarded-Encrypted: i=1; AKwUvBxz13K87kSxXuctC7U+iNaHTwVXlFbjJPkRoFPvQTFEyUs/6349YzO2RUzKY52L2gPJz4A8@lists.linux.dev
X-Gm-Message-State: AFq9FYLVlgsCKY3U7Q3/gMWTgUMBGXTQLyJRpgFEyaMdEDdh4aOEuJNP
	PCxlJ1ar3OGPEvt7fcXIFHPVrDpQD8bfu1o04NidHCXQKDNRuMbpujD+He95bLQkhozb17oarFv
	jQBiFiX4d/48Jft/OvWbm2OFJdW1NPkt+ylIiWp3T
X-Gm-Gg: AYBFou1JA8EMpL2e+A1yyy4GyaeQrZJW7HU9Bz2bobAAfo7k3nCa3auQ+/APYa+5LlN
	wC5MDGX4JJ02j3PN+O06KvQgKnPzEsfk8NRrpq5lCQfDq/RA4QFFgXmicrxgiJY7TKKmGffIvHZ
	ohALWlZEqxgC7ulz7smVdNih+3g/fVcREDp/kXqeJlOmqFS0gswg1b/fA1tgYnen7u9GlezxA5y
	oEZucSEQ2sODJWoS184qajfl71VkkkUO8AAjusxrV4uq3SuC9SqvLjS0BJMd/+m8x7c5x2T7loi
	hCRQ1QFiKiUSFaVX5JGMkspIbTZXyQfSX2MEvIY5Idis0sISDQs+O6lGxjkVdiqxBA==
X-Received: by 2002:a17:907:9723:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c31aa0ae873mr706555166b.40.1791734193812; Sun, 11 Oct 2026
 08:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009130708.1370675-1-wusamuel@google.com> <c090cb17-9bed-4742-a1c1-92cae6ee239e@oracle.com>
In-Reply-To: <c090cb17-9bed-4742-a1c1-92cae6ee239e@oracle.com>
From: Samuel Wu <wusamuel@google.com>
Date: Sun, 11 Oct 2026 17:56:22 +0200
X-Gm-Features: AclHuK894UnY-2bV_b83ssiEWSWy2XODSINmzaUO32jvF7mSXzupNuemdMAaH0I
Message-ID: <CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ1wSm7sJ1w@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Resolve typeless ksyms in the kernel
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:09=E2=80=AFPM Alan Maguire <alan.maguire@oracle.=
com> wrote:
>
> On 09/10/2026 14:07, Samuel Wu wrote:
> > libbpf resolves typeless symbols by parsing /proc/kallsyms, which
> > dominates load time for BPF programs with typeless symbols. This mostly
> > comes from needing to do thousands of syscalls and a linear scan of
> > kallsyms.
> >
> > Call bpf_kallsyms_lookup_name() from BPF_PROG_TYPE_SYSCALL, such that
> > the resolution can be done with a couple of syscalls and a binary
> > search. This is a similar approach to what the light skeleton does. The
> > fast path passes the name and result through ctx, which requires commit
> > ae5ef001aa98 ("bpf: Support variable offsets for syscall PTR_TO_CTX").
> >
> > Any fast path error (e.g. kernels without ae5ef001aa98) falls back to
> > the legacy /proc/kallsyms scan, including strong misses, since the
> > kernel doesn't match LTO "<name>.llvm.<hash>" symbols. Weak misses
> > default to zero.
> >
> > Depending on the device, I see ~9-11x loading speedup when resolving a
> > BPF program with 11 typeless lock externs.
> >   - x86_64 VM, 6.18 + ae5ef001aa98: 147ms -> 17ms
> >   - ARM64 phone, 7.1: 626ms -> 55ms
> >
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 59 +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 58 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index cb09ded90773..7564ec6bde64 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -9590,6 +9590,58 @@ static int bpf_object__read_kallsyms_file(struct=
 bpf_object *obj)
> >       return libbpf_kallsyms_parse(kallsyms_cb, obj);
> >  }
> >
> > +static int bpf_object__resolve_ksyms_in_kernel(struct bpf_object *obj)
> > +{
> > +     struct extern_desc *ext;
> > +     int i, prog_fd, err =3D 0;
> > +     struct {
> > +             __u64 addr;
> > +             char name[512];
> > +     } ctx =3D {};
> > +     LIBBPF_OPTS(bpf_prog_load_opts, opts, .prog_flags =3D BPF_F_SLEEP=
ABLE);
> > +     LIBBPF_OPTS(bpf_test_run_opts, topts, .ctx_in =3D &ctx, .ctx_size=
_in =3D sizeof(ctx));
> > +     /* bpf_kallsyms_lookup_name(ctx.name, sizeof(ctx.name), 0, &ctx.a=
ddr) */
> > +     static const struct bpf_insn insns[] =3D {
> > +             BPF_MOV64_REG(BPF_REG_4, BPF_REG_1),
> > +             BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, 8),
> > +             BPF_MOV64_IMM(BPF_REG_2, sizeof(ctx.name)),
> > +             BPF_MOV64_IMM(BPF_REG_3, 0),
> > +             BPF_EMIT_CALL(BPF_FUNC_kallsyms_lookup_name),
> > +             BPF_EXIT_INSN(),
> > +     };
> > +
> > +     if (obj->gen_loader || obj->token_fd)
> > +             return -EOPNOTSUPP;
> > +
> > +     prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SYSCALL, NULL, "GPL",
> > +                             insns, ARRAY_SIZE(insns), &opts);
> > +     if (prog_fd < 0)
> > +             return prog_fd;
> > +
> > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > +             ext =3D &obj->externs[i];
> > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > +                     continue;
> > +             if (snprintf(ctx.name, sizeof(ctx.name), "%s", ext->name)=
 >=3D sizeof(ctx.name)) {
> > +                     err =3D -ENAMETOOLONG;
> > +                     break;
> > +             }
> > +             err =3D bpf_prog_test_run_opts(prog_fd, &topts) ?: (int)t=
opts.retval;
> > +             if (err =3D=3D -ENOENT && ext->is_weak) {
> > +                     err =3D 0;
> > +                     continue;
> > +             }
> > +             if (err)
> > +                     break;
> > +             ext->is_set =3D true;
> > +             ext->ksym.addr =3D ctx.addr;
> > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%ll=
x\n",
> > +                      ext->name, ext->ksym.addr);
> > +     }
>
> Great to see the win in terms of resolution time, but I wonder if we coul=
d
> speed things up further by resolving multiple symbols at once, since we h=
ave
> all the externs available (either by dynamically creating your program th=
at
> does symbol resolution as a side-effect, or adding a more direct resoluti=
on method)?
>
> A single syscall could provide an even faster speedup, so might be worth =
a look.

I tried resolving multiple symbols in one pass, but unfortunately the
impact was negligible and made the code much more complex. I profiled
a few numbers, and turns out it's because resolving typeless symbols
is down to ~1% of total load time (from ~90%), with the remaining time
mostly spent on BTF loading, CORE relocation, and BPF verification.

> Another concern would be a lot of production kernels won't have BPF test =
run
> support baked in, so relying on that without fallback would be a problem.

Are you referring to BPF_PROG_TEST_RUN when mentioning "BPF test run
support", or something else? And totally agreed in that we need a
fallback, of which it currently falls back to reading /proc/kallsyms
on any error during the new fast path.

> > +     close(prog_fd);
> > +     return err;
> > +}
> > +
> >  static int find_ksym_btf_id(struct bpf_object *obj, const char *ksym_n=
ame,
> >                           __u16 kind, struct btf **res_btf,
> >                           struct module_btf **res_mod_btf)
> > @@ -9863,7 +9915,12 @@ static int bpf_object__resolve_externs(struct bp=
f_object *obj,
> >                       return -EINVAL;
> >       }
> >       if (need_kallsyms) {
> > -             err =3D bpf_object__read_kallsyms_file(obj);
> > +             err =3D bpf_object__resolve_ksyms_in_kernel(obj);
> > +             if (err) {
> > +                     pr_debug("failed to resolve ksyms in kernel: %s, =
falling back to /proc/kallsyms\n",
> > +                              errstr(err));
> > +                     err =3D bpf_object__read_kallsyms_file(obj);
> > +             }
> >               if (err)
> >                       return -EINVAL;
> >       }
>
