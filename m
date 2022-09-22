Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0241FBA
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 03:33:54 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id c198so7952599pfc.13
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 20:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=XNbtSxfuJM0TvCbKrDSFlGazSHd4nOQHgC+9b6ylUe4=;
        b=JLTH01KnBgmnNcpiE4BaxPSMUmiRK1wixqi2R2fDvpYZ7mbFuWVA+eCMwV9Ooy7Y2R
         Woa8XpodShi3pnIGGNpgTJfitVebcLwCm8c/U0JiK4sHYFoOL+kb1m3bgvOAeN7Z7r0W
         00Y2KF+MivPazWmmeeTVy/Yh2IAp+53XXFWOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XNbtSxfuJM0TvCbKrDSFlGazSHd4nOQHgC+9b6ylUe4=;
        b=i8GDBvJu+xT9hm6Xk2QNpXVAg8HgnDf6B/yuw7NAOzjqU2HmcpHKTWiP+hSemmHh8Y
         Z+kLIF1wz/q7tlPgsVbwWXWhYrw23QiuhTORk9DCv8nTh/idna26D6jkMXzrTAgzXjLd
         gFuyHrMWQUD0wInUcajucdnIEeFW5k6QxQacHXhUXliNzEpR1GEmfBYbxjSJOUdThSBe
         BD5ImyJdHI90zVl+CtaSM+paAUVqV1gC9/c3b84muenR/gHT7Tsv27aofZCn9+y5Owox
         R3DnMpz0LEBQq6+7+lxElMO6+khyNuScBBITW0QDlLQzqChUTel3Vn29xe9CKSXuZ/m0
         41Og==
X-Gm-Message-State: ACrzQf125yKCCmUeiTLmv2n2PUkT80Yi300N4JmMc8+etXccsmK5uez6
	JTKjTmslPxcs1Sp8y46yAsC5MA==
X-Google-Smtp-Source: AMsMyM7tC1MtDvRJS7cc5qSCv8s84GqWYuQca9GUuvaL53zNqSZvZvxuvVucuuBYn6cgvQqhY2zIhQ==
X-Received: by 2002:a05:6a00:1889:b0:540:acee:29e4 with SMTP id x9-20020a056a00188900b00540acee29e4mr1550769pfh.49.1663817633640;
        Wed, 21 Sep 2022 20:33:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u9-20020a170902bf4900b00176ca089a7csm2754925pls.165.2022.09.21.20.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 20:33:53 -0700 (PDT)
Date: Wed, 21 Sep 2022 20:33:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: linux-hardening@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] fortify: Use __builtin_dynamic_object_size() when
 available
Message-ID: <202209212032.5F392F42@keescook>
References: <20220920192202.190793-1-keescook@chromium.org>
 <20220920192202.190793-5-keescook@chromium.org>
 <9d80e0a3-3fcc-0676-4529-79743f418557@gotplt.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d80e0a3-3fcc-0676-4529-79743f418557@gotplt.org>

On Wed, Sep 21, 2022 at 07:43:17AM -0400, Siddhesh Poyarekar wrote:
> On 2022-09-20 15:22, Kees Cook wrote:
> > Since the commits starting with c37495d6254c ("slab: add __alloc_size
> > attributes for better bounds checking"), the compilers have runtime
> > allocation size hints available in some places. This was immediately
> > available to CONFIG_UBSAN_BOUNDS, but CONFIG_FORTIFY_SOURCE needed
> > updating to explicitly make use the hints via the associated
> > __builtin_dynamic_object_size() helper. Detect and use the builtin when
> > it is available, increasing the accuracy of the mitigation. When runtime
> > sizes are not available, __builtin_dynamic_object_size() falls back to
> > __builtin_object_size(), leaving the existing bounds checking unchanged.
> 
> I don't know yet what the overhead is for __builtin_dynamic_object_size vs
> __builtin_object_size, were you able to measure it somehow for the kernel?
> If there's a significant tradeoff, it may make sense to provide a user
> override.

So far I've not seen any measurable performance difference, but I just
may not be creative enough yet.

So far, the tunable is building a kernel with or without FORTIFY_SOURCE
and UBSAN_BOUNDS. :)

-- 
Kees Cook
