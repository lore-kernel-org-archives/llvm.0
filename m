Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B13328AF
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OMyIQw6h"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-690ce3c55f1so2194823b3a.0
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624881; x=1697229681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtVwJz3VmrSTmUGmidLH6zVmajGrZnWdZ9J4CH5SXmA=;
        b=OMyIQw6hsutToU1bxxhMK/iSD3sL3/pw93POL9L4x54DVGT4J2aOtVEw24cU2aXfrh
         brBZei0LoKmS0TBmm/54ve9IUJ94tvSgIUbk0mfnD9dsh8ZQ5dUa+R4U2KMFPoyJ/qGY
         JqR/O6xmtL4v6l4H/6gwE0OSvv0zZXUxzFVsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624881; x=1697229681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtVwJz3VmrSTmUGmidLH6zVmajGrZnWdZ9J4CH5SXmA=;
        b=vGPwN7Y59MJC6mdrJNmT3Ljw3UG5F+6vRfibQ2t+2tpPkXZGPj2flTevrREICqisqE
         0WWLU/T52QaWR+N/LmNglWXcKJY6Q8aVmnpZHbIeyij8HUgjlZbcPKBRvLNmD9/YmvMU
         tbY03M+H1ZsjGl7yrgSjGwTLMQFhXUtg6lTZh6GMmZG+CPMSBWkJCtCNSnUdFkGvnAuw
         wxPkrIo97jaZbuzzvo9BWVsnnx/TjmlE+BZluzKwa0CW8orkku04zBfr2JPU6UHXcR9G
         Xa7exqthscZAG5dmeWDL/imQcU5VGSJRki9e2iMnfRh7wltzehHCcCx5E+t0PLY+Xe4C
         1E4w==
X-Gm-Message-State: AOJu0YxMxOvMCf1zS7XNGSRQeVxt9ibOIdOaKZ1uuIIIOtcOuNkSMSt5
	LGqrAm8wPZYYfq625fWDth+/lA==
X-Google-Smtp-Source: AGHT+IG2dW/zusfUQ2rC4ErBYYeHN5DHDo9LKlcGpi35mNLb8jz1YPoleHgLhOqVUS1wHJDIJupwlQ==
X-Received: by 2002:a05:6a21:3397:b0:15d:c86d:27a6 with SMTP id yy23-20020a056a21339700b0015dc86d27a6mr10172087pzb.55.1696624881579;
        Fri, 06 Oct 2023 13:41:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x52-20020a056a000bf400b0068a0b5df6b2sm1920327pfu.196.2023.10.06.13.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:41:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Fei Li <fei1.li@intel.com>,
	Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] virt: acrn: Annotate struct vm_memory_region_batch with __counted_by
Date: Fri,  6 Oct 2023 13:41:13 -0700
Message-Id: <169662486907.2156024.1367197877614723586.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175102.work.020-kees@kernel.org>
References: <20230922175102.work.020-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:51:02 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct vm_memory_region_batch.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] virt: acrn: Annotate struct vm_memory_region_batch with __counted_by
      https://git.kernel.org/kees/c/1a38cf8d8ae7

Take care,

-- 
Kees Cook

