Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BAD1B425C
	for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 20:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744664218; cv=none; b=XFlMS0NX2y9dvrJaDZuVIZCrFT+B+DO0eMfkgxUb8+HkDm56dTZtgXb9svIQ2ppu4bzcKPoqqq9asKmq43kH7n4HWLuKMAbB7ooBcspXXap3vy0AdvdeN4yCQpDuwZrdDSzxuIJ9EP9OCPoJ4itu53e7AT4K/f+mDlMRct6JAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744664218; c=relaxed/simple;
	bh=59DG5cicG2nYVNl6LJKyYhu1RhtD/HerSJsdOedeqQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXQBy45UPvIRgsrtn5rTxLk+qG75o/n2kD8ErdAFbaLQ94ip1JGPcZ/j4ZcbWv/stBEuO1wYe4Vhq/VD17X+LRLYfINKQFMoykoyDqke6ZZ2qQj8E5WLQzeGYKQYYlJOchRRgAS10JlxPMRU9ivxm9gCuhKwe8Y5FX26aXgFq4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TL83HnZH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TL83HnZH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso38181485e9.0
        for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744664215; x=1745269015; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TcZJJNpo591s6xoFqHx75vVN+ieiVBofj1AeFVZgrg=;
        b=TL83HnZHJl1GWxp/K76bv6nqV7st3kCW8cQGqmJcTVILOyMpQfCQnb21EoEt9N+0rp
         qXr1rEPJ1fHxSPrAkQqfHf24LpzgGdOQHdgoVzp74vCPM5b920o8J6JuU3HnEro8Ocxw
         rxALax7qehPiA6JdZrVNtPXhuCOhnLV99BJneC9GOavVQTd7pRYcActwFqBR4xYw4D/F
         BDZ56WmgE+MsDKvJl5bQ1EZlyThDcwp3NOP8wNp5VHoUUIS4iyBNaesTIt/Rsdej2yI/
         qID1kidzteEjp8ve0j0II90qsjl3IzteE580Xh39+95GtUqbqWl83EV6hbA1SKOud6SJ
         uLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744664215; x=1745269015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TcZJJNpo591s6xoFqHx75vVN+ieiVBofj1AeFVZgrg=;
        b=Y2LJ0t7mTUwbCdJuLCTUaasNdsgoebcjcAKwCy6wWKT6DPUT29f1bZF6kOrUANhnU1
         EiVXr4Q+IloE6l+8KvFn2xDd0Xz02s9muWaX6babQcmI/1MMCK+Jhm6aN+ig0EjY/ZfV
         PlTC/lzw74vievyZNqqO/psZXFUL9KTeUY5P0sRqx29oJiknYH0N2T2r3dthtBQ2BDKu
         i8A/gEztgkvI8esLFx1VS0LiuxWLhEb3rgz0zCQpX07Q8kR62zXqiunuOHJj5FzVPx2D
         rT5YOvgtoKvCNSlNWmfUOynhpQ6F8J0hRv0JHMWSdE5xP6cDG+0loirrrUn7myy86yxY
         /fRA==
X-Forwarded-Encrypted: i=1; AJvYcCU3IMpB47A129D1sxq2gIOBG1r/l1IOzHrRKcTnFNqxqiEAzEIT7SresElVht88feCFTLuj@lists.linux.dev
X-Gm-Message-State: AOJu0YwvHJLiGjnwFJgpIu0pbiRdh+MTAhKbYefeAziApUVFFkHvyFyL
	YpZd63CVqDa4j0ChAuUHwhoQTaJpOaSYusX0j7Tesh0C7EeFhGPIw5ttORCfwzrlcVYH+xqmdZ3
	YalVNV2DNJi1eXtRwxg5S+0BfIas=
X-Gm-Gg: ASbGncvb9aBaT5LCLSJeL8uBjdQHdfoO1iCDIDs0nQG8l8mzgKyBPh4KpAbv2ShL8qe
	KJiL+1y9ar1kqLsE/4ofsy+wcQUP+YKAVLqSJYJv6e1ewMo9Myd3fSAxrZ0dJUyN4LJnGcgr694
	0qLVVPVKSngg2cOLSu22hfnTXVEed3TTdFGh5uZw==
X-Google-Smtp-Source: AGHT+IFcREG/4yFEmC+ZxV8s2QA/5bd3ZV1RNpvIrg2UOkqeg3XFOew6fBn8aG27bqWGkg7Xi5BfChdrPFBmpTvrP3w=
X-Received: by 2002:a7b:ce16:0:b0:43c:fabf:9146 with SMTP id
 5b1f17b1804b1-43f4aafa80dmr58064325e9.17.1744664214557; Mon, 14 Apr 2025
 13:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
 <87semdjxcp.fsf@microsoft.com>
In-Reply-To: <87semdjxcp.fsf@microsoft.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 14 Apr 2025 13:56:42 -0700
X-Gm-Features: ATxdqUHCb53j5ciFtAcQCnJkNA0yls1KzsDz-H40EWEXDT9mEyWFo_Dj8Pa3eyk
Message-ID: <CAADnVQ+JGfwRgsoe2=EHkXdTyQ8ycn0D9nh1k49am++4oXUPHg@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, nkapron@google.com, 
	Matteo Croce <teknoraver@meta.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 6:58=E2=80=AFAM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> TAlexei Starovoitov <alexei.starovoitov@gmail.com> writes:
>
> > On Fri, Apr 4, 2025 at 2:56=E2=80=AFPM Blaise Boscaccy
> > <bboscaccy@linux.microsoft.com> wrote:
> >> +
> >> +static int hornet_find_maps(struct bpf_prog *prog, struct hornet_maps=
 *maps)
> >> +{
> >> +       struct bpf_insn *insn =3D prog->insnsi;
> >> +       int insn_cnt =3D prog->len;
> >> +       int i;
> >> +       int err;
> >> +
> >> +       for (i =3D 0; i < insn_cnt; i++, insn++) {
> >> +               if (insn[0].code =3D=3D (BPF_LD | BPF_IMM | BPF_DW)) {
> >> +                       switch (insn[0].src_reg) {
> >> +                       case BPF_PSEUDO_MAP_IDX_VALUE:
> >> +                       case BPF_PSEUDO_MAP_IDX:
> >> +                               err =3D add_used_map(maps, insn[0].imm=
);
> >> +                               if (err < 0)
> >> +                                       return err;
> >> +                               break;
> >> +                       default:
> >> +                               break;
> >> +                       }
> >> +               }
> >> +       }
> >
> > ...
> >
> >> +               if (!map->frozen) {
> >> +                       attr.map_fd =3D fd;
> >> +                       err =3D kern_sys_bpf(BPF_MAP_FREEZE, &attr, si=
zeof(attr));
> >
> > Sorry for the delay. Still swamped after conferences and the merge wind=
ow.
> >
>
> No worries.
>
> > Above are serious layering violations.
> > LSMs should not be looking that deep into bpf instructions.
>
> These aren't BPF internals; this is data passed in from
> userspace. Inspecting userspace function inputs is definitely within the
> purview of an LSM.
>
> Lskel signature verification doesn't actually need a full disassembly,
> but it does need all the maps used by the lskel. Due to API design
> choices, this unfortunately requires disassembling the program to see
> which array indexes are being used.
>
> > Calling into sys_bpf from LSM is plain nack.
> >
>
> kern_sys_bpf is an EXPORT_SYMBOL, which means that it should be callable
> from a module.

It's a leftover.
kern_sys_bpf() is not something that arbitrary kernel
modules should call.
It was added to work for cases where kernel modules
carry their own lskels.
That use case is gone, so EXPORT_SYMBOL will be removed.

> Lskels without frozen maps are vulnerable to a TOCTOU
> attack from a sufficiently privileged user. Lskels currently pass
> unfrozen maps into the kernel, and there is nothing stopping someone
> from modifying them between BPF_PROG_LOAD and BPF_PROG_RUN.
>
> > The verification of module signatures is a job of the module loading pr=
ocess.
> > The same thing should be done by the bpf system.
> > The signature needs to be passed into sys_bpf syscall
> > as a part of BPF_PROG_LOAD command.
> > It probably should be two new fields in union bpf_attr
> > (signature and length),
> > and the whole thing should be processed as part of the loading
> > with human readable error reported back through the verifier log
> > in case of signature mismatch, etc.
> >
>
> I don't necessarily disagree, but my main concern with this is that
> previous code signing patchsets seem to get gaslit or have the goalposts
> moved until they die or are abandoned.

Previous attempts to add signing failed because
1. It's a difficult problem to solve
2. people only cared about their own narrow use case and not
considering the needs of bpf ecosystem as a whole.

> Are you saying that at this point, you would be amenable to an in-tree
> set of patches that enforce signature verification of lskels during
> BPF_PROG_LOAD that live in syscall.c,

that's the only way to do it.

> without adding extra non-code
> signing requirements like attachment point verification, completely
> eBPF-based solutions, or rich eBPF-based program run-time policy
> enforcement?

Those are secondary considerations that should also be discussed.
Not necessarily a blocker.
