Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887F46B5
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 02:32:55 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e9so4226320ilq.6
        for <llvm@lists.linux.dev>; Fri, 27 May 2022 19:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=B9/k/vYalZlu99Y+0uMJfLSyG8XL3D1qV0fsmg7wW8k=;
        b=lmpl2R8kMj6FJrr+ZbxYA3Ec5/f0QMq2Vqcu4JzdXFQXBpyCEJxNO8J/VyrVIkZW6Y
         A82SLoVdR9sJuugK9SEQ2YKR3C/b19uiqlJmc1lMGybla+FplstTcpj4o/zz3FQNGge7
         zyXAGq4ro6UdZOjhLpYelUivo/a/g56zy9Myz4HYiBO2VAD9P8eh8vXSRGDqWz+8lAN4
         4oRVRSTaf1RoRF9WEXrBWHNJKHyA6511Cmg2upv5D6IhzAQLzFQoxoOvKOt20PxOh2+j
         WQ4LGZ4hqWWPie0NRAzUJi9MyyVP0+Lu8LkYiCldijKQNjK5vI0YyDMIKn/F4vsIXZIO
         lBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=B9/k/vYalZlu99Y+0uMJfLSyG8XL3D1qV0fsmg7wW8k=;
        b=FMgsnhGC43s4Pgx9lHyPKer2VFECpHXeKd7SdrqDMJOgSsPqR+evdZyIphCoSyIG32
         jxXTn4qUwcL64OTe/qKLzRsDbZsSMdm7/LoqKlEAM0VdTnFUIrHUzMn9u0VDECkxkM0S
         yCOlavGk+JZ2fOklcpaxHjQYg9T+tUzjTMNC62ZK1UOhA6CQygy4pvHZC5vyppeGy4IW
         6hW37qraoUMu4ziGwqsqy7OyfPMqBH20WXgWcUejtdkdLsKaZ6n07aINti+UdkZWn5Aq
         5V8CQlGcMvlmXoGeFlYc8RXnu3IIUKImujO9UKYOoFESk37oGDlRmjNNBiW6JHX3FEpN
         QgOg==
X-Gm-Message-State: AOAM530RBKb6iVD9rhyTATk3bfZBFF+sPJBuKfkonSDk4b0/hVDCteWx
	mLYAJ65nfpzBJkyvStjWjEr6/xx0bqQvyG2Tiio=
X-Google-Smtp-Source: ABdhPJwHfUd38QQKGLgQWhy/xoN/+ho5lVQ5i+2NshwjEm3+X5GKjnUhY8Wls0cR6GO03Rd/W9RbALzcxGAmKt9DDnE=
X-Received: by 2002:a05:6e02:174f:b0:2d1:3971:9348 with SMTP id
 y15-20020a056e02174f00b002d139719348mr23734496ill.4.1653705174899; Fri, 27
 May 2022 19:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220527100155.1996314-1-masahiroy@kernel.org> <20220527100155.1996314-2-masahiroy@kernel.org>
In-Reply-To: <20220527100155.1996314-2-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 28 May 2022 04:32:19 +0200
Message-ID: <CA+icZUX_xeZ8k-3YZppGbuYzeypU8f_iz_-tuMJ1bg0dhikH8A@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] kbuild: replace $(linked-object) with CONFIG options
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, llvm@lists.linux.dev, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 27, 2022 at 1:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> *.prelink.o is created when CONFIG_LTO_CLANG or CONFIG_X86_KERNEL_IBT
> is enabled.
>
> Replace $(linked-object) with $(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)
> so you will get better idea when the --link option is passed.
>
> No functional change is intended.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiroy,

I was not CCed on the cover-letter and only on some patches in this series.

So, I have re-tested this series by pulling from kbuild.git#kbuild
(saw later you renewed the parisc/nm patch).

While testing my selfmade LLVM version 14.0.4 (PGO + ThinLTO
optimized) toolchain I included this series.

Just built fine and I was able to boot on bare metal.

-Sedat -

> ---
>
> Changes in v7:
>   - New patch
>
>  scripts/Makefile.build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 06400504150b..f80196eef03a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -219,7 +219,7 @@ objtool_args =                                                              \
>         $(if $(CONFIG_STACK_VALIDATION), --stackval)                    \
>         $(if $(CONFIG_HAVE_STATIC_CALL_INLINE), --static-call)          \
>         --uaccess                                                       \
> -       $(if $(linked-object), --link)                                  \
> +       $(if $($(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)), --link)    \
>         $(if $(part-of-module), --module)                               \
>         $(if $(CONFIG_GCOV_KERNEL), --no-unreachable)
>
> @@ -284,7 +284,6 @@ quiet_cmd_cc_prelink_modules = LD [M]  $@
>  # modules into native code
>  $(obj)/%.prelink.o: objtool-enabled = y
>  $(obj)/%.prelink.o: part-of-module := y
> -$(obj)/%.prelink.o: linked-object := y
>
>  $(obj)/%.prelink.o: $(obj)/%.o FORCE
>         $(call if_changed,cc_prelink_modules)
> --
> 2.32.0
>
