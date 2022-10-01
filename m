Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2D28E2
	for <llvm@lists.linux.dev>; Sat,  1 Oct 2022 14:48:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id l1-20020a17090a72c100b0020a6949a66aso2045718pjk.1
        for <llvm@lists.linux.dev>; Sat, 01 Oct 2022 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WXUW6n+YocspZHBa1uHAP+hmukxgAOqdWaMPFjgZfq0=;
        b=oQrIcLm2/AzOeI7DlA81NFJX3B3BOsT+QRzwk3H2jTaTTc0+eHKpvnX2twWCBiSkJV
         lCl7IMk+VpTcE67HGBRnpdj5AIo2AfprWmaW5ZzSnjWBd/jmIIJy25vQd2Reec9WinPH
         l27pxL9fsGWW2OiZd6AEjAlJQ8twp/pbDh14U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WXUW6n+YocspZHBa1uHAP+hmukxgAOqdWaMPFjgZfq0=;
        b=GmzgTVe/Zfiq+4LDzCaKL92nziyzmGlHNhjfkmsJ22D4w6QlXWYs7I/DGOg1GEI2Nn
         wEUb4L0fE2cV/0gJeDrdnrQ5OzdxPJUXBagSNiuAXdnubfTYICJT45L8caN8gKnO9PCQ
         P/cyAbQMLbphK8H4KuYbeUw13YEKR8jGz/LGEYFFJadP9AHrbm1wAgybdDyrzGOlO2av
         n4bap1SR6Y/tcglLo7u8KX751RlhXbQE4VcN6nEdXlpkIs0PhHm0i9zksDivey1mNCng
         x1b6SnBESESLPGXSfpufKSQgCUWyiM73mUi5N0UqsEF0dw2o/m0JdB8L64f6YgXUE9vQ
         T8sA==
X-Gm-Message-State: ACrzQf2QbXsMSbztvrcf0F1l4a1m9Qj2URYjc9Y3cwaxPxzXPuWqDt30
	SKf5YxUc5APZWcUdEfpdJaLtiQ==
X-Google-Smtp-Source: AMsMyM7OFcoeT8Wign6R573YRonn6hDxkXDAJo6yXcperZ70XVD7CulLRtdLOLh3tmxu8dyxA/PQXA==
X-Received: by 2002:a17:902:d54e:b0:178:2da7:1bea with SMTP id z14-20020a170902d54e00b001782da71beamr14035113plf.161.1664635723987;
        Sat, 01 Oct 2022 07:48:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x6-20020a63f706000000b00429c5270710sm3532975pgh.1.2022.10.01.07.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 07:48:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: samitolvanen@google.com,
	masahiroy@kernel.org,
	michal.lkml@markovi.net
Cc: Kees Cook <keescook@chromium.org>,
	trix@redhat.com,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile.extrawarn: Move -Wcast-function-type-strict to W=1
Date: Sat,  1 Oct 2022 07:48:25 -0700
Message-Id: <166463570274.4070760.11444179166073924518.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930203310.4010564-1-samitolvanen@google.com>
References: <20220930203310.4010564-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 30 Sep 2022 20:33:10 +0000, Sami Tolvanen wrote:
> We enable -Wcast-function-type globally in the kernel to warn about
> mismatching types in function pointer casts. Compilers currently
> warn only about ABI incompability with this flag, but Clang 16 will
> enable a stricter version of the check by default that checks for an
> exact type match. This will be very noisy in the kernel, so disable
> -Wcast-function-type-strict without W=1 until the new warnings have
> been addressed.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] Makefile.extrawarn: Move -Wcast-function-type-strict to W=1
      https://git.kernel.org/kees/c/2120635108b3

-- 
Kees Cook

