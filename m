Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41010949
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 17:29:08 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso5131172b3a.0
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695662948; x=1696267748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aMa/e/MpMROFsp3gARJijeh7sh0P+MuDKdlmUY9kPc=;
        b=SZi4LlKyPht8ikY6MWb+H8beQ86PB5EDhHf5u9c23xHp6iWJ72lMcVfKOFPpx5x3gA
         da3aD39kuagIKIDr3dWpwObK+g0gDsex37YOIkKnXwmsWuPvUv/Se1DBBjKCJnXUPNbF
         QK1+fsnGsB7Z8Ovu9PkJQSI8X+wK479jIe8vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695662948; x=1696267748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aMa/e/MpMROFsp3gARJijeh7sh0P+MuDKdlmUY9kPc=;
        b=bam1BqV3bAWOFXWXosYC6fVPosJ90+0oVzEHNXdvCoiLZ4Q9h9ijgc9Smk/aoe8Ggo
         9JFOUhscA2YCodyNZHaDJ2IuOVmZ11GLNGipE855MU+lLDxVDMOY2XylsxZAarXCxSf+
         wxaa6gsgx1GKLtZZnOxgXLf2H9f4XQ+9j7Pc3f1WJb7SGFMT0eFcaw56dc9v+55hCSHv
         /QIKcmKaMaPi6x4qdpFKYDFKKQnB+kNQ0uOenn0O4vUzD7dFMUU2bolcX0x8kM/1V74U
         D0fNK9VhToLwA1qzAi2dqi7g/qKLvfQQzOdzr7oKTu151P0k5LC3vB88GUr+KOTKZgq4
         ZY6Q==
X-Gm-Message-State: AOJu0YweKQ+xD/oiDl1rimm7WUJ6aUIsu1ZTFFb+XkvLMAAMXr45sa3t
	auq8DWr7GhpXhkoheU4FiXESxA==
X-Google-Smtp-Source: AGHT+IGOgiwM4+b8S6Xt1BZDhFJWOaJGQxJpivA0wrsHDefHQof1Ld6BLNGIRgIO+U3XOUTHoQ7GrQ==
X-Received: by 2002:a05:6a20:9499:b0:13b:a2c9:922e with SMTP id hs25-20020a056a20949900b0013ba2c9922emr4951421pzb.27.1695662948293;
        Mon, 25 Sep 2023 10:29:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z18-20020aa785d2000000b006829969e3b0sm8345115pfn.85.2023.09.25.10.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 10:29:07 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Kees Cook <keescook@chromium.org>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] accel/ivpu: Annotate struct ivpu_job with __counted_by
Date: Mon, 25 Sep 2023 10:21:58 -0700
Message-Id: <169566251617.320041.2089067222600486912.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925110352.GB846747@linux.intel.com>
References: <20230922175416.work.272-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:54:17 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ivpu_job.
> 
> [...]

Thanks Stanislaw! I'll take it through my for-next/hardening tree then:

[1/1] accel/ivpu: Annotate struct ivpu_job with __counted_by
      https://git.kernel.org/kees/c/2eabbbb8275b

Take care,

-- 
Kees Cook

