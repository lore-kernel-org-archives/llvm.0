Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD7A3546ED
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002309; cv=none; b=nUMggOSMmGZ7e8hOHER2jRI9SPR4TCJEWu9KFQJgg6tOSOVEARZWO7L0PV6+TAhXEnnHUWOG12brOR2Z0fnelim0s7FxgupGwPAWHw6ECHzSQoZ0PNv7iqsas9NAPZAGefW9TSOJkLEE0wbdoF3lfzmM6kEOfgSSWuzcURU981Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002309; c=relaxed/simple;
	bh=tk1c7rnwuBHS2uRZ5SwD0NGJn2M8Eb6GDVhRgrEKGj0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pkdSjzX3yNPT0lrL0BHCq0VRNlO0p3VNHOhJxteAjMtFkYzYKf+zK1x11mts6XdT5oHv4sEd2WyAVCvBGuWZEHX6UAuu66tvYNn+EGsx2XcQVx3pNy9ZIZbet3J/kdvZV/dKo4Dk3ynfI9kqzUk1nGYait/FRYrYuZJty8h3Q20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5BoG9+t; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5BoG9+t"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so75667625e9.2
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780002307; x=1780607107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4mg5HNDrZSCCvclWVXl2PaKa8JuKCMeM5HAnfez5H0=;
        b=a5BoG9+t3HwA8mSJqVeOXgTGjz17mM/cGhUS2lQjmtM0DM1XXqgWobQIOJ+dIDbWN0
         /P+mtjAVly0LdCQ0mFTu2yOKH2zcj3DeY7qU9iF15N3hKtCfN5LmrnfjJLqC31/FlCbY
         e98YdhuWHeWhZYCmVDPWzTfTUH2Jph6ElStEJE5fmmydj2mmtLjcVg00GFtdETt+nhBn
         4168mbnz8NPiSw05RyHy3RTcrRIBBkr9Knfky526ROGEkWLoKzkXQBi5glsNE0qBo1K0
         RatIoe3+NXBSMzY6cDp5+cvvEFODcKIz/3eMNqeFlSSM+SSl/HH8h7osIjx7KAumA4ok
         EdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780002307; x=1780607107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4mg5HNDrZSCCvclWVXl2PaKa8JuKCMeM5HAnfez5H0=;
        b=EzZl0/oqJF2wt/MHfH4Kr0SlUqyNnVJSuxLPqDahGfbzcZki8LlFT6TSJsLpMVJqHa
         fJBGVqh8/gDqwJ6t90LSCqlGe0PA74s/fdD6RRc8j8U+z3gotD8EZqx7Vq/V/wulcG0T
         BP8PxgGN+r/V/CGkWJxJ8bWsksfBqD+jBXsMGEVUSeROry1k3L4OZ00gvVuH061MTZq3
         bfXYas9uVAl1GKics5LFHipyIq0JdTpowsGskDCIZXrZRlWFlLh1FmyQLc61XZUvtGkg
         2SwWYKdupVkRTE6Kr4h8FVT6w0/7YacK3eE8STPxI65na9CEgI/4k4FE8TS+571xDsL/
         fOEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EgXU/5Zoexit6tOwX5dhWPTaKQaYKA1pUekw8ctdHxOtVs89H71NmHpYK/VubQP+EcIyo@lists.linux.dev
X-Gm-Message-State: AOJu0YyWAMviCZJiB7AMrffs4UAD/9jTXDH0KZVXgK07kbPbzv+001bv
	VuzBfcHH8XydB6axPUzREiUOa596Q1hyAQzdHAwrUwAgbTGKbQPLnrEq
X-Gm-Gg: Acq92OEvbN43GpuWv9/Fe+DZMvZzvNa5Hlm579Zap30KaL2ToJzsj8jQ7fGl74tvy/S
	zZFeNiywqAQGBuknQL2bupYDOnAq9Azxz70tsH5hkuE3TvzCI45C0u7Ql4RzPe24i27Gg8jRMqK
	t0XIbTJe1rwqdFhRWa15LhC3oe7cPGBdC2uWQJYysXzV/aMwMwaZ9uuh5Ooh2+jO/+IKFjHQOGM
	v7jgh0P6jFnx7kStaNgmRftd2H5kyzSoLv5XPzugYwod6nFeLjQdsElSwtzC1fIWGqCt/IFFv7f
	icl0I+FEYHDguNU8Na8v4co69MszYoaCkxdn9vJzUsptBNg2IG18NJuBsAY2dqoEJX0bc7r5w/N
	vudaxusIV9OeqpZjeuh+/CtE8+4uAy3VNokvAkAlnn7825+xOdeAFQWtkWWZanoNCuhb6ZcDkfv
	VdCI2ZqP74/G4hUFzeZ1Y80gOOOn5+T28Cz6yn5h9yHvb7p6cVO+S4SIJ58ZDwewXnJNf7L5k=
X-Received: by 2002:a05:600c:c059:20b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-4909c0e421emr1387775e9.22.1780002306931;
        Thu, 28 May 2026 14:05:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092654e10sm56452765e9.7.2026.05.28.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:05:06 -0700 (PDT)
Date: Thu, 28 May 2026 22:05:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-block@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Jens Axboe <axboe@kernel.dk>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, ceph-devel@vger.kernel.org (open list:RADOS
 BLOCK DEVICE (RBD)), linux-kernel@vger.kernel.org (open list),
 llvm@lists.linux.dev (open list:CLANG/LLVM BUILD
 SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: Re: [PATCH] rbd: cast snap_count to size_t to avoid tautological
 comparison warning
Message-ID: <20260528220505.73eac71a@pumpkin>
In-Reply-To: <20260528202151.136274-1-rosenp@gmail.com>
References: <20260528202151.136274-1-rosenp@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 May 2026 13:21:51 -0700
Rosen Penev <rosenp@gmail.com> wrote:

> snap_count is u32 but the comparison is against a SIZE_MAX-derived value
> (~2^61 on 64-bit), which clang flags as always false with
> -Wtautological-constant-out-of-range-compare. Cast to size_t so the
> comparison is done in the correct width.

If that warning makes any sense then the cast shouldn't make any difference.

Why not check against RBD_MAX_SNAP_COUNT - the buffer isn't big enough
to hold any more than that.

-- David

> 
> Assisted-by: Opencode:Big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/block/rbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index 94709466ad19..b4ba51db9a28 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -6079,7 +6079,7 @@ static int rbd_dev_v2_snap_context(struct rbd_device *rbd_dev,
>  	 * make sure the computed size of the snapshot context we
>  	 * allocate is representable in a size_t.
>  	 */
> -	if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
> +	if ((size_t)snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
>  				 / sizeof (u64)) {
>  		ret = -EINVAL;
>  		goto out;

