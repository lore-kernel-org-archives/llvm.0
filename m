Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30AF1D551
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S6qpzizN"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-584a761b301so1886247a12.3
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624880; x=1697229680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82USvwp/AVZiI7JMu96kcDBx0uffytd6mmJ2fi2p0ZE=;
        b=S6qpzizNDEQ7BooFySXxR8NUKDceCt3gUEAlyw1qQ2pTr12jMMjZNFxcsaXgFjehKo
         IuECRa1CavGU2ILsTmWHJYqyNh2Q1ps7e8tatGmTcWau0nMppAznIBWIaT47f6L0nS18
         sIxjNX6I8oK/BgZK5DepL4hbHonsRkXTlY+Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624880; x=1697229680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82USvwp/AVZiI7JMu96kcDBx0uffytd6mmJ2fi2p0ZE=;
        b=Mx4X35cWCS8U15kanIHnfLGK7z1WgjZIyRtoeVHf16t59j5KBeeJf2ix0l6EwKC86E
         Btbi8Z9NHcQUm0g6phE+uJRm0A0UpvLJxqhhKbzkO9tYFnjZVCrM2vWV6OL0bvVpV2g6
         P0BXwV/2uHlleE9vZI/Zp0blmmLXF7Osuhy2EwZsx7lf68mRV4MgntAdxk2oYjhiZB6n
         Q5zJAtv7ZqtedQUiwpORhqDEp/asQL/lEpYU+rG6CnthjfyMf0avzeXstwaeS8G0pfYy
         nZbIPCaiNREvSOGbyViMkcuEnM019Dnkuyk4oAkToOhSWib7rDxXh498bu5VYugm6EgM
         BRRQ==
X-Gm-Message-State: AOJu0Yzpuj1W6nYLWUW51DgNRZMcZD6grJmAl5I0Cit72C3VzKFkBxnS
	OFz9wAhalj6f3Tton30mUApIPA==
X-Google-Smtp-Source: AGHT+IEagZ/e+OAcVZ1rHnrATwqu55U2it3q4IXBXcOL6xkaUgJK29G54dnQ353w7X7bsAup6nYM0Q==
X-Received: by 2002:a05:6a20:7d94:b0:16b:e2e5:fe5e with SMTP id v20-20020a056a207d9400b0016be2e5fe5emr2794996pzj.31.1696624880249;
        Fri, 06 Oct 2023 13:41:20 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i4-20020a63e444000000b0058958ea2aaesm3753290pgk.83.2023.10.06.13.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:41:19 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Kees Cook <keescook@chromium.org>
Cc: Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mailbox: zynqmp: Annotate struct zynqmp_ipi_pdata with __counted_by
Date: Fri,  6 Oct 2023 13:41:12 -0700
Message-Id: <169662486918.2156024.8903511465543828440.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175351.work.018-kees@kernel.org>
References: <20230922175351.work.018-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:53:51 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct zynqmp_ipi_pdata.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] mailbox: zynqmp: Annotate struct zynqmp_ipi_pdata with __counted_by
      https://git.kernel.org/kees/c/6b607a3a311a

Take care,

-- 
Kees Cook

