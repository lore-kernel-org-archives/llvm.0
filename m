Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F81051226
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:23:16 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c60cec8041so78001065ad.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015396; x=1696620196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj4gKoTPER+a3Rg0p9JfyBeQ5oS9hCDvDWoKv93wILE=;
        b=cSwX2Xp924pI/n/INtrvxhGKrt9Rl+JSMKNlj9yLZJI3PVs4YpLjNY86ys+ReAETRq
         kpJQ5nrAIjlXhTtuRRfXgJnr6Tzny8gDZZ7L57JYHnzBo8jeDcDV9K+0iS/VIEz7Yp6h
         VToT/ZM227dh9BbtFRemmIeBhSykHAcB4LUZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015396; x=1696620196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sj4gKoTPER+a3Rg0p9JfyBeQ5oS9hCDvDWoKv93wILE=;
        b=vA3gDyXWN1FC87HHF+PsZ9sb/WSZTVekKwvqdNLlaqLlQhiUH3SoBu5BrSfBpKs+Al
         mwGuiSmhDnVrwuzMocLyk3ZFni/YyGlzR+taQFedNu9r8W8hdaQ0Jb/IXJ2aLPDoERiz
         LJAR1N6VPoX1rxNYh2qGkJs/2oYdmWSNitK9vUa1/zyhV0WRuZ1myHsPGEGOKb5xhkyr
         rKzq1eOEMiqMAlIIYwfYoKoftQyGbU53xKr0iAIQ7pLFS/I4Le647PzI0lAMJ4xDkZ5W
         4YRH7JAtBcCyj7OrS/tabOIu/VzeqMZGKn0inv9kGwPWwjfdtNGR5kTofuY6WfBJJFgQ
         MKYQ==
X-Gm-Message-State: AOJu0Yw+TfN784BNi7VIKaTS7m3H/f5GbOJKteggLo6iSi926vOIedHd
	L//r1NbDVs0vFU99K4HLtpDxZA==
X-Google-Smtp-Source: AGHT+IHeAzZLWR/XUQ0/HfggCdQEIA48Tga8bx8nr8Ck+3J+Jkxeupd6kXb/kPWfsX+RHQbRBmpodg==
X-Received: by 2002:a17:903:1207:b0:1bd:f7d7:3bcd with SMTP id l7-20020a170903120700b001bdf7d73bcdmr5832816plh.50.1696015395852;
        Fri, 29 Sep 2023 12:23:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902d48200b001adf6b21c77sm1692175plg.107.2023.09.29.12.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:23:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Kees Cook <keescook@chromium.org>
Cc: Anna Schumaker <anna@kernel.org>,
	linux-nfs@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] NFS/flexfiles: Annotate struct nfs4_ff_layout_segment with __counted_by
Date: Fri, 29 Sep 2023 12:23:14 -0700
Message-Id: <169601539364.3014051.4375069928549336780.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201434.never.346-kees@kernel.org>
References: <20230915201434.never.346-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:14:39 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct nfs4_ff_layout_segment.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] NFS/flexfiles: Annotate struct nfs4_ff_layout_segment with __counted_by
      https://git.kernel.org/kees/c/f8ead26ffdee

Take care,

-- 
Kees Cook

