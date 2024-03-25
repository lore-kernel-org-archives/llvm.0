Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7798018EB1
	for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376709; cv=none; b=VW+yoN4Q2QT+q25AVypcueEHTNI9ihi273Eb0y4b2N4LE5aA/PMVFoKAEY7ShCnyDvJJ9Ztg3MrczmzC/WQgbohz3WmBjG08gSASDTqMjIlMD87CWPAURznDT/iFgXL+AibQHrPTysoalZfj/F5SMfpth1CBImVuSdK0TRGXJTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376709; c=relaxed/simple;
	bh=+MeltPZVNKwDT4s9LWJGLhPwYg6oTgYBzKVCn15VZsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYrloQ3+SgYGIgAUcbLSprOj2NWjQ0n2QkguLlbhj5/MLdxXScR/JTSMuBM2IbkqNdDnB4RjDKFsYKzsq6bM+K9rOITrwd/4pMiyQzNfNOheGcA+aAXEA3oQmAEC6GPKoNu6mOoeaNLjS05olcCwawDgVU6VkA1Muuh5blDVMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sG9sySlf; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sG9sySlf"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513d3746950so5398041e87.1
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711376706; x=1711981506; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3PUtNY4boQ+ipy4wQYd09otPfOvXLpDaCkOQ9UXG84=;
        b=sG9sySlfppMommai4CWtfAtc82bZP+wfWERW85YmyHWg+R0eh/ldF/13EVe/03+nWV
         4YHQXFXKqnEWjjSpv2ZMW05/+8GcDPT5d0Qm77aYkLwoe9fX/17PbMstmiD3D/VMX+fc
         H5LJA/EYz6uut3n2iB5n1HzWOVsl7x1MExgDcZmjvz30J6BT/mvixF5ScAKbMsaKyRAb
         z6IXEocaapbrgPqGqB34X3QwY8hnm9AgYjnVvTaPlhb4XZwIN2vwVY2XK5coyoZQjEsm
         lG6bRxJk2Gl9yYciRce+7zC2kiCsMTKppvX5uFw/NpwUUA+Bk7PsqwDvDI1PM5DLC0wW
         5nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376706; x=1711981506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3PUtNY4boQ+ipy4wQYd09otPfOvXLpDaCkOQ9UXG84=;
        b=NUUpFUZcWHpWEg+NOVO7xGE2WCXVmZyYwiksfG+QhceSHlzApgZ+QVNsOoNadH5lHi
         ygkWezSlKa9Tf+8aDWksmcH6nCEgwMJGU/tb5pd7xt2+nPpKQMubbcH+ZDKl4bOEgNN3
         nsilv5fIlngZZCm5B69BxStXI/BDJxX4IvtJ0+0sZ3mKOdeILhuqWWUozinSBVc9MII7
         T6o8rG8GcPMLasK9oMdcnbo4ISwUOtdLyKI/W+fdJV/yXz5097RQazlFVTsj61P0vU5W
         5HJ7DJTsKTnYzH3Sdw07+wTsp2scua83mUvofclzSFKlS2sHZDyoiMNWGYKozjcuMS0q
         Lg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcw9xSiVUlOqc0wpeqdl7FKqKmfY1EngnHYhMMDlBrV/coxTap5kZWYN3jLqZgIF+irMhmk27DcXielI/AMr6gIwvuzA==
X-Gm-Message-State: AOJu0YyG9Tj+De0lyV9bBA0o1D/Ph71AD7GAjTBhuC9wTbYz6sp1YUj8
	vwtJwX7cgFmhWY6uv2a1Qnh2RJXvRW05h4yiixTaYQE1NKOgCIA5rVSmRXpvJRA=
X-Google-Smtp-Source: AGHT+IEFidCgty+v00DMTxMPtnXdVdXzQmlAggnT/0h5fv4Uf17UIa5tj3pq//IwqDLEoDELOZO2Xw==
X-Received: by 2002:a19:ca14:0:b0:513:23be:e924 with SMTP id a20-20020a19ca14000000b0051323bee924mr4375709lfg.59.1711376705571;
        Mon, 25 Mar 2024 07:25:05 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l12-20020a1709062a8c00b00a45f39b2d16sm3104885eje.200.2024.03.25.07.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:25:05 -0700 (PDT)
Date: Mon, 25 Mar 2024 17:25:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: sti: uniperif: fix the undefined bitwise shift
 behavior problem
Message-ID: <5d850276-a872-45fb-9df2-2b72479787be@moroto.mountain>
References: <20240325034032.1031885-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325034032.1031885-1-suhui@nfschina.com>

On Mon, Mar 25, 2024 at 11:40:33AM +0800, Su Hui wrote:
> Clang static checker(scan-build):
> sound/soc/sti/uniperif_player.c:1115:12: warning:
> The result of the left shift is undefined because the right operand is
> negative [core.UndefinedBinaryOperatorResult]
> 
> When UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip) equals to -1, the result of
> SET_UNIPERIF_CONFIG_BACK_STALL_REQ_DISABLE(ip) is undefined.
> 
> Here are some results of using different compilers.
> 		1UL >> -1	1UL << -1
> gcc 10.2.1	0x2		0
> gcc 11.4.0	0		0x8000000000000000
> clang 14.0.0	0x64b8a45d72a0	0x64b8a45d72a0
> clang 17.0.0	0x556c43b0f2a0	0x556c43b0f2a0
> 
> Add some macros to ensure that when right opreand is negative or other
> invalid values, the results of bitwise shift is zero.
> 
> Fixes: e1ecace6a685 ("ASoC: sti: Add uniperipheral header file")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  sound/soc/sti/uniperif.h | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
> index 2a5de328501c..1cbff01fbff0 100644
> --- a/sound/soc/sti/uniperif.h
> +++ b/sound/soc/sti/uniperif.h
> @@ -12,17 +12,28 @@
>  
>  #include <sound/dmaengine_pcm.h>
>  
> +#define SR_SHIFT(a, b)		({unsigned long __a = (a); \
> +				unsigned int __b = (b); \
> +				__b < BITS_PER_LONG ? \
> +				__a >> __b : 0; })

The code definitely looks buggy, but how do you know your solution is
correct without testing it?

I don't like this solution at all.  This is basically a really
complicated way of writing "if (b != -1)".  Instead of checking for -1,
the better solution is to just stop passing -1.  If you review that
file, every time it uses "-1" that's either dead code or a bug...

sound/soc/sti/uniperif.h
   132  #define UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT(ip) \
   133          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? -1 : 12)
                                                                      ^^^^
This is dead code

   134  #define UNIPERIF_ITS_UNDERFLOW_REC_DONE_MASK(ip) \
   135          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? \
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
because the version is checked here.

   136                  0 : (BIT(UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT(ip))))

Just delete UNIPERIF_ITS_UNDERFLOW_REC_DONE_SHIFT() and use 12 directly.

[ snip ]

   988  #define UNIPERIF_BIT_CONTROL_OFFSET(ip)  \
   989          ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? -1 : 0x004c)
                                                                       ^^^
Negative offsets seem like a bug.

   990  #define GET_UNIPERIF_BIT_CONTROL(ip) \
   991          readl_relaxed(ip->base + UNIPERIF_BIT_CONTROL_OFFSET(ip))

regards,
dan carpenter

