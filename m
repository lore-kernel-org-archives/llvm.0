Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA41344021
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 04:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790568755; cv=none; b=hko0JxpHxX14dx9Kqh7vcsbby2KQT9Kf3zMIMwCJ2a9lkIsJY2zRn26e9c5eQpZ8twZrokglU1DqNJRsTxbu2rGeK7S3AkamV4H5qOU0e/nV6NhpTnZyugQgzTbkYYCSe64DXZ+8qZAwAgKaBaGL6uoGNhkRXaCqAjTxkJBbhsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790568755; c=relaxed/simple;
	bh=/sOtv+Jy0VfC/zdAlOtrQTC1fDfCRtKdJKUcnFIpFsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+Vnfym3aMztj/Kq6KRPLIzS6dH9ZiRNuXU8tbep9PC8izyH4UamFd3h1cr45Rky33WAmPnsbIMoAjbqUU4zEYWO72qw3j3FoCzaUtHMBeGGGwc3ZqhhReIGwpKNUK3Ns4mgrBP5vG9sNAbjVhYhhZcnItfMw0IrF6cDYQqnyfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bOolv6g2; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bOolv6g2"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e69so571560a12.0
        for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 21:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790568753; x=1791173553; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXDScwdKbt28kFhjEDV73RhbSo3l7UPBxj8GidcV6Ck=;
        b=bOolv6g2Bz5UsO+xkIeBe5dvnlXBim51h5QxjEjuVuM/lqLtwxh5mwqVcLNZ0m374W
         rie/b5PNH0rskkbvbej74KMW3NwDrY8I/q5wI1zjXGG3Dzkis+F3Rik03PXR6rGALI+x
         CkjZlqkkSIOstw/ujL6uGziiLIrIcNC4lrHzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790568753; x=1791173553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXDScwdKbt28kFhjEDV73RhbSo3l7UPBxj8GidcV6Ck=;
        b=W+ddXDgSNXm8mI51UyiozB46iWETXCtoU5M0obx8iKHVSKMgGRiMPuktOQtahW2uvU
         YPZAX5azWGEPyGA6xJJbSzii9y5PZQy9C6mat5bqIQbIxCu+xkT/RU1Xs1V79coaCLjf
         T4Mih/Zy5WqcC9ywNIRDxxngnY6jio0x72Dd5IIMiucckXLdfaxF8nN0tWrKox/g2GVv
         vZlEMLIefB1Okb38WWgkNN2jwjm+Kt2OKA05BhRacBxKWNX4Ixn4qYqy7FBLKEKjj4Bf
         EuZf04f8yHQ+k78sqjkULZu/s6tE436gEiEZtwgu/2AXquQDgNH0UQBrJY1sjUYFPUJ4
         V7hA==
X-Forwarded-Encrypted: i=1; AKwUvBysj4LiyQXe6e0H/SxsVHBPAmpdZTY/4HuzmQapl0736rilFHdteLLbj3aJNwnqsBts3c2m@lists.linux.dev
X-Gm-Message-State: AFq9FYLO9Q85XIIbr2Ii79MGWAQTnJYUWcwN3bwvmdjcIwo8OEOghbLs
	c5BttpgcHWfep22e9tuds9nlsIxAzSuzSCDM+Fa7Nq0uo9OCQ24t29Qj+2tXH3LOmg==
X-Gm-Gg: AYBFou3xyH/4B0JrT1QJtdFKbnAQrzD1arRE4MMPPNSATUAOC9sU6Tmh0SYgLyjZET8
	nT1eKcAcpNAz+PdjSTkCfFOp9R5ApOELK1RpztJTtb2ZxjIH/tgIxUBAmw+wdiZd2lnwuOJvVF4
	AKMRTpAiMuKsi6NjzURsUz4839UBEDBfn1PFADcdTtoV39CDQQtyrVgrWpu5EQw+WoxIQNF0A1T
	XM0h8s351XkZA6V7hlfjTe4X0Soe93KodvSz59BKyDp0QFCscy8EuvYmUXmLveF6FWaIiH4L4v4
	K2EToWXSZnAVA/iOXFGBud6kh6Wyc3oJRtNokmADkgqoFYuw+O3M0PKQO9HiI4SrjWMOIqSfsA8
	vgNeaPvFOU2xEtwaerHs2z4acu9c5Yqx5fqf445K+rM0oDp6IH92HztmChnRNfYQpC7S611A72Q
	5xgYBtJrvlD48Fy7ECb0Sb0sxUYZrQ2Oq4tpwwlm2I5kXX142vSrWd+XtWnIJhyqlz8dWSnwCBH
	knm2756sSexowUCT28nxQTdT2RlpvFwUPiKifw=
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr10891588a91.59.1790568752817;
        Sun, 27 Sep 2026 21:12:32 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm17381254a91.15.2026.09.27.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:12:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:12:24 +0900
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
	Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Sungguk <sungguk.na@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 1/9] lib/lz4: import upstream LZ4 sources verbatim
Message-ID: <arnosKlQYVIdmTR7@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
 <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> +#ifndef LZ4_FAST_DEC_LOOP
> +#  if defined __i386__ || defined _M_IX86 || defined __x86_64__ || defined _M_X64
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  elif defined(__aarch64__) && defined(__APPLE__)
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  elif defined(__aarch64__) && !defined(__clang__)
> +     /* On non-Apple aarch64, we disable this optimization for clang because
> +      * on certain mobile chipsets, performance is reduced with clang. For
> +      * more information refer to https://github.com/lz4/lz4/pull/707 */
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  else
> +#    define LZ4_FAST_DEC_LOOP 0
> +#  endif
> +#endif

I just checked https://github.com/lz4/lz4/pull/707 and it seems that
LZ4_FAST_DEC_LOOP is enabled on aarch64 now, but we still disable it.
Am I missing something?
