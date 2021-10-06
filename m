Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A82C80
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 03:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633491464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hQgwvO1joc+8xZdxI7msExSbMFXW62NaKXjYt60o60Y=;
	b=FTYnuXKJCSD0NQcQApjO4E+y0vIqVU1AnLS1vassOR1nLDhwJJSQxy2gau0eAg1GOi1x1I
	ZNoyg01nctCyPxgTlEnKFq6J+54ny8FTCW9uuQtSRurFzF4ZufNBI5RvR4nUR0LEr4f3Xf
	+i4xLgcWxrhg4agSHxs0JwyUSwV9a4U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-87mkRg0MOfilMZRusfpoXA-1; Tue, 05 Oct 2021 23:37:41 -0400
X-MC-Unique: 87mkRg0MOfilMZRusfpoXA-1
Received: by mail-qv1-f69.google.com with SMTP id a16-20020a0ccdd0000000b003830ff134ccso1642193qvn.6
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 20:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hQgwvO1joc+8xZdxI7msExSbMFXW62NaKXjYt60o60Y=;
        b=5KxfLMpAT73Zhv/QlDceQGtMChCee9YrnlnnK1UUrq0WDqUMY9UdQiveDzB4buTeVS
         1bxnSIGZG87YLHqbuk5b3Usb85dHwwlJHkEJpFP+4TQsMxIQorbQondMEgcMryRdckuZ
         zwyP6Oo0swBVFZXjKf5KUiKeDJhcUVJ4PISK8RP+OaWKPj0Km/8kPqGh/DLizoI+I9Uf
         V4AYvglMnGOfjYMqxT+00tHEuiUKILL/SgQDzNsW3wc9WcaJ0WT17h2Ja92w6GbFrRT5
         Fy/Tsqb3S+EGg8uMPKrhFsb+GmyyCZh8a7DBF7lwUamYvhz4P2MhQqS8AGITpP/JV0GC
         KccA==
X-Gm-Message-State: AOAM533QiZob0FDZs+dX6fccISKtqSnsTreUHBEvR8ZMhpQzICPlQuj6
	/ZApphptfPjb1d53ousejq90pYiynqzuDaCaax6+MUrhzSEhIKgBzVX1KhyagS8NBF4mBpULGhX
	bO8dksfBc3BNnpw==
X-Received: by 2002:a05:622a:1cd:: with SMTP id t13mr24476061qtw.283.1633491461280;
        Tue, 05 Oct 2021 20:37:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1rqsQDW73oW5IpwjjqQp7qLI0RWKug5ueJvzxcJCbW+Uc/eOz0fUprINDj9JdXsUQ3ob9QQ==
X-Received: by 2002:a05:622a:1cd:: with SMTP id t13mr24476045qtw.283.1633491461113;
        Tue, 05 Oct 2021 20:37:41 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id d18sm1733576qkk.3.2021.10.05.20.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:37:40 -0700 (PDT)
Date: Tue, 5 Oct 2021 20:37:37 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v4 02/15] objtool: Add ASM_STACK_FRAME_NON_STANDARD
Message-ID: <20211006033737.7duncwbqmporicer@treble>
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210930180531.1190642-3-samitolvanen@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 30, 2021 at 11:05:18AM -0700, Sami Tolvanen wrote:
> To use the STACK_FRAME_NON_STANDARD macro for a static symbol
> defined in inline assembly, we need a C declaration that implies
> global visibility. This type mismatch confuses the compiler with
> CONFIG_CFI_CLANG. This change adds an inline assembly version of
> the macro to avoid the issue.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

