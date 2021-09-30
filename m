Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EE472
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 17:30:02 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z24so28508590lfu.13
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ye/qqO0p8PKVzbuUoEwamPcpYGy0s9HnvVApER+R6kA=;
        b=ftI3Z0SVqMbhoWdnhg5bUeF+owpQShwFKiFCCXBcdn4RZHbJbc2J0o5nj5aw/QCKc0
         Vdv2kgukq9RGNxjvjCA3DkRkCBBBad79JhJxxgNrkccjH4TiJmRBW0i0ltEOb3yFMdev
         fFeMeE/vjhHmOt6rD9YvGkHtfgRxvfpXrATQ9+w5QnzKHBDo8urSjo0OMyTAAQJAH+zc
         EwvsOhDC+BRkFf8OyUTq4uGhLOTBNWDzgLni0BSbv5tf0eiZ2g1db+Bz2V5XwFVunwsL
         zbC/56A/1fmE7NB8Ti2l0dQyedYulC894HG+7anlAY/mFjb5fTXbiZUoIMQ/I8y6CLKy
         8uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ye/qqO0p8PKVzbuUoEwamPcpYGy0s9HnvVApER+R6kA=;
        b=06H282LXAnPYH9XiIBfhVVp1+XFd/+OWGKkgsFbQDHbwNSi8CaTuAmBCO8aEX6pSGK
         2MkNRtTygqWzfnJdJ/jNDxKH6sYOBikpO29vwtWZCtIfaHFqQlR3AnLtPdGqT5vpDuGX
         P6waploaMFIoGt7PmJX0waQGiZ36dItYi9vxYCWHoQlu/wa/FWPWfkMfvV3GqS+k4e/L
         aYxBOdY9zh3q4tF4UxxhikGCIVVaaORhKLSmV+2y0LBpXXkTPNvzDasQZfxyKAOTe9It
         90kDzsn2zpR5e/XTNtxdz9kK54U8S7jK8d0XYcIJUUZnA31OJoHWWfXDuwJmPSkbkHzz
         oulg==
X-Gm-Message-State: AOAM530S+4ASSuxQhS+sioSpbygvAY+19o5IDPjH1FA7GOjF5+DrPK2+
	FWdSt1yTx5tdC2kLqiWILkOAEoxrMqcmoGy1e3EQuw==
X-Google-Smtp-Source: ABdhPJyhCryWkdo+UwgKGKjWkIyiSDBhEOEx2SxpkNiPWf9uVV7dyEnhQqYnZexjKufQh9L+L+s2Toet+ZTQxKlAHrM=
X-Received: by 2002:a05:651c:b20:: with SMTP id b32mr7192491ljr.62.1633023000715;
 Thu, 30 Sep 2021 10:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930160142.2301257-1-nathan@kernel.org>
In-Reply-To: <20210930160142.2301257-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 30 Sep 2021 10:29:49 -0700
Message-ID: <CAKwvOdkrD4WuZzUnBc2LeCjLVAumBCKXJdyr=k=dPDX1BsMhOg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Guard IS_OLD_GCC assignment with CONFIG_CC_IS_GCC
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 9:02 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> cc-ifversion only works for GCC, as clang pretends to be GCC 4.2.1 for
> glibc compatibility, which means IS_OLD_GCC will get set and unsupported
> flags will be passed to clang when building certain code within the DCN
> files:
>
> clang-14: error: unknown argument: '-mpreferred-stack-boundary=4'
> make[5]: *** [scripts/Makefile.build:277: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_resource.o] Error 1
>
> Guard the call to cc-ifversion with CONFIG_CC_IS_GCC so that everything
> continues to work properly. See commit 00db297106e8 ("drm/amdgpu: fix stack
> alignment ABI mismatch for GCC 7.1+") for more context.
>
> Fixes: ff7e396f822f ("drm/amd/display: add cyan_skillfish display support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1468
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

$ grep -rn "ifdef IS_OLD_GCC" drivers/gpu/drm/amd/display/dc/ | wc -l
11

It's probably time to put this pattern in a Makefile under scripts/
and include it in all of these Makefiles.  Anything to minimize the
amount of code that has to be carried forward to new subdirs.

> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/Makefile b/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
> index d98d69705117..96cbd4ccd344 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
> @@ -14,9 +14,11 @@ ifdef CONFIG_PPC64
>  CFLAGS_$(AMDDALPATH)/dc/dcn201/dcn201_resource.o := -mhard-float -maltivec
>  endif
>
> +ifdef CONFIG_CC_IS_GCC
>  ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  IS_OLD_GCC = 1
>  endif
> +endif
>
>  ifdef CONFIG_X86
>  ifdef IS_OLD_GCC
>
> base-commit: b47b99e30cca8906753c83205e8c6179045dd725
> --
> 2.33.0.591.gddb1055343
>


-- 
Thanks,
~Nick Desaulniers
