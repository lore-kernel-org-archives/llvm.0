Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20A27FD49
	for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753208840; cv=none; b=L4T10on+n+UjdfhmFoyvA2VflWbHXFKzQy/A+/PCVwOnBI34IhsTQzPHpi8+CzQTg+8iDkdP+L9W29uEKNA9eVSNcBVotKVNlLKI8MZT7TTX6H5wdcr1NFe8LZPjzhbmS5HbLnjCZoDwF7rRn5Z0HbiE/zLMY64QdhRUk3rdap0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753208840; c=relaxed/simple;
	bh=TzuX4mInNFL0Y71HlZ/CxdY52DbWevcbHeKa5VEl6b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4EIq0ffAd/u/8NVie1shjlFiwARWiFvxbzR6e91pXDFea6zd/p59rx7jUEkkHZEmHcd+q64Hr2TvqrAOPA9HCA6H4zzo+7my5Cb/XkCk4n3UuqplEHGAiDMA8e34StWg/9hLXYqYm2OZ8+1YNslryZNPNwqqStuJUSwgUIaSF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NXGaLC4Y; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NXGaLC4Y"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a52874d593so4295165f8f.0
        for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753208836; x=1753813636; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z8+WxTUCxaG+bKBH/CjfFqMsRzOrc36DXiZRhX8IKQ=;
        b=NXGaLC4YQDhDqpZnCZgw6woSAs4CUYTnDFFgSWsG1VBJ36tW5huNmlkaazDdnm0wLy
         T1N+bDp9nNx4U9bVVK3E3yxj12MWGZ2TTaE3PgVNWwf2UnqsfY5SvHoKvTTstSiMh5xH
         C1y5M15A+GvMrymP6kTmFl50yNQATOryFXTa1rcNlp6q4mO3YOE7IccytJ1qsxU18c5h
         DMuZ91eEStQnbRSOwg69hn+NCCHDLtAMsn6vz0Y+T07g7dZjdW+KPQHTurx1s7b5W18e
         QheXQ+srPruZ+VDbFhD4SQ+MfjLXjdTsPS1PpWU1GscyyuS/nhsAkGY/lkZQA67KpfSC
         i59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753208836; x=1753813636;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z8+WxTUCxaG+bKBH/CjfFqMsRzOrc36DXiZRhX8IKQ=;
        b=njMS99rW8XusSkObneX9pRYolNK7CPv9GADxGDav+tYGXyKpE69FGjqtD3yeeNTC4H
         RXFJkkBPUnQ5iA5Frsg9DcEIoZRrzG9y+lRGYpbcsSnojYPiPY9CbHkS8+1QkarFa7wA
         PCi1RUzF7hW2GmqdTHvVROmwsJjSHNL95PlUp8jz1xfl9nZ7+lOCr6oFdtQzRW0hrnsb
         apYqdr8laD7q0zkJTD6CzdwBT/t/DetEDDwHBXOjfJJWy0nU5U5rAO5IEbVT8pkL5yIN
         l9QX2ANBqCDvKVnyn8wiCeJSK66YNJVOw0+wwQFgWbzI2gNrqXgoSEmnmGlAG4CkacV7
         NYGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuxdrAoj6T9QPmaT/wVB7D1sy4fc+o0n4/0fbyLsfuq7KblzkQryhIt+i/EtWHWfzunkxC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6ptO02mSfNFTSAqEkR5WT8ihRU3gkOVRhcZ0SLzYxAdi76fN+
	91GO2k2VUvNNFJKBRfLUw+j4D6J95rrPFY0sfw/mITPA3nbK87/ifQrVX19HSgAkRA==
X-Gm-Gg: ASbGncvrNCuoUUWj54wSJC/KHMAgxDCEqx+U9v2dJgDXgkihKIJn91qWLO8j7rMKrjA
	i9zPhMhYs9ZyMpMnOSXSVeGBhC2ILoHedYOBB2ug13tXw/w0Xo82eHyShV0zlfxJBxXhP9N2eft
	lCaE0MFOIqFHACDUKkqH7AXuiksR7T94qf4BOdEIfsLAGPwNaKjlZKu642hMZvIGOwxvsgaLIgo
	2iQJH27/pZ6Awu7L3n2kpGAIPs36ESEzleJt7sfYY4gIW+lW/XuHE6mFRYMlJVqsQosD0EPRz7A
	RBS+j2I9++AjrsDS/ogltgwq8Y5EcL43HAPMQ7y+8pQeUm/Ks++XfDclFNvcZz8zSjkirdRVjd0
	PsUeAxMq8Btl0zm2Gl1g0HYdldhJLZEmy8SW6tzalPf6AAQ4n9Eyrc2/PzQ==
X-Google-Smtp-Source: AGHT+IHWIMlQSVzvAq85Yom5KJ9BYmsTxVnjI5RbzJDAcwDVZQTDVOTdmdUULBd3ut0q8DI1kuLuUA==
X-Received: by 2002:a05:6000:1885:b0:3a4:f644:95f0 with SMTP id ffacd0b85a97d-3b768f165f7mr219753f8f.54.1753208835850;
        Tue, 22 Jul 2025 11:27:15 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:53e1:3729:be19:c80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d807sm14296542f8f.73.2025.07.22.11.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 11:27:15 -0700 (PDT)
Date: Tue, 22 Jul 2025 20:27:08 +0200
From: Marco Elver <elver@google.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	clang-built-linux <llvm@lists.linux.dev>, stable@vger.kernel.org,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: [PATCH 6.12 000/158] 6.12.40-rc1 review
Message-ID: <aH_X_AVUDoP7oB0E@elver.google.com>
References: <20250722134340.596340262@linuxfoundation.org>
 <CA+G9fYu8JY=k-r0hnBRSkQQrFJ1Bz+ShdXNwC1TNeMt0eXaxeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu8JY=k-r0hnBRSkQQrFJ1Bz+ShdXNwC1TNeMt0eXaxeA@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Tue, Jul 22, 2025 at 11:30PM +0530, Naresh Kamboju wrote:
> On Tue, 22 Jul 2025 at 19:27, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.12.40 release.
> > There are 158 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Thu, 24 Jul 2025 13:43:10 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.40-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> With addition to the previous report on the stable-rc 6.15.8-rc1 review
> While building allyesconfig build for arm64 and x86 with the toolchain
> clang-nightly version 22.0.0 the following build warnings / errors
> noticed on the stable-rc 6.12.40-rc1 review.
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
> 
> Build regression: arm64 x86 kcsan_test.c error variable 'dummy' is
> uninitialized when passed as a const pointer argument here
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Build log
> 
> kernel/kcsan/kcsan_test.c:591:41: error: variable 'dummy' is
> uninitialized when passed as a const pointer argument here
> [-Werror,-Wuninitialized-const-pointer]
>   591 |         KCSAN_EXPECT_READ_BARRIER(atomic_read(&dummy), false);
>       |                                                ^~~~~
> 1 error generated.

Thanks for catching this. Newer versions of Clang seem to be getting
smarter. We can silence the warning with the below patch:

From 56c920457a4e7077b83aafb0c9c8105fb98b0158 Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Tue, 22 Jul 2025 20:19:17 +0200
Subject: [PATCH] kcsan/test: Initialize dummy variable

Newer compiler versions rightfully point out:

 kernel/kcsan/kcsan_test.c:591:41: error: variable 'dummy' is
 uninitialized when passed as a const pointer argument here
 [-Werror,-Wuninitialized-const-pointer]
   591 |         KCSAN_EXPECT_READ_BARRIER(atomic_read(&dummy), false);
       |                                                ^~~~~
 1 error generated.

Although this particular test does not care about the value stored in
the dummy atomic variable, let's silence the warning.

Link: https://lkml.kernel.org/r/CA+G9fYu8JY=k-r0hnBRSkQQrFJ1Bz+ShdXNwC1TNeMt0eXaxeA@mail.gmail.com
Fixes: 8bc32b348178 ("kcsan: test: Add test cases for memory barrier instrumentation")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/kcsan_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index c2871180edcc..49ab81faaed9 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -533,7 +533,7 @@ static void test_barrier_nothreads(struct kunit *test)
 	struct kcsan_scoped_access *reorder_access = NULL;
 #endif
 	arch_spinlock_t arch_spinlock = __ARCH_SPIN_LOCK_UNLOCKED;
-	atomic_t dummy;
+	atomic_t dummy = ATOMIC_INIT(0);
 
 	KCSAN_TEST_REQUIRES(test, reorder_access != NULL);
 	KCSAN_TEST_REQUIRES(test, IS_ENABLED(CONFIG_SMP));
-- 
2.50.0.727.gbf7dc18ff4-goog
