Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A480B405F3
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:17:50 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c61bde0b4bso87552825ad.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015070; x=1696619870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdzIkpOORPZHV5wenIN0SGnXWAeNAW/YV8thKJqiWYA=;
        b=Y5UZCPOze/qMyTChY65Qgj5tMT4ZM5/pfRWYWoaMH+pHauAcEY+NpStmaSneCjyaGU
         ACJ08c2hPRaM0ZyPrb8ntFEVhiARSy03LMiLGo45l1XRgtS51rOhUAr2BRPBuSP9f56W
         qwbCOYBVxHLeZPtVSWmI/2nlhOPv6d01txHB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015070; x=1696619870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdzIkpOORPZHV5wenIN0SGnXWAeNAW/YV8thKJqiWYA=;
        b=lTCS87l0Yi6mQmVSV/81b+OAmZLmIsHZGyRowHs0jdEw8EMKu9TgRtj70yrI62wwM2
         NBMIkOoFdwo7Pf6bJdsFIkyMTsQzG5MjW6fRwPYbiPuVQoEYDJxLirFR0Bt7c0epgDph
         YC/Z2VnogcqXFP95EnblBncp5Ydq+Fcxo9sBS1SgbIbPZGO6UQvG1I1KmWJSUMxk59Av
         GgNmMqw3iPCBij08hZdPU5moKl79+FH5QrDT5GRToAuiSIBrF6pcSHxasWrwl7/1bqPS
         LUzK8rZ3BYSMLAwRdWNrlqHCgcJj0iSaXULkAEG8+8i/iq5l1HG//EjzrUfOilLtoDJP
         Kteg==
X-Gm-Message-State: AOJu0YzZZwBCpTgLSQiJCB5X1pve7AAGzreGaPQWBsGwhak7eYSgIlMg
	CKZfqE3meIsi8oFSrbbGj2tp/Q==
X-Google-Smtp-Source: AGHT+IHrw1fOyPjJ3jkkEg8ObgcF8Wa58J+gcFGUj5kMKDI7VBoc/1OzIbj48UaSw/kDEy3t3ivkGQ==
X-Received: by 2002:a17:902:c38d:b0:1bf:8779:e03f with SMTP id g13-20020a170902c38d00b001bf8779e03fmr4898508plg.68.1696015069936;
        Fri, 29 Sep 2023 12:17:49 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902b60800b001c1f016015esm13499323pls.84.2023.09.29.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:17:48 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>,
	Kees Cook <keescook@chromium.org>
Cc: Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] afs: Annotate struct afs_permits with __counted_by
Date: Fri, 29 Sep 2023 12:17:44 -0700
Message-Id: <169601506495.3012633.13895603881576903782.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201456.never.529-kees@kernel.org>
References: <20230915201456.never.529-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:14:56 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct afs_permits.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] afs: Annotate struct afs_permits with __counted_by
      https://git.kernel.org/kees/c/45faff97751a

Take care,

-- 
Kees Cook

