Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210F23D9
	for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 20:49:33 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-655e49717c2so10462136d6.0
        for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 13:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694465373; x=1695070173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uk1XDmqFwXUmTLSDlfzOoXD9AdaNAh9AxlQYo7gmX+U=;
        b=i8hyn6bpMkTmIqALqdb4QEd6GXFXsDqLp4JnFRIs/uS9y+CkaM5aNl1PHkd2Vzzy48
         aWj4eZlmTaXvvHwKyrQh9HPOjepCg+wI4bAyEZVRXyUQcQiDes+/60qF+zi3AzqOBTN/
         U9GMr1Er7rTZiukzWcGpzy2xphf1EGRAz3RFtqBK59F6L65HLlHhLONX5VntVvjoQzYR
         D2jUElJO9aUfZ3vmdgW4lfOT+Xzjkgce9/pLDW5ay+iIGYbNk6vxLxbg7hodTWOvNAQi
         iED3vtq7QqHRSZqwfnLu8aD/fjyHhJBnO7uoZcvHKk8eLq63GBwPtF6e9udkHI5NBdNH
         rR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694465373; x=1695070173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uk1XDmqFwXUmTLSDlfzOoXD9AdaNAh9AxlQYo7gmX+U=;
        b=kuGaT6HcHs0sPe7wIRSNpJFsXYL8OjRLTD+QUghRk/c3od21YYo2igSagjMddvXhUH
         0Fgg/lEJBj1TgzpAtMdiLG05iQ/To29ypzjWBY7e2RC1Q4pN4TuIJPwHyFqR2kUgY1xc
         j5r6IC4BsbzwwktPGzkOU3elDzlRVLdBR3bz3yW7ph683gT3E57cbJ2Js0qd6VlJeR4A
         Jr5mguvwn6dAjzbHBNHmp8aB34Z2zmhqsQQEEeL1QEXY+WZeevs9yCAwf3U7uqhHtlls
         +tr1TsE82lIOIDXuVRtkCI0aZ+wzTrRCdmgh1sG8piuRIG4Np6qEi+DO7d1PLiNrxZ+C
         Zxng==
X-Gm-Message-State: AOJu0YyVBNL+65jBerNWkzWHhxffuodMXCbAiFComFwnBQQCWzI3i9k4
	fx+FfZW4EL3imyVApUeubQUpxf7SN5yij4MmaK3/gw==
X-Google-Smtp-Source: AGHT+IHyaS9QKpap21B51umX64WFD1kwW1xpsmjerzMmTR5YKpb3rU4yHxt08JSEW/yD0p6ZFSUJGrDbdT7FWwaJzkc=
X-Received: by 2002:a0c:efce:0:b0:63d:6138:1027 with SMTP id
 a14-20020a0cefce000000b0063d61381027mr10551959qvt.42.1694465372796; Mon, 11
 Sep 2023 13:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905-missingvardecl2-init-main-c-v2-1-08498a9cf740@google.com>
 <CAKwvOd=uqAf3bX=5FTQ2JdvLmN7m4rS55cXuT01xbRqBN21NaQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=uqAf3bX=5FTQ2JdvLmN7m4rS55cXuT01xbRqBN21NaQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Sep 2023 13:49:22 -0700
Message-ID: <CAKwvOd=er2cLyzz2B-dAeR1mFi8YkN5ouuK4-qxhsCmEdJyqBA@mail.gmail.com>
Subject: Re: [PATCH v2] init: fix -Wmissing-variable-declarations clang warning
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 1:46=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Sep 5, 2023 at 3:43=E2=80=AFPM Justin Stitt <justinstitt@google.c=
om> wrote:
> >
> > When building x86/defconfig with Clang-18 I encounter the following war=
ning:
> > | init/main.c:189:13: warning: no previous extern declaration for non-s=
tatic variable 'envp_init' [-Wmissing-variable-declarations]
> > |   189 | const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TER=
M=3Dlinux", NULL, };
> > | init/main.c:189:7: note: declare 'static' if the variable is not inte=
nded to be used outside of this translation unit
> > |   189 | const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TER=
M=3Dlinux", NULL, };
> >
> > Make `envp_init` static and provide `handle_initrd` its own copy.
> >
> > This silences the warning and makes the code more readable as you no
> > longer have to track down extern definitions inside of `handle_initrd`.
> > It is now more self-contained.
>
> But this is now creating duplicate string arrays in the kernel image.
>
> Why can't this be:
> 1. declared in include/linux/initrd.h
> 2. defined in init/main.c
> 3. referenced in init/do_mounts.c
>
> The extern declaration in init/do_mounts_initrd.c isn't even correct!
> It's missing a `const`! That's the kind of monkey business this
> warning is trying to help avoid. C has headers for this reason, let's
> use them.
>
> Perhaps users of call_usermodehelper_setup need an update, or
> envp_init actually should not be const.

I prefer v1 as the basis; though as kbuild test robot noted to you,
there are other references to envp_init that now need to be cleaned up
in addition.

When you say you build tested v1, I assume you only built init/main.o
and not vmlinux. Make sure to build test ALL files which refer to
variables you've modified.

call_usermodehelper_setup and its callers either need to be cleaned
up, or we should consider dropping const.

>
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1920
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > The kernel test robot didn't like v1 of this patch and I prefer Kees'
> > approach to simplifying this code anyways so I'm sending this v2.
> > Hopefully the CI builds clean (as I am locally using their repro).
> >
> > Changes in v2:
> > - Make envp_init static and provide handle_initrd() with a copy (thanks=
 Kees)
> > - Rebase onto mainline (2dde18cd1d8fa)
> > - Link to v1: https://lore.kernel.org/r/20230830-missingvardecl2-init-m=
ain-c-v1-1-59007a637259@google.com
> > ---
> > Note: build-tested only.
> >
> > It should be noted that `handle_initrd` has been marked as deprecated
> > and perhaps the entire thing can be removed as per it's own message:
> > | using deprecated initrd support, will be removed in 2021.
> > ---
> >  init/do_mounts_initrd.c | 4 ++--
> >  init/main.c             | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
> > index 425f4bcf4b77..154bd0de85a6 100644
> > --- a/init/do_mounts_initrd.c
> > +++ b/init/do_mounts_initrd.c
> > @@ -87,7 +87,7 @@ static void __init handle_initrd(char *root_device_na=
me)
> >  {
> >         struct subprocess_info *info;
> >         static char *argv[] =3D { "linuxrc", NULL, };
> > -       extern char *envp_init[];
> > +       static char *envp[] =3D { "HOME=3D/", "TERM=3Dlinux", NULL, };
> >         int error;
> >
> >         pr_warn("using deprecated initrd support, will be removed in 20=
21.\n");
> > @@ -100,7 +100,7 @@ static void __init handle_initrd(char *root_device_=
name)
> >         init_mkdir("/old", 0700);
> >         init_chdir("/old");
> >
> > -       info =3D call_usermodehelper_setup("/linuxrc", argv, envp_init,
> > +       info =3D call_usermodehelper_setup("/linuxrc", argv, envp,
> >                                          GFP_KERNEL, init_linuxrc, NULL=
, NULL);
> >         if (!info)
> >                 return;
> > diff --git a/init/main.c b/init/main.c
> > index ad920fac325c..9a473107bb8f 100644
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -186,7 +186,7 @@ static int __init set_reset_devices(char *str)
> >  __setup("reset_devices", set_reset_devices);
> >
> >  static const char *argv_init[MAX_INIT_ARGS+2] =3D { "init", NULL, };
> > -const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TERM=3Dlinux=
", NULL, };
> > +static const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TERM=
=3Dlinux", NULL, };
> >  static const char *panic_later, *panic_param;
> >
> >  static bool __init obsolete_checksetup(char *line)
> >
> > ---
> > base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> > change-id: 20230830-missingvardecl2-init-main-c-93dc1013ff8a
> >
> > Best regards,
> > --
> > Justin Stitt <justinstitt@google.com>
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
