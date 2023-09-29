Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D76588D
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:23:16 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c3cbfa40d6so130359565ad.1
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015396; x=1696620196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uITMbz4SVXsN3h2p6aW3e9TM2Nhes+MRerhsiPaKZNY=;
        b=QelhGZYLE5xFR7aluMcY/7x0KWfoE0ifCWjYXD2Wctqw2YUCPZ6Oj6j0mzgCIoVBA8
         +uOH7PTktaxguldosrXeF3AvvAOBrwPg/7Dq+7plCZq48GPFjgEYRnu8pKwG6OzvjU67
         oLJXFEhnIaWttCwdNcG+JcsbKYdsqTI8Pe1dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015396; x=1696620196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uITMbz4SVXsN3h2p6aW3e9TM2Nhes+MRerhsiPaKZNY=;
        b=XyiutFGMAOimokPAkH6L88sfx88cafZcusWIYMqFRm7Nk1mAiAhPyY4GZOvDfaRirx
         afjo2Jp1jkyjYzwxP6dYsIzLxAjN5yzNxcfZNK4hLuk7SGtk+UWDOKqG+5gO/YxYbEpi
         Y+V5hc8gJVeAgLyBUbf/7drTV/AppSentHQ1e7bPaIczLBvTZ4YD7UfQTxkhUziGJ7uk
         +zpEBjXVy2cpUYoXyf0ev2a8M8fMxdFCSAPHvRpPDLjU9788ifvGYg5PxqOlc26ZPr2a
         xPcyBzOy01a16GD5NkcqWbp2+rwyds2ByDQe/FKKhSpc2UrRwW1ISVXXXBi9+Gmx/DDR
         fKnQ==
X-Gm-Message-State: AOJu0YxztZI+HuEMzOpJszh1eLPm3HphhCiGYRNQdQrJmvoxpqWkkYop
	18Npy86CMVDcbSDi2twljAnq5w==
X-Google-Smtp-Source: AGHT+IEl0LvVWNhM9XEtVBHF0eypOkjX2wKUhmTs9VMGSa1/dOxPXszHikcyziAnfqiFcWEiXhH1Og==
X-Received: by 2002:a17:902:bd94:b0:1b8:4f93:b210 with SMTP id q20-20020a170902bd9400b001b84f93b210mr4598464pls.45.1696015396110;
        Fri, 29 Sep 2023 12:23:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b001b8a2edab6asm17138005plt.244.2023.09.29.12.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:23:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Kees Cook <keescook@chromium.org>
Cc: Anna Schumaker <anna@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-nfs@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] nfs41: Annotate struct nfs4_file_layout_dsaddr with __counted_by
Date: Fri, 29 Sep 2023 12:23:13 -0700
Message-Id: <169601539363.3014051.18337419689508974314.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201427.never.771-kees@kernel.org>
References: <20230915201427.never.771-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:14:27 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct nfs4_file_layout_dsaddr.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] nfs41: Annotate struct nfs4_file_layout_dsaddr with __counted_by
      https://git.kernel.org/kees/c/4d8e2b2fb0cf

Take care,

-- 
Kees Cook

