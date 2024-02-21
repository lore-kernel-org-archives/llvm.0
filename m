Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC641EA8D
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 22:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708554724; cv=none; b=vDGcioum09PpbtCba2yl2xppUX9cFS9L6a96P4pThAQxDtEm5/DAk3CaIRQ3/m+Fy1k6QEaCSKXOPkQcGpOw7TLQiz9siTj9IZxUpCAiT3dOsaF1hEqlL8RIBMRkZD8TrQkChdKmJLy+YCy6Nx2uNqacB0owNKmADdYK15lxxZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708554724; c=relaxed/simple;
	bh=e8beQZH/8dTcH2SlskyquNhTiyiTGjmTdYwL9ADmD5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgYTFUbdFSekEGFlj08wPB/pskhWYQeipp0tjUKsA/YyDHJzcOGI+FWh3DLI5LHjgpN4XmSydiLkbdf/ysKejGj+FU4nNbQQ65uEx2/Mp63riUvc9FL+Z8XnT25eyXY+BCzpw9cGueBDjFNGxRUKw+nU2YF9U2DFZIKje+kvaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dl1znVU8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dl1znVU8"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e471f5f1a5so2230457b3a.1
        for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 14:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708554722; x=1709159522; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwSF+RHtQzi0FDht5gRWAtF1IQMU5qPXVryp4kceArc=;
        b=dl1znVU8zyP/9tqPiGQMUq0D5IlW1LiElaMqfl8mUhP6TjXdQxNPug/JD/6BdsHze5
         BT2AJ/OxGBDv3+7xr9HuK68HGOw6Nu5flLtHqrq8AT1L3cuGD2zCNGi5ZeJm9IyHHg81
         SQ38C+tvNyBjZYjXgXHkA/VuPUyNUWQAThlqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708554722; x=1709159522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwSF+RHtQzi0FDht5gRWAtF1IQMU5qPXVryp4kceArc=;
        b=Gs5IvTJxafP7uZ+8SaDnn8UarGYUVBvglCYtfvi5VUj4ZzkGKGKsvIu42RMyhA/vVI
         w2ldCgrUo4clJ4r5GTtn0bEIZB9Rl6FZXxsNNT4Ew/uitu9AdeRseoAy7T6enJn0OLJy
         yqpFMkiSSHCmtywOEMGdRj/eiwIAAzPCho/QUgItJTwrjx5+nyq76vIpp7u5+mUm7vn8
         nW8wOI0dwy8YPGbXRVknVj/pOBnNmT7/ZjKWRK6jrlGEW5Rd07/2b70qXCR0T4zF7jpD
         fpdDEQVlVl36LftGPmbuOOOWcOfcMWPh+U+rXoXjdiST/LoDL1X6L+JLg7Dtqg01GL87
         OEuw==
X-Forwarded-Encrypted: i=1; AJvYcCXJr4lUH35aPt75r9ywnR4diDT3v9p8BBAOBUi+209BcHLTi1ORRiW4oaPV11Ui5juvfAkLlbA6UEoF59VU1Rb0lFnv4A==
X-Gm-Message-State: AOJu0YyKhHiGBe91wsJzNGdi+TS3OItZQ10cstR47sieP1eAkyRgZIqy
	bln/rbyu49hUUeIvpYvF7rslbajZ4/wHbwPbEeqJSkqH7n63DIqPJA2WTDccqg==
X-Google-Smtp-Source: AGHT+IHRmg+Wo0dAlYaTnjM+LFEy1m1wh/Bq5UQjRL3JwQIIceR9LfrEx3PAPsdmBFeTyj7ADIPXVA==
X-Received: by 2002:a05:6a21:1394:b0:1a0:aa34:8733 with SMTP id oa20-20020a056a21139400b001a0aa348733mr8310173pzb.17.1708554722256;
        Wed, 21 Feb 2024 14:32:02 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q69-20020a17090a17cb00b0029954a48c38sm10780321pja.38.2024.02.21.14.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 14:32:01 -0800 (PST)
Date: Wed, 21 Feb 2024 14:32:01 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, morbo@google.com, justinstitt@google.com,
	netdev@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH net] xfrm: Avoid clang fortify warning in
 copy_to_user_tmpl()
Message-ID: <202402211431.ECE9690@keescook>
References: <20240221-xfrm-avoid-clang-fortify-warning-copy_to_user_tmpl-v1-1-254a788ab8ba@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221-xfrm-avoid-clang-fortify-warning-copy_to_user_tmpl-v1-1-254a788ab8ba@kernel.org>

On Wed, Feb 21, 2024 at 02:46:21PM -0700, Nathan Chancellor wrote:
> After a couple recent changes in LLVM, there is a warning (or error with
> CONFIG_WERROR=y or W=e) from the compile time fortify source routines,
> specifically the memset() in copy_to_user_tmpl().
> 
>   In file included from net/xfrm/xfrm_user.c:14:
>   ...
>   include/linux/fortify-string.h:438:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
>     438 |                         __write_overflow_field(p_size_field, size);
>         |                         ^
>   1 error generated.
> 
> While ->xfrm_nr has been validated against XFRM_MAX_DEPTH when its value
> is first assigned in copy_templates() by calling validate_tmpl() first
> (so there should not be any issue in practice), LLVM/clang cannot really
> deduce that across the boundaries of these functions. Without that
> knowledge, it cannot assume that the loop stops before i is greater than
> XFRM_MAX_DEPTH, which would indeed result a stack buffer overflow in the
> memset().
> 
> To make the bounds of ->xfrm_nr clear to the compiler and add additional
> defense in case copy_to_user_tmpl() is ever used in a path where
> ->xfrm_nr has not been properly validated against XFRM_MAX_DEPTH first,
> add an explicit bound check and early return, which clears up the
> warning.
> 
> Cc: stable@vger.kernel.org
> Link: https://github.com/ClangBuiltLinux/linux/issues/1985
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

This seems reasonable to me. Thanks for chasing all this down!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  net/xfrm/xfrm_user.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
> index f037be190bae..912c1189ba41 100644
> --- a/net/xfrm/xfrm_user.c
> +++ b/net/xfrm/xfrm_user.c
> @@ -2017,6 +2017,9 @@ static int copy_to_user_tmpl(struct xfrm_policy *xp, struct sk_buff *skb)
>  	if (xp->xfrm_nr == 0)
>  		return 0;
>  
> +	if (xp->xfrm_nr > XFRM_MAX_DEPTH)
> +		return -ENOBUFS;
> +
>  	for (i = 0; i < xp->xfrm_nr; i++) {
>  		struct xfrm_user_tmpl *up = &vec[i];
>  		struct xfrm_tmpl *kp = &xp->xfrm_vec[i];
> 
> ---
> base-commit: 14dec56fdd4c70a0ebe40077368e367421ea6fef
> change-id: 20240221-xfrm-avoid-clang-fortify-warning-copy_to_user_tmpl-40cb10b003e3
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

-- 
Kees Cook
