Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862342570
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 18:06:25 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id y32so11026481lfa.6
        for <llvm@lists.linux.dev>; Thu, 07 Apr 2022 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vwNPEn1Qq7uv4RdgWNLzHFqsu4OAjr3KWr5NW8LXZlw=;
        b=FzpY0kFBGfyZZCQEyvL5s8hlHiWUO7GtmY3oyySyBa7MFe0FZFxvXn05WHMYorc2zb
         v4aPp5CV0jEedWRUfQYzSCGK2a64BHmsiBIsPJN6vCGNMFJHqJkE7YgpLUh3BoWdi5b7
         9i2nb43MUYG0cI8r4gwHnsz0cb/4Ijpr6mafQ5IYDo+jw8IiVraq7KAwM4/WlMG1dUam
         xSWO/F/WkBDzucun507eTRzAFB36gXSVKrJJwewAhUHKEN8c7l05aHyLPV2uMrfd8n5A
         mXVV3bzxJ1JqeF9HXfW4iS1QC6nGQ6oaCLpY9r5uQl4xFpxueHhv6bGymiV1i3ObxNfl
         IKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vwNPEn1Qq7uv4RdgWNLzHFqsu4OAjr3KWr5NW8LXZlw=;
        b=QBkTHAb+iJ9Qn332X0374QhVocJIlJ42pq/cTZpi6fXfKCiPmKiWe67DbBylEiSuBW
         w6E5PF15d1qUBikQ3ytXTja0g16SIY2Kh8ALZ+/bJZPbE/IVwQkAHPlubJp7RCCAuJ/5
         zCY1PnTW+oaQ3nhmgi+TjA3lbhZOnyYQOBzvzr5Fnxv4/FYFNSBXSIOQio6eI3LGrkb0
         iHpE1wB9RdikHUsl+8/eWpcGgFuoyL1uAzA3w6QIWdbxrknLkZeP1/MVzneeOLq/28pA
         igZ7Yi4uTX/T5p5nRiNjg1NWfPotYHOe/dh0a9yWhdm+fPecOKpCTGFeBKxEOSvzJfXI
         yhww==
X-Gm-Message-State: AOAM5335CfE56ID1/33yGboyAppC55udDkNM6He0xyhzWtEopmDwpViF
	UH9MHVtS+oLX47e10fqHdoeOopok2QDBf6+2wDs8fQ==
X-Google-Smtp-Source: ABdhPJyW51VcXmBTIer//X3eyaZpHr3gODmyvuIZNbPifUFQmk8WOkbQf5q1UK6kw1CeuB8/o10K/VAD1kV1uMt2ZyE=
X-Received: by 2002:a05:6512:3092:b0:44a:e7bb:e961 with SMTP id
 z18-20020a056512309200b0044ae7bbe961mr10226923lfd.190.1649354783232; Thu, 07
 Apr 2022 11:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220407175715.3378998-1-trix@redhat.com> <Yk8nV1kBngon+o6N@dev-arch.thelio-3990X>
In-Reply-To: <Yk8nV1kBngon+o6N@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 7 Apr 2022 11:06:11 -0700
Message-ID: <CAKwvOd=3nP8_SHXLByX1qUWU424g6y-89LR953396+RQME37Ag@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add self as clang reviewer
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 7, 2022 at 11:03 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Apr 07, 2022 at 01:57:15PM -0400, Tom Rix wrote:
> > I have been helping with build breaks and
> > other clang things and would like to help
> > with the reviews.
> >
> > Signed-off-by: Tom Rix <trix@redhat.com>
>
> Thanks a lot Tom!
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
>
> I think we might need to CC Andrew Morton for this, as we do not
> currently pick up patches ourselves.

Yep, Andrew, would you be so kind?
https://lore.kernel.org/llvm/20220407175715.3378998-1-trix@redhat.com/

Welcome aboard, Tom!

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9ebfc93d8f0d..8da670067a34 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4797,6 +4797,7 @@ F:      .clang-format
> >  CLANG/LLVM BUILD SUPPORT
> >  M:   Nathan Chancellor <nathan@kernel.org>
> >  M:   Nick Desaulniers <ndesaulniers@google.com>
> > +R:   Tom Rix <trix@redhat.com>
> >  L:   llvm@lists.linux.dev
> >  S:   Supported
> >  W:   https://clangbuiltlinux.github.io/
> > --
> > 2.27.0
> >
> >



-- 
Thanks,
~Nick Desaulniers
