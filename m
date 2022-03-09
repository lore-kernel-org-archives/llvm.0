Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C825127
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:06:36 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id c16-20020a17090aa61000b001befad2bfaaso3542645pjq.1
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 14:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4umDXsTj1CldyJcysNP+Nnq3pVu2iPQxmtjAZsmbWQc=;
        b=fonhPV0Eq1KKbf2UvQA+KGAibGPw26KwBtm0dM70xCxj6ATohjtHnwM9d6UdiJ4pES
         TtwRiVhwuqVmD1pMJN1AjZmG+ufDLj8RIalRJKwWBNl6MUbtTzyxogX/ltfosrYrsK1W
         ukbHTdoheSpC4mi3+swuWKJMWUMvllUxyoHhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4umDXsTj1CldyJcysNP+Nnq3pVu2iPQxmtjAZsmbWQc=;
        b=X0a3PH8/tMQw3TXB5xWqwgcMXPt1xAZINW/7ojmfGsFea2T/cJWXHxQMQLgrKAi9DT
         d/L+UfDeKkOOqxpTC1xjZEr6inPi97YCRz852DYGhYHEe6KSL4MxZ/M/NLD/wMi5ZKkj
         koum3LM4MrJ0QFdWmRBMkkG0Cibwet8XGv1MAL6aeE2SZrDfCpAFbI4GgoIvSDlU/Xzl
         WiRJIT2fGU0etISOuiQKtEvW+kQ1ViOzi67y+fr7InlEbDfJ2yQURlqGPVIsCYSnmJUu
         JlOBZt2l/4sCJpkRN5gRJ+/sadvZNDDUyhnERJjxK5tbevig6l53+DVkm9aGIrpX9Eap
         5NfA==
X-Gm-Message-State: AOAM532VA0MSmJp6QDTojfhZmE5MqxwsJHtIXC3t1sqGKq8ddyyx/Hhg
	fCJvVdA5T973XUqQ64mnHcfLdA==
X-Google-Smtp-Source: ABdhPJzGofjm+FGYBG97TRW7gxvFjqmZFdCBX6uEyrkbYPtSeUo2O0Yh6GCX+Sushx4dJa23puvXbA==
X-Received: by 2002:a17:902:7404:b0:151:c3f9:e43a with SMTP id g4-20020a170902740400b00151c3f9e43amr1839188pll.12.1646863595999;
        Wed, 09 Mar 2022 14:06:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u8-20020a056a00098800b004f702473553sm4134935pfg.6.2022.03.09.14.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:06:35 -0800 (PST)
Date: Wed, 9 Mar 2022 14:06:35 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marc Zyngier <maz@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Yanteng Si <siyanteng01@gmail.com>, linux-mips@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] MIPS: Only use current_stack_pointer on GCC
Message-ID: <202203091406.E94510FD@keescook>
References: <20220309204537.390428-1-keescook@chromium.org>
 <YikTQRql+il3HbrK@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YikTQRql+il3HbrK@dev-arch.thelio-3990X>

On Wed, Mar 09, 2022 at 01:51:13PM -0700, Nathan Chancellor wrote:
> Nit: I think the subject needs to be updated (I assume this was written
> before Nick's fix?).
> 
> On Wed, Mar 09, 2022 at 12:45:37PM -0800, Kees Cook wrote:
> > Unfortunately, Clang did not have support for "sp" as a global register
> > definition, and was crashing after the addition of current_stack_pointer.
> > This has been fixed in Clang 15, but earlier Clang versions need to
> > avoid this code, so add a versioned test and revert back to the
> > open-coded asm instances. Fixes Clang build error:
> > 
> > fatal error: error in backend: Invalid register name global variable
> > 
> > Fixes: 200ed341b864 ("mips: Implement "current_stack_pointer"")
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Yanteng Si <siyanteng01@gmail.com>
> > Cc: linux-mips@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for sending this!
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> > ---
> >  arch/mips/Kconfig                   | 2 +-
> >  arch/mips/include/asm/thread_info.h | 2 ++
> >  arch/mips/kernel/irq.c              | 3 ++-
> >  arch/mips/lib/uncached.c            | 4 +++-
> >  4 files changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 3f58b45fc953..15769013f46e 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -4,7 +4,7 @@ config MIPS
> >  	default y
> >  	select ARCH_32BIT_OFF_T if !64BIT
> >  	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
> > -	select ARCH_HAS_CURRENT_STACK_POINTER
> > +	select ARCH_HAS_CURRENT_STACK_POINTER if !CC_IS_CLANG || CLANG_VERSION >= 150000
> 
> Nit: This can be 140000, as release/14.x has received the fix:
> 
> https://github.com/llvm/llvm-project/commit/0826716786cd4a8c7cbcb8c01e4d9fac46b7a17a

Oh! Excellent. Thanks; I missed that it made the branch. I'll send a v2.

-- 
Kees Cook
