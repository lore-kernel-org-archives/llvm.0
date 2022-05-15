Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32666623
	for <llvm@lists.linux.dev>; Sun, 15 May 2022 03:19:52 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id a191so11081479pge.2
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MEi80uS+Hv7whcnPDmWumoTBr+8suRXlPOFaSGMgA4w=;
        b=k2E2gWVeuIcJmXctth50gI+JpHO8Jdri7XEy81BsIY5b7LBB+U+mfEZEpjht24f6UP
         dpH1IzclL/xXavJ7dhUZAwraqMh5bh6+PNchYFKigMWuFKoAjMlY5pRxsSmlGENEVH77
         eDbavVNzNaxKdVIVDHOBiq7SWRKR8gbONOzLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MEi80uS+Hv7whcnPDmWumoTBr+8suRXlPOFaSGMgA4w=;
        b=QfMSJEMm5qElBvHLJvZYIPjJngeP4/oyZc3Q8R/oj4dKwOJzBZBDIXbE1KKLPLtU8X
         9NIEXMHT/OhBDIkY/hflfoZBcrkx3evsO+hxrlsK+vRIE7UsHXq47mrVwBHUOEgPLbYQ
         Ron5C++WWxQGpDLJe/ccPYNU8T5HnZGkoqtIjCl6MrEmLuIzg0KpCqcO+JbkBmMwsWM7
         UFzKbPfOZJkjdEThep3ClNZmKNjVdaLZdiMhjHBFkUnm67BMoqUpi/xIgR7wX8avfgYy
         SnQA10vW8PiuvNcwHw8r3i5a/JdHlLCJjZzJgmImBfY9ZS2oD4jgNeHFcP7AQ3QUfHtV
         1hJw==
X-Gm-Message-State: AOAM531gfQKUkfxRdcuZWzt1WB2Nqzyf2MrNnL/92UmjnYGiFVKn8OzY
	J0aASIFfvpBusG0tIA4DVrL8vg==
X-Google-Smtp-Source: ABdhPJwR7XZOxJrS4oIzgQbamR8MN0/jGNaXZitp2YdTHflXf1xkjcnFI+uVSj0ggVkl4+1JzhTJtw==
X-Received: by 2002:a63:8843:0:b0:3da:fe5c:9374 with SMTP id l64-20020a638843000000b003dafe5c9374mr10329905pgd.342.1652584791498;
        Sat, 14 May 2022 20:19:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b0015e8d4eb27csm4411356plg.198.2022.05.14.20.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 20:19:51 -0700 (PDT)
Date: Sat, 14 May 2022 20:19:47 -0700
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
Subject: Re: [RFC PATCH v2 20/21] x86: Add support for CONFIG_CFI_CLANG
Message-ID: <202205142016.DB5DB8638A@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220513202159.1550547-21-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:58PM -0700, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler injects a type preamble
> immediately before each function and a check to validate the target
> function type before indirect calls:
> 
>   ; type preamble
>   __cfi_function:
>     int3
>     int3
>     mov <id>, %eax
>     int3
>     int3
>   function:
>     ...
>   ; indirect call check
>     cmpl    <id>, -6(%r11)
>     je      .Ltmp1
>     ud2
>   .Ltmp1:
>     call    __x86_indirect_thunk_r11
> 
> Define the __CFI_TYPE helper macro for manual type annotations in
> assembly code, add error handling for the CFI ud2 traps, and allow
> CONFIG_CFI_CLANG to be selected on x86_64.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Looks good testing with LKDTM...

$ echo CFI_FORWARD_PROTO | cat >/sys/kernel/debug/provoke-crash/DIRECT
[  144.084017] lkdtm: Performing direct entry CFI_FORWARD_PROTO
[  144.086138] lkdtm: Calling matched prototype ...
[  144.087833] lkdtm: Calling mismatched prototype ...
[  144.089777] CFI failure at lkdtm_CFI_FORWARD_PROTO+0x34/0x67 [lkdtm] (target: lkdtm_increment_int+0x0/0x7 [lkdtm]; expected type: 0x7e0c52a5)


Tested-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
