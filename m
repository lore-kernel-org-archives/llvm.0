Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A44C3B42FE
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 05:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574510; cv=none; b=Wbc/6IUxuxNpq8vgfPHdK5/eP/3CjS2rQuFN5rnJl05x8vKUaWNcGW9C5Cq8qspTaiCKZ6/A9nfDPErMFcvcB1+/OYKCe2AN3c4XSBWbd61D2igwQwahfg29YpSRDfvaNhBjilq5bBaXcUqWPbBlkm1ckz94yPfXc/ZfgMbs6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574510; c=relaxed/simple;
	bh=iMYszCd2Q2GkfRGunaTTlbLJABOPePOXot6uhYku9yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szWjHyPoM2epnBDe9xT3ROx5lDV8KHLAeXIcgx6IGIbOAkebUiVU+7FijdpdAT7MRHHjvQDrWeRECY2W0a9I5r78izynvsVOvKqQg1PAJ/rOEhIay2Gg6itM3WlYIHzP3/nAK6LvCOvr8sd+63dUTkwzilZfD9M5TGre0fEwARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JteTbOyF; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JteTbOyF"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso42997a91.0
        for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 22:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790574505; x=1791179305; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWV/wHWLQfhp6L6mSocYwp2pbMQ9zmUarPxSrrFDYg8=;
        b=JteTbOyFc+g9SymaIaPio01xvMClJpkC+EPc6ykcGuvofl3fQbVPkUprYKpnWk2MzA
         RO2QIMa2gHVYMa2CDYGNrVAPbvizUq3HM6cfqiAB5/Mgm/dmGGPHTdoj25qXFcHClXMD
         65TMe/aqgbjjlLbbBBcgMjuzeE7c4fkRRfUd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574505; x=1791179305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWV/wHWLQfhp6L6mSocYwp2pbMQ9zmUarPxSrrFDYg8=;
        b=PVwwtDXRQ4mmU9FP1Rxch13hn8mejZzHtTM91QSjQsaoGeHF8St70HtYq5VdcrSJ72
         RaxaHH3Snl0FwU2NgDbSvuAPlt11zpPDn6Inx1LvLQRVuSp/drp/aOSk6N1cIAF809cS
         lDCtptuJR68N69aC2SL3GUHXrfZU4K9UX32KlRtQqfXheYYpEEgE767jwqhuIuN+qSmZ
         4uvKxUr0ZprLWjZJONk5oIUQ7NI/tCR/WgUSeU4PKRJLRobpomC4Aqn5tJN+URQLGOle
         W6McqUBn01ofceZEytxlMGzIKBtB42JGUjMCO1dEgr38FtpNvoe02xSYzytfnfknEm+8
         KrTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkwGQlg6pllcTI2DyJq9CmiS5ohDohq6OZhfYQJfcKSe8LOKsPSmppNQQ7hOB6SPP688fZ@lists.linux.dev
X-Gm-Message-State: AFq9FYLvyOGcRacTG5YwoYUAZgx1TbrWZaGX5rlrsEnb4STlq354I29E
	nS7+8orWtTfuT4OqEEuOgQuYaQztF0vKAEQWTfwA+aHy5E/EgLbxBsAc3ovqSHs+Ng==
X-Gm-Gg: AYBFou0PJleDj/cbg7LYiMGRq+enWEd3laFiSYC30juV2RJjBTjGY7mNyhnO35j3YCb
	pg+ogDpg0UBPEzs6pfa8XAxvSwZCW5nQ6zeX/uMhlXVtMNjB/cScKPQzINXd7yR60KdUi/5EFHu
	vVnyY93OU+3WQvrM6svtX5i126NZqM4WfYPbnVHSn75ww/CND1zxA5aJScN5ap/yVYmytRXZKqc
	4OEzlbd/qRWELj82rUb/kb/YCf9BRWRlw2e66qNArp1l4YdLOauugd1jmUdslvRlLbg7MLErwqU
	QjRtjMMor0AHSggWfUpc2SJkbWJxhZxI4Y0f/V80Tk6+mIYGlwZ8xkloKJqWmUN8VUmzm9zSUpV
	1wfkpsjrRO7wqd1Cd0kuQ9qFWjgba0W/eKv940/EhlG4Gb67fWxeKzRUnQlqgGtlJD5wfo9WVAa
	EY/4BLESzn60mOnZJgLRAz2CLYDm/QoS3KwDVfR0exX5oWofkVSrBWrhMaN6hyZwv5SdfZpdp40
	ZOYtXD3MmjSzDw8tKuDxFN+QEQ5zqfN9ae3TeMu9qUW2IrU+g==
X-Received: by 2002:a17:90b:3888:b0:3a0:cc33:2287 with SMTP id 98e67ed59e1d1-3a0cc3324ccmr6256726a91.6.1790574505299;
        Sun, 27 Sep 2026 22:48:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm17853889a91.15.2026.09.27.22.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:48:24 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:48:15 +0900
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
Subject: Re: [PATCH RFC 3/9] lib/lz4: add the build environment for the
 vendored sources
Message-ID: <arn9tK5MxxxfH7OW@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113456eucas1p136c3cd1f08be7201ad6b3f7b0e8ff02d@eucas1p1.samsung.com>
 <20260925-lz4-vendor-upstream-v1-3-1c7ffbe21c4b@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-3-1c7ffbe21c4b@samsung.com>

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> +
> +/* LZ4_decompress_fast() and LZ4_resetStream() are still kernel API. */
> +#define LZ4_DISABLE_DEPRECATE_WARNINGS 1

Is this upstream code?  As far as I understand it, LZ4_decompress_fast*()
deprecated upstream and are strongly discouraged.  Do we want to suppress
deprecation warnings?
