Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C863D2
	for <llvm@lists.linux.dev>; Fri,  9 Dec 2022 18:17:20 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id q71so4055206pgq.8
        for <llvm@lists.linux.dev>; Fri, 09 Dec 2022 10:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mHldBNwMDxBGa5oJAciP9SUh7XCxBJPxzIOTUsmKXsg=;
        b=WN8zt38fo0rPzI1M/6FwYLK6sw5AQwIa6Pr5EoLBhkjMBvLUWnVWr0DxkBlJlJ8Uib
         7O7rhSf7jJoryqf0zhjFyeRUTUHZdMu3yTJaMm5kK/UTv+7hyq6ilrMMEk9pqYl/bQcG
         dXIuqC4UOSOWfpEfqD9PrDzkJsuwrxH/YP2tiwSsM4TyPUeXB6m5gIk+YRQNYGivlLmB
         PpogDGG/pQumE4+vhoOiU6S/k7GN1Qxg8FZDPvwqUf4N6SIvZ0XXQver8oUZiWtfIg9w
         wcXYt9uRPJ/iiWJA7z1jF95/usONGU6/+6MgmkWTBFfSAkt0vjUm0bkwRGUgWLV6H3pM
         Bt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHldBNwMDxBGa5oJAciP9SUh7XCxBJPxzIOTUsmKXsg=;
        b=t4A+dqzJiJ8fVMcGv8D/Dyz8RSgdAcoimOaawXofeohP9y1lYB+BNT1Tw5BN5dpCTg
         4P67yLaYKD3QwUwhUaYbgaEwTDd+NaiBl6CLhTU/IZdkRaf+m2WlBdhm6okDsmj+93Wb
         H2p13KKKUtYWR7vhxdtG+y0/HSuJSL2+BjGGJ8nvqFAOsOnZjTyicnkY9DOGak8w7IG/
         Rj4XycJjrLifWLLfBjBeJK0Q7GO+QqTmovTtSZt9YPl4QG75oXI2cxBc1WuIE4sR0yxG
         4LoKjJQRo2g/5idaBPqyBBT/JnqrBigCnNxSzrN1xBiMSnZmywIF/3ZgNh93/peuw4qb
         y2WQ==
X-Gm-Message-State: ANoB5pnitUfEvUpXd4ZU2/D9G94pl5lyVTg8/5mCaSpmFm0BSVwcOW9/
	q6TNnhec0LwMV6JJdxZOnu6LMkOabEt9DjZn1z4oqQ==
X-Google-Smtp-Source: AA0mqf7Z/nMXR28vj8/FO4hAcG3xVvi1C0aJ5KtF473JPDM/O/TREHX4VgMJrUiLBXmw/AOAZYWK+u+q+01l1XwZgCI=
X-Received: by 2002:aa7:8c54:0:b0:574:2f5a:18d0 with SMTP id
 e20-20020aa78c54000000b005742f5a18d0mr73001464pfd.23.1670609839914; Fri, 09
 Dec 2022 10:17:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com>
In-Reply-To: <20221122001125.765003-1-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Dec 2022 10:17:08 -0800
Message-ID: <CAKwvOd=fEc=f++NFJpb+QOynC8vRrRp3wFT1KpQNwVcG9WWdrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] objtool build improvements
To: Ian Rogers <irogers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 4:11 PM Ian Rogers <irogers@google.com> wrote:
>
> Install libsubcmd and then get headers from there, this avoids
> inadvertent dependencies on things in tools/lib. Fix V=1
> support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
> being set for say gcc, and then CC being overridden to clang. Support
> HOSTCFLAGS as a make option.

Ian, I'm terribly sorry about the delay in reviewing this; usually my
turnaround time is much lower on code review...

Anyways, the patchset LGTM; thanks for the work that went into this.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>
> v2. Include required "tools lib subcmd: Add install target" that is
>     already in Arnaldo's tree:
> https://lore.kernel.org/lkml/20221109184914.1357295-3-irogers@google.com/
> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=630ae80ea1dd253609cb50cff87f3248f901aca3
>     When building libsubcmd.a from objtool's Makefile, clear the
>     subdir to avoid it being appended onto OUTPUT and breaking the
>     build.
>
> Ian Rogers (4):
>   tools lib subcmd: Add install target
>   objtool: Install libsubcmd in build
>   objtool: Properly support make V=1
>   objtool: Alter how HOSTCC is forced
>
>  tools/lib/subcmd/Makefile | 49 ++++++++++++++++++++++++++++
>  tools/objtool/Build       |  2 --
>  tools/objtool/Makefile    | 68 +++++++++++++++++++++++++++------------
>  3 files changed, 97 insertions(+), 22 deletions(-)
>
> --
> 2.38.1.584.g0f3c55d4c2-goog
>


-- 
Thanks,
~Nick Desaulniers
