Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E52168
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 19:17:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id c32so51683174lfv.4
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 11:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CeAbDqQVJZTM66ES85ssc7ES4kZBm5FRz8B7DywloJM=;
        b=cgSRgD5OaZuIdQHRi+e9iJl7q/tVHZ57Aiq8kaW7oU4t59vV3SFFGs0eD7w91qjr7p
         nDB2IXbxJS4aBWHlR6S6GY331p5vxKfC5RNqpBJm58WX4PY/4cM+ZoE/Ep/aihJ2bZPO
         fw3pxy/Xbsz6hcjlS5Ao6Yd9qLHb37rpb/Lw2jHjocu2KvdNWDwXfQTl46VGr9kXfVjn
         a7Updw+c2G5XsT1rAxBbmyhCac9OD1OyQK1mHGJxX5h+cPshAjRL4WefvbqUJDR12TbW
         I2bRY+OIjM5Em5OP0H6rCcLhq0AFG/5pLvmqYD12598mhOlrX83juKNeXuI+R3kVE3XJ
         Av4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CeAbDqQVJZTM66ES85ssc7ES4kZBm5FRz8B7DywloJM=;
        b=eGEtDKnc/102XhbABkisMrZFHrur+wwlQyNlv9MMsFjtz0+rAxLznDptzQwaJ20eM1
         pcpBBfN1JHjzFItN2aEIYks85UwhxTibbAP9fX/VvVbvtmI0+bphY0OTt1yxOsj1NENV
         6S8yRXVLMuzcNltr9qFPLn63PszYR2j9n7smqC57yqy1naxT2Z/1BMJ2pXVfA0s+VVxk
         AEOjLdeCYW5DgCK0oiPGx6sAX2RN7GRQNaE9gMgrhxghc3LEROpetpeI3+cZo6xGH1lw
         oCLQuNXuB41T3kUFdmG7dTWsJXk2cmchQarGvvbQAncpfCHLoaKpYGMIQWEBHQGB6ONr
         KIQg==
X-Gm-Message-State: AOAM533wuvJYhuSXL39eAuP5+2J/Hk/XULI2pXa24AJuKb80hMnwLKFg
	58irgfecUjRH4YlI2I2H9IBEtxWb14TPrJd5O1+8PA==
X-Google-Smtp-Source: ABdhPJzQ7775nxrt1oIiY3S+R+5BbjqeTRLcI9Ct5YM1KdXk4rl0d0yKyysga4uDHO/bnJSEbiJZ8X4DkE0MUH9ALeY=
X-Received: by 2002:ac2:4db3:: with SMTP id h19mr5742153lfe.82.1639682228050;
 Thu, 16 Dec 2021 11:17:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211216163842.829836-1-jean-philippe@linaro.org> <20211216163842.829836-2-jean-philippe@linaro.org>
In-Reply-To: <20211216163842.829836-2-jean-philippe@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 16 Dec 2021 11:16:56 -0800
Message-ID: <CAKwvOdmLYKV9UEg4_NV2EdPqF6VqboaY0gVDw1WEkmrvES8jvA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] tools: Help cross-building with clang
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, shuah@kernel.org, 
	nathan@kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, 
	john.fastabend@gmail.com, kpsingh@kernel.org, quentin@isovalent.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 8:50 AM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Cross-compilation with clang uses the -target parameter rather than a
> toolchain prefix. Just like the kernel Makefile, add that parameter to
> CFLAGS when CROSS_COMPILE is set.
>
> Unlike the kernel Makefile, we use the --sysroot and --gcc-toolchain
> options because unlike the kernel, tools require standard libraries.
> Commit c91d4e47e10e ("Makefile: Remove '--gcc-toolchain' flag") provides
> some background about --gcc-toolchain. Normally clang finds on its own
> the additional utilities and libraries that it needs (for example GNU ld
> or glibc). On some systems however, this autodetection doesn't work.
> There, our only recourse is asking GCC directly, and pass the result to
> --sysroot and --gcc-toolchain. Of course that only works when a cross
> GCC is available.
>
> Autodetection worked fine on Debian, but to use the aarch64-linux-gnu
> toolchain from Archlinux I needed both --sysroot (for crt1.o) and
> --gcc-toolchain (for crtbegin.o, -lgcc). The --prefix parameter wasn't
> needed there, but it might be useful on other distributions.
>
> Use the CLANG_CROSS_FLAGS variable instead of CLANG_FLAGS because it
> allows tools such as bpftool, that need to build both host and target
> binaries, to easily filter out the cross-build flags from CFLAGS.
>
> Acked-by: Quentin Monnet <quentin@isovalent.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> Most tools I looked at needed additional changes to support cross-build
> with clang. I've only done the work for bpf tools.
> ---
>  tools/scripts/Makefile.include | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
> index 071312f5eb92..b0be5f40a3f1 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -87,7 +87,18 @@ LLVM_STRIP   ?= llvm-strip
>
>  ifeq ($(CC_NO_CLANG), 1)
>  EXTRA_WARNINGS += -Wstrict-aliasing=3
> -endif
> +
> +else ifneq ($(CROSS_COMPILE),)
> +CLANG_CROSS_FLAGS := --target=$(notdir $(CROSS_COMPILE:%-=%))
> +GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)gcc))
> +ifneq ($(GCC_TOOLCHAIN_DIR),)
> +CLANG_CROSS_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +CLANG_CROSS_FLAGS += --sysroot=$(shell $(CROSS_COMPILE)gcc -print-sysroot)

^ this is a neat trick; it does rely on having $(CROSS_COMPILE)gcc
installed though. Technically only the header include path is needed
and the path to the cross libc shared object.  I think we should take
this patch&series as a starting point, but there might be future
revisions here to support environments that don't have
$(CROSS_COMPILE)gcc (such as Android's build env).

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the series!

> +CLANG_CROSS_FLAGS += --gcc-toolchain=$(realpath $(GCC_TOOLCHAIN_DIR)/..)
> +endif # GCC_TOOLCHAIN_DIR
> +CFLAGS += $(CLANG_CROSS_FLAGS)
> +AFLAGS += $(CLANG_CROSS_FLAGS)
> +endif # CROSS_COMPILE
>
>  # Hack to avoid type-punned warnings on old systems such as RHEL5:
>  # We should be changing CFLAGS and checking gcc version, but this
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
