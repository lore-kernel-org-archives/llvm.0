Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4FB72
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 10:58:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so7480773pjb.5
        for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 02:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sCgAh/8By8wNIrpD9ZFYd1/D45MydwuRk8zcWPcXzGQ=;
        b=cLqXpIgXjTlGOz1+IBYb8VUFp+uxcoeg2qgpXuYboMkZ9nEN2PIueIvHrVwRREeLmb
         +MrF9p67VwUtwkCOKgMpKFHfMbgQKrRu3A4Ei5fZTDaW/5FP6BRBW4nGfIWSFpYZFNe8
         0HSKyJrAk7bR75zNpuXPOvX7m7hC7BeqhRGcMfOrHH6huXvQNL5Az0dD8t07sD1vp6fW
         DSs5Sa4z5eLSfVWXh6wJRcbwCy9qkbxFE/5DrfUZkwUbQAyBimFVikRyc2tPk4rfv6vB
         IVnUrMjl/5tVH3g09/AQOnibornKoF23XfqUGYJTThaJBEa6V998JrI4MIc7OGUol2aZ
         HDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sCgAh/8By8wNIrpD9ZFYd1/D45MydwuRk8zcWPcXzGQ=;
        b=AZRnaofMsaR/oPSmc4XmenxcxprfSgIgDHGWVD9ti+4sSlC8VDkHoQS5YFKWikY6Ci
         LM0E8d992yc+a43JdZ9rA8NmQ7bzu8oeL4rMQtuav/XTZH/OBtCgfulAutKzM6EnDIIj
         Md5SH9xSg/JKLlv2ORXrpE0MWqOiWXG14isPHYI6ZPA+sA0YdYSkBwN5bQCE4H2pIBZ2
         CCMgrHgoNA+ke1SFzYrHZqVPj40dUg9nyWXD76qubRwAzCFsM3gjiwDnL5t+af2fFoM7
         g1spJHx2AQ2Q1DY51/D/ZK0JitD1pM6NJzBhfqnobH5g1XIDsG5HXgjD2FGj+xBMXF5a
         OCEg==
X-Gm-Message-State: AOAM5323hPX7PjwpD5Dles6LZnXADRIUksShDt/mlV4QRk9TcE5w6Cv3
	2pM995HIm/tIcny8nvrBiW+ULovnHYlFCYyJhZhk7A==
X-Google-Smtp-Source: ABdhPJzEuWLGFxkRno8JHC5jNEyjXKuuqBAtEaEU9SYXKzgCatvz+aOmCp4g+jj8lAIvVYTHHBWYGkqPHzjzHeAWsL4=
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr5895404pjb.232.1637837938076;
 Thu, 25 Nov 2021 02:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1637781097.git.mchehab+huawei@kernel.org> <c33a6897f5a0803b3fde93fcf4ad652c0915db54.1637781097.git.mchehab+huawei@kernel.org>
In-Reply-To: <c33a6897f5a0803b3fde93fcf4ad652c0915db54.1637781097.git.mchehab+huawei@kernel.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 25 Nov 2021 11:58:45 +0100
Message-ID: <CAG3jFyvHvNs93x29s9CoxwRJnpEo_VpyFvCcb6qOAOVpWUs+mA@mail.gmail.com>
Subject: Re: [PATCH 17/20] media: qcom: camss: mark read reg function as __maybe_unused
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Todor Tomov <todor.too@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks for submitting this Mauro.

On Wed, 24 Nov 2021 at 20:13, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Such function is currently unused, but could be needed in the
> future. So, keep it, marking it as __maybe_unused, in order to
> avoid a clang W=1 error.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
>
>  drivers/media/platform/qcom/camss/camss-vfe-170.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> index 5c083d70d495..455ae1a819e6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> @@ -191,7 +191,7 @@ static u32 vfe_hw_version(struct vfe_device *vfe)
>         return hw_version;
>  }
>
> -static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
> +static inline void __maybe_unused vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
>  {
>         u32 bits = readl_relaxed(vfe->base + reg);
>
> --
> 2.33.1
>

I've submitted a patch[1] for removing this function, with that patch
applied, this patch is no longer needed.

[1] https://lore.kernel.org/all/20211011121301.421410-1-robert.foss@linaro.org/
