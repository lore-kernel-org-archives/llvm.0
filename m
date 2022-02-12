Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819D37F
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 00:05:18 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id k10so11554747ljq.2
        for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 16:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3wE/nOdJLWv1mzpBtdK/cJVk9Tp2iFdl54BX0oVeteY=;
        b=JZ4+ncYzNYerj+moSCDWO1WJoiIH1M96FVDcYdw6NEPzkI0vfciZXqQRAJ/ExwSKWm
         4su7BW04KWOmgtSLfMWfmFwwPLUoxQMXYWPRUVsT0VuYtJ20G92SikYuCtyrx5evufpO
         N26KJe6Z+HgUlAL/2VpEhB+DoS4ngCWobKH+HY7DUT67+fxZm239uiFhBRDD9YYE1yMS
         e5fCMS0jPdtR9S7RB6LBOirrAFXoAK/6zoreaVyBSpBP1PpepUVqlOCB1ZYioEKq6Hkr
         o0LQgL6mBPPLbsxzPWnWfoZAKZ8O48BoDo1avbbjjBi0eQWRjzpXbSLNlmahWCrqKf3U
         JMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3wE/nOdJLWv1mzpBtdK/cJVk9Tp2iFdl54BX0oVeteY=;
        b=cKgHBNbhUSMbhDllTWWzmDdSNQqrYucsLZzIX1DdLcqKhSu2WjvSneIlcRgFsPtge0
         0YMiupjcD5iPVOv2CkVyyhe3HYZr9u3RmQZWcLRwAYbFYYma4huQuckrVEy51M7KIc0H
         dil9ebP37AyG/iZ6AzFIwP4UObWojdeU+kZpdPcN0tAKl4Ajp2KNUWCiap3tvLRjYPJk
         Jv2uu5w3ZyARBF5ZMBNu9HBUVUWxjP2hCmP9ZJqe9xbVL3QAkju4XkYeg59R3FF73d9S
         d7ubSXd17KWHnN5YQ2BOcvdmVfPFl/PUYj7oOWd28S+jEZ5JTh5FUMCs/+PvfXENBIt2
         kAug==
X-Gm-Message-State: AOAM533kaUcEmxiVAKTSuHA2QXQ+gaEAKdTORElYlCcKdNhdZBjufbis
	3Q2vhsRbvFEq1OssrSYGQq3SPnMCreNFwh2r1v8Vvw==
X-Google-Smtp-Source: ABdhPJwmPtH/n7FoQO5chtGDWHS6OG9MEkuqrVz6CbXbgX3B755ZqK+C3HYjz81i7WU+P0JnqoED8Mf0MZ6V58/814Q=
X-Received: by 2002:a05:651c:1253:: with SMTP id h19mr2394779ljh.338.1644624316161;
 Fri, 11 Feb 2022 16:05:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220211023125.1790960-1-aik@ozlabs.ru> <20220211023125.1790960-3-aik@ozlabs.ru>
In-Reply-To: <20220211023125.1790960-3-aik@ozlabs.ru>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 11 Feb 2022 16:05:04 -0800
Message-ID: <CAKwvOdmJspxuNh-K-CeLJh4X4GGVYJWH29HnjJwuRL+jcN9G5w@mail.gmail.com>
Subject: Re: [PATCH kernel 2/3] powerpc/llvm: Sample config for LLVM LTO
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Daniel Axtens <dja@axtens.net>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 10, 2022 at 6:31 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> The config is a copy of ppc64_defconfig with a few tweaks. This could be
> a smaller config to merge into ppc64_defconfig but unfortunately
> merger does not allow disabling already enabled options.

Cool series!

>
> This is a command line to compile the kernel using the upstream llvm:
>
> make -j64 O=/home/aik/pbuild/kernels-llvm/ \
>  "KCFLAGS=-Wmissing-braces -Wno-array-bounds" \
>  ARCH=powerpc LLVM_IAS=1 ppc64le_lto_defconfig CC=clang LLVM=1

That command line invocation is kind of a mess, and many things
shouldn't be necessary.

O= is just noise; if folks are doing in tree builds then that doesn't
add anything meaningful.
KCFLAGS= why? I know -Warray-bounds is being worked on actively, but
do we have instances of -Wmissing-braces at the moment? Let's get
those fixed up.
LLVM_IAS=1 is implied by LLVM=1.
CC=clang is implied by LLVM=1

why add a new config? I think it would be simpler to just show command
line invocations of `./scripts/config -e` and `make`. No new config
required.

>
> Forces CONFIG_BTRFS_FS=y to make CONFIG_ZSTD_COMPRESS=y to fix:
> ld.lld: error: linking module flags 'Code Model': IDs have conflicting values in 'lib/built-in.a(entropy_common.o at 5332)' and 'ld-temp.o'
>
> because modules are linked with -mcmodel=large but the kernel uses -mcmodel=medium

Please file a bug about this.
https://github.com/ClangBuiltLinux/linux/issues

>
> Enables CONFIG_USERFAULTFD=y as otherwise vm_userfaultfd_ctx becomes
> 0 bytes long and clang sanitizer crashes as
> https://bugs.llvm.org/show_bug.cgi?id=500375

The above hyperlink doesn't work for me. Upstream llvm just moved from
bugzilla to github issue tracker.

https://github.com/llvm/llvm-project/issues

>
> Disables CONFIG_FTR_FIXUP_SELFTEST as it uses FTR_SECTION_ELSE with
> conditional branches. There are other places like this and the following
> patches address that.
>
> Disables CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT as CONFIG_HAS_LTO_CLANG
> depends on it being disabled. In order to avoid disabling way too many
> options (like DYNAMIC_FTRACE/FUNCTION_TRACER), this converts
> FTRACE_MCOUNT_USE_RECORDMCOUNT from def_bool to bool.
>
> Note that even with this config there is a good chance that LTO
> is going to fail linking vmlinux because of the "bc" problem.

I think rather than adding a new config with LTO enabled and a few
things turned off, it would be better to not allow LTO to be
selectable if those things are turned on, until the combination of the
two are fixed.

-- 
Thanks,
~Nick Desaulniers
