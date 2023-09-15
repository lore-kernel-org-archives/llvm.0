Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4B330CEE
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 19:06:29 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6561c09ead6so12304976d6.1
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694804788; x=1695409588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NNdNMoPNLRC5J4Us7rjn5YK+Bn2P8ki5j52BrAmQfc=;
        b=nkvUh/Ogk7bRHzhQk+y2OxGI+CauH6I0DiLK6Ua4M+yiArqFyjGJ1fLiVFfQjT23QO
         3j7c9pPFQhQfM71I3rRQFLbnva+CrFk4pp4x58F7O6yMutTw86wCNgfgHFB0Y/69RmA1
         jhHY5XRfwG6frVvaxSwKvXu7KwnrhZg50QvqKXWuJSl9LzSNtcQL2L5n+xsyd+dYnmMf
         JSc8Bz+s7QA41W87gZIQlXKMKTKrqAm+QP/vvM2MRbriME7vqjM9uBnsZxjh8ztbiSgF
         qkwheoRx9SN7tKrT2YFZumm0AtWIWpWZMeL23ME36koGlqagBCOxbyZb80FN37nymaxs
         kK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694804788; x=1695409588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NNdNMoPNLRC5J4Us7rjn5YK+Bn2P8ki5j52BrAmQfc=;
        b=HuzkBz9xcN1OaZCevNVD0q9WSk1pGh1AnL51/usHPp3ReAmwi4WcWlozhv2ZchWwwW
         YcY0Aguca6Q9YWGiKx3SLRiGq97GOG2XH6X0DwyycTkP1wKInHrh7YgjfdqAIjHfaf8c
         pLjIEjbLP7vsLf4Zaw/iNp6ldXgJ26cohzlyZjn17QK4ZQlIygb8VjfKb7SgybB0vGKP
         Ux0zb+4ddJRHsr0Qtr526qOsATyfEillYB5RSrd0RJ3hIjZjlLtFUMTA47+xQwI9EH6r
         G7sf979SNpJ8wEpA+ho89u31rsRH8MvMJ/gMPxw8Tys2BBRISHuCZcrFCNGgVFRLpvw5
         1g+A==
X-Gm-Message-State: AOJu0Yx9p3HBvxGWPlNDcHhKE3oKbvTBZxEfXC6nQWLomsV0y1FmUHFn
	eUFHtu8gsrtyVlSEO9oeTLKwNhK1u2WRXbDqfmbT3g==
X-Google-Smtp-Source: AGHT+IHnUmEPsIeFlP8ufy20De8OLVwpSSqcrp7lDWmTe6PTj/7WjDAOWdhgq5G3z26K+KHrakYbT0n8GVD/uGs4Htc=
X-Received: by 2002:a0c:e301:0:b0:651:65ca:141d with SMTP id
 s1-20020a0ce301000000b0065165ca141dmr2504505qvl.37.1694804787931; Fri, 15 Sep
 2023 12:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230915050125.3609689-1-davidgow@google.com>
In-Reply-To: <20230915050125.3609689-1-davidgow@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 15 Sep 2023 12:05:50 -0700
Message-ID: <CABCJKueOu+MwgvTcEUY51tJ1YjNjS-3zHhAHP=1TQUC1wd_1VA@mail.gmail.com>
Subject: Re: [RFC PATCH] kunit: Add a macro to wrap a deferred action function
To: David Gow <davidgow@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, dlatypov@google.com, 
	Benjamin Berg <benjamin.berg@intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Sep 14, 2023 at 10:01=E2=80=AFPM David Gow <davidgow@google.com> wr=
ote:
>
> KUnit's deferred action API accepts a void(*)(void *) function pointer
> which is called when the test is exited. However, we very frequently
> want to use existing functions which accept a single pointer, but which
> may not be of type void*. While this is probably dodgy enough to be on
> the wrong side of the C standard, it's been often used for similar
> callbacks, and gcc's -Wcast-function-type seems to ignore cases where
> the only difference is the type of the argument, assuming it's
> compatible (i.e., they're both pointers to data).
>
> However, clang 16 has introduced -Wcast-function-type-strict, which no
> longer permits any deviation in function pointer type. This seems to be
> because it'd break CFI, which validates the type of function calls.
>
> This rather ruins our attempts to cast functions to defer them, and
> leaves us with a few options:
> 1. Stick our fingers in our ears an ignore the warning. (It's worked so
>    far, but probably isn't the right thing to do.)
> 2. Find some horrible way of casting which fools the compiler into
>    letting us do the cast. (It'd still break CFI, though.)
> 3. Disable the warning, and CFI for this function. This isn't optimal,
>    but may make sense for test-only code. However, I think we'd have to
>    do this for every function called, not just the caller, so maybe it's
>    not practical.
> 4. Manually write wrappers around any such functions. This is ugly (do
>    we really want two copies of each function, one of which has no type
>    info and just forwards to the other). It could get repetitive.
> 5. Generate these wrappers with a macro. That's what this patch does.
>
> I'm broadly okay with any of the options above, though whatever we go
> with will no doubt require some bikeshedding of details (should these
> wrappers be public, do we dedupe them, etc).
>
> Thoughts?

Using a macro to generate a wrapper is a reasonable approach IMO, and
we've used it before in the kernel to fix type mismatches in
indirectly called functions (v4l2-ioctl and cfg80211 come to mind at
least).

Sami
