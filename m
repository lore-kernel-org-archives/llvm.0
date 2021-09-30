Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7C72
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:01:08 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id e24so8335457oig.11
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yZQ9+ptpmGZPeIgxp8JUYclciB8//BIrr9G2Q/xQRpI=;
        b=L5lkL0l6KtT5agnJdUQekOZPgWMZ0FQsY02b7YU0lwUgKl6cw6/Ib735DMgIFQrF+d
         P03cs2riMQ5Wr7yZHIIGQ4bPt2aSo38AE3EQiSb6k2/DJ6XJR5U5YDsSwM5lzUWTlpuM
         sT+wfKmv2UZu/6i0vfXH/JtiLZx+ZaonnIPjYD2rUKf7Gzq614FM9WFRVd/4KYQWZVaO
         OywtzTV969OrJBkpZWn/6FA4BOZczstYSv+KllGGnqPkK/bOOeB2pHqTbilUcBYPjezA
         neGf1eHNG03ig12fbBFc+YqIyBVfb9UvUUwu/bSb7efwyRIHMxw1kTn9itC/oCrgHDOH
         DLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yZQ9+ptpmGZPeIgxp8JUYclciB8//BIrr9G2Q/xQRpI=;
        b=gIViW3IF5wfv4Q4lSS9mhIbOirnEIDHO/Gz3lYEyO5k/RcSfDh5cRZYEgR2XmVkyHS
         EU87941fQzrMDqbBwhN6ztj6Duyxp2RZzrlKAR1+XcSQPUC+ZhMidhu41phbZKmNJb5N
         Wg3JKXNC+n0QEftUvJa5DeEkWRycahPSZki7xG/TMlkkNAH9oRI0tpmVX+fpg5n/DaP5
         fl98W2mQ+nO1rhPvvtCFITPfMC3VZHCM2ef2H8sa1edSi3Dts6LQofB2AqEWhobM0vBg
         qheTIFjWPdJ0Qj8g2KK18iPQdRHVwuW9giaOewirOWkURFtdhaU6N6yn0NRC9ZDsLUK8
         71Kw==
X-Gm-Message-State: AOAM532OeEds0X7eEK6yO+VF23/4rqcCCJ9gSxWYdfjkmZnRaTvgv242
	jVjIcHrO59eW/pHaDgz25jJKA4nWc6MiCdg3TEM=
X-Google-Smtp-Source: ABdhPJxzr0g8+mn8CixoZiIj4shBlN5EDztIQ6LzFMC+yNKVdi+qZtKnohF4pLFo6+pUFAfRnlf2DGEHzUu9maVUU5U=
X-Received: by 2002:a05:6808:1141:: with SMTP id u1mr444880oiu.123.1633024867391;
 Thu, 30 Sep 2021 11:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930160142.2301257-1-nathan@kernel.org>
In-Reply-To: <20210930160142.2301257-1-nathan@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Sep 2021 14:00:56 -0400
Message-ID: <CADnq5_P5eKwjeR4nKTsOFc-QRUYkSuiko91PO4L4Djtr=VU=ZA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Guard IS_OLD_GCC assignment with CONFIG_CC_IS_GCC
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 12:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
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

Harry beat you to the punch by a little bit.

Thanks!

Alex

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
