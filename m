Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BCE374E7
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="If16ysVo"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c62d61dc96so19160465ad.0
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624883; x=1697229683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GURnAZx4gtWmv3AO8Lj9TIfuZbs5tNuLiF2FqF49VSs=;
        b=If16ysVorLKcCA1JovgbbuzpJPUiMefpe6GR0Fme+1j9bfKRq2LurrDfMZq/vqqfvc
         mJhFyH+P1kYDu+BK+HSPzX9oxJK0XL/7+MZFoxDKQnFVJkRedyzHKELmNfCcgXSQSLn3
         Nm0ivM69aXyccDZL4S2HETsoDIWc4iOvz6xQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624883; x=1697229683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GURnAZx4gtWmv3AO8Lj9TIfuZbs5tNuLiF2FqF49VSs=;
        b=FQjItV6T0ysBxQYj7r6iLWOh8yIJZCOPKYkhOMFSEuBlqU8nYyD0hVG3sduw3Sof48
         mL2S57/EqZO/ULIAq6Z993HuZHYNaaQ/LO0Hzi47YWoqQ1GEUnfL9BhGvGW/S+NsbJQu
         QkQHaWyWfPbMQJmp3oRFp0H6DVnErKTB4w73xYmkyQtaSGFcDzAgmUFbclOghcZZzJIg
         BC6uMlfvOPVEEcVV9z2tzYYyJCm334P5D6eSoz4CV9vxhWMYSybUa+yW45zqgGB1lNfN
         PlKlSIpY1FUNg0KMqt5HkqaWeGhxqo/3pkG2oh4i/GorR9JWq8XHRtGQ/ij9MhrZIclr
         DdZw==
X-Gm-Message-State: AOJu0YzKavv3Bkj2nB/u2smOfLAVuJj34p7Z4InIDn/+aL5wqOhcjMbi
	BuJZx5WjivKx18txaFZUxGybtQ==
X-Google-Smtp-Source: AGHT+IGYMji8WWmS2cMJoZ5nClhJOhH5qp5E4dC5W/5rnEY2qlLb77bHw85K9B2xCd+v5N5AN6yVWQ==
X-Received: by 2002:a17:903:25c3:b0:1c5:76b6:d4f7 with SMTP id jc3-20020a17090325c300b001c576b6d4f7mr8158493plb.36.1696624882955;
        Fri, 06 Oct 2023 13:41:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902e85100b001b9c5e07bc3sm4348373plg.238.2023.10.06.13.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:41:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Kees Cook <keescook@chromium.org>
Cc: kvm@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] KVM: Annotate struct kvm_irq_routing_table with __counted_by
Date: Fri,  6 Oct 2023 13:41:11 -0700
Message-Id: <169662486908.2156024.3248243280882819249.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175121.work.660-kees@kernel.org>
References: <20230922175121.work.660-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:51:21 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct kvm_irq_routing_table.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] KVM: Annotate struct kvm_irq_routing_table with __counted_by
      https://git.kernel.org/kees/c/bbf75528039a

Take care,

-- 
Kees Cook

