Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9AF14B948
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715119407; cv=none; b=t4cINxRPdMex0Bsoc5SEt/fbymMP+Ccn0sN66o/h+TGBPLFj6ABhDr3BQG7eo9PkzkJOGsMcIKGOx8PuqH1aC2C+wo/vs1mj2uKh1+FAxuI0GKYg5zXAPe+85RaQm4guAFpAvsVMnnsP2pxrIQBE1ox6ahwvnM1AfKj5H047Iz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715119407; c=relaxed/simple;
	bh=MX6SyBQV2e/UPmX5oD7lh1S0/KXjiG5UdXrd7/ZQWrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCPXMK73p9m0LIs0woXS47hwRwbILXwdld7qn3y+yLBpOweQdkriLA4cfWesEnxdxppP0HZ+XU9BkM5IJvKXMqEBt6iehOqyOKv4CeQQ6R+u1R+P6yiu91RDluDP0YYeJYu6Pw5Vt7yj/jaKEmFDNaiYe/D9ueG2RGYneLHS/N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GAH0jYUG; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GAH0jYUG"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36c6e69180fso14674635ab.3
        for <llvm@lists.linux.dev>; Tue, 07 May 2024 15:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715119405; x=1715724205; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XYu6qO5CHO9l0ai1bRXa+x+4h/eEC8RbEzVjbVWXls=;
        b=GAH0jYUGIQXvAz/lVhu6a/yxDA4JxqhDhFvNDrTeLeDicP83alPosLL8FlxlPM9jFO
         wXEtvlbhRhQdOu/rdcpvD//KmPSNE1yQT/t8KRrWXyo4sjc/czkMhPKKYSpYZ1vz/Djd
         Sy8KRSIzPcP5MYt6MA3GJrkyBaufbVWAQkbBk2qhToKmYafeZGS3B/LKpChHbZMcOrjs
         Zkj/oVDZYK7TDDO0+1r3l2ghz/xJRfSv8mwYxmRJh/YpX2bcJOUE+4y1Gio28X2dY/Tk
         xiyZzBHuMEReGHjdA0mLOld3bBcGt8U7vLJrsThY5w75+w5izeWCUJxSoSjEcmnNS7GZ
         LzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715119405; x=1715724205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XYu6qO5CHO9l0ai1bRXa+x+4h/eEC8RbEzVjbVWXls=;
        b=BaOKg060S//KNY1jiT4KHanm4TfWJldqtudFkaGScecXT1+pLwoUEVOmePtsgLaRAG
         O5uM+U8LqykOIxCt7NJhuwtxd0Q/JUStUJPl5ABOsnMc3l0MC9cqHWWyH4TNaDHaEU0s
         QLmRQZO2vYlUvUnz9FuD/sPjLAdxAiKDeWye/58Vf5B+gH/ktAD+Pk5sDXHr9hNnl8ip
         yKHTt7xY7ti2fxHHPS90A2bgbCRPHubTco5v+c9kqZBBpZVhnvnuD2tteTItest7NQMY
         097NLpb46aZeReklCmtyTVtoZQdWG2uWhmBGJLuY/CBn269CwISm5bNV0LhEPM2jUA7Z
         bZuA==
X-Forwarded-Encrypted: i=1; AJvYcCU2zcYUUpOQwZN9vyJYAn71klkpNfRA2aJXmNVE5/UvmPmNE0VW2QpKDQKuXGsZepGs5mGLq3QWhsIuyg65mIHcVPuxmg==
X-Gm-Message-State: AOJu0YweDpFII7IAuDl4K1HSm6DU3/xdD0pz/N/NRbcGMHHuMgK872++
	zfL3PB5JHd9jSD5v5dkvtdGaQoOASUl+PcEZySNAPwkr7kKDoyu3vXGbyjDCJA==
X-Google-Smtp-Source: AGHT+IHeILznDlUOIRj7JtU8GNORObVZbAVb33+P8RJAsCLODYRINZy2EqtCLx4tLeU7nkbNdj4PfQ==
X-Received: by 2002:a6b:5b16:0:b0:7de:a980:f210 with SMTP id ca18e2360f4ac-7e18fd3402bmr96660439f.3.1715119404651;
        Tue, 07 May 2024 15:03:24 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com. [34.66.121.195])
        by smtp.gmail.com with ESMTPSA id v12-20020a056638358c00b0048788df1013sm1625504jal.15.2024.05.07.15.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 15:03:24 -0700 (PDT)
Date: Tue, 7 May 2024 22:03:18 +0000
From: Justin Stitt <justinstitt@google.com>
To: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] ntp: safeguard against time_constant overflow case
Message-ID: <zhb5dy6ysbdghj3vhnj2s3gd7fhqg3v7xmhonkgfxp33qtc6bw@pqyhntprkwjr>
References: <20240506-b4-sio-ntp-c-v1-1-a01281aa01ba@google.com>
 <CANDhNCps8qE1a+Vp2HNgU=-vA5RwhrLd2_D0EMZiNv1j_OOYWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCps8qE1a+Vp2HNgU=-vA5RwhrLd2_D0EMZiNv1j_OOYWA@mail.gmail.com>

Hi,

On Mon, May 06, 2024 at 11:02:17PM -0700, John Stultz wrote:
> On Mon, May 6, 2024 at 3:01 PM Justin Stitt <justinstitt@google.com> wrote:
> >
> > Nonetheless, let's slightly rework the logic surrounding time_constant
> > and how it is incremented such that we avoid unintentional wrap-around
> > (even though it is extremely unlikely to be hit in non-fuzzing scenarios).
> >
> > [1]: https://github.com/llvm/llvm-project/pull/82432
> >
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> >  kernel/time/ntp.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
> > index 406dccb79c2b..a9f039601968 100644
> > --- a/kernel/time/ntp.c
> > +++ b/kernel/time/ntp.c
> > @@ -65,6 +65,9 @@ static s64                    time_offset;
> >  /* pll time constant:                                                  */
> >  static long                    time_constant = 2;
> >
> > +/* pll time constant increment:                                                */
> > +static long                    time_constant_inc = 4;
> > +
> 
> I'd probably use a `#define TIME_CONSTANT_INC 4` for this.
> 
> >  /* maximum error (usecs):                                              */
> >  static long                    time_maxerror = NTP_PHASE_LIMIT;
> >
> > @@ -734,10 +737,10 @@ static inline void process_adjtimex_modes(const struct __kernel_timex *txc,
> >
> >         if (txc->modes & ADJ_TIMECONST) {
> >                 time_constant = txc->constant;
> > -               if (!(time_status & STA_NANO))
> > -                       time_constant += 4;
> > -               time_constant = min(time_constant, (long)MAXTC);
> > -               time_constant = max(time_constant, 0l);
> > +               if (!(time_status & STA_NANO) &&
> > +                   unlikely(LONG_MAX - time_constant_inc >= time_constant))
> > +                       time_constant += time_constant_inc;
> > +               time_constant = clamp_t(long, time_constant, 0, MAXTC);
> >         }
> 
> Overall, this looks fine. Though the time_status conditional is now a
> little unwieldy.
> 
> I wonder if some sort of a helper like:
>       time_constant = safe_add(time_constant, TIME_CONSTANT_INC, LONG_MAX);
> 
> Might make this a little easier to read?

How about something like this:

	if (txc->modes & ADJ_TIMECONST) {
		if (!(time_status & STA_NANO))
			time_constant = clamp_t(long, txc->constant,
						-TIME_CONSTANT_INC,
						MAXTC - TIME_CONSTANT_INC) +
						TIME_CONSTANT_INC;
		else
			time_constant = clamp_t(long, txc->constant, 0, MAXTC);
	}

We can remove the initial assignment and use some fancy clamps.

> 
> thanks
> -john

Thanks
Justin
