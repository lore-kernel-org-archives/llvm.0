Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182875233
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 22:15:20 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id y1so11149883plb.2
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 14:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cWcEmZiis3k81rHkzEa0Ff5rOGDEfrLjYKHcyZUOVd0=;
        b=aQYQYh0zZly02xM2q0Kz4/tJhJBCKKnDiLV+255pEkAT+/cIwpUBATajSVjChmEW6b
         e03d7uMeLF3XO9SU436g/wLBcqJj00bnWeoVigfzsAsV+03QRrwDRooZVCCt4xRxQBz4
         mDhVg08QMtBUu9x5a67qMtXDIoPQJdkZxXnD7cMkZQlG0oKjhE7yb/0WvOaeWvbekmsx
         dig7iYo3KJ4dIlSaJPih4o9OOkoI+reok/9JWhy8fMnteXScwZOsP7rtvuSdUXom+FA5
         XDuGo6UFaTMp7Jb03Sbd0YyNLvYS0C49ZmjFtAd1RNTwAVc2W/qibwoBS8C6Y/WhN4qs
         0cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWcEmZiis3k81rHkzEa0Ff5rOGDEfrLjYKHcyZUOVd0=;
        b=aB1RK+3uniDF40kVtHPxytITkjb1U6GfdWVQ7tCQAn6L6E93wTEEvFsIXkdE401fv7
         LqT55l35r9shXqxHBiNMvAK+0f2ld05ZKS+P0qdg/cSZxLfQZl5Bnlsjq0Z5C/yzP9tm
         xMMEerT6E+Wab9ukpz97eXTlAxS9ISDXwN9FfyjTTHIaI/EEZU53AlksOHAWHM2UAQMe
         h48bb05v4Bp4EW9aMOsd2J1Yfzlay555B34Ztq/7ugQE+SrrOTPRp1vuWgO3lynsaEt6
         AC816GrqiAZrk7G2MiaSJKlYCDrbpfJENLYFXE08UXBQonrBx+nmWI41xIIJY4DssPTu
         ALNA==
X-Gm-Message-State: AFqh2ko43UIRfZ7vqoZcU4lQ3IkxTtRH+7O/kbs7kVHbFtYZSTy+KURT
	v1cBXHgeJAO+AnaAVmJ4PWL+PrRdLu1GOjFdVPFldg==
X-Google-Smtp-Source: AMrXdXvSPOwVjOCrhguWVpzIUlUMdttiuizEXtJFfgxCI3UH4Bv6pmx/fTGssGsMzUohUgJr5iXSG8wohLXJd4lJ15w=
X-Received: by 2002:a17:90a:488a:b0:226:b5f4:d420 with SMTP id
 b10-20020a17090a488a00b00226b5f4d420mr2188050pjh.102.1673302520314; Mon, 09
 Jan 2023 14:15:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-13-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-13-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 14:15:08 -0800
Message-ID: <CAKwvOdnaXkHe4bJyD9LGfWj6rX4DVO_0J1U_eH3wJX5kFiOYBg@mail.gmail.com>
Subject: Re: [PATCH 13/14] kbuild: Turn a couple more of clang's unused option
 warnings into errors
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Currently, these warnings are hidden with -Qunused-arguments in
> KBUILD_CPPFLAGS. Once that option is removed, these warnings should be
> turned into hard errors to make unconditionally added but unsupported
> flags for the current compilation mode or target obvious due to a failed
> build; otherwise, the warnings might just be ignored if the build log is
> not checked.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1587
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.clang | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 87285b76adb2..70b354fa1cb4 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -36,6 +36,8 @@ endif
>  # so they can be implemented or wrapped in cc-option.
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  CLANG_FLAGS    += -Werror=ignored-optimization-argument
> +CLANG_FLAGS    += -Werror=option-ignored
> +CLANG_FLAGS    += -Werror=unused-command-line-argument
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
>
> --
> 2.39.0
>


-- 
Thanks,
~Nick Desaulniers
