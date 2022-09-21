Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048EE66E4
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 17:47:29 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id x1so6400475plv.5
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ILSktUPhRtygadO3mX2WIdesu+9ATPxlEft+pugio2Q=;
        b=dIj2p5onSFh4ES5KN1JGCp53Up0q1dNdiapiiaO5QSt3Gs+Q1ifYBgha1wML+sn8S8
         Znegl9GL79Z9MBTX+/i3u/bWsBWHFL+b6MSeuGRNyWw4v/FF4ptRgk3u2xOm5AxUNCMV
         Ar0UWhRj5MDEaZTHXqBY+Eb4HoD3OEbC5C7grADuo6YJBFmK5tZ2XqN1DegKylKZd1WD
         GPacLUxEptaESO6PEly7V9h03UjL9KEcYHgUHRHCvrHlry8fjYtkbsVtKKEnRDMyBMR3
         BFj01EREDio7XXXtawp4ojyT1FF4HRNgd19SXAXLwGC6Bg7adQs+rKVxQOfX/QBl3CI0
         2OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ILSktUPhRtygadO3mX2WIdesu+9ATPxlEft+pugio2Q=;
        b=St6WT+NY79kwmWR3bH0fU2wbjsv4MTtFWDEKXCamLVcJ3HvbfoGElo1ovgBAEN2iAf
         WC1Tf0MhNnP56yDVizazcvO6dMW95IDLvq85u/9pCbWspGipjCRC2KTknuIhpdi230S/
         hep1fdNkiPBQQ2Sapw0+m133LrjhaJu/t9hmqNh7E4xNCbm68B/rKHSDjQ52DwgfRdwi
         De0RVOkhAbC+0XWhPinbK2FKuH7i8k7eJRsdRUX51nAnEMSJNiB82KSWa1WD4fdOLF4q
         9e8QVGBUbOP38l363HeLDAdxjAFBsxFzsRP8HxbrjeD/NYVGfu69GItBGZ3Brz3JafXk
         +moA==
X-Gm-Message-State: ACrzQf09XK/LwhcsZOn3C4BVIbH0k00p9LlsQlJfJ4rPyx1Tc2yz0pf9
	oGulImzJyg/qz9uNh2LFVHFc3RjNm8EDt36KCHh6Dg==
X-Google-Smtp-Source: AMsMyM7Q3WVPJ/GxxcQYCAnz5FiWC2cq4UhUGCIwASTcM0s85s5ifrGW1IEqYSXW8F8nkKkYK0InMc3gZ3UuleL0OL4=
X-Received: by 2002:a17:902:a411:b0:178:9e4c:2ef8 with SMTP id
 p17-20020a170902a41100b001789e4c2ef8mr5929684plq.95.1663782449080; Wed, 21
 Sep 2022 10:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220921064855.2841607-1-davidgow@google.com>
In-Reply-To: <20220921064855.2841607-1-davidgow@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 21 Sep 2022 10:47:17 -0700
Message-ID: <CAKwvOdnLaDn=EfGFhjhcZe4EzvjU7Cws3z3KjLGwW=xnqnmHyw@mail.gmail.com>
Subject: Re: [PATCH v2] arch: um: Mark the stack non-executable to fix a
 binutils warning
To: David Gow <davidgow@google.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Latypov <dlatypov@google.com>, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, x86@kernel.org, 
	Lukas Straub <lukasstraub2@web.de>, Randy Dunlap <rdunlap@infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 20, 2022 at 11:49 PM David Gow <davidgow@google.com> wrote:
>
> Since binutils 2.39, ld will print a warning if any stack section is
> executable, which is the default for stack sections on files without a
> .note.GNU-stack section.
>
> This was fixed for x86 in commit ffcf9c5700e4 ("x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments"),
> but remained broken for UML, resulting in several warnings:
>
> /usr/bin/ld: warning: arch/x86/um/vdso/vdso.o: missing .note.GNU-stack section implies executable stack
> /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1.o: missing .note.GNU-stack section implies executable stack
> /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2 has a LOAD segment with RWX permissions
> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2.o: missing .note.GNU-stack section implies executable stack
> /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions
>
> Link both the VDSO and vmlinux with -z noexecstack, fixing the warnings
> about .note.GNU-stack sections. In addition, pass --no-warn-rwx-segments
> to dodge the remaining warnings about LOAD segments with RWX permissions
> in the kallsyms objects. (Note that this flag is apparently not
> available on lld, so hide it behind a test for BFD, which is what the
> x86 patch does.)
>
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ffcf9c5700e49c0aee42dcba9a12ba21338e8136
> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> Signed-off-by: David Gow <davidgow@google.com>
> Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> Tested-by: Lukas Straub <lukasstraub2@web.de>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> ---
>
> Note that this still doesn't seem to be working properly with make
> LLVM=1. It doesn't appear to break anything, and still is an improvement
> for gcc, so seems worthwhile anyway...

Hi David,
Do you have more info about this comment?  Perhaps there's more
hermiticity issues with ARCH=um when a linker is explicitly specified
via LD= or HOSTLD=, or implied via LLVM=1.

Looking at our CI for ARCH=um builds...
https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/3095779516/jobs/5012260390
warnings from /usr/bin/ld. That's...unexpected.
I've filed https://github.com/ClangBuiltLinux/linux/issues/1715 to
follow up on this.

>
> Changes since v1:
> http://lists.infradead.org/pipermail/linux-um/2022-August/004234.html
> - Pass the -z noexecstack and --no-warn-rwx-segments flags as LDFLAGS,
>   rather than as CFLAGS via -Wl
> - Check that --no-warn-rwx-segments exists with the ld-option function
>   (Thanks Richard)
> - Add Lukas and Randy's tags.
>
>
>  arch/um/Makefile          | 8 ++++++++
>  arch/x86/um/vdso/Makefile | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index f2fe63bfd819..f1d4d67157be 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -132,10 +132,18 @@ export LDS_ELF_FORMAT := $(ELF_FORMAT)
>  # The wrappers will select whether using "malloc" or the kernel allocator.
>  LINK_WRAPS = -Wl,--wrap,malloc -Wl,--wrap,free -Wl,--wrap,calloc
>
> +# Avoid binutils 2.39+ warnings by marking the stack non-executable and
> +# ignorning warnings for the kallsyms sections.
> +LDFLAGS_EXECSTACK = -z noexecstack
> +ifeq ($(CONFIG_LD_IS_BFD),y)
> +LDFLAGS_EXECSTACK += $(call ld-option,--no-warn-rwx-segments)
> +endif
> +
>  LD_FLAGS_CMDLINE = $(foreach opt,$(KBUILD_LDFLAGS),-Wl,$(opt))
>
>  # Used by link-vmlinux.sh which has special support for um link
>  export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS) $(LD_FLAGS_CMDLINE)
> +export LDFLAGS_vmlinux := $(LDFLAGS_EXECSTACK)
>
>  # When cleaning we don't include .config, so we don't include
>  # TT or skas makefiles and don't clean skas_ptregs.h.
> diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
> index 8c0396fd0e6f..6fbe97c52c99 100644
> --- a/arch/x86/um/vdso/Makefile
> +++ b/arch/x86/um/vdso/Makefile
> @@ -65,7 +65,7 @@ quiet_cmd_vdso = VDSO    $@
>                        -Wl,-T,$(filter %.lds,$^) $(filter %.o,$^) && \
>                  sh $(srctree)/$(src)/checkundef.sh '$(NM)' '$@'
>
> -VDSO_LDFLAGS = -fPIC -shared -Wl,--hash-style=sysv
> +VDSO_LDFLAGS = -fPIC -shared -Wl,--hash-style=sysv -z noexecstack
>  GCOV_PROFILE := n
>
>  #
> --
> 2.37.3.968.ga6b4b080e4-goog
>


-- 
Thanks,
~Nick Desaulniers
