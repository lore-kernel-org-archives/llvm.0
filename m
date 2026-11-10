Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289195;
	b=OZg4eDesSD/BHKjqCb0qMghpMESSiN1f9lTR4MMEt5EDfovyP4wzuvV3x7Bp7X8GmxhP
	 4+uWRza9bQSMRxlEZsQaPCy1TmQc0oEZU/ntZhf+P9IFs4h2XBvkZp/kevbGZ/3BNevqr
	 rtTiv4f9w96ITR0ATZlyAo8C5ROzx7HQ/IhLACBVnt2Da/w940lDYjfyiIEhFiprPBvwF
	 C23l93TBR+yh2BFJmGut0QIMAyo0Z7rF7X1GbAsfKfPFP2fJ2ALQspqNLWPw4Ff5GV/OV
	 OwRiX8QuU+ADKU4X+vWCB7vdKeXkwg9mI7bcs58R52VAkfeGGUeOsncbNIQCJtJtyHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
	b=bnuFuEkv2LzuTWF19A5d6sXL0LV0/AgbNp4BWhZun7Yb3zvT6i9/ohMK3PUQZalYcCS1
	 W7ImyTzO46XGrHd4SHJs41PsGNVRZVSr4T2/vCqi0rEdr+lGXJHcbTUCs7C8ylv+eP8wC
	 F4D8JMzMvchvN+xBD6+sCK9/7taCcLF9aaKYbijhpww8QBBapSJYIVHN9pTxu6fm/JhN3
	 fEzZw/oanohLCJBSCO+1T4d0rpL7WmGyyaPqfBGA67ngAs4bSBCOBlO7qJIInkPK1NUdM
	 sEEih0iomJGmgJpHCwbN3I5c0LGfcUQcxZHGt2zI6ROkA3BcRkmdp1mWZy0lOc1g18A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cLVYVYuu;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEF8606A325
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 05:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEF8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cLVYVYuu
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso846030a91.2
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 21:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289194; x=1794893994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=cLVYVYuuBBXQ2a8BC/RZPap/VVuCBYxB+9+dmH4GcFa7rDdNwk2d+Tt7j067wZknjq
         26ignaWiswoZ1s73g7SdsQtXPV9yGnxKCEzLZxX5wRJCcsE7ODUyLhJvk2K/PHMA3eSz
         uUoBx69dNRYa2prsevBY7G5qpgndcPUZmTDaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289194; x=1794893994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=BTqwWmoN/iyQebvhdOZbo5apyNOnLQrRaYCYz4OB/ew1H/ehAeqPowALibp6AcyjGP
         bj95uT/69Mq+FU4SGLLesJ8l4UTuShszgUZETntdbeqLSxwfx49p30Cqf2W3YqyAjFRr
         5JOTfumt7PqaZUa+zXj8HuunXb4WzX+2yOpc8XXEzWV5pZuzuOdX7VxNw80s9uqWuTt1
         0eIh1oNiYXUC+BLCeKyY730UK/WpqwK46pXI4bglG2wxTWJ3Vevb0+1X7868FLl97m+A
         J9Cd0e7q3kn4EIi1xE0IGWmoOuVBb/HFkgxNEWMQsEQK0LhujZ7N0Tx9zGByjnXnpNfj
         +5sQ==
X-Forwarded-Encrypted: i=1; AL+hErFBeqU/b3NruIxq/M+T/1gUcgKKw3KqBk6SMx4lDIEAzxG5GRWRck/JeABqlMdfRLM1BH+O@lists.linux.dev
X-Gm-Message-State: APuU4Z99nKAFINixNTbpF274MevpLgDWbevwx2CW3/kHjH7wC6jLC2o5
	W5luYQPDfwHPVp0cLkNbl5+H45mEiFuv941ItWs/1U/xQyHK5gElxFXVHiQWEV/6fw==
X-Gm-Gg: AYBFou0S5iFV/ZPX1++peDn7T6RCNNS7iRkhBBxWc8sIYl0bBj7NUt47Nnmijo/olJt
	e5PJWwLYM8TEsooLa4/w01aiIE00WHZarMKWdQioWCZocAwsxS8epGAL09EMsLKO0WP+PjAunKD
	YxqBOHO8Ndc3AGhVEJ2dz3FEYY30s7eATcwxW1ADWxMykm4nqMEzUcO76a1f+o6GtpPtQ3d+5Xm
	UrmnijOArccsn/e0H+avAdyWdJ9kEImwA3uWsjmF+lSMEImJsyhzv3GNAQtn7YE9nV5pG/JBZbT
	2RLjAn3W/6BuUXiq+kSbp/PqPs1x6gleyszQ3XbW2zU7dUrUekgTyyFlafoq6XL5meYbDmoX8l8
	7QRK0jq3hk7a0iGTaO6Nd7Iq3QYWYGeDtgJmAFsdEvaSO9IfyeQn8Dg/GwnkZEd8EhN6crCU8MN
	KYYmHjdNCp9tzYMxuO8dqGHggJ2CSKhI9m24CGG1Oq+W00PmNKTu+kQmSeOnZ242tPdUcG83KML
	9I+zBtUpVaH0iEs/qq8sIFcjAJyKFcTlCN5S4nhOl/DBkWwRyjvtK+PV9dJh8IqkggVRZpNYYdm
	rGEhW8C4AIc/+pIudhZwxwjLrefvC7XRnoUwxBzEFNyOImBUDb8d23sDsWaNW3S17oaJAnwg8KL
	NAxckiumVm4KKxro=
X-Received: by 2002:a17:90b:380f:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b166d02addmr1882552a91.34.1794289194303;
        Mon, 09 Nov 2026 21:39:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168ff86e7sm1041404a91.2.2026.11.09.21.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:39:53 -0800 (PST)
Date: Tue, 10 Nov 2026 14:39:43 +0900
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
Subject: Re: [PATCH v2 13/15] lib/lz4: switch the decompressor to the
 vendored sources
Message-ID: <avKtyCOOmK3AH0xy@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144310eucas1p1d60fe5c2e0170c49f38a3142bb1d8f94@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>
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
In-Reply-To: <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 50265e3ce256490994cb6dae32a45da376e408e0..b9b8a5f678c155442fa3fd2c1984e45182e6fc38 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -84,7 +84,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;
>  
> diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
> index e7ee3740219852f079d1e0866da6b213a3f3a583..1e09c93016264259c149e2913b2819571b56fab6 100644
> --- a/drivers/block/zram/backend_lz4hc.c
> +++ b/drivers/block/zram/backend_lz4hc.c
> @@ -65,7 +65,7 @@ static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;

Ditto, outdated zram code.

My ask would be to not squash zram changes with lz4 changes, when (iff)
possible.
