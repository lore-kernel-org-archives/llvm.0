Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A76D19
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 21:43:07 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-31bf3656517so6032537b3.12
        for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 14:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dMHt42bJ1YlW7qsjn88JwOKrZtD6Yx+xury8B4lI9tk=;
        b=QZX9HPFJkD9+fzjjZWsSCiOlE2J/2LsSXswBgBMfa0v9fHzcoWvnjb3VEHfacRDxYt
         p83HHAoDzMPStKdrx0jpo73c8H8L9bqEGASwti9PF8dOP3fCoFE5oH/ju2WQmAQFEEIu
         2Xz2bGf3ke5KIZ7wLDOHukz6+UP1FeL/mHrTRw4YBe0bei7LrMaWHv9MK4+4nSVTMqqG
         ymgvGNvQO0Nd0WelNyhtBiIiaOFrQcB9iNsxPXb3n1Ms9Cifpj/jY5RcFc0VRFuYaxzm
         5n57zZG1SqXMuAv13Cm4jvQDrnSDsKNEgKpD6Nce8ZdKUymPJnZdqir5kYHPe0ea6UPb
         aTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dMHt42bJ1YlW7qsjn88JwOKrZtD6Yx+xury8B4lI9tk=;
        b=oryujCUdnEXQUjf+pqPU2gJmY8p+nWtP/KGS6fzXEVHOJ4XM0Rk77YpdCwrbUe09u1
         coCLHFgm3r5jnE2I1xaWInDnO8mc200/jQ0WgYCC/Hmqv5pPmRcIDqBykt40EyZRrbuo
         A/Va+VHtAb5H749ktnUCKAIK7cv/ne+ezKVhrKYWYiAYtkEvY5H/8r2tHdEGivUH+RZc
         pbxNGYOnzXXbRIFnsgs4Z4eTmE5tDWevg+wbW4k9WCQVFxZnuy/GkRaatW9bgAs6fyd1
         lnXMEjXdZEhiQfckkn2J8g5cOztZm0Wp7eKoKhUPaPkYRpsPTpbOsLwjvPPdeRf6ENWj
         Nixg==
X-Gm-Message-State: AJIora/ZqhC3wpk++qKQ9HiTj1Mgg19opyiRVs/gaoDEVFBiohXdMxyR
	uvea/RBZOLnGRf7izq5kCmEbqg3kyFbwngBQhxE=
X-Google-Smtp-Source: AGRyM1t2UrK1hzV79ai9XXNCfm4iNtTsbANUmoYqfQmUHleEfY0pxh0cpqQXRU3xd7K+u5jePVWW1lw/QC+ZRlYpm3Q=
X-Received: by 2002:a81:2386:0:b0:317:6586:8901 with SMTP id
 j128-20020a812386000000b0031765868901mr12916894ywj.195.1656625386155; Thu, 30
 Jun 2022 14:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220629235326.480858-1-justinstitt@google.com> <20220630195738.904505-1-justinstitt@google.com>
In-Reply-To: <20220630195738.904505-1-justinstitt@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 Jun 2022 23:42:28 +0200
Message-ID: <CAHp75VfYPfvcySRJboSO8YsXTfO61j7QM=mYrDDPJquRAwzw0A@mail.gmail.com>
Subject: Re: [PATCH v2] lib/test_printf.c: fix clang -Wformat warnings
To: Justin Stitt <justinstitt@google.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 30, 2022 at 9:59 PM Justin Stitt <justinstitt@google.com> wrote:
>
> changes from v1:
> * moved NOWARN macro definition to a more appropriate location
> * using __diag_ignore_all (thanks Nathan)
> * using local scoping for code blocks instead of __VA_ARGS__ (thanks Nick)
> * indented affected test cases (thanks Andy)
>
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Somehow you replaced the commit message with a changelog. On top of
that, I didn't suggest anything important here, so to me it is
considered as a credit in the changelog (see previous sentence as
well).

-- 
With Best Regards,
Andy Shevchenko
