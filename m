Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A508468A
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:23:36 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id mj6so9883843pjb.1
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=fS7xlk8exOPxYXHFLdn8iabPIslSYjRlhaKGdRBrbZw=;
        b=MNJusS+5Xh80LA5c1pprHLLub+S28s+9/p/b/OOz7IAJSptPqkqQlXfv5FO9nna7My
         MOnGz7gea2rJeQf4IClBH2ymUQoF910kZAFSn4Op4vV9G0z3m5++AuppB6fHkfzGO741
         uZaElfhQRXmG5iRG0vhJY3t97cmpA8p041qGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=fS7xlk8exOPxYXHFLdn8iabPIslSYjRlhaKGdRBrbZw=;
        b=u7GexgSUWxEvsU9WxPwnXNfTHr36IcGhEcAqavRg/2ZTAspgkKE2w2h9SVULvpAD8i
         /4m8yj3gcXVjDjGHj22kJJnf64WcmSZ9nbhJe0bL7tcRo+35zRyYlTmbpbv2fio1hdUx
         X9IIEZZ0N7XLzd3yw6VhiT77T0SVULXc1lxvVmXYMuuXvrJgeWJ9TJocTc+m/y2Leda9
         rzJTL1bV/HSoUE1ZGuz5tOfr6rccwsZr6t+t6dIQ38iQUK68Hc/hiGPHq380RE6Jga6o
         iYPxwix9P9tdWpxHpDtFNCENFyS7pkdBhKGThBU3EJSrircr+g3GnFXXunJ5nG2BkM1v
         0YpA==
X-Gm-Message-State: ACgBeo2NQoVYVMf435V7Vv4RuYmkMryDCOrsfoFqc6SCsPoUxwwjbAtL
	2/+ZBBt+CzFN+ziVTwP6iqNwDQ==
X-Google-Smtp-Source: AA6agR6p0pm5G+0tEg3FHLipUz0PBlM7zrfbRO94La2RKxHAydUxfZxpVV8PdPYV5O1NMEFkLbhxJA==
X-Received: by 2002:a17:90b:3803:b0:1fa:ebea:e90e with SMTP id mq3-20020a17090b380300b001faebeae90emr4544973pjb.111.1661970215991;
        Wed, 31 Aug 2022 11:23:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z9-20020a17090a170900b001fe136b4930sm1590311pjd.50.2022.08.31.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:23:35 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:23:34 -0700
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
Subject: Re: [PATCH v4 16/21] objtool: Disable CFI warnings
Message-ID: <202208311123.CFD2B1B9@keescook>
References: <20220830233129.30610-1-samitolvanen@google.com>
 <20220830233129.30610-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830233129.30610-17-samitolvanen@google.com>

On Tue, Aug 30, 2022 at 04:31:24PM -0700, Sami Tolvanen wrote:
> The __cfi_ preambles contain a mov instruction that embeds the KCFI
> type identifier in the following format:
> 
>   ; type preamble
>   __cfi_function:
>     mov <id>, %eax
>   function:
>     ...
> 
> While the preamble symbols are STT_FUNC and contain valid
> instructions, they are never executed and always fall through. Skip
> the warning for them.
> 
> .kcfi_traps sections point to CFI traps in text sections. Also skip
> the warning about them referencing !ENDBR instructions.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
