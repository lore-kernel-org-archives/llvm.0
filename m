Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17012369D47
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572753; cv=none; b=nBilliDx9cgWY4n43kQSfFQU8OeE1eJzgkG7y8EDVueFL4lHhqOAxvwppQzG5Oek5zC9A05/TtGnPsrZclG0cfv4m/BYAizcylOWTT8LZgRMRbOKD/I2MFFfLO2+eArc8CmvPipSjdbEVvjYgm4kvhvgpt3iV9wHDZoh6FVqtlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572753; c=relaxed/simple;
	bh=If6eyZW189bAWCED7HJ77WUzjEmoh3HbC+AtCUG98As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsR7h4Sxhm0JjuOLnKPMjRX1PDMNt4hWnsM1n7erldWEbU899n/jJVXiALRl64xINcgJ3P+qvapmCnRMqG8X9I3NyR0wVHkJGPaOl5N+q7nulHriDe83VQhZ9JesQzkjs7qvH3gccD5fsz4gS7WPePUVepmWWQSypdTFxxp0IXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HvQQ0R5X; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HvQQ0R5X"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b6200eb0so1932490a91.2
        for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 22:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790572751; x=1791177551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aE4CNeMPjoyGqhac0qEjC0MrhT1ea2sjSdxYtuXCv0E=;
        b=HvQQ0R5XmDVjo4lMLFHMlUULE5ePieeOEnks7BKRY16LrUtEWSAaQ+9vkiRa4qd/Kp
         zdwKROmRbrqtVfclE/B4etHykbd82W8v3PSr333Y6245C1x/aC6xfCB50PHfv+cZQy6X
         WjiHvVac0xKHbzli83ltnlGutqyZhvI7BZRaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790572751; x=1791177551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aE4CNeMPjoyGqhac0qEjC0MrhT1ea2sjSdxYtuXCv0E=;
        b=UE4RS/n2jqzngQY4IAGB31ld7Bc35dEgKYedIXK5Hh5/KM8fYV8nYplvznwCueCYwe
         ucfYdemeX6Gw63PLdedIN9iDFtsffGFC+MP4nylMBXxgFmEUbGQl8ZJPk8zvZNy4PICp
         6+hFZnUAZZ3DnNYGfcoOWMKVCkdMht/6uFXoh4/W+nlhrEY9YbePVH7oQH/XjsHS/18f
         I1MYqcIW0HN4D2W9VnCk+97mkb5SnSM3QTXqb++7WVW4I9xp5HKHhi0QRyE+2F4NaLa1
         hwriTxtRpcs4nTJCWruirxc0bCAHJ9Pr4BI2Fr3ItOPz/CnBfn9bH0rHq43qZCqsbX79
         U2RQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWeN3HiIXk6qR23xvtl6dNzUhJITEq9DMMrfswBkqkVoO1LApP7o/26yKh7xmfVgX+P6eK@lists.linux.dev
X-Gm-Message-State: AFq9FYIoX576cSqh2lfaECeVsDiDJZOyqHt8bnabnouyTRMALxfVz8bQ
	QEnfkMO3NOTpVj8JyK0sGs878aUzmICECDIiBklxRTJckSNi+jwiq2d8rKcK4U1YaQ==
X-Gm-Gg: AYBFou154Oo/o+hrXBPkmmC2oOJbwMX7cVgImz4EWyNLTEbNmp3SbVOrNsO9ez1DdkF
	oacZgIZml4viXou9FzdSUKEzieiM/S3xSgUxEpEcr/uE8ZTC9vqGQLWalWblu9p+IP7H+J/9uFH
	6scStN5Tq65yr7x+BrPf4hoqUG4o25+8SwPaTIfpB/lWcJ5L86E9YJDnCHkJFGXVnMV7dmI0jup
	8V6aL4rysTeQFvsLzZETs6QlE6Eh8zy11aka5TdkFsOG5OSIeCTOB8MKWudeXcC9FgXSKzilvOY
	IUJz4itIBu1YnZgAPEG5QZOr8auDdWPe+uHAz/ekqqZsDGNtweJDF5cwfYTRywEHBEqMmSaXEN9
	Xa9NC8WwMHX4qy2JlLZOTGMjpkXT0+3qBJERriRvIh3jrrv8nWiXz16OMuSzqBx61HXYAYUchre
	JjGWZC2yaas4smL6tHmzbKhjcy/ozv1RJH2M8YEI3P4vZ0qkKVx3NgF8BnAB3eMKw6XRtCqm3mT
	RAPS32tK/qDUpcaOAdorzqh7g5zWJVu2ljYJfk=
X-Received: by 2002:a17:90a:597:b0:3a0:a055:1759 with SMTP id 98e67ed59e1d1-3a0bb60e55amr5032133a91.40.1790572751469;
        Sun, 27 Sep 2026 22:19:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b94936ddsm18408378a91.7.2026.09.27.22.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:19:10 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:19:02 +0900
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
Message-ID: <arn3TC7BgjTXWmdG@google.com>
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
> +int LZ4_compress_fast_extState(void* state, const char* source, char* dest, int inputSize, int maxOutputSize, int acceleration)
> +{
> +    LZ4_stream_t_internal* const ctx = & LZ4_initStream(state, sizeof(LZ4_stream_t)) -> internal_donotuse;
> +    assert(ctx != NULL);

Probably in some other places as well:

LZ4_initStream() can return NULL, but the code immediately derefs
the pointer.  The assert() check seems to be misplaced, unless I'm
missing something.

I suppose those need to be decoupled.  First LZ4_initStream() call and
NULL check, then stream->internal_donotuse.
