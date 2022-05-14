Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C72F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:56:03 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id gg20so975074pjb.1
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FRz+GXXZaKOMrKydUY42JkbUz0KXbswZCunobIsh+ok=;
        b=EMGxS7CubkSoRXJvbmCOUMnABXzcITd5+nEUdRyvBWZr0Ejfu0faLMdmwYhOM8pXx4
         qOvD2ibBSHZJuEbw1khfAuvievTdhMLKWyGiMShRtK8Ll3XYbrif7r38L2UQePBNmqGc
         wDzdnSTxfK8uDgCLXMc/+iLNVxeUASGOOeNys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FRz+GXXZaKOMrKydUY42JkbUz0KXbswZCunobIsh+ok=;
        b=L2AWtGc5A3zdegD68K1/wwhLTVy7Jm+kw0je/j2hLmnjhtC5y5MVabRMduOQ9AbcKK
         BC9mrkSj0FaOlpRjTNIyoEsEG6q4KyYHUBc2UbLBakPDMtC5pZkfSRoqDFupK1Jt3N/m
         ChKDnwJGAPRuNwX7bAef3rFmQC/hRlnBkEZReIt45e+VmduTwL8uDtFNaiW+ag+x1lNi
         xBBZEjIG2SIeqf9ivA0elNtpdapkvg2RC93CF9mLYgqtshVV55kw2G19MPSfnxQByc9P
         XgwDiiPlFHn3ts7oKW9XaldfH6x20oPV5yybQpaRRrZ3Wf1cMzOgmykeSUbw2RhoNn+z
         6gOA==
X-Gm-Message-State: AOAM533CbgHUGxfxgUVpEEYn5LwvpvIcMek1qrU/aHrd49CECylR6PfJ
	1Gx3fnmrbE5OKk6eiDA2BPVQMw==
X-Google-Smtp-Source: ABdhPJwN6qwi59HdCtNsN1hdnIt3qawy44T1UkLBIVUFePlqWn8+tMNJ68vLHuPdKrk2BA5cYKH36g==
X-Received: by 2002:a17:90b:3510:b0:1dc:88d2:6a1b with SMTP id ls16-20020a17090b351000b001dc88d26a1bmr23153588pjb.158.1652565363278;
        Sat, 14 May 2022 14:56:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v9-20020a170902b7c900b0016162e01553sm495864plz.168.2022.05.14.14.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:56:03 -0700 (PDT)
Date: Sat, 14 May 2022 14:56:02 -0700
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
Subject: Re: [RFC PATCH v2 14/21] treewide: Drop __cficanonical
Message-ID: <202205141455.0A6F409@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-15-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-15-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:52PM -0700, Sami Tolvanen wrote:
> CONFIG_CFI_CLANG doesn't use a jump table anymore and therefore,
> won't change function references to point elsewhere. Remove the
> __cficanonical attribute and all uses of it.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  include/linux/compiler_types.h | 4 ----
>  include/linux/init.h           | 4 ++--
>  include/linux/pci.h            | 4 ++--
>  3 files changed, 4 insertions(+), 8 deletions(-)

I think this is missing removing it from include/linux/compiler-clang.h ?

With that done (or explained why not):

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
