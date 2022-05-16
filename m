Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684C1361
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 16:29:00 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id j2so28041224ybu.0
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0bOl+fIEQwkyHpsAzPSpEA4t7EJjG4W9SophqswqviQ=;
        b=bdD+55o79GwcDBvWafpfYRSlZ2cIsVtsEzWN8lNQZowpdfgforgqMt8qYsM397aVOm
         YiVGsBjyCQ4/nzJb8pjgE6jjFdcKLpF5wOOcJodQ1RZ4iNIvX0CENTxmrtn9+/UciHyW
         EKnHHqZErG9LECr8b32WdjMLnN2pXB4+B7zMmAvfkaPu7l6jzIfy0MhMILwvn73/9VQ/
         MkHv6wCf5C5mFtWTtxiMgZBPV2qCW1bp6lyYTE56bmlfFrfQylzrQZmpH8+PR5FUV1/R
         OxVBsmGQ396NviKrlt0o6WZ5PsTDAzdbxxcSej5Osw7CXNEecq4EKHR7E8NkFpIkBOAc
         v+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0bOl+fIEQwkyHpsAzPSpEA4t7EJjG4W9SophqswqviQ=;
        b=EC36s/sYNdhIQssVBLmiHJUpXzNCJTk0bZm+FqJr5SHojGi43tkARPHa3qj/l2fP9u
         SPSs1SKvKmzyYwVkU3lTsAqej7/z8do6kVFfF5kR4ODWOcUJX0fQQrt/Jl27E0yJCRGa
         1Bi1DdoL1BlwdvMRlKK5DVoT35TIdhJeBjCDgnYCAwpRFPrOG4vEAkHaWQdlmQY8wQSb
         bzNreVap0yMbnmHqufV4VpnXcCTpB8VYIzLim0z0mbQYa2RMU4TyXsTnbWJyXm7U2WHt
         rbcY61u57f1i4FxkcOyrl8UrM/WWijm99kbrLdql+TMb0uxCO/KP32zHpI91hJhYk64T
         6s1A==
X-Gm-Message-State: AOAM532qTSUhx/OkqHl7cbJWbOWXJmA6HwUny7n9R0JTQJC3S/BWnbxz
	a/U9t12JT1jalYOJ9rMQsURab2sWs58CpJCyycZymA==
X-Google-Smtp-Source: ABdhPJwCEGLuNBoujfx+BIv6GEik4LbJeGm6Fda7U5MlIv3LPv1HXUgO10cPIMseX62+HYUEsnBRjf+KqqvWact8dkE=
X-Received: by 2002:a05:6902:90b:b0:64b:233d:8e03 with SMTP id
 bu11-20020a056902090b00b0064b233d8e03mr18071522ybb.428.1652718539243; Mon, 16
 May 2022 09:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-12-samitolvanen@google.com> <202205141453.44171359E3@keescook>
In-Reply-To: <202205141453.44171359E3@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 09:28:23 -0700
Message-ID: <CABCJKudJZUsRjwAEzWszOGY6G5igwWVpEy1OsAWrhyKr3csUSA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/21] arm64: Drop unneeded __nocfi attributes
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, May 14, 2022 at 2:54 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, May 13, 2022 at 01:21:49PM -0700, Sami Tolvanen wrote:
> > With -fsanitize=kcfi, CONFIG_CFI_CLANG no longer has issues
> > with address space confusion in functions that switch to linear
> > mapping. Now that the indirectly called assembly functions have
> > type annotations, drop the __nocfi attributes.
> >
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> It looks like there are still other cases that continue to require
> __nocfi, yes? It looks like after this series, it's still BPF?

Yes, BPF is the only remaining user of __nocfi after this series.

Sami
