Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88DA468B
	for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 19:15:50 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so13925701pji.1
        for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lEIAgIaq7xwDYOXkCfqCwVLGJ7bTE5nHIiB+jrGhv9o=;
        b=N+cAdNyMQXR/tbR8q02b2KsJU34NsOg8AsmZchm09Z2l4h6y4DUccY8EGCAKpFsyo+
         hVUIcNMrL7/tnzDf5cv+joc3p07uIr/yzJbz+OvO17e7SsF6tb9f4yBJcOuBSoLp0ES1
         s5B1qsFCCADwGRqSnL8cxDy82PrJ3kjygJ5mqJ1q4rkm1CSxew9saqIaoal+qYo0pRBR
         aVvUz4wGZQqnUzXObp4x9hDTVuLE6IUQIzjb7EFc+ekpHAaHAGFmTgdGFyAK6CfK6rLf
         3dxwl447zqq1U/1aHH7GQL+/vSEEBAS7gtdGRmuVyzUfhMRuBOxs7t7JZNTQhO2xnzhh
         o9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEIAgIaq7xwDYOXkCfqCwVLGJ7bTE5nHIiB+jrGhv9o=;
        b=yJzxxyPmk3YA7Db42EbxFbUqHh/5SygvQgA22J/czcQ1lfL9QuQplyaWd9POsD+2x4
         mGyuyodi4R9a5wFPPSKAso4sWf4hWjldpI/7C1FM0hO3CEURHrxH2ke1cIqgMOtA8PlM
         lkE6mjWk2qI5a+jIq9HafFW0JzhT1eGZ+ELSKRkepdBCsfub2MPZpFcwYpk/tikz042y
         tA+1Iihnk5qiYSR982OerMSZVQfBc+O6S3ejX1L/gFhLLBVOPkRPyN7NoOlHEWl84+4f
         NoPRGfJIQhOkyn+H/8cd8S87VJExibeFirZeNQC3BtN+AXhF8LQLNWgn7iL/EDtmA1DC
         udkg==
X-Gm-Message-State: ACrzQf0qM/NP1PRi66Ci+7c+lr1ensKY5WpfoxnrTqWk0b5OniDmbBII
	q/H+ziKsYNRFn0y+ipw05YjUY7c1kBFGmzpYI4M3gocwcH394Q==
X-Google-Smtp-Source: AMsMyM7tbBbsSJUv0yupVMnL0+TpbuvReM9TeIGhfkgoLv6T1JBl44WEe3hE4Q6zQu0W3AhFNSVNU/KHSbG8x77l5ik=
X-Received: by 2002:a17:902:b210:b0:17d:c3ca:4a4f with SMTP id
 t16-20020a170902b21000b0017dc3ca4a4fmr33920252plr.33.1666638950116; Mon, 24
 Oct 2022 12:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221023195257.175946-1-masahiroy@kernel.org>
In-Reply-To: <20221023195257.175946-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Oct 2022 12:15:38 -0700
Message-ID: <CAKwvOd=pimEoN_OvyefPiTTsOdzo+Xda1gJrYg8+jAE5GA0rqA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix 'Broken pipe' message for AR=gcc-ar
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, eng.stk@sapo.pt
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 23, 2022 at 12:53 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 321648455061 ("kbuild: use obj-y instead extra-y for
> objects placed at the head"), 'make AR=gcc-ar' shows the following
> message:
>
>   /usr/bin/ar terminated with signal 13 [Broken pipe]

Not just AR=gcc-ar, but also AR=llvm-ar:

error: write on a pipe with no reader

Link: https://github.com/ClangBuiltLinux/linux/issues/1651
Reported-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Note that due to
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8017ce50641c303b9b5d96f3c10229ecfd770a70
we should send a backport to stable like:
https://github.com/engstk/op8/commit/6f2688e3eb4ec06b276e541640d4f06364b68442

>
> The resulting vmlinux is correct, but it is better to silence this.
>
> 'head -n1' exits after reading the first line, so the pipe is closed.
>
> Use 'sed -n 1p' to eat the stream till the end.
>
> Fixes: 321648455061 ("kbuild: use obj-y instead extra-y for objects placed at the head")
> Reported-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index f41ec8c8426b..0e42a7982826 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1218,7 +1218,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
>        cmd_ar_vmlinux.a = \
>         rm -f $@; \
>         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -       $(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F --file=$(srctree)/scripts/head-object-list.txt)
> +       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F --file=$(srctree)/scripts/head-object-list.txt)
>
>  targets += vmlinux.a
>  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt autoksyms_recursive FORCE
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
