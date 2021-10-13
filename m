Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1488D2C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 19:00:40 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id oa12-20020a17090b1bcc00b0019f715462a8so2983726pjb.3
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 12:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vSdCvbsYkIt0Z0Dq92fR0cKB12M68Rwm2Rm4i81p0qg=;
        b=S83D+KnjIrnVXCEAw6xUqC54LMfAZq7UxSajP3TNsE7IodzP4qkKJODPxsupKv1JV7
         RBHwwjdxYBt1aj+Mkj3eJPnrmP1k1AKIcAcGx330nxxQuYr/bf9o91eAAqWtvyWUx/PU
         zrQk7dFVKsoXP9j7/aU62ewAhhYuReCo8f4j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vSdCvbsYkIt0Z0Dq92fR0cKB12M68Rwm2Rm4i81p0qg=;
        b=TP47BWbfkl3ZLDnlojkrPV1wZbmVZ+BLEiXemzSBNj/GrQFygDMrpPaxMOcsw1PWK6
         4QCAKBSkvIM/bVlFnZUOnKIfQEekOOsHc6VBAbCzOBeMapNK1osebazFHDRv05ZCBWBT
         EsXsoDr96hM5SThiGM6CQLGQjzRDu8cxeraf5cm26uU9zX3u7ph9zPfUFCYGE908fL9V
         Hoq9m5mjXgRaSBBFAnkEstnFPLXPK5zAeaJbbn0kYIQ2L2em9daauStC5nODtfBbY+G7
         jZQtGCyNM+uW65Pdnf8whN06qQcGXWtcVDQhvfjOQJBdbYnOLahJajlycNIqoVbaCp49
         TUSA==
X-Gm-Message-State: AOAM531TdpGJqe/0iPD8NaGAKt0s7LrPjDqf5sfrCqbdKbS0V2cghHux
	JBXZev2uLQPIYahs11DNssffyg==
X-Google-Smtp-Source: ABdhPJy7uZ/FwGtvkefI9YhZchrZQeeAa710u9Jhh7h46fIGalxym08H/KMiNgWsnZRij3s2r/9+RQ==
X-Received: by 2002:a17:90b:4d8e:: with SMTP id oj14mr6818560pjb.237.1634151639646;
        Wed, 13 Oct 2021 12:00:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f15sm224820pfq.193.2021.10.13.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 12:00:39 -0700 (PDT)
Date: Wed, 13 Oct 2021 12:00:38 -0700
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
Subject: Re: [PATCH v5 03/15] linkage: Add DECLARE_NOT_CALLED_FROM_C
Message-ID: <202110131200.1CAF319F@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013181658.1020262-4-samitolvanen@google.com>

On Wed, Oct 13, 2021 at 11:16:46AM -0700, Sami Tolvanen wrote:
> The kernel has several assembly functions, which are not directly
> callable from C but need to be referred to from C code. This change adds
> the DECLARE_NOT_CALLED_FROM_C macro, which allows us to declare these
> symbols using an opaque type, which makes misuse harder, and avoids the
> need to annotate references to the functions for Clang's Control-Flow
> Integrity (CFI).
> 
> Suggested-by: Andy Lutomirski <luto@amacapital.net>
> Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

I like this; I have a sense CFI won't stay the only user of this
annotation.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
