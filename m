Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378F68
	for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 16:17:00 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id u11so8497826plf.3
        for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 08:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=usWViYcCzWq+4eFNkCmatkBvFbU3RNEL7+YZbow3+zc=;
        b=MTALUAwzUdnK0Z5b5lVgWJgU6FzCgTzqcFTHahFtZm7OPQApKlWTZNVObBcZdNSRnV
         2Yse8yInV0FVgkF79OZMymK7DwbHqAXAwVQ7+uj+WXY+Z+pGBsUQYIT7JtusZLfJdEpF
         a7OlTvBu+zbNncabs+9IIufXtLeXyIR23TjCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=usWViYcCzWq+4eFNkCmatkBvFbU3RNEL7+YZbow3+zc=;
        b=itGE3RK7Uh/ZTrGJaLejom12gHPlhLJMo63rdhY/LqGNO5jFa7bsw5WKyC3dxXtclF
         9iZRNV+tdtCSuOukrS2yMLzppudYAYsI5jnhUVeYzduoSyAcbjYJRuZELaoD+EwCUEXM
         iSUsKSBFbhTCAsTPvv2rO93UpJxsbMEJPLD0uDNlQbByiX/yH0hebHKq4FN6gKxVjkzq
         lVnw6yc8mXgtS+nS+sI8OiXuf2YJ+kLAikxrtgc/rYiKBFzFtfKJjB6Adh4sYjfpY68R
         QDB8dWvfSgkkn1H5Ilckn2CkXXLg5S2zgIoZzl9E9CzeARa5j+bkO1OXgk9z/1sfLNt5
         rQ0w==
X-Gm-Message-State: AOAM532ytI9Yu9Rstoy8PmyTw7f0hNMD/Vccy7J4H+eP+h0ORUR5huCD
	vL6uD5Yl/rrIXSYNBRHigjOy5Q==
X-Google-Smtp-Source: ABdhPJwDTwOHmvZNvmhYMtZtG/IekoV9obZXM4fOU/Lgx3Ml0lm+gtjzNOd7Y5hKxzPt0un1+dyuUw==
X-Received: by 2002:a17:902:f24a:b0:141:c6fc:2e18 with SMTP id j10-20020a170902f24a00b00141c6fc2e18mr79310972plc.55.1637338620272;
        Fri, 19 Nov 2021 08:17:00 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j6sm125497pfu.205.2021.11.19.08.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:16:59 -0800 (PST)
Date: Fri, 19 Nov 2021 08:16:59 -0800
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Apply a52f8a59aef46b59753e583bf4b28fccb069ce64 to 5.15 through
 4.19
Message-ID: <202111190808.1DA0067@keescook>
References: <YZKpVkYpYfYfHD50@archlinux-ax161>
 <YZeaCndfOGSZLHgX@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZeaCndfOGSZLHgX@kroah.com>

On Fri, Nov 19, 2021 at 01:35:22PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 15, 2021 at 11:39:18AM -0700, Nathan Chancellor wrote:
> > Hi Greg and Sasha,
> > 
> > There is a build error with newer versions of clang due to a broken
> > FORTIFY_SOURCE implementation, which has never worked:
> > 
> > https://github.com/ClangBuiltLinux/linux/issues/1496
> > https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/1457787760
> > 
> > Please apply upstream commit a52f8a59aef4 ("fortify: Explicitly disable
> > Clang support") to 5.15 through 4.19 to resolve this. It should apply
> > cleanly.
> 
> Hah!  Oh the Android people are going to _LOVE_ this one...

They (we) are already aware[1]. Fortify has always been broken under
Clang, so really this doesn't change anything for Android builds. :P

But yes, one of many motivations of the recent memcpy and fortify work
has been to get fortify fixed for Clang. Hopefully this will be all done
by 5.17.

-Kees

[1] https://github.com/KSPP/linux/issues/77

-- 
Kees Cook
