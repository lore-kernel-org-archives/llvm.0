Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671AB257E
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 14:16:26 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id i74so6300751ioa.4
        for <llvm@lists.linux.dev>; Sun, 22 May 2022 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=3dfbftv0bHItknlzHvUMl9TypfZzWyDtE0vtZuY9/u4=;
        b=MHTLDzSqR55aJLipGdUoc1ij6dSycjmCtcPhxekYYtNoAaTpxDgNlFEJiNWSvuCPKk
         YqPMjRwVBlCIpm8BoCjocOl+ryyq2axnL0Ag06xaO8Bv0BJV+E7L4n5Fs03F+SJIf3z2
         2RmvJtOjN8l8ZPXYdnLn8p9j+TfpxjorO7S4ssdtYjIm23PSZ0lDRAMo7DmrUmTomSJm
         I135LF5cD/TxFPDEEkJ7wyEQQfo6COQCUYwF8upa8nM/abv6UJgBTUj33wDdK1nwtU5i
         bsaTHXNb0MVpQA6KpIyFG6mj1rbeAdiusPNFOWy0aWtL37ygRJhXmeNX0rm/4b33euRY
         kwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=3dfbftv0bHItknlzHvUMl9TypfZzWyDtE0vtZuY9/u4=;
        b=i1y1wQGD2tN1Byxbn2nJKSf/7gyL6x86P0QRCpCRd2FjNa82Ic5LktO3hzXZrpZARi
         v/8cyPzM7e0wjhazYK4tUcVZV94K+CzPduqU11tO5BeCJyjbC2ujiHBA/Fj+TFhS5kxu
         bC3NaGPcIacyHuAmBUNlOCdgugLzX4mJnQ0/MHG5xFL3VGaN5jlRDJM/mp6t8auwG3ww
         NlPnf7Pn53Tpr4rkf7kt9UjSnqExFaeE7VS2JkF50xAOjU6yB2gIooTv2bmNmsP9of2h
         sqiC4OGcvO8EyGhSTe/MQyfW5aDnmu1ZVv4kZpccAqHvZoj27PTkG1cSACJZqGd3J3cA
         rTkw==
X-Gm-Message-State: AOAM533tvUxu3gIpUrtLnz1T/5Fxa029ttcIvvye+w/62J2CrkNyCVYB
	6jR12/7rY1wx/sgG3bM8DJL3dwq/u5NC6B+/r+c=
X-Google-Smtp-Source: ABdhPJw1CV7WTOX07Dg1AJ+AhSUJ6vQaIcAn8P91Nmcnn2lOvrQfZXjGzRCF2gJknGRsDu4GWUaiXA7t05oIb69dBIg=
X-Received: by 2002:a05:6638:14cb:b0:32e:cf97:4ac with SMTP id
 l11-20020a05663814cb00b0032ecf9704acmr198855jak.80.1653228985425; Sun, 22 May
 2022 07:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513113930.10488-1-masahiroy@kernel.org> <CAK7LNAQvneCi11myLpkikuXh=i5PLtTaLe0nGpDZXgv_Q1L0Ow@mail.gmail.com>
 <CA+icZUUWww3fXvjQcefgFuq=tPO6+FYDbHE2E5PmL-BSJg4+cw@mail.gmail.com>
 <CAK7LNATx1QcM6BdqBSascV8J8rD6etRgRZj9PjBno5Qrb=p3Yg@mail.gmail.com> <CA+icZUV=PwX_e3U3mZwLOVvsA02pgNNAPsGJSMCPitu9ndWbqg@mail.gmail.com>
In-Reply-To: <CA+icZUV=PwX_e3U3mZwLOVvsA02pgNNAPsGJSMCPitu9ndWbqg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 22 May 2022 16:15:49 +0200
Message-ID: <CA+icZUWttwjhDNPO1VuVyiMoReH5e83nsYDd0rEoY8-Uwv6pHw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] kbuild: yet another series of cleanups (modpost,
 LTO, MODULE_REL_CRCS, export.h)
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Zijlstra <peterz@infradead.org>, linux-modules <linux-modules@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 22, 2022 at 11:45 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sun, May 22, 2022 at 8:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Sun, May 22, 2022 at 10:45 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Fri, May 13, 2022 at 4:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > On Fri, May 13, 2022 at 8:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > >
> > > > >
> > > > > This is the third batch of cleanups in this development cycle.
> > > > >
> > > >
> > > >
> > > > This series is available at
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> > > >  lto-cleanup-v6
> > > >
> > >
> > > Hi Masahiro,
> > >
> > > I cloned the repository on top of latest Linus Git.
> > >
> > > Not able to boot in Quemu - Not able to boot on bare metal.
> > >
> > > $ grep module_layout log_quemu-5.18.0-rc7-2-amd64-clang14-lto.txt
> > > 366:[    2.173265] floppy: disagrees about version of symbol module_layout
> > > 367:[    2.198746] scsi_common: disagrees about version of symbol module_layout
> > > 368:[    2.205573] i2c_piix4: disagrees about version of symbol module_layout
> > > 369:[    2.210610] psmouse: disagrees about version of symbol module_layout
> > > 370:[    2.225138] scsi_common: disagrees about version of symbol module_layout
> > > 371:[    2.235536] scsi_common: disagrees about version of symbol module_layout
> > > 375:Begin: Running /scripts/local-premount ... [    2.298555]
> > > crc32c_intel: disagrees about version of symbol module_layout
> > > 376:[    2.303335] crc32c_generic: disagrees about version of symbol
> > > module_layout
> > > 377:[    2.306667] libcrc32c: disagrees about version of symbol module_layout
> > >
> > > Infos: LLVM-14 + CONFIG_LTO_CLANG_THIN=y
> > >
> > > My linux-config and qemu-log are attached.
> > >
> >
> >
> > Thanks for your testing.
> >
> > I was also able to reproduce this issue.
> >
> >
> > The problematic parts are:
> >
> > [    2.298555] crc32c_intel: disagrees about version of symbol module_layout
> > [    2.303335] crc32c_generic: disagrees about version of symbol module_layout
> > [    2.306667] libcrc32c: disagrees about version of symbol module_layout
> >
> >
> >
> > When CONFIG_LTO_CLANG_THIN=y,
> > I cannot see any __crc_* symbols in "nm  vmlinux".
> >
> > Perhaps, LTO might have discarded all the __crc_* symbols
> > from vmlinux, but I am still checking the details...
> >
>
> Thanks for taking care.
>
> Just for the records:
>
> $ grep CONFIG_MODVERSIONS /boot/config-5.18.0-rc7-2-amd64-clang14-lto
> CONFIG_MODVERSIONS=y
>

Did not try CONFIG_MODVERSIONS=n.

We have a new file:

[ include/linux/export-internal.h ]
/* SPDX-License-Identifier: GPL-2.0-only */
/*
* Please do not include this explicitly.
* This is used by C files generated by modpost.
*/

#ifndef __LINUX_EXPORT_INTERNAL_H__
#define __LINUX_EXPORT_INTERNAL_H__

#include <linux/compiler.h>
#include <linux/types.h>

#define SYMBOL_CRC(sym, crc, sec)   \
       u32 __section("___kcrctab" sec "+" #sym) __crc_##sym = crc

#endif /* __LINUX_EXPORT_INTERNAL_H__ */

But we discard __kcrctab in scripts/module.lds.S file.

Maybe we need:

$ git diff scripts/module.lds.S
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 1d0e1e4dc3d2..c04b596c364b 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -21,8 +21,6 @@ SECTIONS {

       __ksymtab               0 : { *(SORT(___ksymtab+*)) }
       __ksymtab_gpl           0 : { *(SORT(___ksymtab_gpl+*)) }
-       __kcrctab               0 : { *(SORT(___kcrctab+*)) }
-       __kcrctab_gpl           0 : { *(SORT(___kcrctab_gpl+*)) }

       .ctors                  0 : ALIGN(8) { *(SORT(.ctors.*)) *(.ctors) }
       .init_array             0 : ALIGN(8) { *(SORT(.init_array.*))
*(.init_array) }

Or even?

$ git diff scripts/kallsyms.c
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 8caabddf817c..fb3601fe8aa3 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -109,7 +109,6 @@ static bool is_ignored_symbol(const char *name, char type)
       static const char * const ignored_prefixes[] = {
               "$",                    /* local symbols for ARM, MIPS, etc. */
               ".L",                   /* local labels,
.LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
-               "__crc_",               /* modversions */
               "__efistub_",           /* arm64 EFI stub namespace */
               "__kvm_nvhe_",          /* arm64 non-VHE KVM namespace */
               "__AArch64ADRPThunk_",  /* arm64 lld */

- Sedat -
