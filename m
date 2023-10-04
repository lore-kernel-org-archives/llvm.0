Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B0010EC
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 03:32:43 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690f7d73a3aso1294550b3a.0
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 20:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1696390363; x=1696995163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5OaR8DthMsUyWl9mFY7CUG1t46HFxwH/NtoS9Paoao=;
        b=ynb48crmleAf0LT5APw/vciz0WpjiMPlMmsy5vN4+8iVLv0RAh5A/mFYR2+opQ49YJ
         iU92Z+m5x0LmqcwhpV7ZLqgdk6PkuB9iJZJUnrye/7MO193avz2rLPtGFBdND9k6PGfF
         07nvKpNV8AhrIXc0oxJCxAOmrQPO4NUeq+j80sW9eEEg0Rsj+Y7cY58zF9hOUdwdOvaj
         fUov+RQoPrU8FKwRz5H2iHY6Llf6NNAoJevWLJl3wZbAzvFYwFSh3+U68U45QDry8I5T
         3eRNIV/O1cxKPOkjAKtXMJccKEVpFN0nr6z91mJvrhc8ur4LBYA2/t/kEmFK11WRsA+d
         TA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696390363; x=1696995163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5OaR8DthMsUyWl9mFY7CUG1t46HFxwH/NtoS9Paoao=;
        b=ZVQ5+MVgJmXp7MVA/y9gvQ2XARYO8gZpq6ysj5QFbmp9IcJEJzPu3nqlgMoDA+PWvi
         YLW9sCFZAUWJhq0qzgOsGdjKIUr+MTSPa+GH7YywcyaaSvbUPZg/iRKNzyNUn8OmbyHZ
         iaa5DgYWjquShp84j0PmExaVUhptgi3IgqlqCaowSLl61CCzHtpXzVzaJXVaJu4+dioC
         MpD2e0uoLkJolt4RpJYc5+BLOfUdw1wBdrQFIfq2KrBsVbOq8oteRfvf2YG13Ppco9MH
         923CzcSSqfduW7k/MBC0+YGh7th6A0tdqWqLMDykEb++1nQIcNcx/SCBy3RQM2+hs5Ih
         yxzg==
X-Gm-Message-State: AOJu0YxdHmvyd7CuG5R50ri/Gc5cIG9SaaT95ZEZ2/2TQGCgCtR0j2HX
	+QGQb8q05LAw49Lw6FALsXwtnA==
X-Google-Smtp-Source: AGHT+IGGpsEw0e3LTyT8M7WzDJclFEVAubYuk5fb/YO6bOu6xRTDtMULAYA3M1rgQmLE3v3tCyXsrA==
X-Received: by 2002:a05:6a00:a18:b0:690:fe13:1d28 with SMTP id p24-20020a056a000a1800b00690fe131d28mr1249286pfh.33.1696390363246;
        Tue, 03 Oct 2023 20:32:43 -0700 (PDT)
Received: from hermes.local (204-195-126-68.wavecable.com. [204.195.126.68])
        by smtp.gmail.com with ESMTPSA id m16-20020aa79010000000b0069346777241sm2185428pfo.97.2023.10.03.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 20:32:43 -0700 (PDT)
Date: Tue, 3 Oct 2023 20:32:40 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Kees Cook <keescook@chromium.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang
 <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] netem: Annotate struct disttable with __counted_by
Message-ID: <20231003203240.45705fde@hermes.local>
In-Reply-To: <20231003231823.work.684-kees@kernel.org>
References: <20231003231823.work.684-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Oct 2023 16:18:23 -0700
Kees Cook <keescook@chromium.org> wrote:

> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct disttable.
> 
> Cc: Stephen Hemminger <stephen@networkplumber.org>
> Cc: Jamal Hadi Salim <jhs@mojatatu.com>
> Cc: Cong Wang <xiyou.wangcong@gmail.com>
> Cc: Jiri Pirko <jiri@resnulli.us>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org

Reviewed-by: Stephen Hemminger <stephen@networkplumber.org>

PS: size is intended wrong in original code but that is not important.
Should have lined up with table[].
