Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E412CA1
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 19:04:50 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id b9so28861239lfq.6
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 11:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x7D810g+YtIFKHpIEkKZbUB8LHPefSFy/Cofo1oMsBQ=;
        b=EAwy9jHAqpGEf65pb3fSBDWQnW7n8nbU2haUVLOp7KYjIOUsEeGAI4/O/QQyTUel/J
         T/fyl8w+9SNDPbtoyNjNT3xylwe4knJsGIHExj6Ib/df92/YY1la3x8cAFAdkxxGGgOa
         nIN9aVk0V1Fh/5hJns4WnY8eL15utdOLqL49fLMlEdUfaa2bHdimXpR8qNz7XGd5Eill
         xBdrDKvJwDON+AP+5/ctOcfR3H1pqV5RiQVLAGuwxxoYxkdxL3p7oujqAj24byEOz3i7
         ROCkU4ZhDWJ9c154emV6G7Q6EdOwVNknFsRzHo5SSLKQ4xZKq8VnCjkvnB+D9fDl/qW0
         I/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7D810g+YtIFKHpIEkKZbUB8LHPefSFy/Cofo1oMsBQ=;
        b=Vj1s4H6DYqoZPSW9eMl4lUxJXo59l1d1Si1UR7LknZUkOP1nZSLTr6t7DOqzCqXrX2
         JL9QqWWpLfrtNLagcufaYe+1DVfdQCUA7hISBXsI/C8+bFpW8WURoXSwf1W43v5xKgCT
         KpjP5pjUGwLWYq66/KOE3ECVAgVWoz77UEf2T/6nyXyiCZ7fmHgd0WQ9lO7OZZOnvnbL
         4KEV+Um2Zb/ftWJUTOWX5sSBB1KWgN6Tq0L/mjdJr6gQI5qKTZ7gP5RkLG1NlIrw+Kq5
         c6Xe52U3SA+tVDfnAY12AEuegsVCbW2ACORhm6vZ6v7M1U1EOuzzYehRjPcAaul2+Xz1
         MU5w==
X-Gm-Message-State: AOAM533aUhqq5vdCNE1OhDtpJiIoX+AFhIPlf/zPvEafhSQuHMsQ7Nyj
	U4sRlEs7MjwLnb0j4oMquc2oGC67oBdBWzgmcmu76A==
X-Google-Smtp-Source: ABdhPJwB3A+CMUaytWKzeKMvWkUXsOxPbl9gFTdNMGyeMXxmOEOObWpWOXHNsQQQNZ6hpaAieycxW0JBpJ4cNNG6Scw=
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr17074200lfr.444.1643655887933;
 Mon, 31 Jan 2022 11:04:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220130182204.420775-1-keescook@chromium.org>
In-Reply-To: <20220130182204.420775-1-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 31 Jan 2022 11:04:36 -0800
Message-ID: <CAKwvOdmrzO9U9Cu5zB07t1C+Xh-kAzk_F-MisAxsrArhJVhSNw@mail.gmail.com>
Subject: Re: [PATCH v4] fortify: Work around Clang inlining bugs
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 30, 2022 at 10:22 AM Kees Cook <keescook@chromium.org> wrote:
>
> To enable FORTIFY_SOURCE support for Clang, the kernel must work around
> a pair of bugs, related to Clang's inlining:
>
> 1) Change all the fortified string APIs into macros with different
> inline names to bypass Clang's broken inline-of-a-builtin detection:
> https://bugs.llvm.org/show_bug.cgi?id=50322
>
> 2) Lift all misbehaving __builtin_object_size() calls into the macros
> to bypass Clang's broken __builtin_object_size() arguments-of-an-inline
> visibility:
> https://github.com/ClangBuiltLinux/linux/issues/1401

^ mentions a difference in compilers for mode 1. I wonder if this
patch could "hoist" the BOS calls into the macro ONLY for mode 1 and
not mode 0 usage? i.e. the str* functions, not the mem* functions.

It's too late to fix these in clang-13.  If we get a fix in clang-14
or later, what does that look like for this header?  Is there a way we
can provide a different header than include/linux/fortify-string.h
just for clang-13 (or whatever versions until the above are fixed)?

I don't see this series getting backported to stable, where older
versions of clang may still be in use.

I'm tempted to say "let's get get these 2 fixed in clang-14" but we'll
probably have to trade something off the existing TODO list.
-- 
Thanks,
~Nick Desaulniers
