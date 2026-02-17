Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DAA36AB7B
	for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338344; cv=none; b=u1VKMssImqbJSyTTfrONu4FOy92Wie37zS4IxBVFC+cpbR9sgFCQV5iqvYgmUrQlAkbfyJg5X2XggFH2qjNu3egQ4dpv3UKyJkJDRDz3xXgJbH+JfqSPgvEZ5LSRbk5BpTvXF5rv9PCY0eB9D2Y3ge+z5vAUd7sfI/0xnJqRMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338344; c=relaxed/simple;
	bh=G+OrCFla/Rc4tWD0fYhTe1r069MWscvSk996gXlONiA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMI1awrXV1mHmKFHlJ/KggKIM7VYPFvLq4CLZJUBDv7vKwrroimLaLxQeMucLupjVX9gzfc5YUHKy4RW9rKzIL8Vaxe7kV4PVPNhJ9PtorZsTDi3Ti/Mnj3+DSiM/SN6vyVUFFuYVgQncR80WTO1/NH069UA76x6zJlAPzD7G24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZbzruZ1; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZbzruZ1"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48371119eacso40202355e9.2
        for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771338341; x=1771943141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Eu+fC1NvwDc2c+7+RBywzqoe1LU54TndFGYyJ2KsHU=;
        b=TZbzruZ163Qh+KQuvcLN/1hvZ05l/+znzS/sEk1RbHY8BpFPzDl1BVbOCY/FuGL7yK
         q7eD0wWkax8N93WyJmaKPvWseH9b1g1EAgoYkcEfWMi9DU6HNnS8c4mqRRVSxVuLw4bE
         d99FeZxlSXbb9aSOu1L/TMKwMeNUOeaWRi7Pc5SBUiYFlujkS3swpuS933eSVhOXEP9P
         cmrZpnOYlrkwuFJYe3cfO2iWr96zJf4Uvq4VF5grc02pCiX/gO1gvFWb670iiac0lwB2
         e7lRAnwdsOE1lt1eggEBIThdJTVSzUHrhE+iT+HRFCJQx3qFmEUxpCzY4knQaXzntRxF
         i0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338341; x=1771943141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Eu+fC1NvwDc2c+7+RBywzqoe1LU54TndFGYyJ2KsHU=;
        b=FqTGQM5g4yJdgpI8mMfP1OW27JcD+2uVbmoBMznsECpaU5Twr26rN7vA9T44uuklGR
         XsMFU38RnHwv0yDpoGtTXOw48WZ7h63BM/+Ol9MFJBOJ3FlJ0qUPco1IIn0iMTpuHRix
         b3JI/YphMYJlpewWEYfoBpAiEbCMwAXPK5cnE9nglsiEWoFUY9uPIYa9vxE9C0qnoSpC
         Mq6C47Gl76JqOypPWnRLEae1FhN7KDpsDrKePf88aTb655c/WuYeBfYqe/zuuqUQZwWA
         hYjvL6BHyrxUFM5CZKiR91lg0u29jGFo9s2o/63fXerZUZveclZ+oT2+NrJjsJfVOSbj
         zp/A==
X-Forwarded-Encrypted: i=1; AJvYcCURrbk2xaP/YYRRbvS3HnAtfuItrD0Imfve7pFTR1tgT0khgHZIZginG5zE1pGwPK/8Fu5U@lists.linux.dev
X-Gm-Message-State: AOJu0YyaQAdNYfxV1aR5dSnoFqTyi1HNj6mRXmvDvjQqTZVGEsQN/fH0
	uZt2MkzQEJivGJ5zsq/IgVEltPrIfiqh+yVW0P/C86Qn8hoaVKEjavRk
X-Gm-Gg: AZuq6aIlhL00SQU48wzhS9PIRHmvrKclwiSJFm1fACXYW8Xxow7RdKzCbX3JWFCBskH
	qx3weo4ZzM+h0u5ZNKV0ZvMBhB1zvNPnZ2bEkeufkiXW3kLg5GevF553dWWZjoAnje4UqBwWmXr
	2W57teuJYh1hd9MZNyReP5ynf64VCATIuMUTu1bQyb5FfFjOoXP+JHRMrNJllUdUSDw0enwnGmo
	ANtIsy3/WpNbbeMx8McDNIajHDx2T6m8bk2QDvucUHA5peUbGeqqQ4ElxhGfd4pTASh+8iKcMm2
	q3Pjnk/iKYmjyXORxvziqb2pq/fuifLsd1EFSQ9dgL1ZYwdTPobZJKvejp8VQeh6tF6Ksua67SM
	MxBQqeRGQsrGMiQZ2EO36H07jghb4gOni8VX+MftJet5Kb/96vMBCGox0jw12QxGoVXWv7bErWW
	J/uxrADPeAYgBKzPuAMk5VO7Nov8TX4/4angFp1V1DY9h1AybCR7nJE6kTxoFZNAeu
X-Received: by 2002:a05:600c:6206:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-48373a5ba9cmr225553315e9.20.1771338340859;
        Tue, 17 Feb 2026 06:25:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d77b3sm570714265e9.2.2026.02.17.06.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:25:40 -0800 (PST)
Date: Tue, 17 Feb 2026 14:25:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver
 <elver@google.com>, Will Deacon <will@kernel.org>, Ingo Molnar
 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng
 <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van Assche
 <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260217142538.0a2c0892@pumpkin>
In-Reply-To: <20260217121619.GA1395266@noisy.programming.kicks-ass.net>
References: <aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
	<20260206182650.6c21b0ff@pumpkin>
	<CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
	<20260215221656.68b2fc1d@pumpkin>
	<CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
	<CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
	<20260216110915.4f0d5490@pumpkin>
	<CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
	<20260216174324.75d47e37@pumpkin>
	<20260217121619.GA1395266@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Feb 2026 13:16:19 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Feb 16, 2026 at 05:43:24PM +0000, David Laight wrote:
> > On Mon, 16 Feb 2026 07:32:53 -0800
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >   
> > > On Mon, 16 Feb 2026 at 03:09, David Laight <david.laight.linux@gmail.com> wrote:  
> > > >
> > > > volatile structure members are almost free    
> > > 
> > > No, gcc does absolutely horrible things with volatiles. It disables a
> > > lot of very basic stuff.
> > > 
> > > Try doing something as simple as a "var++" on a volatile, and cry.  
> > 
> > On x86 I just see a load, inc, store - not that surprising really.
> > (clang did do 'inc memory'.)
> > 
> > It's not as though 'inc memory' is atomic (without a lock prefix).
> > 
> > Also var++ will be 3 u-ops the same as the read, inc, write so the
> > underlying execution is much the same (ok you might save on the
> > address generation and the compiler doesn't have to find a register name,
> > but I don't remember anything modern being limited by instruction retirement).
> > You might save a bit of I-cache.  
> 
> Interrupts can tell the difference, and that matters.

Just makes it the same as every other architecture.

The only way to guarantee an 'add to memory' instruction is to use an
asm statement.

	David
