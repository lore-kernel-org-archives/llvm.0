Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955C46A9
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 16:37:12 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id e129so1996489pgc.9
        for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 09:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/U6QNXQ/xCPGTTB1SAGiuHHJBka8um7FPSVO88evHYI=;
        b=VSrXHgK1wthxTiSvcuhaQbjJeIf88juMO1vdkrfo8WfFh1W8lrjC/FEAR/tfSGGiaI
         MwL2e/KdbjhhU5Mvx64WTzDvM28en1ruz6tMYyq71mEdM2mUXPl7YsB9GXfSG3zXUdL3
         U0JN8NqLuwTvA7DsT/+Z2LG8SnF4BakmBHO6rvnjvJ2wyzmZ82j7VbOXOvCM4FTenpjf
         LUXfcAQJLSbblvmH06iJVgcMmmP76BqS6KGm/FBWFP1CkRZ14QuwLiNAFLMCuAx/VC3X
         y1k+lyPjJvUOCVaMMDcxwoNJbPK7skwJ05kKMxPx1sab1r+g80HAIayEjDwr2Z3Vaz1U
         tTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/U6QNXQ/xCPGTTB1SAGiuHHJBka8um7FPSVO88evHYI=;
        b=cJNHVChbZVQI0ErlfumAXkS6sMjKUn7nmeMmp0V1JeIKAoAXuDMz1aip6J9EeDK2Ws
         rbGTO/AF+P/jVw9Qb3SDI0+H9VncSxT/2smW+/8Af2udJ3bQercORuVCeefOa63j3jpu
         wyknmDoTKqX3Voax0tAPPaB3GwRVwBWIWG5+9eS1Zeh9uMzSPRydhW1CkOozC2TV91zZ
         k56q1CiHC3Xk0mK2Ab7jWEz4HG3cvCrKCBX1TMW97GoXgNpk2wUE+Nu7XLtnj1z3iU5j
         EyVkxWcpGgobjEQUJ+4/fE3xPIUwtDyRJc4yoNhnaqtZha6s0q9Q0EFHpYwX3IkN+5mS
         e2Dw==
X-Gm-Message-State: ACrzQf3TOLz76MJx1ptoMtGKsNjjvYa7luxTCwQ5q5nytdmbsHzozeKk
	VGNQWzjZ1Z+646QtGnAOppnu8oonGgBJmaw+R6ut8A==
X-Google-Smtp-Source: AMsMyM74RkehYChf05WveFojOxGE9ShcFGDHudhN3+Bi2xfxS50UVNk6k4zl48d16veCpcNgt4M8U3ECMEQxzyXkjHU=
X-Received: by 2002:aa7:83cd:0:b0:563:5f54:d78c with SMTP id
 j13-20020aa783cd000000b005635f54d78cmr51545714pfn.66.1666888628868; Thu, 27
 Oct 2022 09:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027162839.410720-1-masahiroy@kernel.org>
In-Reply-To: <20221027162839.410720-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 27 Oct 2022 09:36:57 -0700
Message-ID: <CAKwvOdmDFxr_PgY4WK392zCgs2QGxrsPfWoX=5h+y3R5r1xrJA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix SIGPIPE error message for AR=gcc-ar and AR=llvm-ar
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 9:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Jiri Slaby reported that building the kernel with AR=gcc-ar shows:
>   /usr/bin/ar terminated with signal 13 [Broken pipe]
>
> Nathan Chancellor reported the latest AR=llvm-ar shows
>   error: write on a pipe with no reader
>
> The latter occurs since LLVM commit 51b557adc131 ("Add an error message
> to the default SIGPIPE handler").
>
> The resulting vmlinux is correct, but it is better to silence it.
>
> 'head -n1' exits after reading the first line, so the pipe is closed.
>
> Use 'sed -n 1p' to eat the stream till the end.
>
> Fixes: 321648455061 ("kbuild: use obj-y instead extra-y for objects placed at the head")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1651
> Reported-by: Jiri Slaby <jirislaby@kernel.org>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Looks great! Thanks all.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - Update commit description to mention llvm-ar
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index e90bb2b38607..e9e7eff906a5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1218,7 +1218,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
>        cmd_ar_vmlinux.a = \
>         rm -f $@; \
>         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -       $(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
> +       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
>
>  targets += vmlinux.a
>  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt autoksyms_recursive FORCE
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
