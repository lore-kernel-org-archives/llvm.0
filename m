Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2962C82
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 21:14:59 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id i17so13936183pfq.13
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 13:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PomGqS/ojw0AtqU3Fb7HbY+FvnyoZQSU3mF25QVJV7c=;
        b=Xn0LtiOPnZ1vxiTS8awYMFTe2/FhG6R5vFOU5b6DthICxjaiSEt3oU4Ss5OnfVHbuY
         oS5xHSkhz0GOTKg7+NsE2IPMSRIkVivQn1A7bCl+KW3AxDjiGjWF2jtYBv9/qDBzMxA9
         5RKrkuEXSkU/tKKnrl9aXQhtdaUUHAw0PAObM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PomGqS/ojw0AtqU3Fb7HbY+FvnyoZQSU3mF25QVJV7c=;
        b=ipKKMcKfuoad5Lv6UFuStWV5nQehidBh66h2jaye2XH3N3a6d50uIHY6q1VGZP2XG2
         LVXirWFkuilkQaOk4UlDJiuer+jpSfc8glvSEkSNvkfvHazAtYucl58zFHkFpkMfgY6h
         b54Qfu3MRMyx2iuqgqbOqjrC+d5RG2+nqtlyvWkdoZ1ClwkwrM1WgjTnlLZ4ZeqXX1kh
         k9tDowXKf5AIxY3qUwDeWlIHzoAmtM38eKqvORcyVuCfIGAoYfeWXrHEYjzD4n0z0XWM
         rtWZRjc4HrYWDDEUAwIuc4bY5EebN1OERVooea8Gn/8tvKRACCSs1TyTKjdibjmkCAed
         ZNXA==
X-Gm-Message-State: AOAM5306rw/HQqYNMBPv1W0hRVNnnVcmpptWP1+X7O3q34qisA8YPTWy
	IN2fWLthxxlxBnS9hmfc0ho7lA==
X-Google-Smtp-Source: ABdhPJxixcp/Qg2tN2OKN473PxgWYy14w53S3JGe8e8/8ZnXhTR/q5o3PhRX0or1L9AEhH8XZWmwOA==
X-Received: by 2002:a62:e40f:: with SMTP id r15mr22514435pfh.24.1643663699526;
        Mon, 31 Jan 2022 13:14:59 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a1sm29349483pgm.83.2022.01.31.13.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:14:59 -0800 (PST)
Date: Mon, 31 Jan 2022 13:14:58 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] stack: Introduce CONFIG_RANDOMIZE_KSTACK_OFFSET
Message-ID: <202201311314.2978E80C05@keescook>
References: <20220131090521.1947110-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131090521.1947110-1-elver@google.com>

On Mon, Jan 31, 2022 at 10:05:20AM +0100, Marco Elver wrote:
> The randomize_kstack_offset feature is unconditionally compiled in when
> the architecture supports it.
> 
> To add constraints on compiler versions, we require a dedicated Kconfig
> variable. Therefore, introduce RANDOMIZE_KSTACK_OFFSET.
> 
> Furthermore, this option is now also configurable by EXPERT kernels:
> while the feature is supposed to have zero performance overhead when
> disabled, due to its use of static branches, there are few cases where
> giving a distribution the option to disable the feature entirely makes
> sense. For example, in very resource constrained environments, which
> would never enable the feature to begin with, in which case the
> additional kernel code size increase would be redundant.
> 
> Signed-off-by: Marco Elver <elver@google.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
