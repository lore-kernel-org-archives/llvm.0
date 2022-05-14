Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B53C2F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:54:18 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id i1so11104719plg.7
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FykryA/PR0f3p83HjJunId+gp3pqJzOIiL8j+Agnd3A=;
        b=P0ytf3VHbbsXrhqae2Zd5Ll2MuTMZ+sX3YHcECJ6uHTAKjjZna4wFiZzv5hRwMvEBn
         MxFkALqYT4Cep0hR0dt+cnddTbsgr75zHgcZlKpFQ9CIHgn+CBZ3EJ9Igtchk6wXVYPF
         Y/kmkar9pi2d7USkoTKnPI5F2B7oJSyz12a68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FykryA/PR0f3p83HjJunId+gp3pqJzOIiL8j+Agnd3A=;
        b=N2lAiuAD3ywfP7Z6nn7M0n3AGj/whkJkFUG6FQNLNgje8pNClwwH/AV7y3MUdn1fXr
         ls5RbOEVKyloHyEjNQ8sQDUy+5ls/d1J+/Fey7uU1Uz++CDhXsMt1gzWhOdxZtJ9wtdO
         5moPtyMYjJ4WR786QXQpjBvn7PCnq+5cqgEgjP35F92lnq+DaxS7HHJqJXrtLh+H0emq
         UyFHRWYQkmpw45bvpsUIhar++bwozJAyi8PjpPKiqbuZRCr4I3T8el+NAy0kGl1UBg1H
         xi8m+vFhlPw0Mcx4QLW28M+Wd710Rnltgnljp0+dytNahzm1P/r6btogjJSPKCcj/Zup
         bp5g==
X-Gm-Message-State: AOAM532HH+5a3WJaaQ3d0vfyzF+JWPFfSbh5ge3FjQXDKnZus3R3gLdn
	0TkdzxFQId+KneLyLjLctnqkfw==
X-Google-Smtp-Source: ABdhPJzoC13YHvqAZkelFuizL5j4/KrYwDhjo/xw/hl3PuFmx/isLndYV81BpaWdnzBIXYZT4z2fTA==
X-Received: by 2002:a17:902:d507:b0:15e:afc4:85b5 with SMTP id b7-20020a170902d50700b0015eafc485b5mr10971844plg.52.1652565258544;
        Sat, 14 May 2022 14:54:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id fv7-20020a17090b0e8700b001cd4989fecfsm5694602pjb.27.2022.05.14.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:54:18 -0700 (PDT)
Date: Sat, 14 May 2022 14:54:17 -0700
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
Subject: Re: [RFC PATCH v2 12/21] treewide: Drop function_nocfi
Message-ID: <202205141454.9EBF450@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-13-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-13-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:50PM -0700, Sami Tolvanen wrote:
> With -fsanitize=kcfi, we no longer need function_nocfi() as
> the compiler won't change function references to point to a
> jump table. Remove all implementations and uses of the macro.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
