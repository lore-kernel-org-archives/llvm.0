Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2292F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:57:05 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i24so10737805pfa.7
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bWmtBNTQalwT7E03B5wIEDiQ0eZQlPfefe0AXNq0tgc=;
        b=lodgp0daVjVAFrVuduK9x3FpGkyMWCC/6YW39rpLvhxCOkWvY4zZ/6+5Rv7fAL8Bn/
         fHdhIT+p7EljVcAqr24MkzageKig7La0PwlLxPvIxxezTK3uZxeoKWeTm3kcQ64tnVka
         rBDBytXX4Vo/T+/xsB2V/f2H87aTVSxZPsySs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bWmtBNTQalwT7E03B5wIEDiQ0eZQlPfefe0AXNq0tgc=;
        b=ERE95aH8mhVOOiAoRtUZg0/ZaTjlf8CxnKJnRRNbopuGymFhfNXsjCd/SVc/4N8Wqe
         y3PxVW7RJJgOWYXgUFMS/K6uSPTyfx15AttjRi3c8bAEJ1HaHUWxZc7SYKLJDRxSP0DZ
         LdgKncIwOEJgwW4muLVRlfuz83RlUegKeCo18cnInDGYAVUqMv6SFjQv+dEOe1X1YEZC
         r+1Bfb+7XgZrlOBCzHh3PsqRJGWIO/wAwtRpP0upr70g7fSTZMzIBQiBlZn06+MnZCWH
         yQxtLoDWoTS5eneAO00SM6SYFt8kwWeTs48xoILiCo1bqvpX6oA6g1yL8fxD7OpSpmR6
         LgMg==
X-Gm-Message-State: AOAM531uifU+n5z3g7PgOh3gSxo4Q481zPIHh6sDvYiACt5ArUrRP1RA
	NVA3UOf4y+hGvBAeaagXOe4Mlg==
X-Google-Smtp-Source: ABdhPJwk0yE4XXGUlIDZlCRDV6CQzbYKn//JmrGMHGihO2a3kta7JYbfAvpqhpWeoOwljf3XaDTA3A==
X-Received: by 2002:a63:181c:0:b0:3da:fe5d:90f3 with SMTP id y28-20020a63181c000000b003dafe5d90f3mr9379364pgl.350.1652565424600;
        Sat, 14 May 2022 14:57:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id fv7-20020a17090b0e8700b001cd4989fecfsm5696349pjb.27.2022.05.14.14.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:57:04 -0700 (PDT)
Date: Sat, 14 May 2022 14:57:03 -0700
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
Subject: Re: [RFC PATCH v2 16/21] x86/tools/relocs: Ignore __kcfi_typeid_
 relocations
Message-ID: <202205141457.6BDD89F@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-17-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:54PM -0700, Sami Tolvanen wrote:
> Ignore __kcfi_typeid_ symbols. These are compiler-generated constants
> that contain CFI type identifiers.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
