Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD915E92
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 08:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfaB/yXF"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c9b8aa4fc7so24519771fa.1
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 00:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701417880; x=1702022680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qTjlCC+GslsWJzNLyZ4ti8FIX5Ayf6BUta7nxCdgfSg=;
        b=GfaB/yXFiz9zfudsoJ0YCwfPmU35q1qBv5C2pc8BNj8MvKTcjs5S8r91k+3V5evZW5
         c+zIDaDFyzhQyHaCPlqtz9zvDW8ln7hiF6M5fjT+ZE1FXU7ueM5/1NLQ8r4c7pnMX5NB
         JlU0QrHgt4zVV59WFUc0yCXKang6Ik1ZWVs9jm0Cr0tHHIYZFWK4PIKvOwt6oLjqRrE3
         MhGskkuEDIg8H/GXFW31lT7ZMEuquR1YFN29FaPxwwDojAGNVhxvvyBSZK1w+PRtiSB9
         4F8eSwwAJCsT2CSyE4ZbpuVaQyTJl6S7RGPuI8LsBWH5cCQxqe0umuD27tc3jPc05OkK
         e8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701417880; x=1702022680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTjlCC+GslsWJzNLyZ4ti8FIX5Ayf6BUta7nxCdgfSg=;
        b=GNYrIErvyAurtuz7oXvfv6jFsJnleQ2m2HmBjDHQaQDvh5IRlfweUxhwUJh/ssuhw0
         qWg30T6gd1bZl+ZZlxOV4cyh7Au8uSfUCnFW8RD262hi0apq6TRLotbrCtVg5F/GHf4Q
         qHd1P2cMJj/zdfvUFxKU5TL9EHINsA81olseoGYGNu3Oc20Hrxeu6ItxrXDfu6Yn0s1S
         +2a4bEi3cak3KnJuiN3XPPuVDxzIXshqPNFif86A9cYdbYYVLFUXOgV9vRnC4rR9cQHT
         ykEgSRToNGzGiqgwMVeTEr6hUg0km2xyg0ESDH+N6B8QLZ2qAzpE+JBP2k+Sq/UkCZ0N
         64DQ==
X-Gm-Message-State: AOJu0YxyFPgS4BcgbwhuWl5p6QQ5hpLreOuZuazdcBhmyHUzd0dEHug1
	Kx0Xqia01EBv1GyZ4myZabXEy6G+7xYF/320bRI=
X-Google-Smtp-Source: AGHT+IFEuuxko1Q2PpI2q5cy8/izJael5ks2bFo9rN1ePwh31sc7O83FYc/61iNEILFM6s+xu0ERR56KQAymMM0pPL4=
X-Received: by 2002:a2e:80da:0:b0:2c9:d872:e795 with SMTP id
 r26-20020a2e80da000000b002c9d872e795mr434172ljg.76.1701417879899; Fri, 01 Dec
 2023 00:04:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com> <170113164796.1670732.18133777682518787773.b4-ty@chromium.org>
In-Reply-To: <170113164796.1670732.18133777682518787773.b4-ty@chromium.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 1 Dec 2023 09:04:03 +0100
Message-ID: <CA+icZUUOFVOe7Z4q4F6nasQ--8v9wvZs9vZtLpR-p3o4UZ0HPQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: Kees Cook <keescook@chromium.org>
Cc: ndesaulniers@google.com, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 1:34=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Fri, 17 Nov 2023 11:24:02 -0800, ndesaulniers@google.com wrote:
> > As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux P=
lumbers
> > Conf '23), I'll be taking a step back from kernel work to focus on my g=
rowing
> > family and helping Google figure out its libc story. So I think it's ti=
me to
> > formally hand over the reigns to my co-maintainer Nathan.
> >
> > As such, remove myself from reviewer for:
> > - CLANG CONTROL FLOW INTEGRITY SUPPORT
> > - COMPILER ATTRIBUTES
> > - KERNEL BUILD
> >
> > [...]
>
> Applied to for-linus/hardening, thanks!
>
> [1/1] MAINTAINERS: refresh LLVM support
>       https://git.kernel.org/kees/c/9099184dec26
>
> Take care,
>

Jetzt amtlich (Now official):

https://git.kernel.org/linus/994d5c58e50e91bb02c7be4a91d5186292a895c8

-sed@-
