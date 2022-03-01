Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F45179
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 13:10:56 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id q8-20020a17090a178800b001bc299b8de1so2148643pja.1
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 05:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DV6f3J2QIRehyEDByQEpoJ2xwDbM5hUK+3WRGSJAWlw=;
        b=YbuwEXN/UFumml2CqM42Aahs6NNSgs9Fax2qrLKsWK3mw8JfHkq7DpjMyrbU0N1Usx
         bmHQu6FoE6V/joJwRIjThReEFs/kkPktEhABl7uNtKNe1ufj8eTNvGoE/AsPxa9tN0MH
         YD2Vl0UrWh2AjVEa4A9t8oUMSSxRRk0ZSqcVsJea+OVqKXhqaDB7GRkUSKj/Nz/SRAAw
         VdmyNV4CpfsY3QB28aRqjKtc+LtehkS1v37iQzSUSkodUzze9ZLvTqTekeE7yyzHrLvr
         rDRrBC5VxnEFbnwtevr9seYx/NO/F3H4YESG9A5RcOi0srsUnLX2JDcq7Iij3SDDxdVy
         u9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DV6f3J2QIRehyEDByQEpoJ2xwDbM5hUK+3WRGSJAWlw=;
        b=O5mOKAMFE+F0QOKMniStj7R8GSANyGoO5rsOnW2N7zVKJf65X73pXyxqjP22ARI4d3
         6armm/h5mKiFnfuxbqj7Gi4IsWdmkolR8wrBNCA2UBP3nu8ClsuNcRjERumLLrqD8lrG
         JRiA720EQyPUMpKzgHGfQWoWaciITDNiB8TAdDPzD6HOZOwqUK0x7BPTFwgYsuvEGO44
         VHA3RJU9jo7Kcd/FsgjnP4Lag+z0G+DyA2M8Xy2Kwac+gjTZRMXH6a55ZNE7w5kU0WFf
         0KryC6k7d9CsnBNNvFWsnGwyM0MNNIEgUcrArzb4KUJz9cfbmiaKvScWtDryibe/fX29
         LREg==
X-Gm-Message-State: AOAM531WXneMo1fXJgLCcf2y2FDAk61ndWkrasbE0W7e0DJovoTFMIAz
	AZglGCD2vnNdbmve5b5Iu3FDzMrNeL1vQUO+1nTQ8A==
X-Google-Smtp-Source: ABdhPJyUTJreTDgP0C9OseilZ4NmT99vFUTYPcMXphbUrL9wNDsClw+KYh7/yJsMqqSZ7ZrQKj8DidkIMvcpRyd1WSY=
X-Received: by 2002:a17:902:c94f:b0:151:3cd8:efe3 with SMTP id
 i15-20020a170902c94f00b001513cd8efe3mr18961096pla.117.1646140255853; Tue, 01
 Mar 2022 05:10:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301060530.5870-1-jrdr.linux@gmail.com>
In-Reply-To: <20220301060530.5870-1-jrdr.linux@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 1 Mar 2022 14:10:44 +0100
Message-ID: <CAG3jFyugksy60Sgjg5U+E4ZGEH3mNpZmLJB_aZ=uncb7kg7zAA@mail.gmail.com>
Subject: Re: [PATCH] media: camss: Replace hard coded value with parameter
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, 
	mchehab@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Mar 2022 at 07:05, Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
>
> Kernel test robot reported below warning ->
> drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3:
> warning: Value stored to 'val' is never read
> [clang-analyzer-deadcode.DeadStores]
>
> Replace hard coded value with val.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index abbfbf448893..2031bde13a93 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -405,7 +405,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>                 writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(0));
>
>                 val = 0;
> -               writel_relaxed(0, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
> +               writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
>
>                 val = 1;
>                 writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
