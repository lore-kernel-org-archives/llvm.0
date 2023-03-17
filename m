Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A636A
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 18:35:56 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id o12so23846971edb.9
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679078154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q47tfVyvSpC5G96FSLgqo6Kvz0mEzwMLPLkpQTW/zI=;
        b=JbBqHEhfmHr5XPbZxFNDq4j+yfnEgmJQgeYj4hZRvH7vK7FoVf2ZtooAk/UvdnFPur
         6OhA5LGymXYkuA1k9leOEJjJI0ySR5XiXWRDUyrQbZsoDddK/UOVsL8e7k7io6xz9SAX
         yaE3WeEQaUvkXXJTQP1+rBl+NDP12XlNkll4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679078154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6q47tfVyvSpC5G96FSLgqo6Kvz0mEzwMLPLkpQTW/zI=;
        b=CLdIiwwcmp20XI0rwQhqkL6V3xk376OoVK39LLwtTRuZSqQSJOQZGTSTAcDZsCFfBT
         w1U/aSp7rwTSSGKCcbF+vV3bsYpbLkvrRscqFgwxY4BzqdT/pPDqsrxASHEFkUh1U50t
         qmHNYaP+jGtZE1LgtA6G5HeDaTFA7Tq9B+HM39qOqOyXePOe1kLXfngwMeoVSFktCB9S
         LBXr5Gg908BRX/E7wa173rXWEmFrhiknTFdTJFrH9TZkabH4HRYbMcdseAJxgGM5Mjer
         dUzuBInAFo24EUAiiFmGcBOmCAmkOujTcX40gZXN5C6F5DINmtyrAe88cuif55tIiqs0
         bJDA==
X-Gm-Message-State: AO0yUKXQDHnVaBzPgCpgSXbUyACf/gT09dvh4PzSlhqZ8cY+I6806vkx
	HRHDylS3ojSJP0kDW/KlnrXUMMFB2QVe4j04WQSQnQ==
X-Google-Smtp-Source: AK7set9VyUibSaSpt2JUym1fe4+SLIsh4HgWnfI1c0oqBHKx5MuE+o/XvN6UIZ5cEgefFPRlqysD/Q==
X-Received: by 2002:a05:6402:10c5:b0:4fb:999:e052 with SMTP id p5-20020a05640210c500b004fb0999e052mr3435468edu.33.1679078154713;
        Fri, 17 Mar 2023 11:35:54 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id l6-20020a50d6c6000000b004af62273b66sm1412035edj.18.2023.03.17.11.35.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 11:35:52 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id w9so23959209edc.3
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 11:35:51 -0700 (PDT)
X-Received: by 2002:a17:906:6805:b0:8b1:28f6:8ab3 with SMTP id
 k5-20020a170906680500b008b128f68ab3mr137958ejr.15.1679078151333; Fri, 17 Mar
 2023 11:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
In-Reply-To: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Mar 2023 11:35:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
Message-ID: <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 10:16=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote=
:
>
> - blk-mq SRCU fix for BLK_MQ_F_BLOCKING devices (Christ)

Christ indeed.

But I think you meant "Chris".

> Side note - when doing the usual allmodconfig builds with gcc-12 and
> clang before sending them out, for the latter I see this warning being
> spewed with clang-15:
>
> drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fmt() fal=
ls through to next function m5mols_get_frame_desc()
>
> Obviously not related to my changes, but mentioning it in case it has
> been missed as I know you love squeaky clean builds :-). Doesn't happen
> with clang-14.

Hmm. I have clang-15 too, but I do the allmodconfig builds with gcc,
and only my own "normal config" builds with clang.

So I don't see this particular issue and my builds are still squeaky clean.

That said, when I explicitly try that allmodconfig thing with clang, I
can see it too. And the reason seems to be something we've seen
before: UBSAN functions being considered non-return by clang, so clang
generates code like this:

   ....
.LBB24_3:
        callq   __sanitizer_cov_trace_pc@PLT
        movl    $2, %esi
        movq    $.L__unnamed_3, %rdi
        callq   __ubsan_handle_out_of_bounds
.Lfunc_end24:
        .size   m5mols_set_fmt, .Lfunc_end24-m5mols_set_fmt

ie the last thing in that m5mols_set_fmt() function is a call to
__ubsan_handle_out_of_bounds, and then it "falls through" to the next
function.

And yes, I absolutely *detest* how clang does that. Not only does it
cause objtool sanity checking issues, it fundamentally means that we
can never treat UBSAN warnings as warnings. They are always fatal.

This is a *huge* clang mis-feature, and I forget what we decided last
that we saw it.

But I suspect we need to disable UBSAN for clang, because clang gets
this so *horribly* wrong.

Fatal errors that cannot be recovered from are not something that the
compiler is supposed to decide on. It's exactly the same issue as
BUG() calls: it just results in a dead machine, and in the process the
actual problem easily gets lost (because maybe this only happens while
running X, and no serial console, and no way to actually see what the
UBSAN warning was as a result).

I really really detest this thing, and I think this is a fatal flaw,
and means that as-is, UBSAN really *has* to be disabled for clang
kernel builds. Maybe that will make somebody wake up and smell the
roses, and stop this idiotic "undefined behavior is fatal" garbage.

Nick? Do you remember what the fix was last time?

               Linus
