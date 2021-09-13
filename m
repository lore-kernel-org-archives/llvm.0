Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F053FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:25:03 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id v19so4045971pjh.2
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zuPUItXSPj0PAMYdwf9A90s2GvyBeXQIkWyfA3MX9Lw=;
        b=U6fT/FIGLJV6UN6XFl+2eeN+TRUZp/d9f4Gg2Zbqy3odIfJdjZOTqd46CvX/KDp3HJ
         l9NcuwruLjOciU4rNSPnw25+GPJ2jd8CxB3ex/8zoq8XYFzXRSWfYXGrhbuRogDihdNJ
         bkKEWOmUymMUjtmwdyOwrATS0g2Sa/NwvqMgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zuPUItXSPj0PAMYdwf9A90s2GvyBeXQIkWyfA3MX9Lw=;
        b=BkW59X9ehuZBjFhWoHJjJYHvDAGdJybxNpr9bMcFXZUELid7NO7+UoATLmfgUG+CdA
         tijtmfhTXzXrImOxIentRoIPhnn7Wuy0VxU665s76qbjnakHBquUFzDYL9JhZWAe33Pi
         R1aCQKJ0DrVFIT860gxThhnRLj/7U7CxzBEQGbaDtWiQDEmIoeSePDmtitAN5c04aZpH
         uCAwobXdBOBuDi2asSVIn/dP5NxsweStEd7pU7OyScNkn33j5Y+7AW87Wl1PMN3MFNmG
         0PMWIq4kltxYjyMT1TUsQ56WHn87ucycywPPrFuSmLivyO8istHUlWNC1R84lbaESFr9
         cWBA==
X-Gm-Message-State: AOAM530N6e3w+Srj/ef/OAY8EMvJvf/8iA4Yf+6cXcFES+zYAeq4oQOJ
	iZ9GFzp39PPyseYYaZxaEdTAYA==
X-Google-Smtp-Source: ABdhPJwL9ixBG8I68USpTyltJTZ5dkFKkNfUYvRlELRdAaw67LR4GDId05Pp5su+VZlRqT4yZ5cSdQ==
X-Received: by 2002:a17:90a:194a:: with SMTP id 10mr426324pjh.176.1631550303604;
        Mon, 13 Sep 2021 09:25:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d10sm7621291pfq.205.2021.09.13.09.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:25:02 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:25:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] arm64: remove GCC version check for
 ARCH_SUPPORTS_INT128
Message-ID: <202109130925.3B30E9E1@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-8-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-8-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:44PM -0700, Nick Desaulniers wrote:
> Now that GCC 5.1 is the minimally supported compiler version, this
> Kconfig check is no longer necessary.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
