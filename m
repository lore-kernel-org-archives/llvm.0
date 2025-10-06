Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0170026058D
	for <llvm@lists.linux.dev>; Mon,  6 Oct 2025 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773417; cv=none; b=skn0BwCOAf7ZP5vCSODHRgecDwjqNAaINr/ZnmaKaW0hKdAJPvLcquD6Ur/X5zpr9KFx+t6gE9LVgrmkD3TFBzSTpLgdicGZzkgUPo0CdP5DhFt50sNhYVsDhji1LJtoKfnMQZJEPSKIfeyCdNrb+ZXhApfgDcYM7ey1kuDgpp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773417; c=relaxed/simple;
	bh=U9ffjV7BL0HXoD5lEUkf+VHuGrAOPXko+Tm91qRV1X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e81McXhBmOUqhKZCu1+gqfgp1eMjFv8XXBteKEoOWQu1QFRGU04Q4dsd6WM/0fRKe0yursECPgKWdYiLrG3zeB0akiaWs6jHF14vhOLbVNaVJgYbR6ch+0A0KkTuYuC1lEt6gEUib6FPRPlXTWBWM5fc8Ddkq3+pONoVk/l1V4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oBrsBJM0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oBrsBJM0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2681645b7b6so16995ad.1
        for <llvm@lists.linux.dev>; Mon, 06 Oct 2025 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759773415; x=1760378215; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgNIO/Vg03wOgHjezxsvevp0MBXeQPhEmL6wrOMft2c=;
        b=oBrsBJM0BQ2PJT2XUQh9FVrUz5HyqcBI2Ggu/AU5wr30FAINeafuJ4Fujhc1/CzeJg
         pcQxz05Fqv+9KWmGVehznqNi7jQzpvIjgzqMrjAU7vZLgWm5QZjTGOZCpBpfw4M7rMdn
         IiKIZc8S6KY0lyt8Fy2ylUvdIwIWAO75MY7DbldRddfjBjQwaIdm2wQ2IndZkTOvQtoi
         kA8GdD9UUXdVn1y94Y+WTi2EoTYj4vdM+KuhUqpsUYq74Nq9rfMp+SJgAoTgP4gz3zql
         8QJHDOrNNOKhHuXmwAri9QiP99cZLsVZ0TVIH+tZNYDOfZbfb0ay3TfiqmrdTLA97MC9
         683g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773415; x=1760378215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgNIO/Vg03wOgHjezxsvevp0MBXeQPhEmL6wrOMft2c=;
        b=kjyy+9iI13sNIxnsbN0c77dmdHhyvKy1FA8lp1d07fgn+UzW7T57n0dnW77G5v/aar
         f0wdFMKm9mvr5rHJcKPRQWgbAWOawAoKG8o58Bg9Do2jxsUDBxFs56bI8yEkR+UyZb1q
         dkQUgqwLf7B4wGV1KV+MBCAbC22vQQfa/fk1QrMWwRr1jHcXS8oACujyv/NL/2lYNsvG
         6OiSD3JRsrLnKLg/WQyZrSFBOAw7ozwpyNXB3hhUGSVmMktvrHJDFjXfFvPiUBo5kzsw
         qRt1MvuqpnSo7EDDYi9bpuvrbkvxgE+ofMSTnA76fSFNWnkkp695DtRuIEIFE0GUD+X5
         kHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWByLd7YDbHRERaO54vS5s8BDtb0zIbw6jFOHj+uOOsMpJra/0XjabdLh10Q4D9WyNk7XoR@lists.linux.dev
X-Gm-Message-State: AOJu0YwX+DvqbDEoGRpvzHaZVyAD9808X7SHRi8xBn6L72xy5jL99e7F
	CxKYMRZJ915sWTKPwzQ3aG2+IAOAM+tpE+Raa/Vz83hV7+4i4Axl0jcyl143rUONMBG+IAO2bXw
	g1rnHWIwAdLxzPKrp29iw2QQNehoB1YQU3olVZ0sQ
X-Gm-Gg: ASbGncv8zPl9QvaQhjewr7ENj9fQGvpa6gAzxDSDzxYeHjXcc+nOGj85lkGh+7HQGsR
	0+fe3brICiSAmM3wiewE7G9EE+fJNRrR+NTqB/95ik7Pq2F8Cb5rov/F8QX70imY1bkmNW0akpA
	/rc6czs76ziXyi8VPrRfPsiWEhmJvfHE3CVEUYyYbLHALf+x1MjgDZeeaD5JRN23IvqZyPQaFY7
	sLTQkEDb+Ea6pafG3TC7xDAEAYkzytj8QAJZzzdagMFW8tr6WvfI/fsu73ftlr8mHAI0F7H2eIX
	reQ=
X-Google-Smtp-Source: AGHT+IEc0OvHtFH5e8JUnvIJenLMDF0rFXPhnKj1FxC7gkK5Xn2psBR9dBkn9cD2lkoGGsFgB9c6AUjOaYgzf5qGaJo=
X-Received: by 2002:a17:903:3d07:b0:268:cc5:5e3c with SMTP id
 d9443c01a7336-28eca40ef40mr356805ad.10.1759773414620; Mon, 06 Oct 2025
 10:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com> <20251006-perf_build_android_ndk-v3-4-4305590795b2@arm.com>
In-Reply-To: <20251006-perf_build_android_ndk-v3-4-4305590795b2@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Oct 2025 10:56:43 -0700
X-Gm-Features: AS18NWBYM4S-kQkaLa4kp8LfC_m-pnaoulSPmNbf8CExHNpB0ol_xCKKyPKhVEQ
Message-ID: <CAP-5=fUVs8Dn+kQDgPW08SNC=W5ZQKMFEETjjqkOJ_Mvbv22dw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] perf build: Disable thread safety analysis for
 perl header
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 9:21=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> When build with perl5, it reports error:
>
>     In file included from /usr/lib/perl5/5.42.0/x86_64-linux-thread-multi=
/CORE/perl.h:7933:
>     /usr/lib/perl5/5.42.0/x86_64-linux-thread-multi/CORE/inline.h:298:5: =
error:
>           mutex 'PL_env_mutex.lock' is not held on every path through
>           here [-Werror,-Wthread-safety-analysis]
>       298 |     ENV_UNLOCK;
>           |     ^
>     /usr/lib/perl5/5.42.0/x86_64-linux-thread-multi/CORE/perl.h:7091:31: =
note:
>           expanded from macro 'ENV_UNLOCK'
>      7091 | #  define ENV_UNLOCK          PERL_REENTRANT_UNLOCK("env"...
>           |                               ^
>     /usr/lib/perl5/5.42.0/x86_64-linux-thread-multi/CORE/perl.h:6465:7: n=
ote:
>           expanded from macro 'PERL_REENTRANT_UNLOCK'
>      6465 |     } STMT_END
>           |       ^
>     /usr/lib/perl5/5.42.0/x86_64-linux-thread-multi/CORE/perl.h:865:28: n=
ote:
>           expanded from macro 'STMT_END'
>       865 | #   define STMT_END     while (0)
>           |                                ^
>
> The error is caused by perl header but not perf code, disable thread
> safety analysis if including the header.
>
> Though GCC does not support the thread safety analysis option, this
> negative warning flag is silently ignored by it.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/perf/scripts/perl/Perf-Trace-Util/Build | 2 +-
>  tools/perf/util/scripting-engines/Build       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/scripts/perl/Perf-Trace-Util/Build b/tools/perf/s=
cripts/perl/Perf-Trace-Util/Build
> index 9b0e5a8b5070f1a1640518fae75557f824ef21ee..01a1a0ed51aefd721b4bc7eba=
728c29a8ffcd551 100644
> --- a/tools/perf/scripts/perl/Perf-Trace-Util/Build
> +++ b/tools/perf/scripts/perl/Perf-Trace-Util/Build
> @@ -2,7 +2,7 @@ perf-util-y +=3D Context.o
>
>  CFLAGS_Context.o +=3D $(PERL_EMBED_CCOPTS) -Wno-redundant-decls -Wno-str=
ict-prototypes -Wno-bad-function-cast -Wno-declaration-after-statement -Wno=
-switch-enum
>  CFLAGS_Context.o +=3D -Wno-unused-parameter -Wno-nested-externs -Wno-und=
ef
> -CFLAGS_Context.o +=3D -Wno-switch-default -Wno-shadow
> +CFLAGS_Context.o +=3D -Wno-switch-default -Wno-shadow -Wno-thread-safety=
-analysis

I wasn't able to reproduce this on Debian with perf-tools-next and:
make -C tools/perf O=3D/tmp/perf DEBUG=3D1 CC=3Dclang CXX=3Dclang++
HOSTCC=3Dclang LIBPERL=3D1 clean all
but my libperl is 5.40. I'm a little concerned that the warning may
cause an unrecognized compiler option warning/error with GCC given
progress on thread-safety-analysis has ended there. Anyway, these
aren't blockers.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>
>  ifeq ($(CC_NO_CLANG), 1)
>    CFLAGS_Context.o +=3D -Wno-unused-command-line-argument
> diff --git a/tools/perf/util/scripting-engines/Build b/tools/perf/util/sc=
ripting-engines/Build
> index 2282fe3772f3bdc35056cb5e66efb3462dc1c2e3..24f087b0cd11b3e06a338c394=
dc2c650bc2c60b1 100644
> --- a/tools/perf/util/scripting-engines/Build
> +++ b/tools/perf/util/scripting-engines/Build
> @@ -3,7 +3,7 @@ ifeq ($(CONFIG_LIBTRACEEVENT),y)
>  endif
>  perf-util-$(CONFIG_LIBPYTHON) +=3D trace-event-python.o
>
> -CFLAGS_trace-event-perl.o +=3D $(PERL_EMBED_CCOPTS) -Wno-redundant-decls=
 -Wno-strict-prototypes -Wno-unused-parameter -Wno-shadow -Wno-nested-exter=
ns -Wno-undef -Wno-switch-default -Wno-bad-function-cast -Wno-declaration-a=
fter-statement -Wno-switch-enum
> +CFLAGS_trace-event-perl.o +=3D $(PERL_EMBED_CCOPTS) -Wno-redundant-decls=
 -Wno-strict-prototypes -Wno-unused-parameter -Wno-shadow -Wno-nested-exter=
ns -Wno-undef -Wno-switch-default -Wno-bad-function-cast -Wno-declaration-a=
fter-statement -Wno-switch-enum -Wno-thread-safety-analysis
>
>  # -Wno-declaration-after-statement: The python headers have mixed code w=
ith declarations (decls after asserts, for instance)
>  CFLAGS_trace-event-python.o +=3D $(PYTHON_EMBED_CCOPTS) -Wno-redundant-d=
ecls -Wno-strict-prototypes -Wno-unused-parameter -Wno-shadow -Wno-deprecat=
ed-declarations -Wno-switch-enum -Wno-declaration-after-statement
>
> --
> 2.34.1
>
