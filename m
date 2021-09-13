Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532713FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:25:25 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso417611pjq.4
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=taCjqdDSME7vR7lF+EW1BqEPTLTykFPbYK6SPDFQl0A=;
        b=eh1rxFNPw+aCEFZyqDEkXAB5SU6WvscIm/FoYq+F+NbA5PM6WDQVyREPTH+Zmt42Wc
         056LnzzjAmbFc7awWxnztYEHl6BpujZt+Bfv/k8RYN4uu0bzV6hDU3IkNbIw5Tq8MdN9
         By38+nHsFcvmDLl+Q5uYLo+KGPTiNsy3rN/dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=taCjqdDSME7vR7lF+EW1BqEPTLTykFPbYK6SPDFQl0A=;
        b=XUYoAHt+4dD0QvHWhHNMv8fbGB7SLEOJDMaDHAfbEgzEgCx9cTedwnHE7be+gWC016
         w747aAtu/MggjVm28qDcIORd8i54e/DWrCo4lhvC7d6tE2YqbT2lXA2FeS+1l1tKsy/A
         CQCOndMU9G0OMOBUyW8UD+6i+wct25g2UY0t6/shLq1NdluhrcLGEi93znZN5vz+NWX4
         DpUeB6gmGjmQ9vU0Ei4WoHQ3fBrJSJrGhLAu3GlCqdJrYsAy2ovMip8JrOL5WBUBXbEo
         C1ZLP2DiHnJCwyX9hzhVE0W+9DXyLBK0y7n362th2QqktnS/1ACIXlIBXsCQhsRsGhF9
         jEXQ==
X-Gm-Message-State: AOAM532nDCIrZdHgJI+uBfDLkDIozkyi7L5WNT7SkNyjWs/XUqXIBvit
	TGbRmng41phQIUaWIQhSgL/9wg==
X-Google-Smtp-Source: ABdhPJyGnb96Au30P7aC4qM0B6pg/L/NzYt1VlVh+hgL2adQWRvqsZTTS4seDlUN6x/+GDQT2LbG0g==
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id p15-20020a170903248fb0290128d5ea18a7mr11321531plw.83.1631550324907;
        Mon, 13 Sep 2021 09:25:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s9sm7064889pfu.129.2021.09.13.09.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:25:24 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:25:23 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] Makefile: drop GCC < 5
 -fno-var-tracking-assignments workaround
Message-ID: <202109130925.A47FB0185@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-9-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-9-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:45PM -0700, Nick Desaulniers wrote:
> Now that GCC 5.1 is the minimally supported version, we can drop this
> workaround for older versions of GCC.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
