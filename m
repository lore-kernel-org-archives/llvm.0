Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3038BE0
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 14:21:30 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id j130so26438007oif.4
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 06:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCmu3jJ7Nlxelagke1iSb8wxFg1JY+FjQQE47k7d8dM=;
        b=hKUgWT7YXESJh/RZM84Wvm5DUabxzj4moIqEVvGV85ai322jDXTsRN4ZFtRvOFcfDO
         UHHY/tMCAVFAt2hPtFpx3hZScq71/j10BeH0RyW79KBpTnJspIk5NGrX62r092+Kq/5A
         dVJPGdR0SanhJwco5SNaQofIgzpj16JS1jBURzOOv2qdCer+HhwmkestxSRfRe367QTv
         0sNPeSbIOV8qeeYdtXHnjGHgRuCdG0zQuwZTrqj0b3OQZBABoFF7820rl9m+f0qDjRNl
         Gv9ezaevDQtrufO3bwoqn52AR4d6uzpIR4jNuWEGa8ri4EvsbcA0vPvz6sPtsaVEnvd6
         7ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCmu3jJ7Nlxelagke1iSb8wxFg1JY+FjQQE47k7d8dM=;
        b=6ZX29PH+7/zpdTNvHjiCneFLIMZwxtpkMyfRVE1HkMETNsXqqTcUfhbaqj+DiZuCW2
         sF2kojsAuHLz/SMQy85OqhFAaHxPdqRK0alFv24Nua2nWxyV3Rb3BLLq3Oc0I94CyBL/
         pwSL7E2Q3/MYi2q2/5JG7B9xn7MhjMbvy2w1Re9lMo6eHJLnfr04X50tVBvjQl04Lrgt
         94PQFyScK5tg3vMYSu4yNvcDH/ZbiYQpV+2/MQZeS7MEt3xKcUnewMK6HWNdM8c529Ov
         rSCjwuOJZvQZAPHsrsreLqIqFfaA3ci7l++1k+YRJMM1MxEDu/jYI42QT1UM60MjCfez
         uI8w==
X-Gm-Message-State: AFqh2kptiR6dmSWGfkL3enl2+41H6HRC5dBTZs7EkIJV696umouTqWU2
	lnrhtSPx20lXcZv6j8JY9UMWvPU1ghslOfThJKg=
X-Google-Smtp-Source: AMrXdXss6pLzkv+6RMrSqTNpQ6Z+DzO3VSYyYkr56kXLuRqy482ixVPQh/8ymY3KcL5PQWbJRxdlPG42uLrpQJQn6zs=
X-Received: by 2002:a05:6808:2994:b0:35b:f5f7:3ed0 with SMTP id
 ex20-20020a056808299400b0035bf5f73ed0mr3417836oib.46.1672928489064; Thu, 05
 Jan 2023 06:21:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-12-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-12-658cbc8fc592@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Jan 2023 09:21:17 -0500
Message-ID: <CADnq5_O6W2j7QKm-JHsf8FOeuRFu0V4w=Ac8AV8r0KFZTegPdw@mail.gmail.com>
Subject: Re: [PATCH 12/14] drm/amd/display: Do not add '-mhard-float' to
 dml_ccflags for clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, Xinhui.Pan@amd.com, 
	kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, sunpeng.li@amd.com, 
	trix@redhat.com, llvm@lists.linux.dev, Rodrigo.Siqueira@amd.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	alexander.deucher@amd.com, christian.koenig@amd.com, nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 2:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns:
>
>   clang-16: error: argument unused during compilation: '-mhard-float' [-Werror,-Wunused-command-line-argument]
>
> Similar to commit 84edc2eff827 ("selftest/fpu: avoid clang warning"),
> just add this flag to GCC builds. Commit 0f0727d971f6 ("drm/amd/display:
> readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP
> routines") added '-msse2' to prevent clang from emitting software
> floating point routines.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: harry.wentland@amd.com
> Cc: sunpeng.li@amd.com
> Cc: Rodrigo.Siqueira@amd.com
> Cc: alexander.deucher@amd.com
> Cc: christian.koenig@amd.com
> Cc: Xinhui.Pan@amd.com
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this via whatever tree makes sense.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 0ecea87cf48f..9d0f79dff2e3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -26,7 +26,8 @@
>  # subcomponents.
>
>  ifdef CONFIG_X86
> -dml_ccflags := -mhard-float -msse
> +dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
> +dml_ccflags := $(dml_ccflags-y) -msse
>  endif
>
>  ifdef CONFIG_PPC64
>
> --
> 2.39.0
