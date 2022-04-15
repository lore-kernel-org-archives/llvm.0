Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DD27B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 17:34:00 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id md4so8089109pjb.4
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 10:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Cj4lHoJbdVe7/yfpNvTK/X4gKN0yimHzFNu70ixPoFc=;
        b=bQ9Uoq6f8ua+HQMVChR2hvHq9zh8N2X02Qsfy6gnUjzbOW0BA5UUuqextBMPbux0x6
         LOllMaVWds3+HMLb7Njk5gRa3V59cOgxRtCYiPPwq9aU5piIU38CeW9cTiMt81t+h2+Q
         s1tGV4SSdieISroNVa6qnTONweMP4/miOMFfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Cj4lHoJbdVe7/yfpNvTK/X4gKN0yimHzFNu70ixPoFc=;
        b=dDR/Bom22WxIngteHArcv/HBlXev8F9q3su8/uebBQDtIJdFid6J9fj8KDE43t0kC1
         pjp+Ht7ib/OP7EhkO2t89r5PZA+1fiim3cgGSeJxh1RCtnYYmLmyR/N4G7vXEzAa4ltw
         KhSNw5Q+HuIugezz7FbyG4PB+NhGNcZKM/TUOsQwBojCj035yBU1+rGovwGFLTZkHgms
         aUodl7vArImCS925HXDIGPvgwSrVunV/j1+TIkODGYPYesfXY9kQ9eus/xEtreknQFnw
         DDLxv2mQdWJmnhc7y3L64agnT1cA++Q04CmxI5UtiUfFgVJM3x15nswLs8hazBbi0usi
         jdqQ==
X-Gm-Message-State: AOAM531sodeIUK9FoZnWNTtT86yYespaLJuMSUiItxdWZxEoTiZ3JWkK
	NnXvIFX6XtNx+95XiERsg12nWQ==
X-Google-Smtp-Source: ABdhPJwGOIhdA72t4m1dL+juRKEBgpxoxbvjv/BaxNXuLioe9WQxNbkB2mNutNprB9Fue+CuZ/dZsQ==
X-Received: by 2002:a17:903:2052:b0:158:c6aa:b96 with SMTP id q18-20020a170903205200b00158c6aa0b96mr206943pla.140.1650044039760;
        Fri, 15 Apr 2022 10:33:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d16-20020a056a00245000b004f771b48736sm3571711pfj.194.2022.04.15.10.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 10:33:59 -0700 (PDT)
Date: Fri, 15 Apr 2022 10:33:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Qing Zhao <qing.zhao@oracle.com>, Bill Wendling <morbo@google.com>,
	"Moreira, Joao" <joao.moreira@intel.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	"Jose E. Marchesi" <jemarch@gnu.org>
Subject: Re: toolchain mitigations plumbers session
Message-ID: <202204151024.DFDBF9DD6@keescook>
References: <CAKwvOdniB-+F37ygZhRytBGVFjwnukyOpmoiJTCeusMdb=6_=g@mail.gmail.com>
 <3DE35A81-1FC6-4EC7-8F3A-B395B576644D@oracle.com>
 <CAKwvOd=CqOfd=zprWQPYoddgnGPJMb_sdk2Eut9DZNJq_fFJ-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=CqOfd=zprWQPYoddgnGPJMb_sdk2Eut9DZNJq_fFJ-w@mail.gmail.com>

On Fri, Apr 15, 2022 at 10:17:46AM -0700, Nick Desaulniers wrote:
> On Fri, Apr 15, 2022 at 7:50 AM Qing Zhao <qing.zhao@oracle.com> wrote:
> >
> > Hi, Nick,
> >
> > > On Apr 14, 2022, at 4:30 PM, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > Hi Qing, Kees, and Bill,
> > > Jose and I are currently in the planning process to put together a
> > > Kernel+Toolchain microconference track at Linux Plumbers Conference
> > > this year (Sept 12-14) in Dublin, Ireland.
> > >
> > > Would you all be interested in leading another session on
> > > kernel+toolchain collaboration for mitigations? Do you plan to attend
> > > plumbers this year which will be in person?
> >
> > I’d love to attend  plumbers this year to meet people in person!
> > But not sure whether there will be enough new, big stuff to report this year since mostly bunch of bug fixes and minor
> > Improvements to the previous work.
> 
> No worries; it doesn't need to be a presentation, or just one person
> presenting.  I think a quick review of newly developed features from
> various authors, then a discussion with consumers (kernel developers)
> would be beneficial.

Yeah, this kind of overview is what I've been doing the last few years
(with Qing last year):

https://outflux.net/slides/2021/lpc/compiler-security-features.pdf
https://outflux.net/slides/2020/lpc/gcc-and-clang-security-feature-parity.pdf
https://outflux.net/slides/2019/lpc/gcc-and-clang.pdf

-- 
Kees Cook
