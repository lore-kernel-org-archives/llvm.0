Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3677E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 06:17:40 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id m128so7267322ybm.5
        for <llvm@lists.linux.dev>; Sun, 24 Apr 2022 23:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCtKQYSTps0VrLDUq04agqNEXmphYahJ7hA7Tsk3PTM=;
        b=xmgI3GlWs6Rk6xKPI/tcCK4csntqVoAoP7JRqaBpllY+Jzsru5LDACZ+ytbMq+BlrN
         gU0YUaxaES0x/bq63pnO4SnQAQmv7rcYda8Z33CXsN96lC+3nDKdZQ1Fmy+tZ8CCZ+c1
         3lc90n++hDsZ1c/L8/K35hiyvg1lPawVmjGOoJKrOuGAmTv1veZ3Ac+FXN+GS5K3lUtR
         sX+qlrgi90P14509bbRC81qQ4slJwnL6H7eg3j3aFg8KhG5PqV+ASYTjAdPLQgHFMjPr
         iM/J81qg8iO2NiJaYvW10+UyfYYsmMKUtMMOB3E+BxXv4nLd6zsa1bdnRDd90U4WBUPt
         Lw7w==
X-Gm-Message-State: AOAM533nr7EYfJu2/sTYekZvlWAaPUerAW6LzZ+htHsOyjyMdDXYripr
	D3W1nrAlSCS7WmE3ORszeZjAoNsZq/3m4aVo8JI=
X-Google-Smtp-Source: ABdhPJwZwQAaQ5egYyYjlBDWprpUmMiY8C08pHkGK7L97GUxtWa3ijJqZPpDBUDSxZiWSdAjFcDdwIhK2lar/ppEDE0=
X-Received: by 2002:a25:76c6:0:b0:648:5616:ca50 with SMTP id
 r189-20020a2576c6000000b006485616ca50mr4091431ybc.423.1650867460065; Sun, 24
 Apr 2022 23:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422151725.1336997-1-mailhol.vincent@wanadoo.fr> <YmXMiTXEvFXZ/swU@dev-arch.thelio-3990X>
In-Reply-To: <YmXMiTXEvFXZ/swU@dev-arch.thelio-3990X>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Mon, 25 Apr 2022 15:17:29 +0900
Message-ID: <CAMZ6Rq+3XOze01dZZRTe+V44N2uo5J_=rtd9bKH7d7Fq9sNxVw@mail.gmail.com>
Subject: Re: [PATCH] checksyscalls: ignore -Wunused-macros
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

Thanks for the comments!

On Mon. 25 Apr 2022 at 07:17, Nathan Chancellor <nathan@kernel.org> wrote:
> Hi Vincent,
>
> On Sat, Apr 23, 2022 at 12:17:25AM +0900, Vincent Mailhol wrote:
> > The macros defined in this file are for testing only and are purposely
> > not used. When compiled with W=2, both gcc and clang yield some
> > -Wunused-macros warnings. Ignore them.
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>
> The change itself looks fine but a couple of comments:
>
> 1. Nick and I do not pick up patches, we rely on others to do so.
>    Additionally, this is not really something within our domain, despite
>    what get_maintainer.pl might say. This change should be sent to
>    either
>
>    Masahiro Yamada <masahiroy@kernel.org>
>    linux-kbuild@vger.kernel.org
>
>    or
>
>    Andrew Morton <akpm@linux-foundation.org>
>
>    so that it can be applied by one of them.

Ack. As you pointed out, I indeed just followed get_maintainer.pl.
I will resend a v2 to the people you pointed out (and exclude you).

> 2. I am not sure that silencing warnings from W=2 is that useful, as
>    they are unlikely to be real issues. Not to discourage you by any
>    means but it might be more useful to focus on cleaning up warnings
>    from W=1 and getting those promoted to regular build warnings.

Normally I agree, but there is one reason to fix this W=2: this
warning appears when building other files.

Example:
| $ make W=2 drivers/net/dummy.o
|   CALL    scripts/checksyscalls.sh
| <stdin>:21: warning: macro "__IGNORE_stat64" is not used [-Wunused-macros]
| <stdin>:22: warning: macro "__IGNORE_lstat64" is not used [-Wunused-macros]
| <stdin>:75: warning: macro "__IGNORE_llseek" is not used [-Wunused-macros]
| <stdin>:159: warning: macro "__IGNORE_madvise1" is not used [-Wunused-macros]
(rest of the output redacted).

When I run W=2, I want to only see the warnings of the file I am
working on. So I find it useful to fix the W=2 warnings which
show up when building other files to not get spammed by
irrelevant issues and to simplify the triage.

My initial message lacked the rationale. I will add additional
explanations in the v2 of this patch.


Yours sincerely,
Vincent Mailhol
