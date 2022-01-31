Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1042C82
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 21:13:31 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id s16so13302125pgs.13
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 13:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GS7ARrVx7mqa1AsFf3AdkLtLmRc92cKknoJbQi/nsN8=;
        b=VpMxW+eMio0Wu66eA+trKZ060aIZM8z7jb6VDn7qKwkY/PhFOYC8LO+1DYq2da/FxI
         JAotv9ZcWLXu2zJrGrqOb3fuimLZxVDvBCd1imtyfHmpGXv3gRKgTceDM1NACLwsxF0a
         fXSM/pmmRC0yZGBYF92QdQD7GqZ4bK4Fiezbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GS7ARrVx7mqa1AsFf3AdkLtLmRc92cKknoJbQi/nsN8=;
        b=oOt8iJPnje+FsVWemOKku8gnPM9A75O3QU/7AnpS0tmLKrq1eL62bK41Fa6riPSJsa
         XVNIygfY+WzopxTvamIHm7L7gq7qsWlWRYJ2YI1aHoFQRvr1D7svXRYmqANwbtiTwNfT
         kbUVjWWrq++wo2FOQz3sbohdQhWoAHre7GmRIbwce8jiqmDVXL0XTSNf1f4ABgdPvceQ
         F1TmifyGXnrEwgVnjXvgt0J5B0wncJ++aBGD3dcpLqFWJXxn+yIyGGhwZzY/V9fX/oN0
         8Y1hr175gUt2np/+PIHTu1ocLDYc21vwf26SxRt5mKrX+N825dekc4B6BzG+zWPSkNCJ
         K0Yg==
X-Gm-Message-State: AOAM533/UA4KKCqVlfFe6YFJLVvphMjo9pWlHZ1PhMzNLOYjTZF9z+fJ
	ealbtjYj829ni08LCaylDMy2Jg==
X-Google-Smtp-Source: ABdhPJzxIEXhImcS+G4fX4a7La7yj1Sol7mkyBq+x+m4eA/grNnHBkUexrk8Gwx7zzkYa0bvDq2Fcw==
X-Received: by 2002:a63:69c8:: with SMTP id e191mr1911222pgc.412.1643663610998;
        Mon, 31 Jan 2022 13:13:30 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y42sm17430367pfw.157.2022.01.31.13.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:13:30 -0800 (PST)
Date: Mon, 31 Jan 2022 13:13:30 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4] fortify: Work around Clang inlining bugs
Message-ID: <202201311309.AFF4A0C@keescook>
References: <20220130182204.420775-1-keescook@chromium.org>
 <CAKwvOdmrzO9U9Cu5zB07t1C+Xh-kAzk_F-MisAxsrArhJVhSNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmrzO9U9Cu5zB07t1C+Xh-kAzk_F-MisAxsrArhJVhSNw@mail.gmail.com>

On Mon, Jan 31, 2022 at 11:04:36AM -0800, Nick Desaulniers wrote:
> On Sun, Jan 30, 2022 at 10:22 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > To enable FORTIFY_SOURCE support for Clang, the kernel must work around
> > a pair of bugs, related to Clang's inlining:
> >
> > 1) Change all the fortified string APIs into macros with different
> > inline names to bypass Clang's broken inline-of-a-builtin detection:
> > https://bugs.llvm.org/show_bug.cgi?id=50322
> >
> > 2) Lift all misbehaving __builtin_object_size() calls into the macros
> > to bypass Clang's broken __builtin_object_size() arguments-of-an-inline
> > visibility:
> > https://github.com/ClangBuiltLinux/linux/issues/1401
> 
> ^ mentions a difference in compilers for mode 1. I wonder if this
> patch could "hoist" the BOS calls into the macro ONLY for mode 1 and
> not mode 0 usage? i.e. the str* functions, not the mem* functions.

Everything (with a couple exceptions) is using mode 1 after the earlier
patches in the series. e.g.:

+#define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s, \
+		__builtin_object_size(p, 0), __builtin_object_size(q, 0), \
+		__builtin_object_size(p, 1), __builtin_object_size(q, 1), \
+		memcpy)

> It's too late to fix these in clang-13.  If we get a fix in clang-14
> or later, what does that look like for this header?  Is there a way we

If the bos mode 1 got fixed for Clang 14, this patch would likely be
dropped and the Clang + FORTIFY version check would be moved to Clang
14.

> can provide a different header than include/linux/fortify-string.h
> just for clang-13 (or whatever versions until the above are fixed)?

So much of it would be identical. This macro-ification is least
invasive, and it's pretty invasive.

> I don't see this series getting backported to stable, where older
> versions of clang may still be in use.

Right.

> I'm tempted to say "let's get get these 2 fixed in clang-14" but we'll
> probably have to trade something off the existing TODO list.

Agreed.

-- 
Kees Cook
