Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF322C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:55:47 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id l6so2450363plh.9
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CeDioKlYWP/Ln2/sv3Boh4vbm3yoXHdApCIilZ4yhGw=;
        b=adSofeNpkzFQ7ekSQ+w/o5WGdQNGCajwgRa++HMYHPPE9dE7+IC42Fj/GAeu8fYZ2r
         T/XBrlk0nCBGvuFRp8tBJuAGrzUUCHkF6HcKiI/zzyA7Z6Ea0LF0Z2ezCoSZ8jcy8UHd
         LFxEWL7AMGZDGCcK2aRmNHSiq6g3Eol3eDjVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CeDioKlYWP/Ln2/sv3Boh4vbm3yoXHdApCIilZ4yhGw=;
        b=sMmKbgQnc4kwsH9rhVsiO/kqVVB97sSUCHL2Gdwm7iNBD05SESVTCWfotNkEwRqqtk
         t/Jih0MQjTMBr5zIeaEPnx+TFC/87Xb94qon6qad+tzJFBCEsp9cZX1t0uBIe3mM4p6H
         f82peW7BwUpMB7mOSLXRta6DPKu/CmLc1nKEtQU/ZzMaUAkhh94rt7YPkkckpmMI7VRT
         OhlySMlJ8RKJOuCCj+XPtWCzEIgnI7XBnur7OeTZSdHTm4AleKA0kioo00pOMArsjqUA
         ft/OjDBiVJz0rdKIMMwTCOvzRcp40YMmc7++CxBGY23WWUGr0MUHXDxQwLgh0IfjZjRI
         IexA==
X-Gm-Message-State: AOAM532zZDFnt8SbmjjXpaVJHa2CCDgtKGhv38Ke9f00RVqZHdazK+6Z
	apcbv90OaEi/CSmCHbwtxMD42g==
X-Google-Smtp-Source: ABdhPJwbaTpa6edmN31oVJb/gCU2mYzliazMjcWHBH0jE37kLU9+/IH13a8ovSasYEkmTLsZf/xfDg==
X-Received: by 2002:a17:90a:bd04:: with SMTP id y4mr1109096pjr.9.1634151346914;
        Wed, 13 Oct 2021 11:55:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j6sm225896pfb.175.2021.10.13.11.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:55:46 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:55:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 12/15] x86, module: Ignore __typeid__ relocations
Message-ID: <202110131155.3A730AB3@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-13-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013181658.1020262-13-samitolvanen@google.com>

On Wed, Oct 13, 2021 at 11:16:55AM -0700, Sami Tolvanen wrote:
> The R_X86_64_8 __typeid__* relocations are for constants the compiler
> generates for indirect call type checking with CONFIG_CFI_CLANG. Ignore
> them when loading modules.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
