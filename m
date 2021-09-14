Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C5E3FD0
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 15:21:30 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id x27so29623332lfu.5
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ssguMYfEPbOSmQk+TNSW555SqwgqRq6H3zcx/TkiIG4=;
        b=FOCU7M2910YmSjOs3uzHpvrnuMQJ+6M1Dun31eKpszs/tj2+qzYm9z475Xilelsvys
         BTeQLXu8XYRilKkeG0H+vILFGBnsfuoI4l41i+l9D7E/k6I1cRZnZDsTAspeJQBMCXxU
         F5g6oa+Za3j3ZMx2sgpuqVczHyUpa082sg1qrW/IjXZOJd87rVt77//45SksuqidkSUK
         pb8mlOl62P/Y+Y7tX0eLO93yf6UamooBU0JCZYBhcYRT2jUG4rdr6K7HLdVtlbNVQ37s
         bheb2rtjJcr9Nsjly6jMqj55NW9HaSIG4OFjySao28wYps/ZtTqMRil5gf+YyQmzxzcx
         mW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ssguMYfEPbOSmQk+TNSW555SqwgqRq6H3zcx/TkiIG4=;
        b=GV55X+YI4FunIQxR1LZcNMeanGVsTjvZbKrmE9QOFgHZKg6KNjqJFvblsnaUjYu1z/
         +sypzlPWFakXALEhdiYIZOfw3RQO085VdvoBtC1/TD45WsxZEl8ut2AsT+HguEvxH5Vl
         wJKmGo+QB/G2Yp883bPpnPYySU4J8a/oU0/CIsPmR37e4AJYU0EaJhj38iHaQUtro1u8
         Li81v97Jpjg2jE3hIzjc9KTc3jTD8gZ5+ayVlxp2Ar5CApgps/olWAf8OPTSTUAXH9yJ
         nByncJ6jJpZEJuiywPuNknxEvNmQDGGsJL8dlH3hDVdhvV/oWyetUvqufXpcotjGc3Gz
         LJ7w==
X-Gm-Message-State: AOAM533MTZJ+tUtgMEtwyepsFa3XL+K54B5EKsv+tngNcwurUIjeQdBU
	BaeOp1koLYWs+5XuIo11W4TuYam01VzbgDwrz3iGpA==
X-Google-Smtp-Source: ABdhPJzOgrp5/KaLNcSbRF5B6CJF4GNxa2fJrA0U7BpG9Ipq4En12c5XU9s2SEiPI6eY+owf3+qaJ4UpNavZz4Ja6Kk=
X-Received: by 2002:a05:6512:1114:: with SMTP id l20mr14101535lfg.550.1631632888098;
 Tue, 14 Sep 2021 08:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-11-ndesaulniers@google.com> <9433c702-ecf2-4197-2456-59857d38538d@kernel.org>
In-Reply-To: <9433c702-ecf2-4197-2456-59857d38538d@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 08:21:16 -0700
Message-ID: <CAKwvOdk3NgvUWuBqkKh0RUiHCUO=1QHFeSykTq=U8gi2_6e4TA@mail.gmail.com>
Subject: Re: [PATCH 10/10] vmlinux.lds.h: remove old check for GCC 4.9
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 4:51 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 9/10/2021 4:40 PM, Nick Desaulniers wrote:
> > Now that GCC 5.1 is the minimally supported version of GCC, we can
> > effectively revert
> >
> > commit 85c2ce9104eb ("sched, vmlinux.lds: Increase STRUCT_ALIGNMENT to
> > 64 bytes for GCC-4.9")
> >
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >   include/asm-generic/vmlinux.lds.h | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index aa50bf2959fe..f2984af2b85b 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -116,11 +116,7 @@
> >    * GCC 4.5 and later have a 32 bytes section alignment for structures.
> >    * Except GCC 4.9, that feels the need to align on 64 bytes.
>
> Comment should be adjusted.

I thought it was still interesting. Perhaps one day it will be super irrelevant.
-- 
Thanks,
~Nick Desaulniers
