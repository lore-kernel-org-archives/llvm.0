Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F99C12F5A4
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 22:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663985; cv=none; b=MPyhedvSbOXyAFvK+d5QEYFRhgHapj/p7+85oJ2LUH9nAwiGmCMzFk2KN1a2TfhN8a45INvgAOu0466V32mbJAYgI1a4M6WMkbyfMgBFI8867rdP23UxKcDQJb8zg0JXyG6LNHHo7xqhsBxm/fnnXXbTjdLqRRxHoqzEdV5Z7kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663985; c=relaxed/simple;
	bh=UIn7MGUsViPkQt8ICxQrkMUs2JY8jgTueQwbo2IwpX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k47cPfjNfZ1MHwlkjEieUGNcNxh+nvT40i5hloJ9jTPp2NglcCyEYZJ0+G3ZBdzuosSI2R5NNl9aj1O0r1gN5RZ6yykhsX5VrE9BrP6dEmt3Uyj0AKmfJBXSL3czVnpNM/mF0+AadOtKkRMlEkMVsWlSHjDn8oVG2daUq7ZeZuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1/pjnTky; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1/pjnTky"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513da1c1f26so1703341e87.3
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 15:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711663981; x=1712268781; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICkGbpRzf1cYfCwK/zqGbOtZejo0e91jUNy63Mscxkw=;
        b=1/pjnTkyi4n/UYO8dyvg/r3JY6uG6oxLWEdFrGxNVvDgTazpL95v6l0AGzmtttPnS3
         LA5QnRLugdG3FVwL64uKQxfPm+XyFUinyX7FVDA6BgnMnPPwwcRYf51X3ZrN/ytw7YXB
         A/S8RHXJHQfU8lmQi/8aiDaroTcMEe+YWoWzNE9bmXshZ9hKsT9V+J6g1p6nfW6PLAWj
         urKLMcm7q+5bk3EmqyJv2ec1SyMbv82ZERyRtRVnvJ/gt+aod+WJ1HWMH115k+enSJKO
         BPWv9GTVNRIUZFlDGCAzt0M22ZQsGuTTdpXQcSSaSgCjtwPq59XxcMGqrmucJTkLxQjA
         ZL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711663981; x=1712268781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICkGbpRzf1cYfCwK/zqGbOtZejo0e91jUNy63Mscxkw=;
        b=psSrbOGTuv72dPd6PPCyoF/LI/KYuSsXyXyUyEo/ALy0717TVJWVuVI3YPqyTdvlnZ
         dl1/5cUVsaE2FuM1g/j+DFH34OZNuwhDHjCzWA9KmDommJrJg/G0WI8GNBzfJBbMLxoS
         h8l/p3ZhCUOrhAt3CV2SAk92BusQIx920Q+cVVvMtnq+fwn/2WJTSPk7j/KXmXk2SBTH
         vDc/Fbef/IrEg+avV6s7TvU6WvwjIDtq5Ua1iyJb1mIvo8sEPTHfw2BpMPkyHyZdFVNa
         PZ6Jop06EiAaetRvziRZXNmv1yvIxM1/olEfkDwnU84iQHEg1Cir2OEnLVUX42N81hTm
         g9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8pStXAnJjott0kDX3Ss8mfMkxcnoR3xsq4dslzCrcnxKRR81YPUnziRpoOv6mSvszmgHwORcHt2Ri/sdeIkLjfPODLw==
X-Gm-Message-State: AOJu0YxM+FwxkMQJKiIKxk41/dBzT+J+2WlEWZsMi/aNS4Lt0vXgUChd
	E9OnA0dUfQyQakmrHA6htEJ6P6P0sOatMJYsx9NBgWtFbmx42C90qMtrDJXkntRb5tEkTHeNdV0
	9vuhpQMMJv8rmTEp4jC24YE/ESLM2IXkk9HF8
X-Google-Smtp-Source: AGHT+IHSqMcf1h2xQB5wa4ZUcWCBKayE/iQN+78kFaOeI10I6ErDFcmpdz42xUhwteOa3FVAVroi2xGibnGqS3oLTFc=
X-Received: by 2002:a19:6902:0:b0:513:d484:da51 with SMTP id
 e2-20020a196902000000b00513d484da51mr440445lfc.65.1711663981372; Thu, 28 Mar
 2024 15:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328143051.1069575-1-arnd@kernel.org> <20240328143051.1069575-8-arnd@kernel.org>
In-Reply-To: <20240328143051.1069575-8-arnd@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 28 Mar 2024 15:12:49 -0700
Message-ID: <CAFhGd8ojRE3no8K--Nanj5PJz4oO-eG2J8Q_4579pDEEJz8uNw@mail.gmail.com>
Subject: Re: [PATCH 7/9] infiniband: uverbs: avoid out-of-range warnings
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 7:32=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
> Add a cast to u32 in both cases, so it never warns about this.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/infiniband/core/uverbs_ioctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/infiniband/core/uverbs_ioctl.c b/drivers/infiniband/=
core/uverbs_ioctl.c
> index f80da6a67e24..e0cc3ddae71b 100644
> --- a/drivers/infiniband/core/uverbs_ioctl.c
> +++ b/drivers/infiniband/core/uverbs_ioctl.c
> @@ -90,7 +90,7 @@ void uapi_compute_bundle_size(struct uverbs_api_ioctl_m=
ethod *method_elm,
>                 ALIGN(bundle_size + 256, sizeof(*pbundle->internal_buffer=
));
>
>         /* Do not want order-2 allocations for this. */
> -       WARN_ON_ONCE(method_elm->bundle_size > PAGE_SIZE);
> +       WARN_ON_ONCE((u32)method_elm->bundle_size > PAGE_SIZE);
>  }
>
>  /**
> @@ -636,7 +636,7 @@ long ib_uverbs_ioctl(struct file *filp, unsigned int =
cmd, unsigned long arg)
>         if (err)
>                 return -EFAULT;
>
> -       if (hdr.length > PAGE_SIZE ||
> +       if ((u32)hdr.length > PAGE_SIZE ||
>             hdr.length !=3D struct_size(&hdr, attrs, hdr.num_attrs))
>                 return -EINVAL;
>
> --
> 2.39.2
>
