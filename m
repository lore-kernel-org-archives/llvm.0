Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15708749D
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 20:04:06 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so526a12.1
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 13:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693425845; x=1694030645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbpX7Qm/dETVLLemaRynaMls7QRWhrvzeY0G4OaMlZI=;
        b=E51Rgs450EzFSTC4Kx2CPRIeWkA9SgBV9x6+o+j8SAqf+UcXml8+ijhuaMz1eOjuez
         qG7t2kWTZ0balMeuG+CLyxjyOlV9bC5oM2/pGICv1Ty8V0Tsr4mDzwA+pVBlK8xqpKN4
         rFJhDeG5d7DeWN2jTLOH7I+aFyCMv1QLpDGvmIQ2B938Tm2/s2QDpnLwTkp8jP0vI6j1
         rdQqr8WmHycRojM7hZQC2VYDIEfEpg9pWiu9LZ99tmwbkmXLZXbc0yOlpkgG9MUQny9e
         Ru/06Ljezh/q7pSTYeOH/3mLPt3/XQNjDpiS/DMFB/6Rs6PdX+JVj4XAl6gsNVL/vGlF
         5mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693425845; x=1694030645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbpX7Qm/dETVLLemaRynaMls7QRWhrvzeY0G4OaMlZI=;
        b=FUpokRSSZ5UCkt0q9Oim9zMiFrKNVGDGp79C+Rfw0j7NQE/iPgSX8uy0bzAZl5dXCV
         d3fvlqzBOsbyM8k0RtBdAl3EQhulv1dJzlH8FUZwAKY9DsaM2xQKMOGBwQGoOqUtAtoP
         xyI4UW5kK7IJCtVRo5kmVfU3KFp9hj0T0qWhX0l0Y1P6/jg2NcCNf981dfeRE/S9/PLu
         58ApFeZK/kI7hyOSwaHvgqq2/WCVFIP6DUGx6E2aWPfuZWko01CtCkbJgkdZY70jdiuP
         MQzWFWaUDGgeoy23OOhvntaCBIS6ZUmcbiKYxJXeMxC14u3II7eLkmsSUQTd3FOHPdCJ
         y1CA==
X-Gm-Message-State: AOJu0YypMToy8IRYBiUjjDd7Gon/Da2Y+f6HtHs3qGO8jJY5VscXKRJm
	kStlCdoWQLKFHA5ATxTYzt6IEHcVVihMLHwdVk9o
X-Google-Smtp-Source: AGHT+IEi37o1xhf+eU9hWiCam4YF+08bGRgrEaTqOlInAjmyZ3oWswzinbbMB923UGvcpg0VQbNuuRL0cwenJg9UEEU=
X-Received: by 2002:a50:8ad1:0:b0:522:cc9c:f5a4 with SMTP id
 k17-20020a508ad1000000b00522cc9cf5a4mr30588edk.4.1693425844947; Wed, 30 Aug
 2023 13:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230830-missingvardecl2-init-main-c-v1-1-59007a637259@google.com>
In-Reply-To: <20230830-missingvardecl2-init-main-c-v1-1-59007a637259@google.com>
From: Bill Wendling <morbo@google.com>
Date: Wed, 30 Aug 2023 13:03:46 -0700
Message-ID: <CAGG=3QVh+m00OirP0wLb1VzkO+Z6J4Cur+65x+oi4ZuQ1eHTYg@mail.gmail.com>
Subject: Re: [PATCH] init: fix -Wmissing-variable-declarations clang warning
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Jens Axboe <axboe@kernel.dk>, Peter Zijlstra <peterz@infradead.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 12:47=E2=80=AFPM Justin Stitt <justinstitt@google.c=
om> wrote:
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
> Move the extern declaration to a header file so that the compiler can fin=
d it
> when compiling init/main.c.
>
> Add `const` qualifier to extern declaration so that the types match and
> we follow the One-Definition Rule (ODR).
>
I'm not sure the lack of a "const" has anything to do with the ODR.
C's type system isn't nearly as strict as C++'s. :-) That said, adding
"const" is definitely correct.

-bw

> Link: https://github.com/ClangBuiltLinux/linux/issues/1920
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
>
> There's a previous RFC [1] wherein the kernel test robot reported some
> build errors which lead me to creating this patch which both fixes the
> errors as well as the -Wmissing-variable-declarations warning.
>
> [1]: https://lore.kernel.org/all/20230829-missingvardecl-init-main-c-v1-1=
-ddf0f1a71215@google.com/
>
> Also, get_maintainer.pl had a hard time finding folks to Cc here, not sur=
e why.
> ---
>  include/linux/initrd.h  | 2 ++
>  init/do_mounts_initrd.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/initrd.h b/include/linux/initrd.h
> index f1a1f4c92ded..0114f1acbb45 100644
> --- a/include/linux/initrd.h
> +++ b/include/linux/initrd.h
> @@ -34,4 +34,6 @@ extern unsigned long __initramfs_size;
>
>  void console_on_rootfs(void);
>
> +extern const char *envp_init[];
> +
>  #endif /* __LINUX_INITRD_H */
> diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
> index 425f4bcf4b77..b35c1b0babc2 100644
> --- a/init/do_mounts_initrd.c
> +++ b/init/do_mounts_initrd.c
> @@ -87,7 +87,6 @@ static void __init handle_initrd(char *root_device_name=
)
>  {
>         struct subprocess_info *info;
>         static char *argv[] =3D { "linuxrc", NULL, };
> -       extern char *envp_init[];
>         int error;
>
>         pr_warn("using deprecated initrd support, will be removed in 2021=
.\n");
>
> ---
> base-commit: 706a741595047797872e669b3101429ab8d378ef
> change-id: 20230830-missingvardecl2-init-main-c-93dc1013ff8a
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>
>
