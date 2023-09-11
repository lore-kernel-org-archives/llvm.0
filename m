Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C723D9
	for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 20:46:29 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-64914f08c65so30481686d6.1
        for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694465188; x=1695069988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfbFEpTKfUuP4aETijqFfdDlNmxSym5xW5z+8x33k70=;
        b=l6Ji6pgVCLn4qbfpi9NHkNGdcgTU1/QU0BiCxIxvbXb1TFEv08ie76Tves0YxiI4kO
         BWF+qXsCFoSuhGCJPDBkNMMcddN1XJPLjrKO27Yk4ZE1y6QJ3XAFVpTQ4EiAMDZhkTOU
         vGHidY2YWiXOlKo2XExfTLqhclAPrdHUwXjnFK04djTSYqez3sEE1zZat/BrFH0sW33g
         Iy750gqKj49MmxL3XVocaetseTlZPgos+q8wL0MEASGHIIYsHKC/2MLPcf+W9vpHuxfd
         ARraPHQz34rJDm4/zrz4n8iPOF1JZ8vG1gMIJ8/khzT3EWNUVybuQ3jen2yiZXCkqkeP
         s5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694465188; x=1695069988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfbFEpTKfUuP4aETijqFfdDlNmxSym5xW5z+8x33k70=;
        b=e9PbNGkz9M3yLNem8ygvv8VAtmV7fH7zOgl8302tP4hTJxgCasmLfQjZ/4IBfEpK58
         R1tYR7b7uG6XJ8zW+LV7otQoIaFKloJyq2mE0mOUnek/NajwvroT19aHMSzazKWz4gfo
         /TFpVy9ItOm3hB5gY3fQmw9QJ2cJjzeSHlLlYE4DqnWNyUJkDQZ3dHT+jZEG0j4fFdqJ
         VyShwVvadK0iyebtM5GfUCIm+0kk8HYBZgD1krt2fV/VFg2cQfCyg0LFI/lt4tLPiHu4
         N2+968psyBoM5cZRm6A0j8FNr2bv8QqBukbaOmlsrqGQ4jSCcxVTgc0YHQTsnYASM85V
         plSw==
X-Gm-Message-State: AOJu0YwphrfGsieJ6eKy2A2fo5Q+Pz3HIa4UkI8l482B7a/AYf753jhQ
	Y1hLMgvEBpYviVm7AUHRF+4cHOM5WvEO3HQP4cMuMA==
X-Google-Smtp-Source: AGHT+IEtqLjTeVXxu++lV0mt1ISqKfKmwWtzV7NW49kNL492TJ4cBfRQOurjWHhFzi4F9H+Y4iIEGiog34FbQBt8pRg=
X-Received: by 2002:a0c:dc13:0:b0:64f:3bec:9b29 with SMTP id
 s19-20020a0cdc13000000b0064f3bec9b29mr12022165qvk.39.1694465187700; Mon, 11
 Sep 2023 13:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905-missingvardecl2-init-main-c-v2-1-08498a9cf740@google.com>
In-Reply-To: <20230905-missingvardecl2-init-main-c-v2-1-08498a9cf740@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Sep 2023 13:46:13 -0700
Message-ID: <CAKwvOd=uqAf3bX=5FTQ2JdvLmN7m4rS55cXuT01xbRqBN21NaQ@mail.gmail.com>
Subject: Re: [PATCH v2] init: fix -Wmissing-variable-declarations clang warning
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 3:43=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>
> When building x86/defconfig with Clang-18 I encounter the following warni=
ng:
> | init/main.c:189:13: warning: no previous extern declaration for non-sta=
tic variable 'envp_init' [-Wmissing-variable-declarations]
> |   189 | const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TERM=
=3Dlinux", NULL, };
> | init/main.c:189:7: note: declare 'static' if the variable is not intend=
ed to be used outside of this translation unit
> |   189 | const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TERM=
=3Dlinux", NULL, };
>
> Make `envp_init` static and provide `handle_initrd` its own copy.
>
> This silences the warning and makes the code more readable as you no
> longer have to track down extern definitions inside of `handle_initrd`.
> It is now more self-contained.

But this is now creating duplicate string arrays in the kernel image.

Why can't this be:
1. declared in include/linux/initrd.h
2. defined in init/main.c
3. referenced in init/do_mounts.c

The extern declaration in init/do_mounts_initrd.c isn't even correct!
It's missing a `const`! That's the kind of monkey business this
warning is trying to help avoid. C has headers for this reason, let's
use them.

Perhaps users of call_usermodehelper_setup need an update, or
envp_init actually should not be const.

>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1920
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> The kernel test robot didn't like v1 of this patch and I prefer Kees'
> approach to simplifying this code anyways so I'm sending this v2.
> Hopefully the CI builds clean (as I am locally using their repro).
>
> Changes in v2:
> - Make envp_init static and provide handle_initrd() with a copy (thanks K=
ees)
> - Rebase onto mainline (2dde18cd1d8fa)
> - Link to v1: https://lore.kernel.org/r/20230830-missingvardecl2-init-mai=
n-c-v1-1-59007a637259@google.com
> ---
> Note: build-tested only.
>
> It should be noted that `handle_initrd` has been marked as deprecated
> and perhaps the entire thing can be removed as per it's own message:
> | using deprecated initrd support, will be removed in 2021.
> ---
>  init/do_mounts_initrd.c | 4 ++--
>  init/main.c             | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
> index 425f4bcf4b77..154bd0de85a6 100644
> --- a/init/do_mounts_initrd.c
> +++ b/init/do_mounts_initrd.c
> @@ -87,7 +87,7 @@ static void __init handle_initrd(char *root_device_name=
)
>  {
>         struct subprocess_info *info;
>         static char *argv[] =3D { "linuxrc", NULL, };
> -       extern char *envp_init[];
> +       static char *envp[] =3D { "HOME=3D/", "TERM=3Dlinux", NULL, };
>         int error;
>
>         pr_warn("using deprecated initrd support, will be removed in 2021=
.\n");
> @@ -100,7 +100,7 @@ static void __init handle_initrd(char *root_device_na=
me)
>         init_mkdir("/old", 0700);
>         init_chdir("/old");
>
> -       info =3D call_usermodehelper_setup("/linuxrc", argv, envp_init,
> +       info =3D call_usermodehelper_setup("/linuxrc", argv, envp,
>                                          GFP_KERNEL, init_linuxrc, NULL, =
NULL);
>         if (!info)
>                 return;
> diff --git a/init/main.c b/init/main.c
> index ad920fac325c..9a473107bb8f 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -186,7 +186,7 @@ static int __init set_reset_devices(char *str)
>  __setup("reset_devices", set_reset_devices);
>
>  static const char *argv_init[MAX_INIT_ARGS+2] =3D { "init", NULL, };
> -const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TERM=3Dlinux",=
 NULL, };
> +static const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TERM=3D=
linux", NULL, };
>  static const char *panic_later, *panic_param;
>
>  static bool __init obsolete_checksetup(char *line)
>
> ---
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> change-id: 20230830-missingvardecl2-init-main-c-93dc1013ff8a
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>


--=20
Thanks,
~Nick Desaulniers
