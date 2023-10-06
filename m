Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB544469
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y9isqcux"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-692b2bdfce9so2228281b3a.3
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624306; x=1697229106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fX47GVueSgt+x88lXgjrOuEvVhXaBMxhauYyZI06tqQ=;
        b=Y9isqcux11Pba1/Ra9ZAu0eN31tNLiZyABzSiQ1wdYEmLhSf3ky76nGmVe/pcwX0mE
         XFzhgdYVruDEt0TjsOUej9qrEqNe/5jKrz6Cq8hA+6cHyp2u+jEMWgliLXJxbgV1qd/b
         VpxftQLllqO7FNtuZgR5RX3UQ5LJ0dWqkwK+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624306; x=1697229106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fX47GVueSgt+x88lXgjrOuEvVhXaBMxhauYyZI06tqQ=;
        b=H0tMFhQlqklHViGImy6ZoAu2LCoLeODf2JRCAqZiDdWiniNT8otKH8GeK9Sk+ZjRqR
         16sA82Mw8VlYTh+eEaW2LSH5lv2mcU/lDFa0orIZSaGe+a/YrFxxQd1WnIoItLCWQEal
         u8Pj51ix/Vv5k0YpykKqqtsEGHMAbnfeIRLLjN4IiYeW+tAbsGkApZeRQ45AfciUUb/U
         SzX/OmljCmsq2dZJnnIScR6x23HUEf8Uvrbyw3HMWpF9ah+B+vxKsehoG3MNAhdDssjf
         xqgV8GG8vTgISkZ1lwQJUbReWuRLd+MWx2H18CFffHLpMZ7HU+n+obZoE4s94sbEEl3a
         G6eA==
X-Gm-Message-State: AOJu0YwE5Np8hFhr3bCZep6izD4U/8KJfsl/saM3UwpmsnodVNVHAwzB
	kyKjBQuPrvVqopl0svcTzDURzg==
X-Google-Smtp-Source: AGHT+IEDB4JiE6QwcjTIlFZlq6WWddYaDMaPi1FSwSZbG+KVJWywvAicRGeUH+/1a8vmGHDJmVIHMA==
X-Received: by 2002:a05:6a20:394d:b0:153:5366:dec1 with SMTP id r13-20020a056a20394d00b001535366dec1mr10718663pzg.15.1696624306130;
        Fri, 06 Oct 2023 13:31:46 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b18-20020aa78112000000b006933e71956dsm1903839pfi.9.2023.10.06.13.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:31:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Tim Harvey <tharvey@gateworks.com>,
	Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: Annotate struct gsc_hwmon_platform_data with __counted_by
Date: Fri,  6 Oct 2023 13:31:32 -0700
Message-Id: <169662429066.2155323.3293633131737633450.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175053.work.564-kees@kernel.org>
References: <20230922175053.work.564-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:50:53 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct gsc_hwmon_platform_data.
> 
> [...]

Since this is a trivial change and it's been 2 week without further
discussion, I'll snag this patch.

Applied to for-next/hardening, thanks!

[1/1] hwmon: Annotate struct gsc_hwmon_platform_data with __counted_by
      https://git.kernel.org/kees/c/e909028ba701

Take care,

-- 
Kees Cook

