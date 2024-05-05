Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CC917FF
	for <llvm@lists.linux.dev>; Sun,  5 May 2024 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714884004; cv=none; b=ilDpXb5d2HXw49IG/qPwL3R6DW7qub9Z5ptKQ2ZnQP2eKXd6KEjD911sLou8jdjXr7Ob5nv34+G5B+St1ig9ZFUGjnzZrei0OsYqr5hgHrkXZybRWyIjbGhcVzWeY6J6GYx1arI9N/Fj9pJjjFSj08BB6+lCAwpR8P+IzPaLLmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714884004; c=relaxed/simple;
	bh=zg1XkJMfhl0NSO0NTG2Ku336zIdH3gENBvcjq01QdDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJitrj6QIz9Uh0w3UYCqli8z2z+QpfZA4QFB4j78LZibzhxg8Se4QLKe2Ovq3j6X6nAyI9rpJlTEeHaexP+MMB4g9CpCaRF8/pNZ6/bULo1RYCF2broAVLiLI1fjV16fRgW6iFRcFT2mRu8btHMmxtQh9rIqhlJKfY0VDuwlUi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ngb0Ujjg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ngb0Ujjg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ecd9dab183so24600395ad.1
        for <llvm@lists.linux.dev>; Sat, 04 May 2024 21:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714884003; x=1715488803; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzpM7FU8Imvm8zuTPXcEgxBeaAl1FWkYeSH3YqD2Xns=;
        b=ngb0UjjgJ5Ctpx8FEeU3oMXceaImK83aJH2OOlB1EImZyJ2XcvxD0uVey7o3eN+cuT
         QsmP4ZVtXJtlhrf0d0ZYP1pDQsKSLI3ZIzduhXW4FYAL9+u5YeFd1UH/D+w/xTtqHTbx
         EaHzb4iv2iGK2XJqt1AvYXQ0rx9yTqc6gA2Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714884003; x=1715488803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzpM7FU8Imvm8zuTPXcEgxBeaAl1FWkYeSH3YqD2Xns=;
        b=Io9PIPMkXklloM1PHXPvD69Oqj30F5Cp+Fj271RhWqWluBfVBnSZGLnWciV58hJuhl
         /UV3Eb40cp4F+8oVCLTaoHMdz/pFSzAkJzHTel4+s0+bfQAjbGC5NyIOCV+4B8U8gDzp
         EF3Xf2Df5JTlmcbGZNBp3bYSY71HNPLEh/iU58SYm6DssfRBRz6Ne+9/vj+1XhhoTgEc
         ckt7J6EDYXJHQRA3XMxsHMPBqUZ1SCryaXAi0JpM6NEYix69APNFnb/n42XS3cAh0aAm
         VwLk8utv6ShobAomKDkhnogBpFcJmlsvAC0O8SnybijxJ/pTcquJ9oZAPRkDGNNUu848
         fZWw==
X-Forwarded-Encrypted: i=1; AJvYcCUScUVP6lO3hqSYZU2AtL55Sd/DCpSKRxmTLD7l8gc0w7gECRZPmtwH3qooLEByo8V+gpkIVcOwoMrsVq7arj67XVMCCw==
X-Gm-Message-State: AOJu0YwEBQvPAtfJIANlkl8GQ175OEubgJfU3avMuOiPhf/HnXq4E95M
	JO80ii1OY1GfAA/x/WYDf/N2tTwqPs0xdR+y8RQSM7Mb0ZTYvbPZUEx2K0w2oA==
X-Google-Smtp-Source: AGHT+IEeiKOrRPU5vIIqBtlS4HJNxQ0aabIvlspSUVAEeWBnpj7xpaPpcUt2xQ7IpYeR2DLXXzG+rw==
X-Received: by 2002:a17:902:ecc4:b0:1e4:59a2:d7c1 with SMTP id a4-20020a170902ecc400b001e459a2d7c1mr15472258plh.33.1714884002658;
        Sat, 04 May 2024 21:40:02 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8263:3b89:bcee:2ed4])
        by smtp.gmail.com with ESMTPSA id r12-20020a170902c60c00b001ec7a1a8702sm5789626plr.271.2024.05.04.21.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 21:40:02 -0700 (PDT)
Date: Sun, 5 May 2024 13:39:57 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	kernel test robot <lkp@intel.com>, Minchan Kim <minchan@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240505043957.GA8623@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
 <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>

On (24/05/04 16:10), Andrew Morton wrote:
> > On (24/05/04 14:54), kernel test robot wrote:
> > >          |                            ~~~~~~~~~~~~~~~~~~~~~~
> > > >> drivers/block/zram/zcomp.c:214:2: error: call to '__compiletime_assert_285' declared with 'error' attribute: BUILD_BUG_ON failed: ARRAY_SIZE(backends) <= 1
> > >      214 |         BUILD_BUG_ON(ARRAY_SIZE(backends) <= 1);
> > >          |         ^
> > 
> > So this is what that BUILD_BUG_ON() is supposed to catch. You don't
> > have any backends selected in your .config:
> > 
> > # CONFIG_ZRAM_BACKEND_LZO is not set
> > # CONFIG_ZRAM_BACKEND_LZ4 is not set
> > # CONFIG_ZRAM_BACKEND_LZ4HC is not set
> > # CONFIG_ZRAM_BACKEND_ZSTD is not set
> > # CONFIG_ZRAM_BACKEND_DEFLATE is not set
> > CONFIG_ZRAM_DEF_COMP="unset-value"
> > 
> > Which is invalid configuration because it means that zram has no
> > compression enabled.
> 
> We don't want s390 defconfig to be doing this!
> 
> I guess just pick one if none were selected.

I'm looking into it.

We used to have "zram depends on crypto compression algorithm"

: config ZRAM
:        tristate "Compressed RAM block device support"
:        depends on BLOCK && SYSFS && MMU
:        depends on CRYPTO_LZO || CRYPTO_ZSTD || CRYPTO_LZ4 || CRYPTO_LZ4HC || CRYPTO_842

I sort of wanted to change it and make zram select compression algorithm,
instead of depending on some comp algorithm being already selected.
But I can probably keep the old behaviour

: config ZRAM
:        tristate "Compressed RAM block device support"
:        depends on BLOCK && SYSFS && MMU
:        select ZSMALLOC
:        depends on (LZO_COMPRESS && LZO_DECOMPRESS) || \
:                (LZ4_COMPRESS && LZ4_DECOMPRESS) || \
:                (LZ4HC_COMPRESS && LZ4_DECOMPRESS) || \
:                (ZSTD_COMPRESS && ZSTD_DECOMPRESS) || \
:                (ZLIB_DEFLATE && ZLIB_INFLATE)
