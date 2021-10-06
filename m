Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8722C80
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 03:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633490991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Py+JZnh73iO8dfi3ucj0KCUA94S2WthHSRpjsAjnr5s=;
	b=f8k1wFTFWF1SFmuEiOZRis+zkzv+OXA4zqY/3uncjSCv4fUtnybsvTY+QItTFsjW02hTpo
	kY07OPwHwERWWDidStdBm7G1EbTrl2vQxb1E9tbSPclgQp1lC54KPpKog2C5XzPDdpB/7p
	D+/H0p+ozZ8CsrUUSw1AiwbGf2GejeA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-MdUndf8PMgCW5GijweFmOg-1; Tue, 05 Oct 2021 23:29:50 -0400
X-MC-Unique: MdUndf8PMgCW5GijweFmOg-1
Received: by mail-ot1-f71.google.com with SMTP id v23-20020a05683024b700b0054da5f18d2aso791109ots.2
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 20:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Py+JZnh73iO8dfi3ucj0KCUA94S2WthHSRpjsAjnr5s=;
        b=ZOqvtOM0qQyLZAoV86DIBdApnVqtGKG0Vv7v0UnaQbQ5Vrz3gTwaiRC8bKtReJsVlI
         PcNrYDFyoP83lvR8P+Mn+BpsW7fuCG4grTUb8C2nkpVC1BiIfuUXzJVDhXeKHSPLNryI
         tJ7kI9InPRHAJiRRjed8CK8xQy6WF7rN79UNUc+Ixc7y5H6Fv+DZNfNUAVi5rJ9NQPzr
         FgYNEVd87SXbWaisrwqgIv4GSnd1rltbAxOK/+bxYCcgdC0dLbar1YTrOz23rig3RcSX
         67OVprMs0GNDyNoXnyowOUb2Ai6QW/wqf1X5b0NCchzHoaDSqgdQ6pS87lSV3I1rXLG+
         YlrA==
X-Gm-Message-State: AOAM532M1cj8ekH8+YEOTxuYphK3vMXUvwRV/jAuZpeOnVQWGa7RQW/E
	o43Mo/SUNj8iSeiBihiByIImx22RKPUmV/v9uiq4IZP89wfShOmA9UklGxXA1uiHj4+AXCQoTHK
	bv9sE6xjFzRt85Q==
X-Received: by 2002:a9d:7f89:: with SMTP id t9mr17609243otp.143.1633490989299;
        Tue, 05 Oct 2021 20:29:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2vFAYge4anWPhwrb90uw13BuOS6xxF266F6ouThw1f6/Zl32C6XLGYYQ1vnCKVEYNl3IbZA==
X-Received: by 2002:a9d:7f89:: with SMTP id t9mr17609222otp.143.1633490989040;
        Tue, 05 Oct 2021 20:29:49 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id bb39sm2950182oib.28.2021.10.05.20.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:29:48 -0700 (PDT)
Date: Tue, 5 Oct 2021 20:29:45 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 06/15] ftrace: Use an opaque type for functions not
 callable from C
Message-ID: <20211006032945.axlqh3vehgar6adr@treble>
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210930180531.1190642-7-samitolvanen@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 30, 2021 at 11:05:22AM -0700, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler changes function references to point
> to the CFI jump table. As ftrace_call, ftrace_regs_call, and mcount_call
> are not called from C, use DECLARE_ASM_FUNC_SYMBOL to declare them.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  include/linux/ftrace.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 832e65f06754..67de28464aeb 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -578,9 +578,10 @@ extern void ftrace_replace_code(int enable);
>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>  extern void ftrace_caller(void);
>  extern void ftrace_regs_caller(void);
> -extern void ftrace_call(void);
> -extern void ftrace_regs_call(void);
> -extern void mcount_call(void);
> +
> +DECLARE_ASM_FUNC_SYMBOL(ftrace_call);
> +DECLARE_ASM_FUNC_SYMBOL(ftrace_regs_call);
> +DECLARE_ASM_FUNC_SYMBOL(mcount_call);

I'm thinking DECLARE_ASM_FUNC_SYMBOL needs a better name. It's not clear
from reading it why some asm symbols need the macro and others don't.

I guess it means "an asm text symbol which isn't callable from C code
(not including alternatives)"?

DECLARE_UNCALLED_SYMBOL() maybe?

-- 
Josh

