Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742CC3236
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 12:22:27 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 24DCMAxa031900
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 21:22:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 24DCMAxa031900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1652444531;
	bh=N9bbKmHP6POe42Fa+GkW40EBGebzX8tThTjuBWdq8ig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iTUSZMXFn0b0ySQUWXG+bN57jeWcY/6TqbY5S5aZcQ/kCoZfP7nRnS7sHgViAZRNN
	 wDaiei0KZlaKsN1DmBPtcqARjKtLh8u07vqbDgot1zXlPVl8ozeINxWNhKT78anmeD
	 MQsMYS3nDed1y34788+wUVXLLyUtHPQcemLYtcO3lWOjouuXJK5KAuaFkVsgLpiRHk
	 5EPCMq/z3k46EHOXHAjomlBB+N/bIGiCpnFZq5SuOTa/brRI6+YlJqlwhtj1BF0veO
	 c3ZcdRLraUhwKE/pE0JRarqZEMxev0+S3ZhiPXMpvvMPFVRpa7GrNHeQS9hPkyFUJv
	 JtwfNw6AsK7/A==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id x88so7958967pjj.1
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 05:22:11 -0700 (PDT)
X-Gm-Message-State: AOAM532tQTQfTGoOLC2PpR8nJpJ4Z9N6y29sCiLINx30cZ8dCWp+7MXe
	qpOtT9szyODAZDddNjQs1TfVcEgSAhe8qPrfnmc=
X-Google-Smtp-Source: ABdhPJxD5Hnw/BzpOuoc03CTdnOknz232P4SJXD9vQoGZjeOfKjWtDeamnUaHXxR78Q1KZ637m8h49Kf8LDy4D9zobk=
X-Received: by 2002:a17:90a:e517:b0:1d7:5bbd:f9f0 with SMTP id
 t23-20020a17090ae51700b001d75bbdf9f0mr4634068pjy.77.1652444530238; Fri, 13
 May 2022 05:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513113930.10488-1-masahiroy@kernel.org>
In-Reply-To: <20220513113930.10488-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 13 May 2022 21:20:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvneCi11myLpkikuXh=i5PLtTaLe0nGpDZXgv_Q1L0Ow@mail.gmail.com>
Message-ID: <CAK7LNAQvneCi11myLpkikuXh=i5PLtTaLe0nGpDZXgv_Q1L0Ow@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] kbuild: yet another series of cleanups (modpost,
 LTO, MODULE_REL_CRCS, export.h)
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 8:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>
> This is the third batch of cleanups in this development cycle.
>


This series is available at
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 lto-cleanup-v6


>
> Changes in v6:
>   - Fix false-positive warnings when CONFIG_TRIM_UNUSED_KSYMS=y
>
> Changes in v5:
>   - Fix the build error when CONFIG_DEBUG_INFO_BTF=y (reported by Nathan)
>   - Clean up arch/m68k/include/asm/export.h (Nick)
>   - Keep gen_symversions (and will be removed by a later patch)
>   - Add more comments in the script
>
> Changes in v4:
>   - Rename .vmlinux-symver.c to .vmlinux.export.c
>     because I notice this approach is useful for further cleanups,
>     not only for modversioning but also for overall EXPORT_SYMBOL.
>   - New patch
>   - New.
>     Resent of my previous submission.
>     https://lore.kernel.org/all/20210831074004.3195284-10-masahiroy@kernel.org/
>   - New
>     Resent of my previous submission
>     https://lore.kernel.org/linux-kbuild/20210831074004.3195284-11-masahiroy@kernel.org/
>
> Changes in v3:
>   - New patch
>
> Changes in v2:
>   - Simplify the implementation (parse .cmd files after ELF)
>   - New patch
>  - replace the chain of $(if ...) with $(and )
>   - New patch
>   - New patch
>
> Masahiro Yamada (10):
>   modpost: extract symbol versions from *.cmd files
>   kbuild: link symbol CRCs at final link, removing
>     CONFIG_MODULE_REL_CRCS
>   kbuild: stop merging *.symversions
>   genksyms: adjust the output format to modpost
>   kbuild: do not create *.prelink.o for Clang LTO or IBT
>   kbuild: check static EXPORT_SYMBOL* by script instead of modpost
>   kbuild: make built-in.a rule robust against too long argument error
>   kbuild: make *.mod rule robust against too long argument error
>   kbuild: add cmd_and_savecmd macro
>   kbuild: rebuild multi-object modules when objtool is updated
>
>  arch/m68k/include/asm/Kbuild    |   1 +
>  arch/m68k/include/asm/export.h  |   2 -
>  arch/powerpc/Kconfig            |   1 -
>  arch/s390/Kconfig               |   1 -
>  arch/um/Kconfig                 |   1 -
>  include/asm-generic/export.h    |  22 ++-
>  include/linux/export-internal.h |  16 +++
>  include/linux/export.h          |  30 ++--
>  init/Kconfig                    |   4 -
>  kernel/module.c                 |  10 +-
>  scripts/Kbuild.include          |  10 +-
>  scripts/Makefile.build          | 134 ++++++------------
>  scripts/Makefile.lib            |   7 -
>  scripts/Makefile.modfinal       |   5 +-
>  scripts/Makefile.modpost        |   9 +-
>  scripts/check-local-export      |  64 +++++++++
>  scripts/genksyms/genksyms.c     |  18 +--
>  scripts/link-vmlinux.sh         |  33 ++---
>  scripts/mod/modpost.c           | 236 +++++++++++++++++++++-----------
>  19 files changed, 320 insertions(+), 284 deletions(-)
>  delete mode 100644 arch/m68k/include/asm/export.h
>  create mode 100644 include/linux/export-internal.h
>  create mode 100755 scripts/check-local-export
>
> --
> 2.32.0
>


-- 
Best Regards
Masahiro Yamada
