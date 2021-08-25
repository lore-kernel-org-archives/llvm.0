Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610133FC0
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 22:10:04 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id q21so1255667ljj.6
        for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 15:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghFbFPwORK1+Bz2wOxhpN/SoN4TRNRW43zNAEvuCWSY=;
        b=E0x8czOulpWEN891RwS2QAyBvmp9MvfetYuWVhbr06f3zooNt13sa+lOLywDOoy2Dx
         Yv7hedc6sv4ydIHicr6V0Fif8+Eh5ODJaelTi8a4Uz4iaX4QGIngB09G84PYmiSfuh9i
         NiL5Ceil+a1RbaNyWvKo4yIn4O6zJfoNZTZaaGg7sxT8YDpqAmFzIdhncRBY5jAXgTE1
         AthI4l0Mw6uIbSwFjIY1jzdpuJyoAQdSxJZl5BLf8Xq+/wEk4hgGJ7uT5KcbNGCmWfGK
         wp3GCyC0dj2Pd2wTAMjlMQcqgo7Zm9q06CK3OlbmaI7C7R8gQR9la1434Xw4KEdhUm3H
         8S7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghFbFPwORK1+Bz2wOxhpN/SoN4TRNRW43zNAEvuCWSY=;
        b=h1f41x1eYQ2FKQGHIgh0w0lw6KrFDpSgzdPJ6WsnYrvi8+/FOzH7NxzUTL3f3Npdo/
         TU0b7wtr0AterfPLDAYiUYCax7bbxB7hR45FPPpCuJDabpGsXO21+XbLnFNuCrXw6zQS
         RMeunmrBRVArBs7r+dyki4LXUS8+wljiq03c2eyqDrFwYfk8VQz8O1NaPTjhckR5jGoP
         t/lEJEu373SCe+kPUFv+rwyP1/OWy9yPHRYTr4ammWE6vRYVgvjseCRIkU36VpqKctdT
         DPd4TiQ2ZOMCYLweTqbTTxxyZMe+7Td+Zx/qzaBt8w9k5wNsVQOZPspx+kQYNghLoENh
         j7Rw==
X-Gm-Message-State: AOAM532vbKhGQGMIY16h609HN9+ZpnPYSZc9VAOho3AJk2ZUAunF6mHE
	tEwN/xKD4FwfswIbxL8HXhntCJPFjQCfLuRxxXq9TQ==
X-Google-Smtp-Source: ABdhPJzzXlIrFGyXH220jQi7T8nSZN7IM6dxT6KRzEETxGwid12RGI3KeDZHSF3ZBWxXHPPtg544/FeyqPAR+lyTDDY=
X-Received: by 2002:a2e:a40c:: with SMTP id p12mr323288ljn.479.1629929402286;
 Wed, 25 Aug 2021 15:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210825211823.6406-1-nathan@kernel.org> <20210825211823.6406-2-nathan@kernel.org>
In-Reply-To: <20210825211823.6406-2-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Aug 2021 15:09:51 -0700
Message-ID: <CAKwvOdmtd0PUH-=_OqTzhFYh=XimHDpFWP9bmcnMprioTSKHBw@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation/llvm: Update mailing list
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 2:18 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> We are now at llvm@lists.linux.dev.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Documentation/kbuild/llvm.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index b18401d2ba82..06b8f826e1a3 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -111,7 +111,8 @@ Getting Help
>  ------------
>
>  - `Website <https://clangbuiltlinux.github.io/>`_
> -- `Mailing List <https://groups.google.com/forum/#!forum/clang-built-linux>`_: <clang-built-linux@googlegroups.com>
> +- `Mailing List <https://lore.kernel.org/llvm/>`_: <llvm@lists.linux.dev>
> +- `Old Mailing List Archives <https://groups.google.com/g/clang-built-linux>`_
>  - `Issue Tracker <https://github.com/ClangBuiltLinux/linux/issues>`_
>  - IRC: #clangbuiltlinux on chat.freenode.net
>  - `Telegram <https://t.me/ClangBuiltLinux>`_: @ClangBuiltLinux
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
