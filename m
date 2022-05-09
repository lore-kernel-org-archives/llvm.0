Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F7E1FC0
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 17:51:04 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id y19so17986705ljd.4
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z6h/UbBcSsy6Cwv/zRBUg+8oIkiwnR5qcB1QDqTp6w8=;
        b=lOajRfE7fyP+ep3MKFGW9mQh4e9I1Uiq21usbZezTUhM7EFdhg1SnvvNjY4eG59ULs
         V4Owko+szwUqUWwUMOPZ7L4L7x5m3g1Mm7rbCdqAjqtaLm5FvW/K5dfZdN0XW5hf65HO
         78imLtJfT6cP2hesjWXVSZsQU4pIUmnZcKDPw9almOyM+aeGj7565UrKRLWpVcmNrEwe
         xJkgCcUXrlopAOgqZYayw1LQ0mSuw5EChiwGNUaBuTsB3BXNrjGOYu+K76TLXsRGHsBe
         eQK1QSxvGw/P89SyjP0B19ZHce6iDYv7Nz+kMtnMo+aOblb0/ntvWz3HsYVV84q3HMkk
         YVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z6h/UbBcSsy6Cwv/zRBUg+8oIkiwnR5qcB1QDqTp6w8=;
        b=qapOMdMNDs49ZWzbQb/ny1+pAYmswYVjYVL8aw8GyertlzNnJLTIsSRa9zY1PkZisB
         QInDN26TSJBmFQRkqSpz7AxAfrsUnMvQDUx86B0Vv6tnJIyeJ514lIzObz49shBrwg3F
         8mlBNYwGamHRP92saJDrOMNMR8Tergoz0tofVwEzQztiQ4dq2IO1meuVohRGy+A9YKi7
         Bmg2BIcdZH6VmJyrP8hfiYm/OcPRXUYPwxZeRPmvKnVhtEq0rxbMd5EfBxUoubrWduH+
         uhgnxbCmiaUHuEYOwB+SmGU/k1v62sMt9Ged9oxSv73ZE4MZSg8nwJj+Lpbdz7Ak6ESG
         S4/g==
X-Gm-Message-State: AOAM5302f9+Xr30gzBjm3ksbtEiI2iK9YQ/vfmiOj6YTm3lMBmD0NS3X
	StQsIxNAAMF0xiETzQfvAE6T08Q6CK2icTY/GEc/yA==
X-Google-Smtp-Source: ABdhPJzH0GFY+4K8szx4KHcz2z6G62DNfHvef1hX/KTMFMx//VA0v3aill5VeXt5HmS0uJd9IHn4xVPu7N0kN8BJZnI=
X-Received: by 2002:a2e:a7c8:0:b0:24f:700a:4df5 with SMTP id
 x8-20020a2ea7c8000000b0024f700a4df5mr11176691ljp.472.1652118662391; Mon, 09
 May 2022 10:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org> <20220508190631.2386038-7-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-7-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 10:50:50 -0700
Message-ID: <CAKwvOdm_oSLHddWWSzF5UuYrLCsAwF8AwbUGotUnPvV+6JkSkg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

 On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
> index 07a36a874dca..51ce72ce80fa 100644
> --- a/include/asm-generic/export.h
> +++ b/include/asm-generic/export.h
> @@ -2,6 +2,14 @@
>  #ifndef __ASM_GENERIC_EXPORT_H
>  #define __ASM_GENERIC_EXPORT_H
>
> +/*
> + * This comment block is used by fixdep. Please do not remove.

I don't know much about fixdep. How does that work, if you could summarize?

> + *
> + * When CONFIG_MODVERSIONS is changed from n to y, all source files having
> + * EXPORT_SYMBOL variants must be re-compiled because genksyms is run as a
> + * side effect of the .o build rule.
> + */
> +
>  #ifndef KSYM_FUNC
>  #define KSYM_FUNC(x) x
>  #endif
> @@ -12,9 +20,6 @@
>  #else
>  #define KSYM_ALIGN 4
>  #endif
> -#ifndef KCRC_ALIGN
> -#define KCRC_ALIGN 4
> -#endif

The #ifndef is there because arch/m68k/include/asm/export.h:1 defines
KCRC_ALIGN. You should delete that, too.

> diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> index 4827c5abe5b7..6e6933ae7911 100644
> --- a/scripts/genksyms/genksyms.c
> +++ b/scripts/genksyms/genksyms.c
> @@ -33,7 +33,7 @@ char *cur_filename;
>  int in_source_file;
>
>  static int flag_debug, flag_dump_defs, flag_reference, flag_dump_types,
> -          flag_preserve, flag_warnings, flag_rel_crcs;
> +          flag_preserve, flag_warnings;
>
>  static int errors;
>  static int nsyms;
> @@ -681,10 +681,7 @@ void export_symbol(const char *name)
>                         fputs(">\n", debugfile);
>
>                 /* Used as a linker script. */

^ Does this comment still apply?

> -               printf(!flag_rel_crcs ? "__crc_%s = 0x%08lx;\n" :
> -                      "SECTIONS { .rodata : ALIGN(4) { "
> -                      "__crc_%s = .; LONG(0x%08lx); } }\n",
> -                      name, crc);
> +               printf("__crc_%s = 0x%08lx;\n", name, crc);
>         }
>  }
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index eceb3ee7ec06..6aee2401f3ad 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -88,11 +88,6 @@ modpost_link()
>                 gen_initcalls
>                 lds="-T .tmp_initcalls.lds"
>
> -               if is_enabled CONFIG_MODVERSIONS; then
> -                       gen_symversions

^ this is the only caller of gen_symversions, right? Then
gen_symversions can be cleaned up, too?

> -                       lds="${lds} -T .tmp_symversions.lds"
> -               fi
> -
>                 # This might take a while, so indicate that we're doing
>                 # an LTO link
>                 info LTO ${1}
> @@ -183,6 +178,10 @@ vmlinux_link()
>                 libs="${KBUILD_VMLINUX_LIBS}"
>         fi
>
> +       if is_enabled CONFIG_MODULES; then
> +               objs="${objs} .vmlinux.export.o"
> +       fi
> +
>         if [ "${SRCARCH}" = "um" ]; then
>                 wl=-Wl,
>                 ld="${CC}"
> @@ -312,6 +311,7 @@ cleanup()
>         rm -f vmlinux.o
>         rm -f .vmlinux.d
>         rm -f .vmlinux.objs
> +       rm -f .vmlinux.export.c

Probably can drop the `rm -f .tmp_symversions.lds` here, too?
-- 
Thanks,
~Nick Desaulniers
