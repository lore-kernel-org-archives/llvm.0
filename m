Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DE6168BD
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 17:58:56 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf3a2f4528so7316335ad.2
        for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 10:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692381535; x=1692986335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXWn1H6PaMCP3yeQaXdUby2KRE3fNHvqcyLkYIyGiaw=;
        b=VOhEHDw6QsEW+1ZsUQGRv4DVy8ZGywkEJnmW+FmHNmUOmTi67RY6yU8Z0Vl+8HhQr7
         2+JhLYBREnkB743S/lCi3ST+HvJa62ONXc0rDCgaFSidIjQ/J0mopW5eRaBa6wHk4wB6
         fOsfLymp+wlBamHiNkg+XO+Wt7AwE/NilcLxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692381535; x=1692986335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXWn1H6PaMCP3yeQaXdUby2KRE3fNHvqcyLkYIyGiaw=;
        b=FTRHNi01rZkyQwwNO9xEXW0IySnhP5S5M7PRB/Ljk38oWyGRU6f6TOZhNmTtF4aE/G
         nrjsu65CPKDnS+GfgY19lHFfVj1I/NLtYdU7cXR27SafOjhoiqHKmW/UNOiYTAiJalla
         cdrCu+Ly+hGnAkigfa/ye1u4HeDAex6iBGtqas2Q3XmBo+8PRJuzJcycsOK/iEtNAcbB
         OfO65nSlyC1thhsvLjKcriUEVijGZGIRnDuTkOO2O0+ze6GKzFxQf/gC7A9q/Kh40wHK
         Be2RHpw/MKFEfu1VzBahChI0RziN/7U4b2O2Ho+dBlB21Cjn2ir4IhGsgxQHIaAqbXSQ
         r1Sw==
X-Gm-Message-State: AOJu0Yy+7pXCCXSjsoaP8szREUto2tWvim1ghBnxaS8X9xBi4FCRhORf
	7WwxzWhbwNz0AYZBbp3+/mhKqg==
X-Google-Smtp-Source: AGHT+IEfibPi7yaGFSOCm8RGtUYUSuEPp7lZFgkZrkN4e6SwvT5vmrzO8rZthv/Hx28otk3QObEbbw==
X-Received: by 2002:a17:902:c086:b0:1be:e7ba:3a97 with SMTP id j6-20020a170902c08600b001bee7ba3a97mr3173197pld.15.1692381535438;
        Fri, 18 Aug 2023 10:58:55 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q18-20020a170902dad200b001b892aac5c9sm2023752plx.298.2023.08.18.10.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 10:58:55 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Compiler Attributes: counted_by: Adjust name and identifier expansion
Date: Fri, 18 Aug 2023 10:58:49 -0700
Message-Id: <169238152725.1457791.7913447764812747495.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817200558.never.077-kees@kernel.org>
References: <20230817200558.never.077-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 17 Aug 2023 13:06:03 -0700, Kees Cook wrote:
> GCC and Clang's current RFCs name this attribute "counted_by", and have
> moved away from using a string for the member name. Update the kernel's
> macros to match. Additionally provide a UAPI no-op macro for UAPI structs
> that will gain annotations.

Applied to for-next/hardening, thanks!

[1/1] Compiler Attributes: counted_by: Adjust name and identifier expansion
      https://git.kernel.org/kees/c/c8248faf3ca2

Take care,

-- 
Kees Cook

