Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AB22F1FD0
	for <llvm@lists.linux.dev>; Sat, 30 May 2026 01:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780105451; cv=none; b=tCIkOzuGzHV3sS3VGRm0mHofVcXZA4Qwkqpy/AQ0znK3Ozg1ZHZKALG/1kMYmHv1c+1/F/b0bUlioLYHmqREMx+CH9EW1Yk2kHykgtWGD5As7p54bT8HFZebsnEC5D0QGOJ8kqLROUhGIfLztOhBo0h36aw0Xg2ZgFskJUClFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780105451; c=relaxed/simple;
	bh=RoQnkjSAGQlltUOHi6qTBWzLW/MPRpTjVtIir1Bku8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhzwobvNmar14FXrFiLxNFT4iI0x/9FVwNdRZyKT2n4DF/NLfjL9S0Sqod2iZXaL0bYCLR9+ZsbDmy6XYK0r4XauYsNEIKyzPPEg1eqRVfWoZHYIAo9LA3XZ4vZvR0pIbQHf5ZLapQCukxbEJlqpR6jbEn3rCEChcam66PBuAk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=J3/+/BZC; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="J3/+/BZC"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e6201aeb2aso6693744a34.3
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 18:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1780105449; x=1780710249; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+zTIztgsGKEhgjsVhvr5Rv5TrBYFcWsdOmt+WZ+x9w=;
        b=J3/+/BZCGQDQYk/EIBRkfMvpkE/gumgMvc7Zym0q8seJBSjnar73oNQYIQUYyg6fg9
         oOtturFKS9pKm+cPGngcurerBMwVBr3GUt9Sia1GDpMPdyG2GKETzGKvre6r9ezXPbZs
         RhRAaj/HQm776QBRTWaWA9Sq3B1uRltRP4w5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780105449; x=1780710249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+zTIztgsGKEhgjsVhvr5Rv5TrBYFcWsdOmt+WZ+x9w=;
        b=rT/9IhVDmGMLv43uscCZy6zmH2TUX9ftEBSvuR7QUPtrL/VWXsjElhO+k4+Y4lTCq7
         WXrVltHEfD3XfbT4AIdEkvEXdiasG4Xq6DQV3aV132T1baAu6w0Gp25QDZhFKenaE/Ko
         ByRdjbOcpjxXivmT9j5SjtUiJG379jarfTDFCBpyKvvgmWlSOXKzPHM8Zy2VdUNRqQZ1
         yZKEPVgbTLnXXqMvcTr6jPy7839vdHzQ9MAPhHueyqsKbzoyZwKzRkZcBF6PCIQHNQzF
         K8OJiR9XayfM2h7eBAiL+IlZHbEM5fxNtqsC/HDflN+rBaeJK8vIsPsXgETxFknuR8wF
         r8oQ==
X-Forwarded-Encrypted: i=1; AFNElJ87SgYQZsjeiFFnxXuEnOha6KKnI4bDYM2IweG9+Fyuqo4BWzy+0gFu45/y3xWr4zNE6y71@lists.linux.dev
X-Gm-Message-State: AOJu0YyG+IRpC1ADAKS7vk9v5qme1qPEauzyKsxDyesqpazA18ReYBvm
	y6j8Z6TMtAvHGiZh4jhUiMMC4+nCLxHLDNBuq6Ge/zQKW4zAD5fY7v7o4YoegwUQJA==
X-Gm-Gg: Acq92OEZXsLNjsKFZxF/2csll+XH7MFBHvzr+Lo6jwVGBmrVqFApULRM1Mh9uzdS+pD
	6r96NoHfu3udKVbklBoILB+JxqQALgHZNcHSolhy6MABAJFxIijh+1JbeW1oLhrilrQk38kPlCM
	BwRPrQpyQq0mYEfVRwsV834msl4SL+NjqZFB7wdsRYOiQOYJfqE4IiofC1H7jNbyek8d4ZaoNyA
	7cdggHbLzDHe3ub0OBTmACax6iJ6ZMrfW6ZJ2xrzfWlui7aK/pc4+wciUlg/6Yp6/s9eAKA5Pat
	7kHp158leUIMcd2vd4bxH+E3y+MUd+knLxVIA96EIxhRELKwqEgPpxZvAdAe8CdvfZh2gkDGJm2
	RO3AUDWElaky+o3VKYv7IvZojjUrW4IgwtUCbabYBhHpwNNis8Wad/yAB03WkWlHoV4+g0f7awt
	UJy5ZrBtXYvnG35ZHX8yC0jE6DoFAq
X-Received: by 2002:a05:6820:1996:b0:69d:795a:5e8b with SMTP id 006d021491bc7-69e105d4115mr948538eaf.60.1780105448859;
        Fri, 29 May 2026 18:44:08 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-43c94078170sm2262599fac.14.2026.05.29.18.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 18:44:08 -0700 (PDT)
Message-ID: <284d5062-460e-496c-b700-2275deb7f8bb@ieee.org>
Date: Fri, 29 May 2026 20:44:06 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rbd: check snap_count against RBD_MAX_SNAP_COUNT
To: Rosen Penev <rosenp@gmail.com>, linux-block@vger.kernel.org
Cc: Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Jens Axboe <axboe@kernel.dk>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "open list:RADOS BLOCK DEVICE (RBD)" <ceph-devel@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <20260530011255.52916-1-rosenp@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260530011255.52916-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/26 8:12 PM, Rosen Penev wrote:
> snap_count is u32 but the comparison is against a SIZE_MAX-derived value
> (~2^61 on 64-bit), which clang flags as always false with
> -Wtautological-constant-out-of-range-compare.
> 
> The proper check here should be that snap_count does not go over
> RBD_MAX_SNAP_COUNT.
> 
> Assisted-by: Opencode:Big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/block/rbd.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index 94709466ad19..25215c209484 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -6075,12 +6075,9 @@ static int rbd_dev_v2_snap_context(struct rbd_device *rbd_dev,
>   
>   	/*
>   	 * Make sure the reported number of snapshot ids wouldn't go
> -	 * beyond the end of our buffer.  But before checking that,
> -	 * make sure the computed size of the snapshot context we
> -	 * allocate is representable in a size_t.
> +	 * beyond the end of our buffer.
>   	 */
> -	if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
> -				 / sizeof (u64)) {
> +	if (snap_count > RBD_MAX_SNAP_COUNT) {
>   		ret = -EINVAL;
>   		goto out;
>   	}

