Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E107847781
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724166684; cv=none; b=Qrwu6WQ7I09DbYabTcm/MJRp3y5ZuV7bPhBVZD+Z8EWFOkGV7TDq+XvGeXaJpMsOk+K3Y8eUhtOConx7z4dVgVu5lr7NGSIv9q2RqWs2znajFOKzxPLRrF3+D0t5oKAu7715O+lHb9Xaz5Ji7WT3bFf7NH0smYikJBTusk4aa6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724166684; c=relaxed/simple;
	bh=M98b0uho/6L9HJYyuZo8mAFH2lRRpS/KAZXa09S69zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MR3nxPd4AaHfOqRfmT7gnQtnSSpeZAIKOYt6vQwbFYY30qNyVsqRZ3RdwZoSoThtfjsM6T7YXL/uxU5Yk+U3Qz5FGgePWJSRjaLbUuc5+wcGZevKoOnQDH2So2HwymumblXy881ca9OoZEcscQd71hovqP5dkqAWcq6S7qbOg6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XZ3Y2IFn; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XZ3Y2IFn"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4518d9fa2f4so199271cf.0
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724166682; x=1724771482; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M98b0uho/6L9HJYyuZo8mAFH2lRRpS/KAZXa09S69zo=;
        b=XZ3Y2IFnm/xgG6OvQms8AXUtsuR7uXV91UlP8F61WY6S4wU3jYSEQwH4rO1PC0dYtZ
         6UpH79tYzuOvSA65HqgAfo4/aNZzHCIJ8ds4zzskt2qOQv4ps+qT5dBrRXGZJKlwEaYd
         Inb7gmvzyl5U4sGywHB1Ogqc40S5YoYJLrUqWXYSacSDRqiJlq5B5JZHaK6KRi7Mh1UF
         pBQeReO2FjZ2762vOjUswBnSu/3LqQjwm2zcYDezS3WQc0d0DSICs4M1Et1rTE4E32ny
         dysJDc5c+td5mMq+xBQerF63Wx6netfW/bSAM9HPKa7DHSEUkRSvPLJVX1kAtktPciJt
         ntig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724166682; x=1724771482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M98b0uho/6L9HJYyuZo8mAFH2lRRpS/KAZXa09S69zo=;
        b=lNc7miRJnc/K1XWX6sK3xU5aGbtNcUyDg3k28rGZLY3qBV4KQ87LaTgSB1qeBM3pUv
         BzT4eI9SJBYgCB84TzaRk7Jc5EkTioP7aKGYfrSdWu/mZRlXbMv/V/74WhyGsNkg5luJ
         6LLrzn5szWnGBidWg5MopynSTznox/4QhvLEGFwgc0tIPkuGJHLKYWSuyolVFcv0G2in
         EMBmxD9FJdlfYAs2pKM/+OTd66t0ivZ6Pj0WQiSKnXWe4eajuHkHhzy90EiyAmiOZqQp
         Age3pN0bDEQzsAwn2C2/QDFlDJNJSlAFKmVPDCc8s5HSXlLJW0tf0QFmDUWUdILdLKf4
         J6Ow==
X-Forwarded-Encrypted: i=1; AJvYcCX+IaKDpSnoh9K0UofEgNYHYmiZbi5hMS6N+9hjeenCpXFs18dZF+KiibWCP1m1ts0ozAciws8po7NHVdPsCIvMUBR/Tg==
X-Gm-Message-State: AOJu0YwJMManisuvw17qviLLjDRJUP4K7uOqoBbbM7hLcJH7h182yf9i
	oKLgiy2IV5X/YZTh7nB+b4W5Ze8SMlVaXNMUl5xvB9uU8lj/6PZn/Uy37LrWq0efb6D9cdLiERF
	rMl+2tq2/sZwnGCh7GticEkoTsWsz//wwaNas
X-Google-Smtp-Source: AGHT+IGxHrWvwxkET5G9KFHE2OTgjBHj0rFGE1objVdIM7lhI5d9VSUlLjMmyoZSbxU87Ybr//Q4mqrhQSjJsbsz524=
X-Received: by 2002:a05:622a:245:b0:447:e728:d9b with SMTP id
 d75a77b69052e-454e6ac44b5mr1928511cf.26.1724166681458; Tue, 20 Aug 2024
 08:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819171152.12f05e0ae5c9472004d1b00a@kernel.org>
 <20240819112902.11451fe8@gandalf.local.home> <20240820005649.dd019cfa70a8955d91cf85a0@kernel.org>
 <20240819120244.5657eb2f@gandalf.local.home> <20240820100330.9ee6f3d51f22bb9bab7c4b83@kernel.org>
 <ZsR0Z6DxSHOI-wNj@J2N7QTR9R3>
In-Reply-To: <ZsR0Z6DxSHOI-wNj@J2N7QTR9R3>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 20 Aug 2024 08:10:42 -0700
Message-ID: <CABCJKueKhDVarco4mgNeR0hkAhxDtxBjdpu=QaYVi+TGoiqd2g@mail.gmail.com>
Subject: Re: [BUG] tracing: dynamic ftrace selftest detected failures
To: Mark Rutland <mark.rutland@arm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 3:48=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Aug 20, 2024 at 10:03:30AM +0900, Masami Hiramatsu wrote:
> > On Mon, 19 Aug 2024 12:02:44 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > > On Tue, 20 Aug 2024 00:56:49 +0900
> > > Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> > > >
> > > > >
> > > > > We may need to add "noinline" or something to make sure those fun=
ctions
> > > > > don't get inlined for LTO.
> > > >
> > > > Yeah, we need such option at least for function call test.
> > >
> > > Could you add the noinline, and if it fixes the issue send a patch?
> >
> > I found the target function already has "noinline". I tried to add noin=
line
> > to the testing function (callsite), but it also did not work.
> > I think "noinline" is for the compiler, but LTO is done by the linker.
>
> If LTO is breaking noinline, then that has much larger implications for
> noinstr code and similar, and means that LTO is unsound...

The noinline attribute is preserved in LLVM IR, so it should continue
to work with LTO. Which function are we talking about here? Are you
sure the function was inlined instead of being dropped completely?
Does marking the function __used help?

Sami
