Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD03198A5
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 23:08:06 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68a41031768so1217243b3a.3
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 16:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693004886; x=1693609686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGD8RLBqVNB4kmg9LQj/IaQhfmnGQcki3nbsh7hZk+8=;
        b=YBDu8Aja6BKRjm5FFQRjlHeOK8tj/IlFyW39z6NGh6TnmxaKkflBY6o1warcrowa8W
         ue9qNS6nE3FxEVPoZv1U3zrKf7ctMfV3M9xhjPZamFAFYwYxDNok3h/q7J4FmkU8ViNi
         lwMjIA9kY9voVDj76fG9rs6kikyu1/dpBveGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693004886; x=1693609686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGD8RLBqVNB4kmg9LQj/IaQhfmnGQcki3nbsh7hZk+8=;
        b=ibieAQ9HMVh1y9eyUQ/gQQVXvJrzbJLYrezolew+apqRZiW8FFwS6C5Oas7JHoQo7Y
         ZKy34+zwJLiGbT0nxpvKgyaF6XrMC6n2rji+nSPHj2eWjoucHQU18OjDHoN26Wb+rZzs
         X5xyhsz62W/LQVfvN+8ZgQC1PsyoXzhb8OhkuOWoGgSreL1+hhNiK1f/J0R9Fsg5RAJH
         tmjpaOiClQm2Pk3923+xiGs2KTeCq5bEB7D00MM5gSrvNsuyUh9SQZue21UH88OwG+pi
         whSJRFiiuia2xJLSANIRi7niMOqduyFVXxC5VAIOLBqHUUdOCpNsyyJdAJH1hXbzLzt8
         0mXQ==
X-Gm-Message-State: AOJu0YzG/6axqyuIfgiaxzGzX9OFWwpJ+920zlqlXKc4C5i+Owcqozrf
	IgDwugAal1AWNpt3z1F3fmscBw==
X-Google-Smtp-Source: AGHT+IFe1hAe7Lf6wq0l2606gcJN8yUb28I3sQVbEpzoh4vKFlqBPpa+9BRdxsU4JtNnzCmulUYBcg==
X-Received: by 2002:a05:6a20:6a05:b0:130:7803:5843 with SMTP id p5-20020a056a206a0500b0013078035843mr21060026pzk.4.1693004885827;
        Fri, 25 Aug 2023 16:08:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ff5-20020a056a002f4500b006877b0b31c2sm2134013pfb.147.2023.08.25.16.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 16:08:05 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org,
	Kees Cook <keescook@chromium.org>
Cc: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-security-module@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] LoadPin: Annotate struct dm_verity_loadpin_trusted_root_digest with __counted_by
Date: Fri, 25 Aug 2023 16:08:00 -0700
Message-Id: <169300487782.1491255.12127882114694944126.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235955.never.762-kees@kernel.org>
References: <20230817235955.never.762-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 17 Aug 2023 16:59:56 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct dm_verity_loadpin_trusted_root_digest.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] LoadPin: Annotate struct dm_verity_loadpin_trusted_root_digest with __counted_by
      https://git.kernel.org/kees/c/5f536ac6a5a7

Take care,

-- 
Kees Cook

