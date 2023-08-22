Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7C2B554
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 17:17:57 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so1502407f8f.3
        for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692724676; x=1693329476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVxH8gZtgJYxnVhZVMJiqe8tMcZ7bLjPOLe18Ze4lL0=;
        b=lPJQqMMDcohJF2JdOsK63KunlvjahCqtIQcc/RYTdukta+Dp6uZ20GNq+fQnzNPrtx
         zE0Yw1wuqLQtgpFziCB01PGnkAqotVgacE8aIY6L/jfvH6QhkaZiVdVxc81h7wZJjoz/
         gN96ucsushvA81Ntq2eWLfTdDwwZWk0ZyQN54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692724676; x=1693329476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVxH8gZtgJYxnVhZVMJiqe8tMcZ7bLjPOLe18Ze4lL0=;
        b=ErcjQeuYmPL4FS7g/22jF6aawFt2zd/BBQUxFCAC3twNvsAjGCIPIoz/mH7rFO9bYy
         UEOd0wWBuqjx/dwAvd6rgwAEj5K2V4hkykXK7Xmrjw0lLx0Z6l21U0KZGzS0+IKkDZsr
         +x2+of19YjL06Pu3m0F3q2v0iHGtBdELpC0YXyBFb44RaMVKHYWub6+LidJYBeS5NgyH
         bGT+/FOob92b2KsyIDzck4ndoTkav92QgJ4lEmci+T5bXEaFVn06cAaF946i48XWJJky
         s/Ul5Gg2Q2KbdV+J+3yFr0v5KiLM6RrOGg6cZx8snmKKca7X+ybb0u0hHEpdiGqHNBSl
         3kGg==
X-Gm-Message-State: AOJu0YxWuyOuzRHfd0ItykZdh0Lqtjg6uSCy0ijGYXJXtNadt1G03s6X
	GTrTeG53IIxHJuTOcooJKY7EaAwPcrjZ1/0Mmyo+Pg==
X-Google-Smtp-Source: AGHT+IEQzodyd9vz4B621/6cy5AO6Fbt3D8H/LzvFpY5S44hM1nSd7SCg1qWjxx8fR3UGrUZPBRPQY8eS6S5g0RbKIg=
X-Received: by 2002:adf:f70c:0:b0:317:5af3:caa4 with SMTP id
 r12-20020adff70c000000b003175af3caa4mr7859759wrp.38.1692724676163; Tue, 22
 Aug 2023 10:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <CAFP8O3J2pUddEfL+W2j=tpjdj1ufsQMJqjcARbYvY3+khtBPig@mail.gmail.com>
In-Reply-To: <CAFP8O3J2pUddEfL+W2j=tpjdj1ufsQMJqjcARbYvY3+khtBPig@mail.gmail.com>
From: Denis Nikitin <denik@chromium.org>
Date: Tue, 22 Aug 2023 10:17:45 -0700
Message-ID: <CADDJ8CWon2yh=vW73W-88pSaU+J1UfPwhJ7++iAWwnUXvTJD9g@mail.gmail.com>
Subject: Re: [PATCH] modpost: Skip .llvm.call-graph-profile section check
To: Fangrui Song <maskray@google.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the prompt review!

On Tue, Aug 22, 2023 at 12:06=E2=80=AFAM Fangrui Song <maskray@google.com> =
wrote:
>
> On Mon, Aug 21, 2023 at 11:54=E2=80=AFPM Denis Nikitin <denik@chromium.or=
g> wrote:
> >
> > .llvm.call-graph-profile section is added when the kernel is built with
> > profiles (e.g. -fprofile-sample-use=3D<llvm.profile>).
>
> Right. .llvm.call-graph-profile may also be added when the kernel is
> built with clang -fprofile-use=3D (though instrumentation-based PGO
> support is not upstreamed yet).

OK, I will add -fprofile-use.

> > The section holds
> > metadata for symbols beloning to other sections and hence doesn't need
> > modpost checks.
>
> Typo: belonging.
>
> .llvm.call-graph-profile contains edge information derived from text
> sections, so .llvm.call-graph-profile itself doesn't need more
> analysis as the text sections have been analyzed.

Ack.

Thanks,
Denis
