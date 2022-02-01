Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152A52F27
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 21:16:10 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id j14so25994015lja.3
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 13:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6yCl0yrttabI3s7nqjUHynlo3srHrhXhPGElzUkPOk=;
        b=bmiNtc6Ae29Swmg5fc3H/k70xhmmRjtEjcPNh6FgLoUvJUpcAPPu97uoLwA0w0jrBm
         pOM4eMl/IT8X7Cc+T6CXPeQN9ZhyAtdZvS+QxdMrD1DqVNceZpJM4lngftoZhGtHnGK4
         ZWyyIS9wSZqC66iUtcrIssw5hmv6RSKrTKBrF2jdoFRuGK8OpPHYqiTapSwFfZGjK8Tq
         LSwav0CpaPFnaGgLR7Q7ZTDTd2TRQ9mookKcao1R1BP/8Xe1sY2oucnvpapPvMkhzvbm
         CI4j/p0vMv2nfp4JhWuXv39ktAikVGbiN6n6lu5GHzemWtezMJcc97L4SzCcaPrNdxtU
         hzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6yCl0yrttabI3s7nqjUHynlo3srHrhXhPGElzUkPOk=;
        b=cJotlxDGBbWCqTkM+pD/vtbHNSSs01tLLLP+eR/XRONYcGuF/PAWbePVzO118jySmH
         seceUqyGpC+bUTKbe01jCHetO9DK5xgErsf96Q03VzYppUks3kQ4SIUveI8IDgxrpzZg
         BGPJipM0mwwvSM5cnwW6qlUarzlx65QBbIXzgaotr85Sh6lszngG2ucTrYAM+e7YJ6il
         zH/ctLFDINHGMBqC+FHwng2DrefnbuX70XaAXWuZ7W+4StWa1d/BSGbQVppHYkw/R+9f
         FYLWMu4BMaeYJOOIUfB8DyuFq350rvsL/xSlr8A+1jqhp/r0GbAzmmfG8G0GYaKzwE8b
         RGQA==
X-Gm-Message-State: AOAM533orxuH6D/3kLpP6fTxTYQ553fasByVG+BWuv8d9Pw3iWAwWDrh
	qt89QOXh/ASGbuNuE/ccEFnmNUbfYFONa82ctkQ5kw==
X-Google-Smtp-Source: ABdhPJwrMtZhliPhZS5ChFivx/H1H3iJJlf5uao7LihxBJyuwSEBW8JLn2Gy47GuM+rpUIC8+hvJOMzrexoadtJfL3Q=
X-Received: by 2002:a05:651c:3c7:: with SMTP id f7mr13251141ljp.62.1643750168915;
 Tue, 01 Feb 2022 13:16:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220201010838.1494405-1-seanjc@google.com> <20220201010838.1494405-2-seanjc@google.com>
 <CAKwvOd=9nwR7z7wn50SU=mf5AywFLd95ZMH-EbYdHfbeHVvq1A@mail.gmail.com> <YfmedCAn8pK//I2R@google.com>
In-Reply-To: <YfmedCAn8pK//I2R@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Feb 2022 13:15:57 -0800
Message-ID: <CAKwvOdk3rtHCDfW-kCmmQ=UueeXpVVBnG1XGwdoiWWHZgmt5yQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] Kconfig: Add option for asm goto w/ tied outputs to
 workaround clang-13 bug
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, 
	syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 12:56 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Feb 01, 2022, Nick Desaulniers wrote:
> > Note: gcc-10 had a bug with the symbolic references to labels when
> > using tied constraints.
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98096
> >
> > Both compilers had bugs here, and it may be worth mentioning that in
> > the commit message.
>
> Is this wording accurate?
>
>   gcc also had a similar bug[3], fixed in gcc-11, where gcc failed to
>   account for its behavior of assigning two numbers to tied outputs (one
>   for input, one for output) when evaluating symbolic references.

SGTM
-- 
Thanks,
~Nick Desaulniers
