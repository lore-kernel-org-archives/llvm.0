Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E98A347D1
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fwW6pqux"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c5db4925f9so20453525ad.1
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624882; x=1697229682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZOYPkPA5oLY2q95iWRFQ2sCIQPxY7UDWuU5p2gRkM4=;
        b=fwW6pquxnom1hJ/Cj7lmI7oi5kPfp8j+B9Wx+Lao70+nGw0i0FZPaeusVgo9mjg2eT
         NVHbad491ejaWeQOubu+Ms15jsmPMKZA+1rq/u2Im7rc7UWSddRLFRlv15M8xlKsuHO5
         lMqRFEd+rDzmVprisOo4I1qYCGiG/LVwrUwZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624882; x=1697229682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZOYPkPA5oLY2q95iWRFQ2sCIQPxY7UDWuU5p2gRkM4=;
        b=S3ZGylxG+Erd0Mcs5t5QHzT9RGuip5vEK/nIYi8KQlOHMscVG34KnuLWHHaVfJcDgd
         LZ4fE4dFxD4+d2AZ0rJ1zNYLfxsJ7gIzuL/gdiLHxoFmTsdTTQR3JmfdJZD+lD59UBZ1
         TUq2e947uPvXCb5aMXlb6wysSzTQRsz5cwhhfDHQDX544cs5Wu5vxwDyqlMgrulKIVC6
         5KTcsFaY0o0LxSt89bRDxTUyy7xyo3zRS/6QMbYTcj9U0Z6k1Bt0GNV/nzVeyeaHH5ah
         L06oKG//YxfHNcQM6JV4UHll8aPWL0L2BBgXJDcbvKBxNIYzWmn2Y4dhtDcd9ZqUV6fw
         DeYg==
X-Gm-Message-State: AOJu0YxU9IY+TjJdL0nfYlRbpOHW/MnvMtUkuruz1qpydfvhKKKhDBhT
	Jpy72/cAwSZrZ2vSsPZpy3pUAg==
X-Google-Smtp-Source: AGHT+IEWqt2kL6vpwyP4uo7HmC8l8zOT4kXDp6UjWXjtm8QKJU+xVORM9uyR9196a9oaKsrfAArylQ==
X-Received: by 2002:a17:902:e884:b0:1c7:36ff:1feb with SMTP id w4-20020a170902e88400b001c736ff1febmr8572849plg.17.1696624881958;
        Fri, 06 Oct 2023 13:41:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001b9d7c8f44dsm4371587plb.182.2023.10.06.13.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:41:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Kees Cook <keescook@chromium.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] irqchip/imx-intmux: Annotate struct intmux_data with __counted_by
Date: Fri,  6 Oct 2023 13:41:10 -0700
Message-Id: <169662486912.2156024.14062339724876062907.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175131.work.718-kees@kernel.org>
References: <20230922175131.work.718-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:51:32 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct intmux_data.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] irqchip/imx-intmux: Annotate struct intmux_data with __counted_by
      https://git.kernel.org/kees/c/839c5ee04f30

Take care,

-- 
Kees Cook

