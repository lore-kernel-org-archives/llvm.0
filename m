Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C6AD313
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 08:28:36 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5029e4bfa22so3110480e87.3
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694766514; x=1695371314; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5aBDwTfpgKmldVFjZ1KTI6+B18/4k4qUrT/W/k65x+U=;
        b=ktLL2B8d6WDZn2htP6Nh0lcVGW6Babump+A1eOuxcAeBZnoZZ8YfpilMq2TqB0S2hl
         gW2K5CdB1OJ2GVPpZ/tjjkZWnwC20gZgvaV/in18f9CoQgQY5OkBcmYod4MyC6DwaHY+
         fb0OimDf3j4p2qpzoddtF8ZKT7R6ncgBagpZBzqGjXJOqX50fK0wrGtxdAhT/et3pkTc
         vVBhPlNy4frteHzWSqSL1WMMcgYp6BHItx1LGc3zBDsaVbW06v8kV9o2wApTjFoX58xM
         yaDcOtxc/zTIj8ILTFc/BzpSARLzeMcKJmTnzPdZ3zTAvLn2QzPyTohdfZn/SGwSslaM
         4HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694766514; x=1695371314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aBDwTfpgKmldVFjZ1KTI6+B18/4k4qUrT/W/k65x+U=;
        b=brU/Ff9CKNOgted8yeSynxXH0puYqJ0VaP8IAdfDwWXUhiixIabuGtleMOsq5DGYtp
         EQmGN+vTSCW6wfNJJvUdBXiD0a3yz+c7TCnu3xTo003l24ioyzkdnMdFOulTeQrbhOGw
         xrZghQRAdgKUEpDgPw2yQmE3rIu2P9p+NwKPJMxdnmiaVUT0WHXIGdM+pt+EuU0jh/LP
         0dbhgv507d+S9m75IDExEfGEUu7VB28+Unarekebg9EZKCz5yW5oOXzixNesLIwYFsyh
         gVwhvjT+NZyk743RrROMtTDnCVnHqYP8VZWq0pUJqFxY64G3ZtRxM/d1YoUS/HmjnWj1
         kn2A==
X-Gm-Message-State: AOJu0YyVDElmMlIQDFqGHqQMI3vlLADw6z901n6aRRAygk5zZDXaFP3L
	pNRS9eduecv/GuN+fZEl9Vc=
X-Google-Smtp-Source: AGHT+IGIK813zEQEGARNdWFLHg4w3QUxqJM6O/aIUkzbGJMm325dwxArVqw34r3Httpeewx0Pvse/g==
X-Received: by 2002:ac2:58f8:0:b0:500:bb99:69a9 with SMTP id v24-20020ac258f8000000b00500bb9969a9mr767647lfo.64.1694766513710;
        Fri, 15 Sep 2023 01:28:33 -0700 (PDT)
Received: from krava ([83.240.62.189])
        by smtp.gmail.com with ESMTPSA id i23-20020a1709061cd700b009ad8796a6aesm2057754ejh.56.2023.09.15.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:28:32 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 15 Sep 2023 10:28:31 +0200
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Marcus Seyfarth <m.seyfarth@gmail.com>, bpf <bpf@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Stanislav Fomichev <sdf@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
Message-ID: <ZQQVr35crUtN1quS@krava>
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava>
 <ZPsJ4AAqNMchvms/@krava>
 <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>
 <ZPuA5+HmbcdBLbIq@krava>
 <ZQLBm8sC+V53CIzD@krava>
 <CAK7LNATiHvOXiWQi9gXJO9rZbT_MFm6NddaWqoY4ykNWf+OYsQ@mail.gmail.com>
 <ZQLX3oSCk95Qf4Ma@krava>
 <CAEf4Bzb5KQ2_LmhN769ifMeSJaWfebccUasQOfQKaOd0nQ51tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4Bzb5KQ2_LmhN769ifMeSJaWfebccUasQOfQKaOd0nQ51tw@mail.gmail.com>

On Thu, Sep 14, 2023 at 11:14:19AM -0700, Andrii Nakryiko wrote:
> On Thu, Sep 14, 2023 at 2:52 AM Jiri Olsa <olsajiri@gmail.com> wrote:
> >
> > On Thu, Sep 14, 2023 at 05:30:51PM +0900, Masahiro Yamada wrote:
> >
> > SNIP
> >
> > > > > so the change is about adding unique id that's basically path of
> > > > > the object stored in base32 so it could be used as symbol, so we
> > > > > don't really need to read the actual file
> > > > >
> > > > > the problem is when BTF_ID definition like:
> > > > >
> > > > > BTF_ID(struct, cgroup)
> > > > >
> > > > > translates in 2 separate objects into same symbol name because of
> > > > > the matching __COUNTER__ macro values (like 380 below)
> > > > >
> > > > >   __BTF_ID__struct__cgroup__380
> > > > >
> > > > > this change just adds unique id of the path name at the end of the
> > > > > symbol with:
> > > > >
> > > > >   echo -n 'kernel/bpf/helpers' | base32 -w0 --> NNSXE3TFNQXWE4DGF5UGK3DQMVZHG
> > > > >
> > > > > so the symbol looks like:
> > > > >
> > > > >   __BTF_ID__struct__cgroup__380NNSXE3TFNQXWE4DGF5UGK3DQMVZHG
> > > > >
> > > > > and is unique over the sources
> > > > >
> > > > > but I still hope we could come up with some better solution ;-)
> > > >
> > > > so far the only better solution I could come up with is to use
> > > > cksum (also from coreutils) instead of base32, which makes the
> > > > BTF_ID_BASE value compact
> > > >
> > > > I'll run test to find out how much it hurts the build time
> > > >
> > > > jirka
> > >
> > >
> > >
> > > Seems a bad idea to me.
> > >
> > > It would fork a new shell and chsum for all files,
> > > while only a few of them need it.
> >
> > right, I have a change to limit this on kernel and net directories,
> > but it's still bad
> >
> > >
> > > Better to consult BTF forks.
> >
> > perhaps there's better way within kbuild to get unique id/value
> > for each object file?
> 
> let's just use __LINE__ + __COUNTER__ for now and teach resolve_btfids
> to fail and complain loudly about duplicate symbols?

ok, will send that.. but it fails during link before resolve_btfids
takes place

> 
> 
> This will give us time and opportunity to implement a better approach
> to .BTF_ids overall. Encoding the desired type name in the symbol name
> always felt off. Maybe it's better to encode type + name as data,
> which is discarded at the latest stage during vmlinux linking? Either

hum, so maybe having a special section (.BTF_ids_desc below)
that would have record for each ID placed in .BTF_ids section:

asm(                                           \
".pushsection .BTF_ids,\"a\";        \n"       \
"1:                                  \n"       \
".zero 4                             \n"       \
".popsection;                        \n"       \
".pushsection .BTF_ids_desc,\"a\";   \n"       \
".long 1b                            \n"       \

and somehow get prefix and name pointers in here:

".long prefix
".long name

".popsection;                        \n");

so resolve_btfids would iterate .BTF_ids_desc records and fix
up .BTF_ids data..

we might need to do one extra link phase to get rid of the
.BTF_ids_desc secion 

> way, this baseid hack seems worse and unnecessary.

yes, it's bad

jirka
