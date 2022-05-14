Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4722F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:54:47 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id v10so10663554pgl.11
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t2yObVrbf/L9Jq6+JbbAXZHKIfGO1DeBECBvtcKWJrQ=;
        b=a2vCFtT3tXCJFlaBwLlox/cAPNUXQljxjpojw0pEncSqcq0/+C10zLDNqQyY4H4MZd
         kD7/dRMNsR6kSF64Nx5WKF94/fOyf5uHx7flzonMY2TVUorztqn2oJepkCTboXILUDhF
         ufEifGfG/qIMCjWxrANBavsxx++WXTI1Q3Clc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t2yObVrbf/L9Jq6+JbbAXZHKIfGO1DeBECBvtcKWJrQ=;
        b=48UwtmdR+OR9wFzBCpaVcfu87q/n47iaY09oDU7BGBVoTjtrkqFj+Y078nJ6nPmbLV
         bXyVqaSHsg1GqFTBI66vqRBo0FwOPL2pwpqMZh25KAkmFfzVc+n97DAWOBymeAyDO4IX
         FrZUbfSZE+/bFvxd/uRcOGK+o3nonCq6ojhEYXwhNj+SrVHVKzQYFcNl7YM7OGq1dNQE
         kxhSOfDaxnF62RHGdrnedr8U7SRsvZNMLhYxkhpaM2tJ+ptU1Ax1YLUyrb7Y7+poxN25
         +SiXWWsGJoUs7y0/O7JvMVd7AOksmG47KbBaMzL7zbE1YxJ4ndECn1uGM/XS4mTZxmne
         fJOw==
X-Gm-Message-State: AOAM531Drcvu0Vqlgzzuu4lFDWBxyY49q0JueaX8DQa60Zxm8R5gqIfi
	PU1P6eoE8bPS4hTTSLZ0R0TKug==
X-Google-Smtp-Source: ABdhPJzEbT+xSq2G7nTj/6I7DpbTkFKAAE5DIrDPZRYeOTIN7iK2Q3o6lSrZl7RpCs6ZWKyW4Fzjtg==
X-Received: by 2002:a63:381e:0:b0:3c6:d5e4:fed9 with SMTP id f30-20020a63381e000000b003c6d5e4fed9mr9243439pga.553.1652565287615;
        Sat, 14 May 2022 14:54:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u23-20020a1709026e1700b0015e8d4eb1ffsm4184143plk.73.2022.05.14.14.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:54:47 -0700 (PDT)
Date: Sat, 14 May 2022 14:54:46 -0700
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
Subject: Re: [RFC PATCH v2 13/21] treewide: Drop WARN_ON_FUNCTION_MISMATCH
Message-ID: <202205141454.12B573ABC@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-14-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-14-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:51PM -0700, Sami Tolvanen wrote:
> CONFIG_CFI_CLANG no longer breaks cross-module function address
> equality, which makes WARN_ON_FUNCTION_MISMATCH unnecessary. Remove
> the definition and switch back to WARN_ON_ONCE.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

This one always felt like a trade-off, so I'm happy to see it go. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
