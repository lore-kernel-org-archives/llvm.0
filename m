Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289020;
	b=PqcKF9N+jAV6d9Uv6YUb25JmRm24TTL8xvtyol0FOcfF5eQzgynXb3u5DO7xVdp8POVI
	 Mgn8PJmuNw74UgDo2jI1jwIDYGiope6Q6UYeK9RF2OenirRXUg8KEM9+HKmGCm9j67Egh
	 aqGD/QNkVdrt6a1AFDFiItWyBB3HQY98WcL6YZZwUpxu14PqnFYGv5w+1ZIQq428jpbT+
	 eI0b7HY6OunhTkPINizyYF+jz8adxZwgCHYdNdYGii9RJB2d//NZbXknzw8HeaVJpDggw
	 myIetS0XsAqyraJKXamB2DwnlHS/X/cQI4hFkQIQdUCMqNaf7NEYndvTsYCLGSAz/Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
	b=wKZVu9ZoFgezIIt58VFz0gEUd4Qnq8tTtqV+f4seq5C0aDHHQBXYjmrVRXYzphzfEwXl
	 o7U4PglpWlSRSgqDvc8Ic6jOiKH0fow/pyOhzw5L+mtcY6Tm/uRSzw0fqyghD+oYLLq3o
	 EoQZqm9sc6wcJhlQyYY7BQx/v/rNVa9UTQbDcyKQ0YBdNZYidi1z6Cb1H/6dqJf/07DDV
	 rPMOPFtG320fcpHTyQtiXDFsq6f95F7q+Mo56d9x3R3pygvQcqG06Ql7mbcd+Mp/q5GTE
	 J56uYtS/Lg9T+kZliXQECCmDnkhAZ50XkKLua4HL1yU14R5EbT/EkRg0l46RzLQw/vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PFtXr768;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDF760A2624
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDF760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PFtXr768
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so684604b3a.2
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 21:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289019; x=1794893819; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=PFtXr7683OS6zZ1h8aSn1PCVSshc/4ZI8TO4bphhI3UcTT4h6cY7+8Wj0WwbeGzFVt
         eSsWkkCF45Azml8bYCziK8XDiBk9ciBPYi/NRn4E9q/gaPM5XqWEL7jz77++fSOscFct
         6N8lD3+J0bjsfA39GsiFPtRXsvIIMapvOO8qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289019; x=1794893819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=hZ44ZNDWwvebbUqjNc08et3+k+NStbTaH9uF6f6ncyN2yz0w/DUzX0pFVL+Ub4Nkdh
         YfwksD1TtBVF8qOoDqIH+x5Q8iI+pl/2PdzI92JWep9cnW/nxcLK3HBgDOtTdAQUVHrx
         78yaZK6KMU5oEyywtU4Bzixp4vLEYqwzf8oMTb2KGVrDRTiLgo9xkj/7gsypSTPlFWMj
         st7kHn5IzVVsMes1f8gZV35p7wWwv5wkd7NyYuwS7Lly8jZQasTOMMLkMxhBcnBVo08L
         I4xtZBccH6p/GBZ7kjgL8IQmN4Z7blcXwY+/awDtmQ/gtfdiY2IR8dzGIukaOg5erMYE
         uFAw==
X-Forwarded-Encrypted: i=1; AL+hErFN3l4nurHcdEImYM+BAg3sS7kxY4JnMoqBYpXLKgaKkOJOGUPTfhh4sv4dgBsd/me18BXC@lists.linux.dev
X-Gm-Message-State: APuU4Z9WKGDZTmwPkiXaaq56xWnWbmSV7HatRe/0NrFf6L7IOfHiOYr8
	7i2BKfMac+jRZwVeAztm93wkS/B1CZgdIlWuN9yx2zmImy3wNZPUugAozJ99SFGebQ==
X-Gm-Gg: AYBFou3PniGznSAaXQWjlrmRe5jjSHV3CC6zpMe/8fhwkUsYU59JBbWteAfTstNAkD2
	IK8zPdlCLRzrbhqFxlwobYMh4TJzjWTLiozR/mCHnspLp34rJHVOcadhy2mJj77dHQsJTRLZbIi
	2ytEfDwID3B0KI+Mwtr/4ROLRaB4BKUnDia5pq55ob1IsDADXAMrAejZ/UczEiruyMoPFgjxx6V
	tGxaut4cZfJdo9Z/5QHIIuPCoqBMLRzqkpGCtS+4yb9Pe2XJLp4CoNfOu0flnfRPhv72WANbfte
	2uckKTkm1xnwh7xDVm7qfGP/Pw3HCGd40UUVSKLFEgUWv0lW6mXO80ibhvlRQMAICrDhp29d82Q
	BWbzti75UGMEb0l5675kW4LP98X3KKp7dsAep/bio1mUa+ckB9cZ8EI3g679O56L6OPgyxZQvIg
	7ZLFz7/mEyrylbmB4VXdDr/Z5XD91ZLK9QuidnrVaVo54lLrhbaiSPBr+gm++r1deo+mNiUJOvv
	V2+HgewyqRTdV+3LATKFO8Hy6NRs4OTnY6m3Cj1cV+Qmz2J1/+z1kKtZstrHcMIEoP4qEmw+Q7b
	lsNysZ4YWhxFYoKy5e2u8jEicSron+s8ITJEHjrvFckANmBEq821UN14dV5RObAo6YYIOA==
X-Received: by 2002:a05:6a00:1492:b0:89f:5c84:46ec with SMTP id d2e1a72fcca58-8ba89661da0mr1558178b3a.40.1794289019108;
        Mon, 09 Nov 2026 21:36:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dccc7sm405355b3a.52.2026.11.09.21.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:36:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:36:48 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Laight <david.laight.linux@gmail.com>, 
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored
 sources
Message-ID: <avKs4_S7r6EiUVgC@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144305eucas1p17b3b27d403dc7d13b85cdd9a4bea83b9@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
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
In-Reply-To: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 1e4ad31d39a63f45b3bddd3d8a467d8d7d095beb..50265e3ce256490994cb6dae32a45da376e408e0 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -42,7 +42,7 @@ static int lz4_setup_params(struct zcomp_params *params)
>  	if (!params->dict || !params->dict_sz)
>  		return 0;
>  
> -	dict_stream = kzalloc_obj(*dict_stream);
> +	dict_stream = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  	if (!dict_stream)
>  		return -ENOMEM;
>  
> @@ -88,7 +88,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->dstrm)
>  			goto error;
>  
> -		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
> +		zctx->cstrm = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  		if (!zctx->cstrm)
>  			goto error;
>  	}
> @@ -112,7 +112,7 @@ static int lz4_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
>  					zctx->mem);
>  	} else {
>  		/* Cstrm needs to be reset */
> -		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
> +		memcpy(zctx->cstrm, params->drv_data, LZ4_MEM_COMPRESS);
>  		ret = LZ4_compress_fast_continue(zctx->cstrm, req->src,
>  						 req->dst, req->src_len,
>  						 req->dst_len, params->level);

The zram code here is outdated, it has been reworked quite a bit
(patches are in linux-next and Andrew's trees).
