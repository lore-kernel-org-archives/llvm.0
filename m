Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B81C7B
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 17:31:48 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id t25so34934084lfg.7
        for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bKovRKzTTq8kVAKncWkMW8HntSojKecvaV7C1Tiy6gA=;
        b=KiMJPhP6xYYFUTWaCNcg8Z9VnzBD8Sm0oGGvMtn8MvEbc8PTHuawBiezi89pfsM7Qg
         Weaotn/+nwWWMTsRSzSg3qRF0kqlRQQhIV56sfRjnhfJlsreFVjkQwOx56O2r6XGhDIE
         5MwNLhFeUXTLv7GhRSR68Rj4yk3AT6dh4zwiNg6OLPp3JgFANNXzgIlgbjJGJVPQTKnx
         MCEUiDTeM+atlaHz/soeTiQbt2NENBGmLKydg6UEQBFGBoYX7OfGhPE0X3Fm27YP4uzU
         UqdaYdcuGBsxGYIcG7YALT7F6u1V1TWM2roEZKCy53hl8+dLM5hWEuupgxTAOg99+qcZ
         o7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bKovRKzTTq8kVAKncWkMW8HntSojKecvaV7C1Tiy6gA=;
        b=jHQwML4YdB0ychaWGiqvfgcBQoil9IyGdHKBZxGESyBpj25TeUkUPFk2U+6Ygx2M1+
         mRz4RQZ1DiSLN/W/GuN/Ozk7+QHOFymzQoqP993SjGGoAuNNT/7yFxaBuxuc2DKx9S7t
         BTXvakuSHi7cpYW6JByNBjYlsQlYqNsF0UudBeFXPKoY4K5YX2M2chxSLq/K/WugqCzP
         mzZ2caTqbEL+IMO2k/RnM4SibeQ2KRmL07aP73kwbTufnAubaduc3CL7GWOZ1EhOPKTf
         o6t5ci4mstEIlCJoRXu5v3SzK2e26rjIpOXatu7idMPG32yxTgdh9DmfuCi1xuuwZkeN
         vtZQ==
X-Gm-Message-State: AJIora+dKV7fFhNJGE14Jrj1Lpr6d7/GwKx+wZyImE1+D8OQOjOdWcOZ
	TPPrjA2lLV4Q2y5XQ2H/Y3HbQ/LTEwXa0LOqgiHa5w==
X-Google-Smtp-Source: AGRyM1vC8qvT64BKHvXZRWx0+8khtoYbG2fNUSn6dQgJUNzOHR73qJQimcWU1Ouvt7DOWBH7/hK5HihBjOUZbkXXK/U=
X-Received: by 2002:a05:6512:b8d:b0:47f:74f0:729b with SMTP id
 b13-20020a0565120b8d00b0047f74f0729bmr6261421lfv.403.1656610306179; Thu, 30
 Jun 2022 10:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220629235326.480858-1-justinstitt@google.com> <CAHp75VdQws+Q8aoh0BZkq1K4Grw0ugo_=NZ1uYO0g38xFjT9Lw@mail.gmail.com>
In-Reply-To: <CAHp75VdQws+Q8aoh0BZkq1K4Grw0ugo_=NZ1uYO0g38xFjT9Lw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 30 Jun 2022 10:31:34 -0700
Message-ID: <CAKwvOdmyXX=P4k_ymT=3EmzEuTZryozOTbe=F08bokw=axieUQ@mail.gmail.com>
Subject: Re: [PATCH] lib/test_printf.c: fix clang -Wformat warnings
To: Justin Stitt <justinstitt@google.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 30, 2022 at 1:14 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jun 30, 2022 at 2:11 AM Justin Stitt <justinstitt@google.com> wrote:
> >
> > +       /* disable -Wformat for this chunk */
> > +       NOWARN(-Wformat,
> >         test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
> >         test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
> >         test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
>
> Perhaps shift right the lines as well?

Along these lines, I think it would look nicer to pass a block
statement (a group of statements) to the macro rather than use
__VA_ARGS__.  Here's an example:
https://godbolt.org/z/fsYcGGEMb

You have to be careful with control flow out of blocks like this
sometimes, but for these simple localized cases it looks like that
should be fine.

As Nathan mentions, you can probably re-use the existing infra in your
definition of NOWARN.  I do prefer some macro to make it appear that
the pragma is scoped to a block statement, rather than multiple lines
for the diag push + pop inline.
-- 
Thanks,
~Nick Desaulniers
