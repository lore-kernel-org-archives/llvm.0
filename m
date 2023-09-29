Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA886588D
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:14 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c61bde0b4bso87578485ad.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015274; x=1696620074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lm/Ps7g202MOlVqh0mV3HRz4xTXb5X6yozpQbIPIl6I=;
        b=L3T/Ya2PYqa6YYaOXAW4EaYsQs5sdhavoz8t9JbPN9vHmm1UUIEJcsI5R78NsuixrL
         Zyi0XaAL+gUbD8l2MRl4IZzSRU4WSzrELju/xiJItHrX+rOSFpv1M0bryftCKobwcMt1
         yYId3OCd3uJ1ye/O4uzmwh466x3GRnDOy6vhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015274; x=1696620074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lm/Ps7g202MOlVqh0mV3HRz4xTXb5X6yozpQbIPIl6I=;
        b=IgEtfJ279qFX0GUJL3t7+8STYVkK/xu9u7AzIeHsU/ytk1KFHut8QOvQwoy1Cf5xRW
         8Dm+ja9+1mnu8b0E5S9Ox2X8mCVBklTB55A27SBc4JDAkIBfgzp1ApnvdX3pKOBU46ME
         rupCWgWJTp0OJd8L75cBYeLJDOj0njgQ3DQwWAxQXSO/QBdY12TfCguOIgiFna5sgwIa
         hTbVjaqQokp0HMfHGJ7t0fE2iDIaLIfulcjg50O8hQ0U6V6GVLrWJMyIfGA0X6i0Gy5G
         AtDcLQLVkOFOHasIyaiiwtC4DbNa3gS1Fla2lJZvdJrqSQfaVgiktlOyLwMK+lB/PwAk
         KVjA==
X-Gm-Message-State: AOJu0Yzs5fRsBen82unicsCkLokt4nxTA2nXSxejKfp4wWM6/EUSSmGP
	jHUMxTBbBonh5RoNmtB7F7y4BX8g1eePQmc6jLE=
X-Google-Smtp-Source: AGHT+IHzxuvEn9JIX48urjncDPYH9dBw31tAucVspB19q62Zql14kwcg7Iwk6ubcIA4im2QxAPeqyA==
X-Received: by 2002:a17:903:230b:b0:1c3:4565:22f with SMTP id d11-20020a170903230b00b001c34565022fmr5848461plh.21.1696015274330;
        Fri, 29 Sep 2023 12:21:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id je15-20020a170903264f00b001ab39cd875csm13499524plb.133.2023.09.29.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alasdair Kergon <agk@redhat.com>,
	Kees Cook <keescook@chromium.org>
Cc: Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dm: Annotate struct dm_bio_prison with __counted_by
Date: Fri, 29 Sep 2023 12:21:03 -0700
Message-Id: <169601526975.3013632.7773910905391133937.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915200407.never.611-kees@kernel.org>
References: <20230915200407.never.611-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:04:08 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct dm_bio_prison.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] dm: Annotate struct dm_bio_prison with __counted_by
      https://git.kernel.org/kees/c/1eb1f6b6c911

Take care,

-- 
Kees Cook

