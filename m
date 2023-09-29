Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDC405F3
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:17:48 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bf55a81eeaso110749195ad.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015068; x=1696619868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU71GMe2vZPJu4PeEOldUHOc3AVayj7fL9fLtQI30lc=;
        b=fTsotq2TNHhzXvsD2RRqPcl5n/0SiIgXqRn4N/YC7GKgCGjskheDbRMDnf25PyYYhi
         QWDHntHsSNBwF56+S741IgKWR9RD8vBlrrfdhd1FVFRnrrDQ0tKWplLFlu9pxdainHtn
         RFChQwxwV9HcZq3nWJkEdrn4nejUEvrZSMdBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015068; x=1696619868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU71GMe2vZPJu4PeEOldUHOc3AVayj7fL9fLtQI30lc=;
        b=K5WKQGvGTI8HC2QJywNvwVsUXoBB38bILc0bJxHQZjMZGKcJoAUS4hLQmJMMWKew3S
         4qtY87dm3D4fQuJzHstgEG9pIHfczWZc/oCC99PC0j7kG3D5txthaib7bCSe0r4MEQ92
         cIjtxk3I4cDoOoHuSE9K34llqRFFcN+EMuWVr2IRZHtc4s8Xe5NHv/D6uxqV5QbZkJ0d
         UIimX7OvOeIbBUrN2nF/z8s9wZs0/eqPMvt1/2wZfA3u3IDMfL8ay3Mrky9ZrcoWv3gt
         fg9tPsPFux9IbK7Pc1r13gW9cGCTzWitFLwmH5vD0II6ClHhwQYIFAk4nJKQ9BNXlG+R
         gDaA==
X-Gm-Message-State: AOJu0Yzz3KZBOc23N4TozD1lEhSxFuMeqrXl+Fa6m1JegSHYWN+Dck47
	0bvWxAWZNNV9gOb/v7MI0MgfiA==
X-Google-Smtp-Source: AGHT+IG4PO/UY6icxXQtAI1BF64pWJqsBIhFzbwH6stuq3A2hGeiJFIxIvRsmPQ4QUBkfnWiuR6KTA==
X-Received: by 2002:a17:903:48f:b0:1c1:fe97:bf34 with SMTP id jj15-20020a170903048f00b001c1fe97bf34mr4043368plb.24.1696015068184;
        Fri, 29 Sep 2023 12:17:48 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b2-20020a170903228200b001bb97e51ab4sm5269684plh.98.2023.09.29.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:17:47 -0700 (PDT)
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
Subject: Re: [PATCH] afs: Annotate struct afs_addr_list with __counted_by
Date: Fri, 29 Sep 2023 12:17:43 -0700
Message-Id: <169601506496.3012633.16053623568371724578.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201449.never.649-kees@kernel.org>
References: <20230915201449.never.649-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:14:49 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct afs_addr_list.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] afs: Annotate struct afs_addr_list with __counted_by
      https://git.kernel.org/kees/c/7a709daf5d40

Take care,

-- 
Kees Cook

