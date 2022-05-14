Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75732F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:58:32 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so10887025pjq.2
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JzfWF5xEUyLdKqhX0/BNfMvKzUJWiSaq1KcpW14iYMw=;
        b=WUlUbVRF6tirwuKwDy2NkFQO/d2QfrAUOspNRkHBFDb8zh5PYzqPFuh8T5V1C13dXL
         LFH13+Od0CwiqKj4zQII9grfBvdPGnYi6BlF50c5YX57xB7aI063mkiBbOk+Ls4I51VW
         Ea82sWo3QQSM5HKAsah/AH9GJKBYLeEbbBlqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JzfWF5xEUyLdKqhX0/BNfMvKzUJWiSaq1KcpW14iYMw=;
        b=od4LzZyfxOpg5NCdxe5J7ReauR3iig4eN2WyD8Ykm+3zldpo7gKgQnT/tcsEQHDYur
         DklMBzLhuaSglSLas+EBw/EXt6h99f5REvJvr/b0IxfXwCSEHw/oxa7/1nKSHPWpmDjG
         ZZJhgZGg9v1RSsumjwNOyRuq+W4/jt975fDaaFjGol/1XB3e9xUd1k0Qi8Cp2br2cNgR
         WMVqsvjG+cxatCBzmdDthbkjpGzHGp1u1doJhBPdnV5vHgFPE0usozmfZtoxp+IqXY1I
         3b6G+iJu+qt6Vp1mg/WrhaNX275AMlVq9PphJzHe/YKIovjhVDwMHp2hBlJda+14iMQt
         iM9Q==
X-Gm-Message-State: AOAM531mcwSC5RjzzB80XyAWbdbUFUKNh3FRD82SMTJpJF0KiOhNIMBz
	GJ9LXGfB89X2pDJMk6Bc/IXixg==
X-Google-Smtp-Source: ABdhPJwpfw7TbvPXHehxghPWQ4Qsa1e3wKrxEzkB//8n2/gpnFICcaugpHJZByhUFKa3kZET1C0iOA==
X-Received: by 2002:a17:90b:4b03:b0:1dc:6554:1bf9 with SMTP id lx3-20020a17090b4b0300b001dc65541bf9mr22748680pjb.246.1652565512306;
        Sat, 14 May 2022 14:58:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902650200b0015e8d4eb264sm4182146plk.174.2022.05.14.14.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:58:32 -0700 (PDT)
Date: Sat, 14 May 2022 14:58:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v2 19/21] x86/vdso: Disable CFI
Message-ID: <202205141458.54A04805B5@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-20-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:57PM -0700, Sami Tolvanen wrote:
> CC_FLAGS_LTO no longer includes CC_FLAGS_CFI, so filter these flags
> out as well.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
