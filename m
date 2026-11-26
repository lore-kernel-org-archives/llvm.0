Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715521;
	b=KnpQyKlb2tDdf8J78d51F/RP1o7cTHqyWEX0bq1wgXNIkGwNkgEIUZl8+j+wTglPIpyj
	 qNVq+vZFYchRHU84UUwRdibOaSlIbXUbyZz6Hnpkwk2TUpyTpd8dXtXS9swt6LfZiLh+4
	 om0EB/t1TGGMwuD7vuv8Qd4/uNf1xe7euVaKUbIkG5dQt/t6TM1v/NQNnsaJiXpxUbKSM
	 0q/V7JSJBloAkQOQFV+lI3LOYu1Be8tLuSj7fgoCqlQjbeCi2TNBFxJEZiLuF7/uKJ6z1
	 Nx5pXoqf/SM4GcnsJxxylSEZIAgXqe4/UTX4oEe3sshnLOW6P0NrN992N8nTCOyO2lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
	b=AsbEzpdSwPVf/Pnmdcae8aH47p8rParUSauD1dy1vd4cUxDWgzrplgVmveMkz5ILdN/z
	 2Y2hogLAcwv2G/s9LxF8fMktoH/YMSje0P3qxXBySVnl1gnreUgK61smufeQXNgUQmjpR
	 hYAHA2+HNZaCz7t76NkshsEx/yE1usgjqsFJdZKa0zfFYcDYUTeKDzNcKd+VY0Zds4Roq
	 upOSZ/FXLh+gSMRb9oEuBweXcg0YxvI2eLwDKFOU4/+qEODA8DoXnnipBRluHSSRN9+AT
	 dq6x/ILhy2/viytfXtgxBXxm6gR2Wo2lIXNpMZw+gHqBmTBRFxDIocbXyI7D2VxB4jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zXCoLNZz;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109A3606A31C
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 17:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zXCoLNZz
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02f04a426so58730385ad.1
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 09:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795715520; x=1796320320; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
        b=zXCoLNZz+sfvrxQrlz+O2MBPmZCPD330Vx3QvBBoBp+Ja/qDr9V+fvEhqFWUtz4qNC
         A7FDu7lNfe5nqoYY2GGcaqqM5qNc08K40tx/sR3g0Fl0NEG+LE7hdpZPADBqgV7qfFtH
         uLA2iLQ87YTdhON1hdGSX856DlQ6pmYY9MBpJgmRb1N6GyT+SdOayFPvJvW9SqwzXOR3
         +OK+aq48ES+PZ+AXtTnJs9XGlRaXAm8QKFaQ+jQYX2OHxVGkTjRsoxoUhlW/2AUfJHvf
         hvJOu8cED/3mwRPKvRmCqm/Rdnr+G5E5iekLqdCiVkardl03uWV5VSPrdy7kGcJBejAC
         y6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715520; x=1796320320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
        b=QSro73EyOU4MHGHJrABXAhpBEU2CIl5e39Z/sjf7KfjcaCKb2b8QZDl49JJIcPbBdt
         jAqHjCEOrP8GFC1FjkdC2/JtbQ4gx85y+7i/3T8nsr5bFElpxxVbbUO6jO592m96VzLH
         RFbZ1LJYrILyNtRsF6nCRveCKuqLnadD696Zbw5AiI6ItbEmtt4UDSYxgYMn0uhTp9v3
         S3DvFEcudaOr+hwEbVeVyte+8uf+2BkWtfze+TYMnEHnXe+6Y5AdBqDcfDF9bpnz4F6T
         Kv2zUJ6+t5a2hzyr+bmF1g9IMAJZm4gXdwJQvDJRyS1CX0mzwB1jNodtB6cqOlEPrL8u
         RXng==
X-Forwarded-Encrypted: i=1; AL+hErF0/hbp5rA+Vxc+jqYs26F85gn/KhFjUw7VLHMa9j+PoKhmJIxraq7dp41hoAA8ipH5OAFx@lists.linux.dev
X-Gm-Message-State: APuU4Z9pkWVkXAruZkv0xnCxAjHNUah4PQAYPlrH6z42HqBvp7CChetS
	ScbqtLmJ3lPeN9BFVk4UKlZsyVb4duYZVPgm6K97iR6FbQCsfL2QVM9Vz6oNnUjg/e2e1MBWJkT
	aBP8C
X-Gm-Gg: AZFdTZeP3ugOFirOey3rRj1Y0S7gzJtPuKNbjUf7aWy2UUjRle2ZPQQ/QYF1UAGqI3u
	W+vdzHToxqdpC8UfRdiP2w+7agDFCG9myKbbdQ0aZvaJRJ6RmWV8PEr75tORLmLErSY/jkAHbLa
	m21dLRpF52xy1tsIvEMN7eh6r8kS97d+u3zSp3tenrZ2a1wH0HkKXNf4gbjw0FKmAc0e/UCGPDf
	7f6yzBC79/dLUaZU5MI1Oz5nkJTRNwGIOMhb1CJ3m6mPHFlOUCHUUspxEvDa94WNYWGuPktrErt
	b6IHodz12oC/oGL1yp+PLpmnYc5fEPH5YYXpWfhkPLHkW7Z4XEYoD88MKke/VuiKlJQWvU6Ox/K
	0JGOHD4jtipet0FHRv1bbAktG0viKiiGTpQngJ1hn/b+4gj3JxS1pYCRzK7HoqV5nkc07HJCcRv
	oxLB6pBOL1VznurwTtwvyG4ntZV3Lqlr5P+16/Q3MWuHVQmgae/T1Afnb3/V91RmgLYX3LpzAgL
	uMx0fybDVDGtH8GBD1DsCuoB+AHaTM+ZnWDaelQbcWOH+4Co7My+54IwaspXrhKusRdeE1jH1Uj
	83jlXWdkuQzgIv5l6DhDhCMV9jAKrnoO
X-Received: by 2002:a17:902:f603:b0:2e9:4f7b:affd with SMTP id d9443c01a7336-2f03efb00ddmr238487665ad.6.1795715520260;
        Thu, 26 Nov 2026 09:52:00 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ce00:143c:88b9:bd58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm76723865ad.68.2026.11.26.09.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:51:59 -0800 (PST)
Date: Thu, 26 Nov 2026 11:51:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ian Rogers <irogers@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] remoteproc: core: Format firmware carveout rsc->name
 with %.*s
Message-ID: <awhxvZtW_VCOpdfV@p14s>
References: <20261119170505.1515029-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119170505.1515029-1-irogers@google.com>

On Thu, Nov 19, 2026 at 09:05:05AM -0800, Ian Rogers wrote:
> In rproc_handle_carveout(), rsc->name is a 32-byte u8 array inside the
> firmware resource table. It is passed directly as the printf format string
> to both rproc_find_carveout_by_name() and rproc_mem_entry_init() (which
> call vsnprintf() with zero varargs), and printed via "%s" in dev_dbg()
> without verifying NUL termination within sizeof(rsc->name). A malformed or
> corrupt firmware resource table containing '%' specifiers or lacking a NUL
> byte in rsc->name can trigger out-of-bounds reads or invalid vararg stack
> accesses.
> 
> Pass "%.*s" bounded by (int)sizeof(rsc->name) at all three sites in
> rproc_handle_carveout().
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wformat-security enabled; fix and changelog drafted with an AI coding
> assistant. Verified with an ASan/UBSan C test and build-tested under
> LLVM=1 W=1 and -Wformat-security; not runtime-tested with remoteproc
> firmware images.
> 
> Fixes: 72029c901a02 ("remoteproc: add helper function to allocate and init rproc_mem_entry struct")
> Fixes: ffa5f9c84810 ("remoteproc: modify rproc_handle_carveout to support pre-registered region")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 23f8539a99bd..1b1743093edc 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -837,14 +837,17 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  		return -EINVAL;
>  	}
>  
> -	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
> -		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
> +	dev_dbg(dev, "carveout rsc: name: %.*s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
> +		(int)sizeof(rsc->name), rsc->name, rsc->da, rsc->pa, rsc->len,
> +		rsc->flags);
>  
>  	/*
>  	 * Check carveout rsc already part of a registered carveout,
>  	 * Search by name, then check the da and length
>  	 */
> -	carveout = rproc_find_carveout_by_name(rproc, rsc->name);
> +	carveout = rproc_find_carveout_by_name(rproc, "%.*s",
> +					       (int)sizeof(rsc->name),
> +					       rsc->name);
>  
>  	if (carveout) {
>  		if (carveout->rsc_offset != FW_RSC_ADDR_ANY) {
> @@ -866,7 +869,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	/* Register carveout in list */
>  	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
>  					rproc_alloc_carveout,
> -					rproc_release_carveout, rsc->name);
> +					rproc_release_carveout, "%.*s",
> +					(int)sizeof(rsc->name), rsc->name);
>  	if (!carveout) {
>  		dev_err(dev, "Can't allocate memory entry structure\n");
>  		return -ENOMEM;
> -- 
> 2.56.1.708.g77570a6a1d-goog
> 
