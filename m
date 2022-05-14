Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027FD2F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:56:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id n18so11114132plg.5
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t9B0ELg8h6PY+Vl2TDucjtXSCma3zXaus6HyZVuhPIE=;
        b=W1eubUSb/5LGT0PX48eWAAjFP3e+45qNMMJH5elMun/Sun50qtQzJU6DnSdp6Eg/+a
         sZUGxqEPzvzsqRpYUlnPpUwqsnDjU3f8F0t6paJwsZDv37wZBcBScTKMeytTqcg+gQ85
         fq0u+JX10bVU5Nl4qNuwnXTR65D2Gmk7mjZv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t9B0ELg8h6PY+Vl2TDucjtXSCma3zXaus6HyZVuhPIE=;
        b=UzEc79j8AjgmtnYhq+y/+BW9R9AHQWOyNxKvlH84T77p76qCcgLZr+RqrnT3keHhho
         DiLaIe0k/hNWGEZypRSPn4/z8Jg2JRc5CwJ5cWE4MfVZ2MdgDyEM+589tIqWbQ+XqCMv
         K6kmwngwufHPXDLXEgGxjve8EXMULoY41pKWBpFR/+xUwfqSw3LVb14s3Gd7JB9wAEH2
         1rXHMrmB3b/9niH2ht/e9D6jQJ2usvY7pJz6KeLu/Rt1MqzawL9qBmtWjbja52Fjf4QL
         NUuMvRGTQ0VthNLFKN5CJ7hWLGyWtteUwc1J2MSVCSRGtoEiBOkhzoVDxmQoZZU/8nNR
         5AaQ==
X-Gm-Message-State: AOAM533SXSOs6O6h8Gr9UFnJ1GRDOI7eieRKGauMUdseWVtaJ8ol2MsE
	8JcyYe2HYv8teHdASBH+AMOsHP6Sovcdxw==
X-Google-Smtp-Source: ABdhPJxYql9CKgnQAH/6nysRco+nTc9rw86pT4JEKLv1mVouDl0G3T6mTm3JsTqv8m6tl1+a5OAhsw==
X-Received: by 2002:a17:90b:4f81:b0:1dc:69a0:432b with SMTP id qe1-20020a17090b4f8100b001dc69a0432bmr22733023pjb.203.1652565411533;
        Sat, 14 May 2022 14:56:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s16-20020a63f050000000b003c14af5060fsm3886055pgj.39.2022.05.14.14.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:56:51 -0700 (PDT)
Date: Sat, 14 May 2022 14:56:50 -0700
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
Subject: Re: [RFC PATCH v2 15/21] objtool: Don't warn about __cfi_ preambles
 falling through
Message-ID: <202205141456.72950C77B@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-16-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-16-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:53PM -0700, Sami Tolvanen wrote:
> The __cfi_ preambles contain valid instructions, which embed KCFI
> type information in the following format:
> 
>   __cfi_function:
>     int3
>     int3
>     mov <id>, %eax
>     int3
>     int3
>   function:
>     ...
> 
> While the preambles are STT_FUNC and contain valid instructions,
> they are not executed and always fall through. Skip the warning for
> them.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
