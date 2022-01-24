Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99BE2CA7
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 22:08:40 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id l64-20020a9d1b46000000b005983a0a8aaaso24249945otl.3
        for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 14:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5AU7UHXWGTgXus+jcgLu4tYknaJHqkDWYn1T5acuUH8=;
        b=NMM7a/yjJoWOPQjiTo+SdO9A7Y7k+6dqKIG3Kq3o8dz5RSoZ1W2vD77yq2K3z1Nxt4
         2Qn4P18bkaT2nk5dsqlPUyMhY/TB3Qoo6FJRy1W+8sr33cSUmBdktRvJMckxtUpC7ev5
         NS4RFF6uAiFsuqMj/uJEnwtonchUz8WDNLz/9Wj0/0qE5/gDqlonX/RwX/0T7sfOjJsJ
         mIRTYh6QH+zNutWNdWHCUp+LbnJaxAVIF41PJPKVg7CoHdgjKGgvoNgaGqzpbgr4/4Ox
         X1OrHW75bzMi9cF1nNAmFxIVFjO2qiS8K+uCqfqG980sJeDjyS8uL0x5tfK1XA0vq274
         2OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5AU7UHXWGTgXus+jcgLu4tYknaJHqkDWYn1T5acuUH8=;
        b=x4RA+aZNan9nSOLLnYE9utPDQm6MwqcWJ4N68UYeIdG0vj/kprIXDTbDYw/UrPM4vD
         fehGToEsyF/XNaNWBdzsctyJiwzR+ofWy6h1Dl8Jkn7JMwvAtzwIQtBADaVA+2JOjAa5
         RDKq/xBgFHLTqDzQ5I/Dp39rAJoQrAcvBTRXgsTsO0MqjgmitGHQloRrjkDvUuI/9gB/
         IEJjObz+DlZElLIHSEtuhhBL5J5W50HlBkcl8Z/fa67qhCmKDVFxzvcQTgzAv9ZMpD9Z
         GjiH3xWkoyHIVavR33FEDfEpcLwUgY5HaQqb1mK98Eiv2Pg1uTVqscU5k3eK+8oyYoaz
         HWeA==
X-Gm-Message-State: AOAM533Z9r6PHENlEwtZrmPAxRvUWlIMt7KCvH62d+5c3exyau6DK8fx
	wm/i2s+BfUrizzulbppmqxcwv6vbOHrcIgdDzRw=
X-Google-Smtp-Source: ABdhPJyRp7jJ3E/mwEtBlF6sV7zRxPUTudHrillxpCsaSQDiBOb6hmpGdoVdYTdWWuI6WFz59OvDXIFEApG8s+eBGw0=
X-Received: by 2002:a9d:601a:: with SMTP id h26mr3605702otj.357.1643062119806;
 Mon, 24 Jan 2022 14:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124201812.1078824-1-trix@redhat.com>
In-Reply-To: <20220124201812.1078824-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 17:08:28 -0500
Message-ID: <CADnq5_M+xmJkiMkug=5bix8ypxHzr0embK7GN4GRY57BK1y4FA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm: return -ENOTSUPP if there is no
 get_dpm_ultimate_freq function
To: Tom Rix <trix@redhat.com>
Cc: "Quan, Evan" <evan.quan@amd.com>, "Deucher, Alexander" <alexander.deucher@amd.com>, 
	Christian Koenig <christian.koenig@amd.com>, xinhui pan <Xinhui.Pan@amd.com>, 
	Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Lazar, Lijo" <lijo.lazar@amd.com>, "Powell, Darren" <darren.powell@amd.com>, 
	"Chen, Guchun" <guchun.chen@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>, 
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>, llvm@lists.linux.dev, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied.  Thanks!

Alex

On Mon, Jan 24, 2022 at 3:18 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis reports this represenative problem
> amdgpu_smu.c:144:18: warning: The left operand of '*' is a garbage value
>         return clk_freq * 100;
>                ~~~~~~~~ ^
>
> If there is no get_dpm_ultimate_freq function,
> smu_get_dpm_freq_range returns success without setting the
> output min,max parameters.  So return an -ENOTSUPP error.
>
> Fixes: e5ef784b1e17 ("drm/amd/powerplay: revise calling chain on retrieving frequency range")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> v2: return error instead of initializing min/max
>
> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index 5ace30434e603..264eb09ccfd51 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -116,7 +116,7 @@ int smu_get_dpm_freq_range(struct smu_context *smu,
>                            uint32_t *min,
>                            uint32_t *max)
>  {
> -       int ret = 0;
> +       int ret = -ENOTSUPP;
>
>         if (!min && !max)
>                 return -EINVAL;
> --
> 2.26.3
>
