Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C03328A6
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NmQMcpvH"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso2021707b3a.0
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624880; x=1697229680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA6Sc7k2eYudohPOyjS2xNwEbkA0LuukS0jdW+sshIU=;
        b=NmQMcpvHrfKnue9ab1GnRDp5NvIWUkyG4PjfwKVUzrxKvur2iB8eZimav/+0d5uwcM
         DBDu01Me1kGwg2t5NdT/FT6YLIjxx9ewzASxggdb/knYw5HeGNDUZBo5fIZWk0iHXEQU
         TBMr+EbZnSXtu+Ukmuy16mMK+zDjwut7Y43iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624880; x=1697229680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RA6Sc7k2eYudohPOyjS2xNwEbkA0LuukS0jdW+sshIU=;
        b=ZfRECGDE2nunBDzL+vbNCPGP6bWOL9wA1ajrBC1Ln7886HFceq5Ic2ev6Su8YFkq36
         gZuyvV/8s8XBUF+9SRNJFr93zKpXBlIWGf/LpbR3XqWf1FC64q7Anf+jBFJQcP5oivE5
         D0dcTFzg27VkZGMpPfjQSK/X4bz53nQ42VtuzdEa6Osp2q94dZqf/0I7yqt4JZnTG7TD
         guSVy5UAq2HEqTO0v9oq75X7lYO3jO1E1g1Bl8DS89AbjWjoqUzwclHc6uuhjwdTI9+V
         hVfmI9vc1TaYdUJMw9g12nXC+WRXb6kuroaRyAsk52EnDAhza4LxtxsESn09RgDlhpaO
         2BZA==
X-Gm-Message-State: AOJu0YxkYf8qeTPUKK25sXIbAUkVLal7FZD/ySfiSv04g6mfFaySrddH
	74i2UOQdZ6lV7rXwBTAqZCUXuA==
X-Google-Smtp-Source: AGHT+IFSmFU6FkhA8Oz6MBMj4ikhUHOgSULluvCcw1BxoKIl88jeZRsxIUFaVyPPQ1RvqNgCCc7Y6g==
X-Received: by 2002:a05:6a00:a1b:b0:68f:cbd3:5b01 with SMTP id p27-20020a056a000a1b00b0068fcbd35b01mr8784952pfh.13.1696624880594;
        Fri, 06 Oct 2023 13:41:20 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a25-20020a62e219000000b0068fe7e07190sm1905152pfi.3.2023.10.06.13.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:41:19 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Andy Gross <agross@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drivers: thermal: tsens: Annotate struct tsens_priv with __counted_by
Date: Fri,  6 Oct 2023 13:41:09 -0700
Message-Id: <169662486916.2156024.11406030732291665443.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175341.work.919-kees@kernel.org>
References: <20230922175341.work.919-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:53:41 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct tsens_priv.
> 
> [...]

Since this is a trivial change and it's been 2 week without further
discussion, I'll snag this patch.

Applied to for-next/hardening, thanks!

[1/1] drivers: thermal: tsens: Annotate struct tsens_priv with __counted_by
      https://git.kernel.org/kees/c/aa0a14629c2d

Take care,

-- 
Kees Cook

