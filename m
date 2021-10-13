Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0460B2C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 19:03:24 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id ls18so2964972pjb.3
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 12:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iv6F8EdUVptzUcmUANbF0d3VY4H4nepm9NcMDwb+Q2M=;
        b=QCqvZgQSjJeThpfGG6mDINdKSxpEJde0lHGEs529BoaLFmGKSSa9/BwOze1gFeBrkc
         lLVjTB5wROe00bVWuz94F+yf4Q8zhyBUKuijtUfRhp8lL91hUJWMFemYgH97mMeJfU8D
         HnOrgKGJr4OybKcAM1oP7lCM7jrqjiU6yWgkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iv6F8EdUVptzUcmUANbF0d3VY4H4nepm9NcMDwb+Q2M=;
        b=0PSV1bj9hY5g8vzaT7xJuF8OlnAImhJrWb+vP2gQDMuG+uRnx4JGrSD3NoBwEXmK13
         Z9GE9OQPUhVbjP2KWSUKdHmPuj7J2UxmOS005rRTbOYC29Ev1ktN4oSI0PabFE2Mp5nr
         JsIhWxflgPmlDKVFN7iCMTYj29jq95Iu8dwbb5qkCI5Q0XvNZmQxqfIBxWsrMmzrOD/R
         kMTOYntiNrkZA2Z55w5dGl6TwtBPZNsQXh5r6sWxDHHhSAneGDaFeL5JrtCLBwZoi/Ln
         yEMy8fTeW49DRuTowoxW1WuLo615Z0xyKwbD7qclckopmXU1dugXzpF0piFU738OQ2tq
         Mi2A==
X-Gm-Message-State: AOAM531P0k92JbvZcQ3at4+rluAQg2KbsBHPTMSXY7cryCnjMfmzgwlJ
	7giuBOLrgcARMum1TsaKZvsIkQ==
X-Google-Smtp-Source: ABdhPJybFKFUEUtMWbN9X9Wd7+oHR82JGwqbytlB4hKD6IKyhNeTw4u55lNMXBn2h9uN5t6kBfV/0A==
X-Received: by 2002:a17:902:c409:b0:13f:1a43:c5c with SMTP id k9-20020a170902c40900b0013f1a430c5cmr931113plk.40.1634151804483;
        Wed, 13 Oct 2021 12:03:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i13sm7143151pjh.0.2021.10.13.12.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 12:03:24 -0700 (PDT)
Date: Wed, 13 Oct 2021 12:03:23 -0700
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
Subject: Re: [PATCH v5 05/15] tracepoint: Exclude tp_stub_func from CFI
 checking
Message-ID: <202110131203.78C3851CA9@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-6-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013181658.1020262-6-samitolvanen@google.com>

On Wed, Oct 13, 2021 at 11:16:48AM -0700, Sami Tolvanen wrote:
> If allocate_probes fails, func_remove replaces the old function
> with a pointer to tp_stub_func, which is called using a mismatching
> function pointer that will always trip indirect call checks with
> CONFIG_CFI_CLANG. Use DEFINE_CFI_IMMEDATE_RETURN_STUB to define
> tp_stub_func to allow it to pass CFI checking.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
