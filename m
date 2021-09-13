Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CF93FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:22:16 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id v1so6168996plo.10
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x9bengKu+CI5Uy0lxK3X1t9kIOqgRUCo1n/+q3eZAGw=;
        b=atKV3P/8k/Yz8cBigFlc9fXFfyCBqkZFUT4+RKL1Z2tJeLgayOQJvz/EPJpYdPW+vj
         XB9aylqdgIXvWFV2ZaZmy7g73rqq2+ki3DTPisx3U9sGYtJi4LOl5LCUNRzaLaxNkygQ
         4aw/h2na3FhYoUcmwmfGh87UYgO68GUZMKRGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x9bengKu+CI5Uy0lxK3X1t9kIOqgRUCo1n/+q3eZAGw=;
        b=v/DQyDIZ26CvpKf/zlojaW3MokDSP12JfRKvxq+Gkgh9uTqUq2opyhpE2568JJLKf0
         Wv+mhz0zIDxDgy/Wwu78CNBnegU7O0OGZ3sYPEOONdONXi4YwmNjLvFYGnP1M3BqFI8P
         +GLszqLfY1h2qAnQ4kb1WpXLwM84vd5IIPi8KFMWHraTVbiuZHUR1zyP7PZkAkm7lsGs
         PBGpHEME7oHW3juYVZxGBvnsmKYNmWdXrHjPtN3uSYHs4F1PL7BUji46QtAZV98P7PRA
         ulE3LCLnOtbkoh12ZH6DddGP1CXQPt49yzOb1DJYHxMNaxfYfq9MB2txKEgVkQ9ja3RD
         Ptqw==
X-Gm-Message-State: AOAM532uiRNzmewxntgzTB66tZUL46HJ+QbBPZepBES7PEP7S49a6s4p
	L2AJl5vadK6mF/4mFWp7yxcNNw==
X-Google-Smtp-Source: ABdhPJzjqGdWhTndUENRXXSU0o8Taq3svhepsDvQaON2wiOrnYg1dZyKG9Bszyg7IEOrraOFxs5ykg==
X-Received: by 2002:a17:90a:eb0b:: with SMTP id j11mr369315pjz.173.1631550135873;
        Mon, 13 Sep 2021 09:22:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h10sm2302588pjs.51.2021.09.13.09.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:22:15 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:22:14 -0700
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
Subject: Re: [PATCH 03/10] mm/ksm: remove old GCC 4.9+ check
Message-ID: <202109130922.D8C51303@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-4-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-4-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:40PM -0700, Nick Desaulniers wrote:
> The minimum supported version of GCC has been raised to GCC 5.1.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
