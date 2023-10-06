Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737D328A7
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kn81FTSg"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-692a885f129so2140294b3a.0
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624151; x=1697228951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEFC14BkrpnGEbJ9O9/6ay29sN85g5PSsTmfl2FKtGM=;
        b=Kn81FTSgQtw0uQ1jQKTlZD3ELvFLsOde5P/NA5FEWkVsoE4J1JMDgU0orYRSzadgs0
         CKsJVqK7UXOcD66YScgQ5FvjYaUJk2W61tEMqG5rpjKzkPl4lc2x9w9VEV4ZFAedIchF
         zHy0oPGNOjuW2zIlkXJDRXaBblRlsxQGrTwYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624151; x=1697228951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEFC14BkrpnGEbJ9O9/6ay29sN85g5PSsTmfl2FKtGM=;
        b=vCtsmuK8H8ZHnp3dE4ThI0eWTluopKtMw+xxamx0J3PGXoXmBg8fnDGMsqgplRPDJZ
         SVqICUd+va36d7GQa55xc5DcuZ1s2tNqWbXJdI2woulbdH2GmSDhAcvZ/rz7yGz2lY7h
         X5VZShxhPpU+vb85xjD1B66+/tInepfysPvOpIkmn6jyxyOL+1ZOTMDN2AG1fFmuU+/L
         yTw+hhyBrRME4trBoE61mGzuyumz3Jl2WgGjMrIbdFWlGRP6Bt7EfyUwwzciyWqmPvot
         tcNDsF/Qr88OwPF6PANlEv7NN07Aeh26YyuZ3uo5rlW4vFQ/nDp8ufFWQUs8Ea6yCsbF
         xW5A==
X-Gm-Message-State: AOJu0Yy1lt3XvDJ8QBsZ/mbc+Gm9xK8R68mPX5m8pNSIIzlTL398eGl5
	dQOrdFpbLdXltKE9gFISLMsu1w==
X-Google-Smtp-Source: AGHT+IGRyv8sAjwYvp43ZGf13MZV0quwDxaxDpmItfLr+PaHBjrnG6egScp3KHGIyEw9yf3qE2TREA==
X-Received: by 2002:a05:6a00:168b:b0:692:6d3f:485b with SMTP id k11-20020a056a00168b00b006926d3f485bmr10482622pfc.3.1696624150808;
        Fri, 06 Oct 2023 13:29:10 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b0068c10187dc3sm1896078pfd.168.2023.10.06.13.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:29:10 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	lijian <lijian@yulong.com>,
	linux-media@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-event: Annotate struct v4l2_subscribed_event with __counted_by
Date: Fri,  6 Oct 2023 13:28:40 -0700
Message-Id: <169662411867.2154917.2192633783167073007.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922174951.work.160-kees@kernel.org>
References: <20230922174951.work.160-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:49:52 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct v4l2_subscribed_event.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [...]

Since this is a trivial change and it's been 2 week without further
discussion, I'll snag this patch.

Applied to for-next/hardening, thanks!

[1/1] media: v4l2-event: Annotate struct v4l2_subscribed_event with __counted_by
      https://git.kernel.org/kees/c/b1a20bbd4687

Take care,

-- 
Kees Cook

