Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB21376473
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777481021; cv=pass; b=in9gltqD5TPeJA3C2UlsYsEJOkCfpC4cP2XHDdA/1mn/5A1b6K5PCVOvXK2u96+68oBtxaOUNCVojpzPEgVfPaz3lO/6kxPePZDpuaJAWgIQCL+WvbUJTk/G2hGPGJinOYIVh9acnCAKHT0cL+ny4FRmSsDfZuj64Xu6k2/ZQeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777481021; c=relaxed/simple;
	bh=MqSqhGjtNDbnEb2QTBR92Es5KtPX+3lXEjPCy9wPhoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdYXI77SoXyLuGyJccQyEO8CUyglOxZG/weJzhuRBliaawm+QGN+Dni/vNXkwLZT2mSb/9HHkBRKjCKQLsHZRrxjwKLUpthP44tJcwr05asOoFHAWhNQvGU7ubdzaCMzBAWKERgkVtAdbMalMUM6sOQZp1FRhAoSLgiYS3dor30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WIXmzyi2; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WIXmzyi2"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50d864c23bdso806821cf.1
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 09:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777481019; cv=none;
        d=google.com; s=arc-20240605;
        b=jK13UStoRhKlMym95f6xGEHgquY57r3n2h7UIVs9ot7Pfqd/4qdbwHGaKqTvMkmVfp
         JIktMz+x2Rve0aVIP2GpFbkp6gw4uySc9wJmTu5NmrlbhLpsK+bda/DCaKpv3icrWWEa
         RJ4Q440Iaqdrvw+95IPTJpX+gCWmKwVuizRue+Ny9DXZCv3Dfg4Bq7vF3JJGLoHXk1Rt
         DSd/EtD7qHXVt8jERpjVjrgw2C3vlwbWXQ9O3pQr6N1q94dsjQLIYuEl4Z4IvhvnIrL+
         MoO8jPJLWiIz6xXQSp9gKyvl5vNkVLL7J/fhMY+CHP5j2V2VtE7v7HOz+LZ+JE6/kCqA
         oUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imZEw5SCLY9qEQ69oWbenh4ppLOBEqp0hlK19phWzpc=;
        fh=kdRwLfhVwWjTqaGP270YZvI23POi1o7H8pBSh8gwyeM=;
        b=NG4bedBJERytyF83OwCcmDa58MvadnclBvCLpc4IGgB1Te36O+ELi3LVLBpBewz4x4
         lGydz83p1QK1R/XcdCQpOMP1W9+j9s4YnSUtMffqTzEbX5cLhezJz9Aaj8x5RXtNr41r
         vTRYjSALSPH1GmwKTx+s46x6Rxg9ku9UkR5QK+giv2KP0CUBz1t7YNlgO6/kIXAiZi84
         bXMlE0RUMypqZof+FHog9PuqX8risSE1XR12kIPqkwQvTqK/qaWkqBSpl6FjYP6uSNSI
         vo445o9dCP7pzGWqjSplhInkQnVKMlPqkYw5Mn4Yv054kqTLSU8DNT2YxaHRxPKZWoCe
         39Gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777481019; x=1778085819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imZEw5SCLY9qEQ69oWbenh4ppLOBEqp0hlK19phWzpc=;
        b=WIXmzyi2hdQ+kCcm99mggA3sETSVZccp8IKH0Nb2lU2npdyAEROClVmGUzXscpfWpf
         J0I4g4Bt0Clmt10ytwS/kKQtqYWG7yD9wmOgzxedfAite2wQRNsBWUen6+hrBxCxF7Hx
         pyu7i+afcqZ/4iHZ4a8N/c7oSJQp2XJOeR+w3wpsCb+1S9X2RJmiNBh3BYAmKLDnpfPF
         hdPlsJvYTFvzh13AgDboBB61dnYMwA5/pYgYBze7JqNTreTQKIYQxsEOE+/pjeLI5Fna
         iiHEaA2/IPv1kU7pIr9MMU4CSmASX8nu/sI54PWP/JK4V7go8TeVwiGsLciB1pfeGJYf
         B50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777481019; x=1778085819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imZEw5SCLY9qEQ69oWbenh4ppLOBEqp0hlK19phWzpc=;
        b=f42nbq17lHzcwcjU89ay4/+2vVtZ0nW90/u8YCsIeolfKh4YmbDfmDrgyzSXWvbw2n
         kn+l7HCalaMo4R+VcGNwDKQyFwN58PfzPNLJjikYu8IQsok13MJI4IwvfrZjSxJcJw8Q
         u7Yx3DBuNFCF/fCaP2am08NamtW1Tb6tUtP/mxM5xn3c4shXZ8JIHzIujnR8XRJav4BP
         ApUDmB2DPXv+1ZdqPqcvexOEwMdN9NceBGfx8CwAyCx2+czRdUzQBU5wJtkUYDd25c+7
         tnVzDlT9s8C1++8d6lrlz5+3oXS8WTL06bOfl4PpW4BMm6yyj5POJ+25GmcALqGqpsGZ
         jusg==
X-Forwarded-Encrypted: i=1; AFNElJ+fb8FvvreWeiZwv3x8EVmHzPnLTf8ErvaAswXz6qbtzRDpAaggrYF75W7QnGUTqkjte58D@lists.linux.dev
X-Gm-Message-State: AOJu0YzBvFLTFbdGykVufZzc7aEtiJku2T02SuifPx0oGlHyMJFipqI9
	sCv77GM58cQx058KSZ/yRDe1kGB/7jd7eG5V9qZpZm2RB1O+IEtk3YhlAtj7CbTwpYzJs9bzkNd
	CPdfJyr3fGN8HJbxlzV4mke3+5qokVZvkQxamyJv/
X-Gm-Gg: AeBDievC4261Od3qJOXGwQjB1TT8uvuRJUD3FnITyGflTZuzrAHt4/5JX2eJyyoC55W
	mkWowG4+6d1j5yXbK/xcln53GHqLZXNYvSuyGiyuZOBQ/ekoVBHDKb1iFt195zpdnw77NXgk3L5
	OhzMUzj/MWSG9BewzDUJn7IN7dPX5TTJDsNSwtN4HfVAKaPZtPFV2t/g1rVodcsNie8vIxRe/HX
	XD7z1pxRL1KnH+kQLpOr6kD/ggTtkt3OKe2Z8DTJ5dj/OM6PTl/mb/YPll6hvV/jynQbeo4xaHs
	LOARNqo1RgVagPYz3y77b6LpYSmpkMKet5DBdz/JY7jpl/+61sbSP5V3G2g=
X-Received: by 2002:a05:622a:1b12:b0:50b:8d3c:5bd7 with SMTP id
 d75a77b69052e-5101a60b0aamr15133791cf.9.1777481018705; Wed, 29 Apr 2026
 09:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-6-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-6-81d9b2e8ee75@kernel.org>
From: Rong Xu <xur@google.com>
Date: Wed, 29 Apr 2026 09:43:25 -0700
X-Gm-Features: AVHnY4Ik3LqgaCUyRYx0CryX47pN-vmu9vi1p76k09ZWMtV3tzrvTc04VbRHK4M
Message-ID: <CAF1bQ=Q9bZHBT13K7OzY9-QHHzm7D1ZZ3fM3M+-oVzdU+G4yhA@mail.gmail.com>
Subject: Re: [PATCH 06/14] arch/Kconfig: Remove tautological condition from AUTOFDO_CLANG
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good to me.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Tue, Apr 28, 2026 at 8:00=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the clang version check in
> CONFIG_AUTOFDO_CLANG can be removed because it is always true.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Rong Xu <xur@google.com>
> Cc: Han Shen <shenhan@google.com>
> ---
>  arch/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 0d34bcafecaa..5d6e9f56210b 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -866,7 +866,7 @@ config ARCH_SUPPORTS_AUTOFDO_CLANG
>  config AUTOFDO_CLANG
>         bool "Enable Clang's AutoFDO build (EXPERIMENTAL)"
>         depends on ARCH_SUPPORTS_AUTOFDO_CLANG
> -       depends on CC_IS_CLANG && CLANG_VERSION >=3D 170000
> +       depends on CC_IS_CLANG
>         help
>           This option enables Clang=E2=80=99s AutoFDO build. When
>           an AutoFDO profile is specified in variable
>
> --
> 2.54.0
>
