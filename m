Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF571FA0
	for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 16:37:54 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-690d2e13074so12323121b3a.1
        for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696091873; x=1696696673; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5AGtOCX2YLyW25B4ipM/PsTXAr3eNAm1BeKQ+N08Gk=;
        b=gyfxU9P3+q1VzZGBqh2o6jguDKNhxznU1LIePbD0+5e9cZt20VQ7blmFkXoYGSZH1m
         w2Z6f6UE518jSH1/fJPOinTh0qrnssXMga3jQBrHjnXfHa/mvvMfAIfaSVnGxntyq358
         eRu/y/H7yscL+IbFKf9IqbIMTCNn/tMURrAUKKDHX908j/Isd0U1nVecZOtaZyT344GX
         Cz1Ire0gZ2HA/24rS6Uvw236h5aId0w1AfdNXWmfsZC8byFSDGoGfHsf2nKMr+s1qu2o
         FMMtjJkKLIcgbyT5EyA7bzdsGc487Vde6Zaqw8wzvBetx4dFmBWfqQmgMZMYho1OqmeC
         whhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696091873; x=1696696673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5AGtOCX2YLyW25B4ipM/PsTXAr3eNAm1BeKQ+N08Gk=;
        b=asn8C2u7nyAyF5vzTwYbt/iV846KJfY1P5pIE7nAacitg4zcSg5Zn53SWOayDCruKC
         X2V4lE9AlV/T2ldEuz75GYxVCVXzf4u0RzWH2Dnezxlr3a1h5m8oHOQc34gabye533BV
         60lANyw0XcsxXBXgaOgLxzS6+LH0WFxCkkKx8z9bejyo7Pzj1oQst9cur7H9aVr1pkrI
         TPl02s//ghi9UGOKfiA2RDwTa/FQe7AeIrM2UkrylM8E1Hyk3j0Anr3bxZi9ewHur4vR
         ny3OjoeHR4ic77k9d5evfJBanxpEp7FOArbstes7nh37x7xFaVmz2lNRFOUIpkiA0feI
         jQDw==
X-Gm-Message-State: AOJu0Yysw/aJsa0o/+9UsC2blhchrr1nHiXBx2pRmetXYtZ5nd4TbG1d
	ess4/n97BwdXfPZHQ/N6+n8=
X-Google-Smtp-Source: AGHT+IFcD+InxoquI1bZbEdFpDChHT0/gks65lBOkpRCEDjQVecmAWULy2M4IU4Dy2nT3oiXSXv11w==
X-Received: by 2002:a05:6a20:158e:b0:159:b4ba:a5bf with SMTP id h14-20020a056a20158e00b00159b4baa5bfmr7623302pzj.13.1696091873452;
        Sat, 30 Sep 2023 09:37:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a90f:2dad:30c1:d923])
        by smtp.gmail.com with ESMTPSA id ml24-20020a17090b361800b00262e485156esm3334372pjb.57.2023.09.30.09.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 09:37:53 -0700 (PDT)
Date: Sat, 30 Sep 2023 09:37:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: linux-input@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: Annotate struct input_leds with __counted_by
Message-ID: <ZRhO3noTd/bDWjFy@google.com>
References: <20230922175031.work.467-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175031.work.467-kees@kernel.org>

On Fri, Sep 22, 2023 at 10:50:32AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct input_leds.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied, thank you.

-- 
Dmitry
