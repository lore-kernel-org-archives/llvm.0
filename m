Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7641F49BB68
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176945; cv=pass; b=gkt+WqRQ1hQWsyU/603XXgniEt4hm5ETZi6hTzGWnMd9e0KNB2YplaEdamPZi+AMNz2iWBO1D4vQR3ziJugDbBe8LdQhrZ+1HC+z7P4dMHIv8kWZ48HL0xDL3foUaLSeq5W0XXuV2kxqguhghbwsaxfD3dvvMtD7WifLIBFIIcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176945; c=relaxed/simple;
	bh=1b3l1S2U0IeSv/QvOzf8c5X71ocbK46nZ4fIx0EPyIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbKNLMwrV/59Lq7FTqcFqzRHT0WYO2VxBurcFZujP4y1XnYf4jbf6P2TpSxC1Pa5udruNojceqdfP6laADMYa2ED4OGZf4NmPibr9ysLPxF6aJ88DgjNllG8sQattUDZk90uxjTz93N0+5Zt5ym8rCB2LMkP7tjEUox228OWqQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAU/LsWE; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAU/LsWE"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso221978a12.2
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 11:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176944; cv=none;
        d=google.com; s=arc-20260327;
        b=HQgAZ1332ycnJvNkJqxJwUswMupJIFgoVGdtI/3EmW+FrMMMqvZyhhFzp/HF43HbzG
         pXHjPxC8wvfl10H8nUB0oXK5YEoLYcGSZE1+o3Y77xcLxbK0YjES0LDyB88I8I4qEmby
         vWknvpm/ANz5YwMdTrccaRHDb9Pe4YGZPcea2JW7dc+XY2Q2r68vR2yRJ/Jllkk+CbHK
         Py/CacbGZZtylEfXUia3ZWCVP9pYWWGIpSIJ/1+oqioRLJHc5A78fNV4nJU/PEaLibgD
         VFDXh4yCgBWuu0aNDsttkg+q+gNRn815oxV/V3h6yqvDRAtpOGxd7Vqgr7B1pCPyZ8h5
         h9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+xIg4uo6CKkH27g0w/i7+r2VZ1i9gtFiDMjRJWV7+k=;
        fh=Sd5cSBI4NxSSAJPlwgu76kRz/lA1n89iCNhPo88NCOw=;
        b=P88nuGtq5aibRgmXgH6ul113MIXGMcBvmS1lMMkdWK3dPIq970ihRMg/AbESQFbaEL
         yopOGylz0AeLYPb/Rd0/Uju2Ym2tK2KOJjnWDOzaTvuFetQRNIVg5gR7pjND9FSqLM5r
         Qc0Do0o9vycR8+7oHQZ12u9SYxxK1x+UaQCzDMzRA2IyCyVOFQr/qsRwBmODTNtPgtPc
         7fXJUDRKp8Kt7eaWeX49a6ykP0HiWboILxb5GKIerV5OKuN73RB+FQirtI1kDZUJxmdH
         rzkbOTyU+Hj7nEx6MvcsAGrv8KB1tXvwKJtxcc61JtbD9khWeeHcxFKGWSsZsUgWCA3x
         qU5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792176944; x=1792781744; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e+xIg4uo6CKkH27g0w/i7+r2VZ1i9gtFiDMjRJWV7+k=;
        b=DAU/LsWEMV03r2NgeDgYeQiy+pofaCZHKVbp8YQojhB+QHacSx0J5p3084fI5JKR5Z
         OM1ULW3tPsZr9skyniSH0HhnknHkNtyxuMBUPX3cAyxAp4BJN/Ql1DpLH+/1azD6usYR
         prM1ZF3xfpD8KgigzgYahQGqNXGrzDYZMTbeT+QR1NJvlQ0fXQJEPRQtogx11+76sjL9
         FUWOmGFvZASTm/B4Jc8A08OqRVuo4lnZl1rpbNW/wTLmnNSiaaPKrtlWqnBLPfmo/mNj
         lhVUKvGNIois+60KXupgk8KvctnbyuSlTGM9B05dc88HTesrFWGc2Xl2OMSf+ERicCBZ
         0Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176944; x=1792781744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+xIg4uo6CKkH27g0w/i7+r2VZ1i9gtFiDMjRJWV7+k=;
        b=0q7ghiWYmS4XVUIgyytnJUVN3WgZkghhQRaz9DsJvegwJ6BMghvS96bfp0KdLUJVx0
         NUNflUKhzsZqtaAv3xdMX8R+cNu/NToQQHZvXZqmbcI+TJOmc8lrYuZvlabA2pyO5kFr
         KI6tn8VpwrJSy7B1QuJSoicBmQmI00gK6gwMK7XuJ4T61ge8LC9JeJAQ9/84oP56jfIe
         0mpAEi9XLmCN3XqKBNQcJeZPAdhAm/UkHgFpzCvPxPCdM/FVZYrKV1nfRSzxNF2Da6kg
         lqcTDA/vmpydhfp9D+XDmYcJeHuI+6ft0t9iyD1dzVazX+JFRxSh88IB5uc4XW25Yf6t
         38dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl6zsiDdcVpiWSBkmf8WgR4WjTmmB28T6CxXp8qa9sLFMCxiK8mOGkXQqKbz8Pq935GtIm@lists.linux.dev
X-Gm-Message-State: AFq9FYJZ9ZXiN8gTmNQQuSd/fcvYo+JmQ4T9BxWRzso3NjFiG8h+7Y5z
	Zlv2CqOU2ta5TpLDKawvoG3A0P5Hnwazo+/0bPbhUwNpSs7zs+JW5vyUnLHZOlCOF8qnCN4g3T0
	lexDy8JvwZWe9XJj5jW3vloeuL4S7DBQ=
X-Gm-Gg: AYBFou2XLJEHI17NfgteDgcIdlJaa6HH1z0x4gg0d6nmfxZdknSE/L3bHgHSN/7stzh
	A2LyXZvSASRPDAPpXvQflq3PgKozHc/93CMmRyftAXJ3y02fo177Qv12+46319FdsHFfenwGnBJ
	Eu+LJpnS3JzR9XlhuFYa8uikvPE9R2SO/n9qxt3hPM1DbJtPIksvuazdZEsU+Yrx8G5OwuWwhsN
	JI1M+REVgQZTegb5kS6vAGQHgKThuWBHYiJAiZ8Y2Ql5g9TSwCdMgGrtG8Bl97utm1H62oFC9/p
	d+HaxTDNOpYv67vi3FEmjwdPGRXSixPuMHdoeC6XnCH2bQeO3jWikE2+d4DS8kIX5ytcwVfGzfe
	FCvP6DfPGqkog/vKDJIy1O1q1nDsnlFbeacGZ
X-Received: by 2002:a17:90b:2e45:b0:3a6:dc51:cce9 with SMTP id
 98e67ed59e1d1-3acef10a75fmr661384a91.57.1792176943703; Fri, 16 Oct 2026
 11:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009130708.1370675-1-wusamuel@google.com> <c090cb17-9bed-4742-a1c1-92cae6ee239e@oracle.com>
 <CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ1wSm7sJ1w@mail.gmail.com>
In-Reply-To: <CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ1wSm7sJ1w@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 16 Oct 2026 11:55:31 -0700
X-Gm-Features: AclHuK-cBrYRS_O8fHGSWtkg2J2Lupu1xGROacOaq8RNVp1uJrrftZ6oLOb2wes
Message-ID: <CAEf4BzZQ6uyOOj5gCZyVnqdswtn23wAVWWWsNEH3Ay4drv051Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Resolve typeless ksyms in the kernel
To: Samuel Wu <wusamuel@google.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:56=E2=80=AFAM Samuel Wu <wusamuel@google.com> wro=
te:
>
> On Sat, Oct 10, 2026 at 12:09=E2=80=AFPM Alan Maguire <alan.maguire@oracl=
e.com> wrote:
> >
> > On 09/10/2026 14:07, Samuel Wu wrote:
> > > libbpf resolves typeless symbols by parsing /proc/kallsyms, which
> > > dominates load time for BPF programs with typeless symbols. This most=
ly
> > > comes from needing to do thousands of syscalls and a linear scan of
> > > kallsyms.
> > >
> > > Call bpf_kallsyms_lookup_name() from BPF_PROG_TYPE_SYSCALL, such that
> > > the resolution can be done with a couple of syscalls and a binary
> > > search. This is a similar approach to what the light skeleton does. T=
he
> > > fast path passes the name and result through ctx, which requires comm=
it
> > > ae5ef001aa98 ("bpf: Support variable offsets for syscall PTR_TO_CTX")=
.
> > >
> > > Any fast path error (e.g. kernels without ae5ef001aa98) falls back to
> > > the legacy /proc/kallsyms scan, including strong misses, since the
> > > kernel doesn't match LTO "<name>.llvm.<hash>" symbols. Weak misses
> > > default to zero.
> > >
> > > Depending on the device, I see ~9-11x loading speedup when resolving =
a
> > > BPF program with 11 typeless lock externs.
> > >   - x86_64 VM, 6.18 + ae5ef001aa98: 147ms -> 17ms
> > >   - ARM64 phone, 7.1: 626ms -> 55ms
> > >
> > > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > > ---
> > >  tools/lib/bpf/libbpf.c | 59 ++++++++++++++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 58 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > > index cb09ded90773..7564ec6bde64 100644
> > > --- a/tools/lib/bpf/libbpf.c
> > > +++ b/tools/lib/bpf/libbpf.c
> > > @@ -9590,6 +9590,58 @@ static int bpf_object__read_kallsyms_file(stru=
ct bpf_object *obj)
> > >       return libbpf_kallsyms_parse(kallsyms_cb, obj);
> > >  }
> > >
> > > +static int bpf_object__resolve_ksyms_in_kernel(struct bpf_object *ob=
j)
> > > +{
> > > +     struct extern_desc *ext;
> > > +     int i, prog_fd, err =3D 0;
> > > +     struct {
> > > +             __u64 addr;
> > > +             char name[512];
> > > +     } ctx =3D {};
> > > +     LIBBPF_OPTS(bpf_prog_load_opts, opts, .prog_flags =3D BPF_F_SLE=
EPABLE);
> > > +     LIBBPF_OPTS(bpf_test_run_opts, topts, .ctx_in =3D &ctx, .ctx_si=
ze_in =3D sizeof(ctx));
> > > +     /* bpf_kallsyms_lookup_name(ctx.name, sizeof(ctx.name), 0, &ctx=
.addr) */
> > > +     static const struct bpf_insn insns[] =3D {
> > > +             BPF_MOV64_REG(BPF_REG_4, BPF_REG_1),
> > > +             BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, 8),
> > > +             BPF_MOV64_IMM(BPF_REG_2, sizeof(ctx.name)),
> > > +             BPF_MOV64_IMM(BPF_REG_3, 0),
> > > +             BPF_EMIT_CALL(BPF_FUNC_kallsyms_lookup_name),
> > > +             BPF_EXIT_INSN(),
> > > +     };
> > > +
> > > +     if (obj->gen_loader || obj->token_fd)
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SYSCALL, NULL, "GPL",
> > > +                             insns, ARRAY_SIZE(insns), &opts);
> > > +     if (prog_fd < 0)
> > > +             return prog_fd;
> > > +
> > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > +             ext =3D &obj->externs[i];
> > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > +                     continue;
> > > +             if (snprintf(ctx.name, sizeof(ctx.name), "%s", ext->nam=
e) >=3D sizeof(ctx.name)) {
> > > +                     err =3D -ENAMETOOLONG;
> > > +                     break;
> > > +             }
> > > +             err =3D bpf_prog_test_run_opts(prog_fd, &topts) ?: (int=
)topts.retval;
> > > +             if (err =3D=3D -ENOENT && ext->is_weak) {
> > > +                     err =3D 0;
> > > +                     continue;
> > > +             }
> > > +             if (err)
> > > +                     break;
> > > +             ext->is_set =3D true;
> > > +             ext->ksym.addr =3D ctx.addr;
> > > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%=
llx\n",
> > > +                      ext->name, ext->ksym.addr);
> > > +     }
> >
> > Great to see the win in terms of resolution time, but I wonder if we co=
uld
> > speed things up further by resolving multiple symbols at once, since we=
 have
> > all the externs available (either by dynamically creating your program =
that
> > does symbol resolution as a side-effect, or adding a more direct resolu=
tion method)?
> >
> > A single syscall could provide an even faster speedup, so might be wort=
h a look.
>
> I tried resolving multiple symbols in one pass, but unfortunately the
> impact was negligible and made the code much more complex. I profiled
> a few numbers, and turns out it's because resolving typeless symbols
> is down to ~1% of total load time (from ~90%), with the remaining time
> mostly spent on BTF loading, CORE relocation, and BPF verification.
>
> > Another concern would be a lot of production kernels won't have BPF tes=
t run
> > support baked in, so relying on that without fallback would be a proble=
m.
>
> Are you referring to BPF_PROG_TEST_RUN when mentioning "BPF test run
> support", or something else? And totally agreed in that we need a
> fallback, of which it currently falls back to reading /proc/kallsyms
> on any error during the new fast path.
>

Have you considered adding a faster interface to /proc/kallsyms
instead? That would benefit not just this particular use case, but
generally lots of other user space applications that have to deal with
kallsyms (all kinds of symbolizers, tracers, etc).

A while ago I added PROCMAP_QUERY ioctl()-based interface to
/proc/PID/maps to query process VMAs and I think it turned out quite
nicely and is super useful in practice. Back then I was hoping we'll
eventually also add similar (in principle) extensible ioctl()-based
interface to /proc/kallsyms as well, so that at least fast
address-to-symbol and symbol name-to-symbol point query could be done
quickly. And it actually would finally provide a way to provide more
information per kernel symbol, if necessary (/proc/kallsyms is
basically set in stone, besides it being text based and thus slow and
inconvenient for programmatic access).

Can you please look into that, I think it would be a much more generic
and desirable outcome instead of this somewhat hacky solution of
calling BPF program to resolve a symbol.

WDYT?

pw-bot: cr


> > > +     close(prog_fd);
> > > +     return err;
> > > +}
> > > +
> > >  static int find_ksym_btf_id(struct bpf_object *obj, const char *ksym=
_name,
> > >                           __u16 kind, struct btf **res_btf,
> > >                           struct module_btf **res_mod_btf)
> > > @@ -9863,7 +9915,12 @@ static int bpf_object__resolve_externs(struct =
bpf_object *obj,
> > >                       return -EINVAL;
> > >       }
> > >       if (need_kallsyms) {
> > > -             err =3D bpf_object__read_kallsyms_file(obj);
> > > +             err =3D bpf_object__resolve_ksyms_in_kernel(obj);
> > > +             if (err) {
> > > +                     pr_debug("failed to resolve ksyms in kernel: %s=
, falling back to /proc/kallsyms\n",
> > > +                              errstr(err));
> > > +                     err =3D bpf_object__read_kallsyms_file(obj);
> > > +             }
> > >               if (err)
> > >                       return -EINVAL;
> > >       }
> >
