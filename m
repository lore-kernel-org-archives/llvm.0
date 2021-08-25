Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4563FC0
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 22:11:44 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id q21so1262245ljj.6
        for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FcPemo/39ZZqVRJxyNaewA0Ko8RERS20Yvi6i29tDYQ=;
        b=gwHTQzwdCU3t/wtAvSYJjtL8er9zKgGS7fe2BFzG8nb2mJUIxmfzPMun5rNDPcO8gn
         WJ31Ywut5BEbYSO1XBuYn9mOUYmnQV2OAlDulzdcZLPTL60uP4FJF5wb7HfhXHzoopZC
         Nk//kVq4UHOCBURQLvXowN5/nhGg0SowX9X8pJ+0tYX8U+ND7ICI9K2MLFm+e73PznKU
         3uJRa29omcHWJ0cnE9TWOp3TZQIaORfwmeFSUJIco4KGeqeG+U9A+XsPu+kv9AOIEELB
         6DgDcvBKNtVfb/vPMzeDhxTf5Rhk1hoU60oMdPOhsnEMUVjN4qFQPDxngT68zvs3xbsM
         FTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FcPemo/39ZZqVRJxyNaewA0Ko8RERS20Yvi6i29tDYQ=;
        b=tiemTsu2qGTncEnp5zqxYeH2sD+i9AJiYYC/D0/WWWsT5zPRp2qB0Cw0j18ooec/w7
         cuLPQU8F4o98/Xbm1RQ0ngyBYV1E9Di2n+y8RQaf/ZmRa/eEp3LG5qFs7E8TE7BJCAXe
         bU6KhrKL1yFFtRbpXibiz09VQoFub5NXfy0ZZIceRNqYhdx2Ivc3bUJhbovQQXtddpxI
         B5PTutKf0aaWFWuczB7QIl6nSjESioGSgy6qZnFYACqg6s2ugVExyMtENoE5Bk5FJ2tB
         OZkmUm13D4I7TVE7PIRpHFecCQ9mIhdRu4rP+Vkh6rH/ECKzFtUoSNFnvNdYDW0Z+Kut
         vl5w==
X-Gm-Message-State: AOAM532gy5Qt8FM+lcWxDEWSwLZJYFBjMO6xr9ek8FgoHyqdLJ5wcZsZ
	xUsXDM99U8QyJLrrC5bk/jCyfDJZISo9Mrsazyojwj9rzJ0XyQ==
X-Google-Smtp-Source: ABdhPJx3mYgy1OtiE1R6osp0s4OIsm2Y91PX716mJJoiBqC2sS9drhxn8MDm9ioqgKMGu4NvsJMsP4uHFxWwTuA5eTk=
X-Received: by 2002:a2e:9ec1:: with SMTP id h1mr380854ljk.0.1629929502234;
 Wed, 25 Aug 2021 15:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210825211823.6406-1-nathan@kernel.org> <20210825211823.6406-3-nathan@kernel.org>
In-Reply-To: <20210825211823.6406-3-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Aug 2021 15:11:31 -0700
Message-ID: <CAKwvOdmpSh+fa-WfL4sijQXabJ32K_XvDii9Nu-JaT12Fce1kg@mail.gmail.com>
Subject: Re: [PATCH 3/3] Documentation/llvm: Update IRC location
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 2:18 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This should have been done with commit 91ed3ed0f798 ("MAINTAINERS:
> update ClangBuiltLinux IRC chat") but I did not realize it was in two
> separate spots.

Ah, sorry, I missed it, too.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Documentation/kbuild/llvm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 06b8f826e1a3..683f8b7cca0b 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -114,7 +114,7 @@ Getting Help
>  - `Mailing List <https://lore.kernel.org/llvm/>`_: <llvm@lists.linux.dev>
>  - `Old Mailing List Archives <https://groups.google.com/g/clang-built-linux>`_
>  - `Issue Tracker <https://github.com/ClangBuiltLinux/linux/issues>`_
> -- IRC: #clangbuiltlinux on chat.freenode.net
> +- IRC: #clangbuiltlinux on irc.libera.chat
>  - `Telegram <https://t.me/ClangBuiltLinux>`_: @ClangBuiltLinux
>  - `Wiki <https://github.com/ClangBuiltLinux/linux/wiki>`_
>  - `Beginner Bugs <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
> --
> 2.33.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210825211823.6406-3-nathan%40kernel.org.



-- 
Thanks,
~Nick Desaulniers
