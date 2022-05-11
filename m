Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F153207
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 20:01:27 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id y32so5427598lfa.6
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aIr7kufHqh1aklBFT48PcfwiGgRwuFks7DI5SiM+9Q0=;
        b=aDFV+CNgCaB8HAuXCMaTOeqfz3Euqlc9UfykqEg/M7trT+lMOcwb6NTqEGZJ7SsVNZ
         wKPGERgQdDUkJumgL37urxFlDsGkmX7PqdKJaBJZ9MZbdtLV8cQTIpE0yfVn6cMSgZyZ
         GDcUvdJSKIpdCHdovd/rPOddBCdGdf7Tcs7gNO1JNMXTpaAKmIBz3TFWivhPzhsqWiWP
         vJ/31TdyTBLQqry7t/YKe6QWlgU/ihp+YfVohSDDCIs1NWIXVc6t8SiZYJv7SQNHxS8u
         uvm0zjVSH3yCGxEApXJnHd78LwJfVPsGlD2n86/VBo9AQNLgEv62rjfzxd444XLv3wC4
         k+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aIr7kufHqh1aklBFT48PcfwiGgRwuFks7DI5SiM+9Q0=;
        b=iVfyozSSTxlARM5b6WNPiNfGTUwECB0FEkFDkDdcQwGHFi9+Ka01sbvzLBeH+8BlWE
         jv9xEAAxlCkvhYANKc4v40+VQFXzU2rutjz/nlYdtAeKUUDpTS52FBi/HUmeHiIJp+0Q
         AUopwJRjOCucEI0R/B5gNDvjs8HgpDwnahvRGw+v67STg1buje53zk/LPF5LDbMGSzBe
         h1jWqP9WpFBInXJCC5VHwHO84hh1jvT/9RYIxRKclvbsQdnOv9ZWdltnNxm4StEJpy5E
         EgvJKS3uiIe3G4dskZ+DoQEQg/aEM6fmqXSnZhak0hNAHOZn399l+0UwopgyDazZ5nXT
         nhYg==
X-Gm-Message-State: AOAM533mBqdbpMNLp5vcXHXTf5gjWQsVAWuM9+bW2LIwHIARBBcovaFG
	nY7FUpwcwOPf31wkbYCwXy+3FAiWEbTP2O2b3iiSOw==
X-Google-Smtp-Source: ABdhPJyw+NM/b0aVOHtc066BYz2oDYf2ffAEKshIqZZZ77ExFAqpVJecq3d8qHUAeYUdPNE/gr7l7Cdi4Emgrt5UzVw=
X-Received: by 2002:a19:4303:0:b0:473:f5fb:27b2 with SMTP id
 q3-20020a194303000000b00473f5fb27b2mr20127658lfa.626.1652299285108; Wed, 11
 May 2022 13:01:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org> <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
 <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
 <CAKwvOdmK4oH0t8Q6F19sWKX1fT=AgS=kfvn05FT01HffLJwgMQ@mail.gmail.com>
 <CAK7LNAR5preB59HJH1-F_ZfEmoF3N8b9z4eRhYzsEVwu_XUH4Q@mail.gmail.com> <8babc23b-5e24-f662-6c4a-eb1c30e0e6da@quicinc.com>
In-Reply-To: <8babc23b-5e24-f662-6c4a-eb1c30e0e6da@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 13:01:13 -0700
Message-ID: <CAKwvOdk1z6jnTA79W8qyy1sWuoa29YxppU1gAkHkQ=g6UiVvCw@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into section-check.c
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>, 
	linux-modules <linux-modules@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 11, 2022 at 12:51 PM Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On 5/11/2022 12:27 PM, Masahiro Yamada wrote:
> > On Thu, May 12, 2022 at 3:48 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> >>
> >> On Mon, May 9, 2022 at 11:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >>>
> >>>>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> >>>>> index a78b75f0eeb0..e7e2c70a98f5 100644
> >>>>> --- a/scripts/mod/modpost.c
> >>>>> +++ b/scripts/mod/modpost.c
> >>>>> @@ -31,7 +31,7 @@ static bool external_module;
> >>>>>   /* Only warn about unresolved symbols */
> >>>>>   static bool warn_unresolved;
> >>>>>
> >>>>> -static int sec_mismatch_count;
> >>>>> +int sec_mismatch_count;
> >>>>
> >>>> ^ this should go in modpost.h if it is to be used in two translation
> >>>> units, rather than forward declaring it in section-check.c.  You did
> >>>> this for the functions.
> >>>
> >>>
> >>> Sorry, I do not understand.
> >>>
> >>>
> >>> In modpost.h, I put the declaration:
> >>>
> >>>    extern int sec_mismatch_count;
> >>>
> >>> If I moved it to the header without 'extern'
> >>> I would get multiple definitions.
> >>
> >> Yeah, you need to _declare_ it w/ extern in the header, then _define_
> >> it in one source file.
> >>
> >> That way, if the type ever changes, the sources will agree on type in
> >> all source files. You will get a redefinition error if the definition
> >> changes the type of the variable since the last declaration.
> >>
> >> What you're doing is forward declaring, which works, and is a common
> >> pattern for (bloated) C++, but is less type safe than sharing a single
> >> common declaration between multiple source files via a single common
> >> shared header. (Sorry I didn't respond before you sent v5)
> >
> > Sorry, I still do not understand your suggestion.
> >
> >
> > Could you provide me with a code diff
> > showing how to do this better?
>
> I think you are doing exactly what he's asking for:
> declare it with extern in the header (modpost.h change)
> define it in one source file (modpost.c change)
>

Oh! Indeed, sorry, I'm getting lost here in the review. Sorry for the
noise then.
-- 
Thanks,
~Nick Desaulniers
