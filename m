Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236783225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 22:13:47 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id f5so155516ljp.8
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 15:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IKci9zYLvStXfoOzJWr4xGXyeN+jUndpG64b6kauUp0=;
        b=qvqe+62r+z/zDHE5VRRaio8IJPC7F3l7Dlayxdrb3SvRIoEubz6Cle36EQUX9fbPX0
         +Uk2MTpyjYKEOQKsRoqkF0I6kAL3jfNo5MGfXeFMyJvuakCaiWPRq2AErFX811Fn+e9L
         x4v0nZHKKgisniNqH6PqHnF7caSTYdUF1xCdBfEH2UnqgFvjFwkfX+Rx/kAflE8nyN+j
         I7anxMwZ90CMLksmayukGJd25+eTmClHgkLjS4SdszIZPDaaAxGau1lUPcSDR5Vtdwo8
         sm9hruLYGP5JN5K+iqtkIcpcLcxVnz4sjKQyofJgrfZ3oMVP0XjOKWtJ0p11BuhDQIoY
         lwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKci9zYLvStXfoOzJWr4xGXyeN+jUndpG64b6kauUp0=;
        b=tD0Dlcforjh/uh9DXwZIkS3iH61+aqcwbe8p3KJAGdplOwapkqweD8n1zxasSeDnDX
         6J8kcOeSgCeKrRl+CsJ3Uy8B/Mw1Hv99MVYbb+wTyNM+eJjB4tn0+kzGAv5lNEfBR23T
         HG9KdsrH60NT61WmHBIJmjTkbt0Ctu9OGUODaiCNAAKIGLbIsU5/n9L+OZx0LZpqopW0
         PZqYB/n9o+oCEDSUS9pk6dLR3rQ1auJTm7JhNWK5fk5NgDwJ57XSWbR1u2lMACBCpwjZ
         OPSHlvRXygv+wD27y7luzYU52DLBMC3pcEzoI9+XaT+IA3qd6vvo1lKnkWDwQ864jgtY
         +Zyw==
X-Gm-Message-State: AOAM530RDxRihW+0NqyMQFcUEmVek1HVeVYMfLMLXrYioYuBSFLKB7AA
	nWEMtQFvn9HNHMcmmUEufrWJtWuiO/7FkC9rQQsRTg==
X-Google-Smtp-Source: ABdhPJy0w0vwfGz3NPPcdJRgNSnmwG8BK0PTb3S8h9EVIY4Gx4Gpp0ntMuST8iHzvd1KZ/Qvu8mp2UL86xpd0IzsIuk=
X-Received: by 2002:a2e:8650:0:b0:24b:5309:352f with SMTP id
 i16-20020a2e8650000000b0024b5309352fmr2697199ljj.472.1649974424908; Thu, 14
 Apr 2022 15:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnb-DiAnq4bT7XiJpFtqyJYpWNw1shEp8gWYpVmUpRBaA@mail.gmail.com>
 <8c5012c88989a8f05a3b67540b9172336c57ddf7.camel@redhat.com>
In-Reply-To: <8c5012c88989a8f05a3b67540b9172336c57ddf7.camel@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Apr 2022 15:13:32 -0700
Message-ID: <CAKwvOdmXYa-A76CGitoAFNQz3rab37AJafQVN-=QSRVDA8y1fg@mail.gmail.com>
Subject: Re: Plumbers conf presentation on -fanalyze?
To: David Malcolm <dmalcolm@redhat.com>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, 
	Steven Rostedt <rostedt@goodmis.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 3:08 PM David Malcolm <dmalcolm@redhat.com> wrote:
>
> On Thu, 2022-04-14 at 14:42 -0700, Nick Desaulniers wrote:
> > Hi David,
> > Jose and I are currently in the planning process to put together a
> > Kernel+Toolchain microconference track at Linux Plumbers Conference
> > this year (Sept 12-14) in Dublin, Ireland.
> >
> > We had seen
> > https://developers.redhat.com/articles/2022/04/12/state-static-analysis-gcc-12-compiler#scaling_up_the_analyzer
> > particularly the section on The Linux kernel and were wondering if
> > you'd be interested in presenting more information about -fanalyze to
> > kernel and toolchain developers there?
>
> Thanks!  I'm very much interested, but am not yet sure about travel
> (both in terms of (a) budget and (b) possible new virus strains).  Is
> this conference going to be purely in-person, or hybrid virtual/in-
> person?

I didn't see an answer to that question on
https://lpc.events/event/16/page/185-faqs.
cc' James + Stephen who might be able to answer that more precisely
than I could.
-- 
Thanks,
~Nick Desaulniers
