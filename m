Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3CFD2F1
	for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 22:35:18 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-78f1210e27fso2018234241.1
        for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692225317; x=1692830117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SX8jlMVqMi1+mLRoYyUfc72SUd+crYgBsYv56+9V6E=;
        b=EfLFo/b41aCL09FPShvIG4tmRfEM0AwoIXv4zJi49BVDrF9iPI0A8tbq7wR4GQ0e9p
         oivgK7oz9AKcXdl2AHm4mwT2RWJEekqG5ehDH0h1D2QkJmPpDLbEgyyHCyZLK1PmVn3e
         zovIeprLeYevzeyj5NnQkJKitard3wRxq1Pejhayb3ju9rtFqyqs28IVC0TJIMjgED+n
         5seVZQzsp70BDVbVQDuVR9Va4sPDH8z1COdrb2bVRzEbIxHnHvfdk724UhKH9YayP2np
         +JMvf40D3KN/T+WBRDVcd3vov+V6HWZTYVP8sbiRt4HJWrQb8+IndhjuTc1UXuyD23Tz
         PTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225317; x=1692830117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SX8jlMVqMi1+mLRoYyUfc72SUd+crYgBsYv56+9V6E=;
        b=cWQVjTpNR1ThrXyG41WXXEMjKlzqQe+iZSEJ2wbvYtFyAVhS1CHcd0Ej+bli4XZSNQ
         /shptdbOFFXVCVhKwZngI3ADDeLmutOojJZSinaW1RSN97jY7sS8W2FyoHp0zArYDnwT
         wNMy9rF1DlwyAHtNJWqa0pMqMnPDVcXmwqEQOrkrPui9w4EWotR3why/C0GtrUKSYE0T
         iEXkVv9Tu8VOMTpq2Ynss1Hg4tswBEI9n5uh+pA3t3XKIu9OanDd4LgZpsq6tMVl0PF3
         Bixvq9NMSlSEnU45WOrS/Uii6npRtXAlmrcJR8ur+1dWSoTZDs/doRN1WLzB1g4nu09x
         Q67A==
X-Gm-Message-State: AOJu0YwDKvtOWDPbXRkTMC8+gkPjtCkPSvIMXTaLH1NEp57a94LZ22e2
	5VkZQ0iOWvDf8avXsaIk66ROUHGgxEUJTKnyuxz6mw==
X-Google-Smtp-Source: AGHT+IGxyLfu+paRIoexaD6++oCBn/XHtUBIo0chldIV2SAMVOqAwfY5RYFRwl6Gb08X8o6pYt8fWuN4GCV6exZuHyU=
X-Received: by 2002:a67:f299:0:b0:446:a2f8:9fe4 with SMTP id
 m25-20020a67f299000000b00446a2f89fe4mr2962206vsk.16.1692225317332; Wed, 16
 Aug 2023 15:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org> <20230816220457.kqzlbiibeomvki4y@google.com>
In-Reply-To: <20230816220457.kqzlbiibeomvki4y@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Aug 2023 15:35:06 -0700
Message-ID: <CAKwvOdnRb1OmLWNWnj5f-r-rqL0=OsBXJV9d7OU3bjXtOLLtiA@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
To: Fangrui Song <maskray@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, conor@kernel.org, 
	trix@redhat.com, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 3:05=E2=80=AFPM Fangrui Song <maskray@google.com> w=
rote:
>
> On 2023-08-16, Nathan Chancellor wrote:
> >When building for ARCH=3Driscv using LLVM < 14, there is an error with
> >CONFIG_DEBUG_INFO_SPLIT=3Dy:
> >
> >  error: A dwo section may not contain relocations
> >
> >This was worked around in LLVM 15 by disallowing '-gsplit-dwarf' with
> >'-mrelax' (the default), so CONFIG_DEBUG_INFO_SPLIT is not selectable
> >with newer versions of LLVM:
> >
> >  $ clang --target=3Driscv64-linux-gnu -gsplit-dwarf -c -o /dev/null -x =
c /dev/null
> >  clang: error: -gsplit-dwarf is unsupported with RISC-V linker relaxati=
on (-mrelax)
> >
> >GCC silently had a similar issue that was resolved with GCC 12.x.
> >Restrict CONFIG_DEBUG_INFO_SPLIT for RISC-V when using LLVM or GCC <
> >12.x to avoid these known issues.
> >
> >Link: https://github.com/ClangBuiltLinux/linux/issues/1914
> >Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99090
> >Reported-by: kernel test robot <lkp@intel.com>
> >Closes: https://lore.kernel.org/all/202308090204.9yZffBWo-lkp@intel.com/
> >Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >---
> >Since this only impacts RISC-V, it seems reasonable that this would go
> >in via their tree but I have added Andrew in case he wants to take it.
> >---
> > lib/Kconfig.debug | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> >diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> >index d6798513a8c2..bd51274f4771 100644
> >--- a/lib/Kconfig.debug
> >+++ b/lib/Kconfig.debug
> >@@ -355,6 +355,11 @@ endchoice # "Compressed Debug information"
> > config DEBUG_INFO_SPLIT
> >       bool "Produce split debuginfo in .dwo files"
> >       depends on $(cc-option,-gsplit-dwarf)
> >+      # RISC-V linker relaxation + -gsplit-dwarf has issues with LLVM a=
nd GCC
> >+      # prior to 12.x:
> >+      # https://github.com/llvm/llvm-project/issues/56642
> >+      # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99090
> >+      depends on !RISCV || GCC_VERSION >=3D 120000

Thanks for the patch. I was initially surprised to see no explicit
check for LLVM version.  Rereading the commit description a few times,
I think it makes sense, but I'm guessing we may need to rework this
condition again should we eventually get split debug info working for
riscv for llvm.  I am looking to enable split debug info for kernels
for Android's next release.

Fangrui, any thoughts on feasibility for `-mrelax` and `-gsplit-dwarf`
composability for llvm?

Link: https://github.com/llvm/llvm-project/issues/56642
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> >       help
> >         Generate debug info into separate .dwo files. This significantl=
y
> >         reduces the build directory size for builds with DEBUG_INFO,
> >
> >---
> >base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
> >change-id: 20230816-riscv-debug_info_split-0713571a1ac2
> >
> >Best regards,
> >--
> >Nathan Chancellor <nathan@kernel.org>
> >
>
> LGTM as the author of the Clang mitigation
> (https://github.com/llvm/llvm-project/issues/56642) and several recent
> LLVM assembler side linker relaxation improvement (I continue updating
> https://maskray.me/blog/2021-03-14-the-dark-side-of-riscv-linker-relaxati=
on
> about the complication of linker relaxation).
>
> Reviewed-by: Fangrui Song <maskray@google.com>



--=20
Thanks,
~Nick Desaulniers
