Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A42E30F8D
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 20:15:40 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso308499166b.1
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 13:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694204138; x=1694808938; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=si1xGkM7Ros3c7RMLtdfTxwuvqPomUDStzBN1AuUiUQ=;
        b=dSuUoZEddhz1LOZOyoGncsQZGIDeMGyzHJPHLbsiuKeMiQZXWzHO5qkQcPB+5xkhun
         xToevY+6PqRYCsky1bm1YfTCLW43l66CppplfzzC0gO8a+TKgWPLyRL4LGe1BsIZMkpF
         6NB762Rkwg3xDuL/lzp30NlcNTN7+V1ta3Y7SeYcmbbp1gpAUWoBaB75eOOGiUwE0bSz
         CL6Hyxw3gdcaMi4DRgX7jMyiPdsKde4NRWKTCrLLfgb3mHpnlmtXamH8lcE7Rhso3gzW
         Sy2UDkcB9Bl7uX76sy8lYFXn6qTokWZ8ZPAMzvtpdXJeApC6Qkbv/04SRmS/0Wcv/YwM
         1NmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694204138; x=1694808938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=si1xGkM7Ros3c7RMLtdfTxwuvqPomUDStzBN1AuUiUQ=;
        b=V1d0Nmam2k8oQaBi+/cpp2PIIZ7dki79kHCml3Z6+zzI5czQrELUvAZDrIiNrQ4rj9
         MfFRflJp2rXZ8e11GVirXFkvMI/N8TwCBcLnUS/ZDwNoklqjWXWLVsxruVsAjDqnby6W
         8VSd1lHa3yawEPTiC2CtQHXH4QLIe1pyekqFevVK40xGiIky+MzVCIAe0NPEOs6SpAoW
         nHkFpuh1npBCC6RSNnW3jErDkqw7i64EUsfnmdKTYNYLWEo5G6M5TFhHdQFn5Bxfb3/3
         XzCkWkkjK7nA2kip+kww7DrcfzEzRiJP+uADmkwE7fN2ePtyg0CaAsOgZEN3LTPd2xi+
         qFfA==
X-Gm-Message-State: AOJu0YwWOguz+Fizblw5u3alE5dzx2YVKTeNyE1O2VJlA5dgfgN4+yum
	tY5dfihVKpnjuwjrFfWi3vU=
X-Google-Smtp-Source: AGHT+IH25N0r6VV2un5+wqQKFwEggFRKFnpRBeYcun0YJGT1y54WhSAiL9ngsk8F1RRwuXgbuFKq1A==
X-Received: by 2002:a17:907:770b:b0:9a5:8269:2c94 with SMTP id kw11-20020a170907770b00b009a582692c94mr3077635ejc.57.1694204138379;
        Fri, 08 Sep 2023 13:15:38 -0700 (PDT)
Received: from krava ([83.240.61.79])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906528f00b00992b2c55c67sm1449713ejm.156.2023.09.08.13.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 13:15:37 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 8 Sep 2023 22:15:35 +0200
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Marcus Seyfarth <m.seyfarth@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>, bpf <bpf@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Stanislav Fomichev <sdf@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
Message-ID: <ZPuA5+HmbcdBLbIq@krava>
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava>
 <ZPsJ4AAqNMchvms/@krava>
 <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>

On Fri, Sep 08, 2023 at 10:14:56AM -0700, Nick Desaulniers wrote:
> Thanks for the patch!
> 
> + Marcus
> 
> Marcus can you please test the below patch and provide your tested-by
> and reported-by tags?
> 
> On Fri, Sep 8, 2023 at 4:47 AM Jiri Olsa <olsajiri@gmail.com> wrote:
> >
> > On Thu, Sep 07, 2023 at 10:33:00PM +0200, Jiri Olsa wrote:
> > > On Thu, Sep 07, 2023 at 12:01:18PM -0700, Nick Desaulniers wrote:
> > > > So we've got a curious report recently:
> > > > https://github.com/ClangBuiltLinux/linux/issues/1913
> > > >
> > > > ld.lld: error: ld-temp.o <inline asm>:14577:1: symbol
> > > > '__BTF_ID__struct__cgroup__624' is already defined
> > > > __BTF_ID__struct__cgroup__624:
> > > > ^
> > > >
> > > > It's been hard to pin down a SHA and .config to reproduce this, but
> > > > looking at the definition of BTF_ID's usage of __ID's usage of
> > > > __COUNTER__, and the two statements:
> > > >
> > > > kernel/bpf/helpers.c:2460:BTF_ID(struct, cgroup)
> > > > kernel/bpf/verifier.c:5075:BTF_ID(struct, cgroup)
> > > >
> > > > Is it possible that __COUNTER__ could evaluate to the same value
> > > > across 2 different translation units, leading to a name collision like
> > > > the above?
> > >
> > > hum, that probably the case, I see same counter values at different
> > > __BTF_ID_ symbols:
> > >
> > > ffffffff833fe540 r __BTF_ID__struct__bpf_bloom_filter__380
> > > ffffffff833fe548 r __BTF_ID__struct__bpf_queue_stack__380
> > > ffffffff833fe578 r __BTF_ID__struct__cgroup__380
> > >
> > > perhaps we were just lucky not to hit that :-\
> > >
> > > >
> > > > looking at another usage of BTF_ID other than struct
> > > > cgroup;kernel/bpf/helpers.c:2461:BTF_ID(func, bpf_cgroup_release)
> > > > is only defined in one translation unit
> > > >
> > > > Should one of those two `BTF_ID(struct, cgroup)` be removed? Is there
> > > > some other way we can avoid these collisions in the future?
> > >
> > > need to find some way to make the symbol unique, will check
> >
> > the change below uses object's path as the __BTF_ID_.. symbol suffix to make
> > it unique
> >
> > I'm still looking, but can't think of a better way so far, perhaps somebody
> > will have better idea
> 
> Another good approach; I had simply added __LINE__ into the paste.
> https://github.com/ClangBuiltLinux/linux/issues/1913#issuecomment-1710794319
> Which just makes the probability of this occurring again smaller, but
> still non-zero.

yes, there's still possibility of the match

> 
> + Masahiro for thoughts on the invocation of echo and base32.  Looks
> like base32 is part of coreutils. Kind of strange that coreutils isn't
> listed in Documentation/process/changes.rst.  Would adding the usage
> of base32 add a new dependency on coreutils?
> 
> >
> > jirka
> >
> >
> > ---
> > diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> > index a3462a9b8e18..564953f9cbc7 100644
> > --- a/include/linux/btf_ids.h
> > +++ b/include/linux/btf_ids.h
> > @@ -49,7 +49,7 @@ word                                                  \
> >         ____BTF_ID(symbol, word)
> >
> >  #define __ID(prefix) \
> > -       __PASTE(prefix, __COUNTER__)
> > +       __PASTE(__PASTE(prefix, __COUNTER__), BTF_ID_BASE)
> 
> Do we still need __COUNTER__ if we're now using BTF_ID_BASE?

yes we still need that because we could have same __BTF_ID__...
symbol used multiple times within same object, and that's where
__COUNTER__ makes the difference

> 
> >
> >  /*
> >   * The BTF_ID defines unique symbol for each ID pointing
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 68d0134bdbf9..2ef8b2798be0 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -200,6 +200,10 @@ _c_flags += $(if $(patsubst n%,, \
> >         -D__KCSAN_INSTRUMENT_BARRIERS__)
> >  endif
> >
> > +ifeq ($(CONFIG_DEBUG_INFO_BTF),y)
> > +_c_flags += -DBTF_ID_BASE=$(subst =,,$(shell echo -n $(modfile) | base32 -w0))
> 
> `man 1 base32` shows it can just read a file. Could the above be:
> 
> _c_flags += -DBTF_ID_BASE=$(subst =,,$(shell base32 -w0 $(modfile)))
> 
> ? (untested)
> 
> Also, the output of
> 
> $ base32 -w0 Documentation/process/changes.rst
> 
> is 24456 characters.  This is going to blow up symbol tables. I
> suppose ELF probably has some length limit on symbol names, too.  I
> was nervous about my approaching appending __LINE__.
> 
> Perhaps pipe the output to `head -c <n bytes>`?

so the change is about adding unique id that's basically path of
the object stored in base32 so it could be used as symbol, so we
don't really need to read the actual file

the problem is when BTF_ID definition like:

BTF_ID(struct, cgroup)

translates in 2 separate objects into same symbol name because of
the matching __COUNTER__ macro values (like 380 below)

  __BTF_ID__struct__cgroup__380

this change just adds unique id of the path name at the end of the
symbol with:

  echo -n 'kernel/bpf/helpers' | base32 -w0 --> NNSXE3TFNQXWE4DGF5UGK3DQMVZHG

so the symbol looks like:

  __BTF_ID__struct__cgroup__380NNSXE3TFNQXWE4DGF5UGK3DQMVZHG

and is unique over the sources

but I still hope we could come up with some better solution ;-)

jirka
