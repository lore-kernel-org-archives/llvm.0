Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D472652B7
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240160; cv=none; b=dDDj+P/ru2ZHGMVvfHpu6Eb8l1FkW82VlTpO60Av85CkK9aY0Mt3kJsn9TIIyJkZqjEEJ46nR1K5Dvr89kisWUY134X2EWFYJYzJ7z2m+590lxK9ooCo0Nu1Og+uNoOzQhILzb5xxNwmSHZoVHe4R6aF52rTS31nRR1gsEfKw7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240160; c=relaxed/simple;
	bh=yL10Snrz9gC6XYMsJoWK+o5r2O/79dphE2aaEfhCQ9w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H0YezxgrJBBBVb1Mn57XPG1CqkeMkBEaD9yE79mRPBhoPnwDWAW/uLUeFBs6ZvUXmdE524vpaXr2fUmmzI1IwrztbIlxMw/68LNqtw/KsPjnKgrNOZfjgnlvaLX0g2/ME7nzdtznZ8M86nlr0L05+JmycczuYwEbMLB+CVnO+xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtZWjj1l; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtZWjj1l"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48374014a77so25087905e9.3
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771240157; x=1771844957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86+3Ol8ufgkpxEsjqivLYye2L+eLEE02N4njJxkXOz4=;
        b=JtZWjj1lZClJ4LwQI2JkWv4u4WeGyhitzJPcOkx5AWx6p0hh1/zO2r+UsN7HQsywqe
         N6mJG1c2AmCNjycsX1rfFZQwoH5wODlrxY8jCasyGZ7shlUzFJSiwAV/9eFoX6sxX46s
         AX6udL0GXZfb7rAytXPH7hDPEexFfsQS5eblQSV02TBx5TiBta9gNR6xXvfiL5SOzzsb
         ITIqY75xBsKQ4nvzw0kMrJb8Msu/mmPDc0VJbwT6TNRBcL6/rSsphxZdSxmY8gnPJkx2
         4hAyWppcqM3gR+XFxBAiWirNbjFMvTaPQuCULRtbjKdIP0C3v86KkDD/dmpWKM3lPiDW
         wGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240157; x=1771844957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86+3Ol8ufgkpxEsjqivLYye2L+eLEE02N4njJxkXOz4=;
        b=IUuoEQ/BOOyZWhoJx3OlOp6UIoxViEMcdvxZOMk9mymy0ek9zQlqfKNT9KbI7VnLN/
         nfEH70dJp21ZPQq6BamSMbzmxmdA7Vw0x3a/Ptix04Gv3ZapYC8YHbczEv89cjD0fMSa
         XuHKdI7fmIRvQavUmX8dAHjJZFVrjA3xETs5Tmb4FrtRv3s8/36EJkgcZJl/QCUdYlLB
         DuGboaQTfZFRvNgYPpcdQrVES8XZXWOGxA5WchopC/1fsI9U1nJkIPq5VEK9xYv/PTSq
         BKGolzjFptbVOYt/4DZl8aXA4cZHqKnWtp2pqjHojCzdPS1F9R4yuYFsxw0+vvBhGM0u
         HA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXnndV1o/d3yY05ikGQNJTFa2Hxr9bQxRwqEci3l9Mo3qltuY9JM5C17xyiE33rdoBHTmH@lists.linux.dev
X-Gm-Message-State: AOJu0YzixQ9G4Xg8+FYG7cHJS8343l7JyF+URNnitU2j/V4tGM2YiQ1d
	dUEXMK9aI1mbojQkyu5370JvSogJAW/xvyKe/SoxSXy8v9/FIt7yyOCp
X-Gm-Gg: AZuq6aIYkxYX45bKAXCZdpYU5fmDdIyAUI3UYtrhh59vWJ4SYSf2+HTXf6wH9+IulZ+
	SC7Nt43useVM5ay/m02EluWKDOcpFIrYGZxLprF27EK5mZ4gEECWg3aJhCv6nm+ni2pehJ4Jp7T
	GHOGM4AA+Hk0h7RPuexOpEA/PNI8Q/4jitq1OAzlLG8RKpogufg+zvZ4904T+9Tfg/bwVp41OkO
	aGdI8SDbHaYtP7wKK2w5545/H4nZb4MZx/Q6kZ6DHvtKLjWjJGNR/Nz0FeIdtFkiVwXelrcFdqS
	p4ljqh0pUPeVYg4+50U4zKk1cek9miS22YNIXQ+n3gxNDFWqkKSXAT/UiJK+UNXcqJibFS6gFZQ
	ex1rL1l7s92R4WQpIVLi6o7n+PZBvVJudsGAF0xO6hf7HiJIkQLO9W4L4r3FktvEcaNT+9N7kZN
	x6jFkazRtxMXpUDXpZ5TlPndc6E/fYmS/au59eSowXz0MMk8K79naXs7eYxN9r6OMZ
X-Received: by 2002:a05:600c:3e87:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-48373a0f961mr151759405e9.14.1771240156943;
        Mon, 16 Feb 2026 03:09:16 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm657254105e9.9.2026.02.16.03.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:09:16 -0800 (PST)
Date: Mon, 16 Feb 2026 11:09:15 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boqun Feng
 <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260216110915.4f0d5490@pumpkin>
In-Reply-To: <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
	<20260202192923.0707e463@pumpkin>
	<aYHgNSF5a3F7UGU_@willie-the-truck>
	<CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
	<20260204131400.GI2995752@noisy.programming.kicks-ass.net>
	<aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
	<20260206182650.6c21b0ff@pumpkin>
	<CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
	<20260215221656.68b2fc1d@pumpkin>
	<CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
	<CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Feb 2026 15:40:07 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, 15 Feb 2026 at 14:44, Marco Elver <elver@google.com> wrote:
> >
> > I found e.g. xen_get_runstate_snapshot_cpu_delta() uses the >8 byte
> > case via __READ_ONCE(). READ_ONCE() itself is already restricted to <=
> > 8 bytes (due to that static assert), but that itself uses the
> > __READ_ONCE() helper which these patches were touching.  
> 
> I think we could just make __READ_ONCE() be totally unchecked - just
> make it be "const volatile typeof()" and leave it at that.
> 
> Anybody who uses __READ_ONCE() would then have to deal with it.
> 
> There are very few users of that left, I think it's mainly
> arch_atomic_read(), which just doesn't want any of the checking that a
> regular "READ_ONCE()" does.
> 
> In fact, there are *so* few users left that I think we could probably
> just remove __READ_ONCE() entirely, and make our "atomic_t" use
> "volatile" in the type itself.
> 
> I generally absolutely hate volatile on data structures - it's a
> design mistake (an understandable one: it was at least partly designed
> for memory mapped IO accesses), and the volatile should be in the
> accesses, not the data, because very often the volatility of the data
> depends on context, not on the data.

IIRC The bots are now bleating when there is a READ_ONCE() in one
place but a write without a matching WRITE_ONCE().
That is effectively forcing all the accesses to be volatile regardless
of the context.
Which is pretty much equivalent to making the structure members volatile.
So if all you care about is 'inverted CSE' and read/write tearing
then volatile structure members DTRT.
What you probably don't want is 'volatile struct foo *'.

volatile structure members are almost free, you lose CSE and some versions
of gcc 'forget' that a load zero/sign extended a byte and do it again.
(I had to use barrier() rather than volatile in some code where I really
did care about single instructions.)

I've never see gcc reload a local, but I have seen it do CSE then
spill the value to stack.

	David


> 
> But our "atomic_t" is already properly wrapped, and nobody should be
> accessing it with anything but our helpers, so putting the volatile
> there looks ok.
> 
>              Linus
> 

