Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5E3111A4
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 16:47:34 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a9f88b657eso1408334b6e.3
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694796453; x=1695401253; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF9YS+ehaF+t5NpFvOnVvaBghLCf/gM6bVST9fQJ4mY=;
        b=fmA/7a2oq9GIAVsormGz/MsDn+kkNumzKMjNWfUuhK6ARs7Y5ORh+GvElgvHzHlpXa
         b2N6vqjESysdgS79KBRg8WYVlRZEAJYPZCUwHHkG55xl2DYMhThT5nQl5rr0GR7HVtfu
         9Fuco6iIzLXfUJERwbEP4wUtj6yyhikbJgu6jaWVcQlSq+jJzJw3dB2BYKT4blZkusc0
         tubaxX/oxH8jTvQVm541rgoCQXtgrLoSNedoFcwUhR85pHZNM4TzLNLFlZ3XrER63Zb0
         X2b7kdMT1+PslZaVQtepSjKEWg5jZjrElrDjXCloxz55SeHr1VO8NHEa+AQrOz/kP6Kz
         qK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694796453; x=1695401253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF9YS+ehaF+t5NpFvOnVvaBghLCf/gM6bVST9fQJ4mY=;
        b=lk933pFY+XxTPxojGWi57yFAnoT5rIpkv1whuX5GfUdn/2ohLccr2auEy04IUuhWgv
         6BKa+yKewQ3IgA85Fbt6uzcyzeLJRLnwYeOMlSCWZncFrfK8hyY8kAnr2twWCv8UG53s
         V6gz8yqXmLoIQYmXTWs1JAfyYM22m5767m1vgBM6rlIk9lFuKgMzovdcnohx+Yrz6dj1
         GappCwxDgPB8FHWFFXjrjmYKMZhZn+jwGAhdfnLU3yDNvScUsjHZz14ioFhzuGoKFhbA
         8U4DQa8RNC8a85z4VUKPGrr0Z/ERLABqjaJh/Db/gAD68iuVSgx52r3ONOTQoDxmWXOd
         pnpQ==
X-Gm-Message-State: AOJu0YyLhZmKthJ58uIbyx29fAGn5eV1oxzBqsjEM5pAaCSXw0lQHCFy
	lEg+JeVQJAapdeTtd6rxo+cU5NQgJsIw7N3Tj1seCWgB+GuD6YrdXlM=
X-Google-Smtp-Source: AGHT+IFvL2eD//es1+Vlrx72iJXEbG1iWd4k5Qmr5WyFLT5JxMTHytrk/S/0QC6X0oR8TKe+Okc61Jc/op6Uj4KT4Zc=
X-Received: by 2002:a05:6871:281:b0:1c0:937:455d with SMTP id
 i1-20020a056871028100b001c00937455dmr2658921oae.47.1694796453154; Fri, 15 Sep
 2023 09:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava> <ZPsJ4AAqNMchvms/@krava> <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>
 <ZPuA5+HmbcdBLbIq@krava> <ZQLBm8sC+V53CIzD@krava> <CAK7LNATiHvOXiWQi9gXJO9rZbT_MFm6NddaWqoY4ykNWf+OYsQ@mail.gmail.com>
 <ZQLX3oSCk95Qf4Ma@krava> <CAEf4Bzb5KQ2_LmhN769ifMeSJaWfebccUasQOfQKaOd0nQ51tw@mail.gmail.com>
 <ZQQVr35crUtN1quS@krava>
In-Reply-To: <ZQQVr35crUtN1quS@krava>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Sep 2023 09:47:18 -0700
Message-ID: <CAKwvOdk0i5fXACA5ZBn0ZLK4jvoXn6X3VjSjfOTc6R=+owNB1g@mail.gmail.com>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Stanislav Fomichev <sdf@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 1:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Thu, Sep 14, 2023 at 11:14:19AM -0700, Andrii Nakryiko wrote:
> > On Thu, Sep 14, 2023 at 2:52=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> =
wrote:
> > >
> > > On Thu, Sep 14, 2023 at 05:30:51PM +0900, Masahiro Yamada wrote:
> > >
> > > SNIP
> > >
> > > > > > so the change is about adding unique id that's basically path o=
f
> > > > > > the object stored in base32 so it could be used as symbol, so w=
e
> > > > > > don't really need to read the actual file
> > > > > >
> > > > > > the problem is when BTF_ID definition like:
> > > > > >
> > > > > > BTF_ID(struct, cgroup)
> > > > > >
> > > > > > translates in 2 separate objects into same symbol name because =
of
> > > > > > the matching __COUNTER__ macro values (like 380 below)
> > > > > >
> > > > > >   __BTF_ID__struct__cgroup__380
> > > > > >
> > > > > > this change just adds unique id of the path name at the end of =
the
> > > > > > symbol with:
> > > > > >
> > > > > >   echo -n 'kernel/bpf/helpers' | base32 -w0 --> NNSXE3TFNQXWE4D=
GF5UGK3DQMVZHG
> > > > > >
> > > > > > so the symbol looks like:
> > > > > >
> > > > > >   __BTF_ID__struct__cgroup__380NNSXE3TFNQXWE4DGF5UGK3DQMVZHG
> > > > > >
> > > > > > and is unique over the sources
> > > > > >
> > > > > > but I still hope we could come up with some better solution ;-)
> > > > >
> > > > > so far the only better solution I could come up with is to use
> > > > > cksum (also from coreutils) instead of base32, which makes the
> > > > > BTF_ID_BASE value compact
> > > > >
> > > > > I'll run test to find out how much it hurts the build time
> > > > >
> > > > > jirka
> > > >
> > > >
> > > >
> > > > Seems a bad idea to me.
> > > >
> > > > It would fork a new shell and chsum for all files,
> > > > while only a few of them need it.
> > >
> > > right, I have a change to limit this on kernel and net directories,
> > > but it's still bad
> > >
> > > >
> > > > Better to consult BTF forks.
> > >
> > > perhaps there's better way within kbuild to get unique id/value
> > > for each object file?
> >
> > let's just use __LINE__ + __COUNTER__ for now and teach resolve_btfids
> > to fail and complain loudly about duplicate symbols?
>
> ok, will send that.. but it fails during link before resolve_btfids
> takes place
>
> >
> >
> > This will give us time and opportunity to implement a better approach
> > to .BTF_ids overall. Encoding the desired type name in the symbol name
> > always felt off. Maybe it's better to encode type + name as data,
> > which is discarded at the latest stage during vmlinux linking? Either
>
> hum, so maybe having a special section (.BTF_ids_desc below)
> that would have record for each ID placed in .BTF_ids section:
>
> asm(                                           \
> ".pushsection .BTF_ids,\"a\";        \n"       \
> "1:                                  \n"       \
> ".zero 4                             \n"       \
> ".popsection;                        \n"       \
> ".pushsection .BTF_ids_desc,\"a\";   \n"       \
> ".long 1b                            \n"       \
>
> and somehow get prefix and name pointers in here:
>
> ".long prefix
> ".long name
>
> ".popsection;                        \n");
>
> so resolve_btfids would iterate .BTF_ids_desc records and fix
> up .BTF_ids data..
>
> we might need to do one extra link phase to get rid of the
> .BTF_ids_desc secion

It should be ok to keep it in vmlinux as we do for DWARF debug info.

We'd want to make sure it's not retained in the compressed image
though. Pretty sure `strip` is used to drop DWARF from the compressed
image, but `strip` isn't going to recognize the semantics of some new
ad-hoc ELF section.  Pretty sure `objcopy` can be used to drop ELF
sections; we'd need to probably invoke `objcopy` explicitly to drop
that section (or add any new section to any pre-existing list of
sections to drop).

>
> > way, this baseid hack seems worse and unnecessary.
>
> yes, it's bad
>
> jirka



--=20
Thanks,
~Nick Desaulniers
