Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76492F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:58:08 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id q76so10665531pgq.10
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F4n+C6M9Aw1zMVfcPORGXMMVLEr2xX50zcVOAMomtNI=;
        b=ORcydA/uFIOR4odJFAV1XxY+PcGt2zebDpivlroBUEMd4PMs7KqLIIwFyrSrx1hQve
         IphjhRek3rFH0b0wKiFSafB46D14B6zsDaIUkgdWyUVQ4HxGNE+LGPeFItDUMmv7WDWQ
         l82UrDZKj39Vo1sdMxdDyg2ceu7AxyeuoD9GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F4n+C6M9Aw1zMVfcPORGXMMVLEr2xX50zcVOAMomtNI=;
        b=fc2KD7CKVa9XtC9pLvAg7Sa4QFaJieBBSa2RhXlE/CuOG2ysljNZTgzXu2IA+/0z/I
         TFDA+oihy01lVhKpPFAaCXg3RyxwMdbR+cOvBSVAnlB+fFmdiKWaMZv/e4f4vRg+kzTH
         Ze0J6Bge4/eNuMvARLe8agoz/j2AxyNjh0iqfj5I6koNS+GagU8pVMBJjnuWWqYWNyb1
         qVLVY3F8QymR2hx62JWoF3aA7uBTZ6sBCnw+vqggNye1omdhfE+dthahxRIGUCew1g7D
         Hx3gLYSL3jddJ4TmEJijlM+C0yODrbFTWyNrnhKasjGXp7HkGeoJxyeM6V9bUSMeH4vQ
         YpeQ==
X-Gm-Message-State: AOAM530QXAU4pqW2tvgowsuGANr2gpnKbUe0PlyjFZt7qt4FqaORbnEi
	40Ww9HdsiYIm8/DdQfBYSZu7Aw==
X-Google-Smtp-Source: ABdhPJwOtndnmF6wotSc9dg7+c73fyG5+SBhQYVy5w8DsKeAwdpvOT6FhYjPgzOsGs5Q1NOcr1h40Q==
X-Received: by 2002:a63:190f:0:b0:3db:972b:46bb with SMTP id z15-20020a63190f000000b003db972b46bbmr7949134pgl.554.1652565488145;
        Sat, 14 May 2022 14:58:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o14-20020a655bce000000b003db8dd388afsm3840321pgr.10.2022.05.14.14.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:58:07 -0700 (PDT)
Date: Sat, 14 May 2022 14:58:07 -0700
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
Subject: Re: [RFC PATCH v2 17/21] x86: Add types to indirectly called
 assembly functions
Message-ID: <202205141458.80233E7ED@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-18-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-18-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:55PM -0700, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, assembly functions indirectly called from C code
> must be annotated with type identifiers to pass CFI checking.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
