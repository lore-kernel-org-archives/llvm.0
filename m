Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8885694
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 17:15:11 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-649edb3a3d6so10796466d6.0
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694193310; x=1694798110; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvC9pL6Ni1XwRDm5BeqCIzzDS/+lbPGOBzfjrA1tAJw=;
        b=GaMRoPSdKt1DKwoPcKd74S5Ne2P5Ne+x/hgozzI4Zp3AJPKDZ5I1R/AjjmYfV+/G5y
         q14Fa/kUMzLY8/ZwfXeXd7Vg1yDX53q5A3CeughIjMbrgDgvc2jpfyv6PEv0i1pFD1DZ
         9pgFfSOdROXJWCOFDkiGQbi37f3O88/+WjHEG/CYrLdfUL6Kp7Dcl3YouTsAz0UH8aSm
         qT5nGDF5+8xcNhs8QxbD3KeaS/gOwdmt8ADh/yeHtRvLqrS0Xl/Zof9jPbNHousb6rr2
         7hGGmU4bhysb4Nt15+ijEuXpAY8uE3JjgJOYpEhdrL8GhCsBMd+t8/y/tspSCRSA4AzM
         rFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694193310; x=1694798110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvC9pL6Ni1XwRDm5BeqCIzzDS/+lbPGOBzfjrA1tAJw=;
        b=wgDOWhDMfhYL+thSURIEx8pxcYGTTl/Z2ANgjdCj6eL2WHaFcmzOSVBIugalZHtMhd
         GQyFx057iCWI5HbEnXIOU36uztYm9l7T5gciz0wD+yVbLjQKqtProQFAJeT+I1ub6bfp
         PGZdWFh5BsWg31LuZOnWPL6lXekJi7hqdV3AJ6Bp1E0Iz58Jt0tUGuFib0HCaVZL1ivU
         0Yf/i1dHAppmnzznf7KBHmfKs4f5iPBcDJ5zn2YwJJ7JNE64fZOQsKaeEQkLn+HuPiTv
         6s3n5lqNuWKMw8y8fkGz92j1oHgNTgJuvLA8LEBLjD/QeIJnjPQWhrrdKQGTAe081foM
         IY6A==
X-Gm-Message-State: AOJu0Ywu8HwvOUGdeg09QYVRyRRewLmD8nSqUvx3rBgfdi0oZSMwW2Eu
	YtSX2o7VqCP66UPSnsnC1v3sganUu8ERVUPUasZtlA==
X-Google-Smtp-Source: AGHT+IHurteqR3i6yaqkMaO/DxMsTokaewDiPBujsr0fhYb39oy8+ZmDi6wXwmbrivcBqzheTati8qR0uJemwcQ3Zag=
X-Received: by 2002:a05:6214:20e2:b0:630:1b99:5c53 with SMTP id
 2-20020a05621420e200b006301b995c53mr7558558qvk.9.1694193310278; Fri, 08 Sep
 2023 10:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava> <ZPsJ4AAqNMchvms/@krava>
In-Reply-To: <ZPsJ4AAqNMchvms/@krava>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Sep 2023 10:14:56 -0700
Message-ID: <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
To: Jiri Olsa <olsajiri@gmail.com>, Marcus Seyfarth <m.seyfarth@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Stanislav Fomichev <sdf@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch!

+ Marcus

Marcus can you please test the below patch and provide your tested-by
and reported-by tags?

On Fri, Sep 8, 2023 at 4:47=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrote=
:
>
> On Thu, Sep 07, 2023 at 10:33:00PM +0200, Jiri Olsa wrote:
> > On Thu, Sep 07, 2023 at 12:01:18PM -0700, Nick Desaulniers wrote:
> > > So we've got a curious report recently:
> > > https://github.com/ClangBuiltLinux/linux/issues/1913
> > >
> > > ld.lld: error: ld-temp.o <inline asm>:14577:1: symbol
> > > '__BTF_ID__struct__cgroup__624' is already defined
> > > __BTF_ID__struct__cgroup__624:
> > > ^
> > >
> > > It's been hard to pin down a SHA and .config to reproduce this, but
> > > looking at the definition of BTF_ID's usage of __ID's usage of
> > > __COUNTER__, and the two statements:
> > >
> > > kernel/bpf/helpers.c:2460:BTF_ID(struct, cgroup)
> > > kernel/bpf/verifier.c:5075:BTF_ID(struct, cgroup)
> > >
> > > Is it possible that __COUNTER__ could evaluate to the same value
> > > across 2 different translation units, leading to a name collision lik=
e
> > > the above?
> >
> > hum, that probably the case, I see same counter values at different
> > __BTF_ID_ symbols:
> >
> > ffffffff833fe540 r __BTF_ID__struct__bpf_bloom_filter__380
> > ffffffff833fe548 r __BTF_ID__struct__bpf_queue_stack__380
> > ffffffff833fe578 r __BTF_ID__struct__cgroup__380
> >
> > perhaps we were just lucky not to hit that :-\
> >
> > >
> > > looking at another usage of BTF_ID other than struct
> > > cgroup;kernel/bpf/helpers.c:2461:BTF_ID(func, bpf_cgroup_release)
> > > is only defined in one translation unit
> > >
> > > Should one of those two `BTF_ID(struct, cgroup)` be removed? Is there
> > > some other way we can avoid these collisions in the future?
> >
> > need to find some way to make the symbol unique, will check
>
> the change below uses object's path as the __BTF_ID_.. symbol suffix to m=
ake
> it unique
>
> I'm still looking, but can't think of a better way so far, perhaps somebo=
dy
> will have better idea

Another good approach; I had simply added __LINE__ into the paste.
https://github.com/ClangBuiltLinux/linux/issues/1913#issuecomment-171079431=
9
Which just makes the probability of this occurring again smaller, but
still non-zero.

+ Masahiro for thoughts on the invocation of echo and base32.  Looks
like base32 is part of coreutils. Kind of strange that coreutils isn't
listed in Documentation/process/changes.rst.  Would adding the usage
of base32 add a new dependency on coreutils?

>
> jirka
>
>
> ---
> diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> index a3462a9b8e18..564953f9cbc7 100644
> --- a/include/linux/btf_ids.h
> +++ b/include/linux/btf_ids.h
> @@ -49,7 +49,7 @@ word                                                  \
>         ____BTF_ID(symbol, word)
>
>  #define __ID(prefix) \
> -       __PASTE(prefix, __COUNTER__)
> +       __PASTE(__PASTE(prefix, __COUNTER__), BTF_ID_BASE)

Do we still need __COUNTER__ if we're now using BTF_ID_BASE?

>
>  /*
>   * The BTF_ID defines unique symbol for each ID pointing
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 68d0134bdbf9..2ef8b2798be0 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -200,6 +200,10 @@ _c_flags +=3D $(if $(patsubst n%,, \
>         -D__KCSAN_INSTRUMENT_BARRIERS__)
>  endif
>
> +ifeq ($(CONFIG_DEBUG_INFO_BTF),y)
> +_c_flags +=3D -DBTF_ID_BASE=3D$(subst =3D,,$(shell echo -n $(modfile) | =
base32 -w0))

`man 1 base32` shows it can just read a file. Could the above be:

_c_flags +=3D -DBTF_ID_BASE=3D$(subst =3D,,$(shell base32 -w0 $(modfile)))

? (untested)

Also, the output of

$ base32 -w0 Documentation/process/changes.rst

is 24456 characters.  This is going to blow up symbol tables. I
suppose ELF probably has some length limit on symbol names, too.  I
was nervous about my approaching appending __LINE__.

Perhaps pipe the output to `head -c <n bytes>`?

> +endif
> +
>  # $(srctree)/$(src) for including checkin headers from generated source =
files
>  # $(objtree)/$(obj) for including generated headers from checkin source =
files
>  ifeq ($(KBUILD_EXTMOD),)



--=20
Thanks,
~Nick Desaulniers
