Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5A19F419
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711343; cv=none; b=q92tbj+JBZBZlglDX1M93Ttm5Rnx4V0pY0+zhwut/I6JGki1hPJS7KCTC58EilHYOA+TZjHb8Ap4Dh9BTAPl+NprBRZOT0b/WzxAhIfpfvTxTSvF/rn7MmuMQwypJns2HxbDAnU+PwRM3vF9fdYaf+ygzhxTfaCx9RnN+QGed+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711343; c=relaxed/simple;
	bh=7wlIWTYBu6l85jVG/NNzbm3gZW4+E1mdp1ATovPRdlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJoTgPGhvDIp6czQNIS6Tx7vU2qFA+gPMIhNviNd+AWdhed0Cd1tiTg8mCfUACJVDnhiY/C0eeEsYK5keb24FcSBQ6C2Ol0WIgIcthGl9bxX+GIfkKp/buN+UA1IwDX0TI2+FxfCkF7/JE6doo0OombEJNATM7dxhoFK71fq/0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I1JHOH7R; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I1JHOH7R"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2263428c8baso10025ad.1
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743711341; x=1744316141; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9FiIG9VAdbY9vvhPrckluTadBWrK7mI9etYkWzR0uM=;
        b=I1JHOH7RImL8jpBuxxkBve5NDA4TJKnlTFc2FnidbSCyoXAkgFI7SwmUXGU07L5kyT
         TCsrJgNXaHeS6BGuN4ZkNiMZ9y7+FRd8HTxRo/Y+KZxnzyyb00BJejkOErwF7W3ekt0n
         jzSDCKAnJ3ww6lgQZgUv9CwI0iUgNQsjUWuDcVx2kMyDG1236pjF37D+nKAAoa4ubq+b
         hN6cntU0p3Jn06D0Hed1QtgE0H7kxCLaSRV7LgN9tyg0GuAR4axNWOR9FPaMEdNZSqWU
         nWb6ATwh5NXE67sZlJAeKkvUgoW8TOxOLRdcsGbg6LWVnRfM8COGQ/iGyC/uwk0nx8HV
         B6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711341; x=1744316141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9FiIG9VAdbY9vvhPrckluTadBWrK7mI9etYkWzR0uM=;
        b=HfG7dAc98DFmvvMNb+vX1LxLbRoAaW4KyHzNFPnyP7N5Fp6hIGDP715SCIQgbN41Ya
         XtMLDggEdhzUsNBEObvMrI/5R+eFb2lSHJD1+J2hByYlGlSxD2rBV6bsH8cGFCeikDq9
         vlfI3s5kUEH1tPkxySz8iEqhHbDLRHpCdemOnu9AAf63pUR7dafMS+13jtsL8zpztADk
         nbXGbVK2Tj0PbUrNqDEm7DFHnXEEHZdbYpPzvArG8eQWWxKqvTsSF3MbNfnwWGWbuUu2
         cCvvBNIJ5s6jqmjsHnK5m7gKpQ1sri1bF5yEN3GPzC27mcEIk8fRZd13VcDzrxMgY/o8
         MEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa0rsfjLW34pL6iJ+SARa8Lz2Ll/a1JG9xD2mB6PfF/lFYSWdnPvmrQAn4O2mdoQlengl5@lists.linux.dev
X-Gm-Message-State: AOJu0YyQKCpefBs7iIboZyZOl9zWUe5qLW0KEs2xfmoGJFMIFb3V2h6o
	/CaqAd+nY+CI+2GI3k2YHIpfZg7kCP4R52uyE4ESQyuakMTHMWaMO3XqIzCxwF77feHhhVdG0UE
	AsQ==
X-Gm-Gg: ASbGncsA17cQoiyjRQaWag0lHBw8UaQ/avQwVZilHihFM6szCuY3il13eBB/rW/tMu/
	MM/A4Q+WzvCw7GH7Ckp61WltH5Dl9vYSf+geiZNeo9KhTMQKEGeV9KQCf3oLFXqlP40mxcXa/dM
	ZAV4iVafWUGsA55t6HSrtShuZwL3DgEJmB1eMJXtm1V8FmJXFyzrh8oJSceIrR8OXFftNUEsvCh
	BhppmICDB1yJttC2HvtA/1hvlTThuTGwppJGD/vtqayCsMNJXcF5nFFh9EEXQ63tYxEV4Jai04W
	yBQwwdU0xQLdglICuo7L049oyk2bUUYvOTfMV6NR/tIQRbImjqO3OipKXMOArOoj1ppRyp5h50o
	ooq3/NoY=
X-Google-Smtp-Source: AGHT+IHjSj+UBbEWgXjBxDtxoLUefEdWlIf+aTvXEvObr0AnxhKwZTfr4leY27mrWcr7YIZG65soJw==
X-Received: by 2002:a17:902:d487:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22a8b6b2832mr11915ad.3.1743711340284;
        Thu, 03 Apr 2025 13:15:40 -0700 (PDT)
Received: from google.com (69.8.247.35.bc.googleusercontent.com. [35.247.8.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b41f1sm1978828b3a.147.2025.04.03.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:15:39 -0700 (PDT)
Date: Thu, 3 Apr 2025 20:15:34 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Fangrui Song <i@maskray.me>, Joao Moreira <joao@overdrivepizza.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: kCFI && patchable-function-entry=M,N
Message-ID: <20250403201534.GA197065@google.com>
References: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N>
 <Y1QEzk/A41PKLEPe@hirez.programming.kicks-ass.net>
 <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>

Hi folks,

On Mon, Oct 24, 2022 at 12:24:11PM +0100, Mark Rutland wrote:
> On Sat, Oct 22, 2022 at 04:57:18PM +0200, Peter Zijlstra wrote:
> > On Fri, Oct 21, 2022 at 04:56:20PM +0100, Mark Rutland wrote:
> > > Hi,
> > > 
> > > For arm64, I'd like to use -fatchable-function-entry=M,N (where N > 0), for our
> > > ftrace implementation, which instruments *some* but not all functions.
> > > Unfortuntately, this doesn't play nicely with -fsanitize=kcfi, as instrumented
> > > and non-instrumented functions don't agree on where the type hash should live
> > > relative to the function entry point, making them incompatible with one another.
> > > AFAICT, there's no mechanism today to get them to agree.
> > > 
> > > Today we use -fatchable-function-entry=2, which happens to avoid this.
> > 
> > > ... but I understand that for x86, folk want the pre-function NOPs to
> > > fall-through into the body of the function.
> > 
> > Yep.
> > 
> > > Is there any mechanism today that we could use to solve this, or could we
> > > extend clang to have some options to control this behaviour?
> > 
> > So the main pain-point for you is differentiating between function with
> > notrace and those without it, right?
> > 
> > That is; suppose you (like x86) globally do:
> > -fpatchable-function-entry=4,2 to get a consistent function signature,
> > you're up a creek because you use the __patchable_function_entries
> > section to drive ftrace and now every function will have it.
> > 
> > So perhaps something like:
> > 
> >  -fpatchable-function-entry=N,M,sectionname
> > 
> > would help, then you can have notrace be the same layout, except a
> > different section. Eg. something like:
> > 
> >  #define notrace __attribute__((patchable_function_entry(4,2,__notrace_function_entries)))
> 
> FWIW, I think that'd work for me, and that was roughly my original proposal on
> IRC. My only concern with this approach is code size, since all uninstrumented
> functions gain some point less prefix NOPs.

It took me a couple of years to find the time to look into this,
but here's a Clang patch I committed yesterday that adds support
for a section parameter:

https://github.com/llvm/llvm-project/commit/acc6bcdc504ad2e8c09a628dc18de0067f7344b8

Sami
