Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A35CBD
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711165871; cv=none; b=WITWWQ95LBIz9GB9/ayogNCkGBbZqBnf77D8rnC9a3HRVrq9nvffdAFtI23LMlDi25JfgHIeBF8YnJlNWYu05fnwX5yeBIJvyekUvLTawwBMFQ8g/wrClYfvY+thA1hQoZsK4/tdyLurI0rbBtyFbLVQly5ujGyBpH8UTuGjkjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711165871; c=relaxed/simple;
	bh=DzTFgELqldFH9O3EltKcjzhtBdzOprH0xn1JBpvoTFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boIt6ZECZFTAiD2tqAKRnIOvIOaR/VrkxIScJj7ZfjffiDb0sskSWH34kQp8ebHhVORlA5AtXkR7uys1QkDCiF2WGl2iaB1flVC67BXh3qiPFfpa8l7WXxiMo4VreJNGiqFs5Uj+coO9xgi+aff6vjxMwcDa+9Tk1A/tDTiUeVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG60jTQ4; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG60jTQ4"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-69625f89aa2so23446026d6.3
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 20:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711165868; x=1711770668; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fthf99+C6r59SY0f1P7eO/8dux5VEEpV4VML7N7nikc=;
        b=QG60jTQ47SuqWbzXVMHRm58P36hK9MbaWoc1TAX/3fssu/ACUMmPjJI8cCFRlEdrCk
         +qBKptOEOvVnWb7jNmBOoaFjLifSmEIUqW3ObHLSTswDt2FVfVC0H9b7vtAWdebPflmN
         F5YeUdeiAukrtCvBmFskg3WJxfaiHlasWgz/gaKTNkDDRhjhRNjZ+d4JTta8Yx8cY5fO
         6DqSn914ZSJ1SX/xezvbEUy1vvg8ef+r8MKgxU7UxLxFQBJityOwYUdMaG9tNRbpKv9Q
         wbWiD20pddu6F8aFncMCQ0CYZdhCpkRNkjiLgq8jIAfBcR8TIahCBnLfmn92JOMbQBO3
         hbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711165868; x=1711770668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fthf99+C6r59SY0f1P7eO/8dux5VEEpV4VML7N7nikc=;
        b=rDcAcoT9UUmr36douGft35af6g3A0fd5RUaONxRPhcjI/NgQKsOAZliAkwTwEDHzxV
         WXWBCmjhBuM2vCBAjh2NIJa1QOtPr/qpNvYULKPQr95SU6JlhuCsEf1BIsLyPP/zgMNz
         uIiHoqQODOlL91lvv/XazTIFpxlDqT+OfvJcZ8QgYToGFic9ravRxQSA0qey2ydPu0F0
         vf3JdSGMkGdkJBxRUN2LjNRooef4VjlPhXJETUtLFPymLjnptsfF/gOjmxnlMIzeq6Lp
         X/F+VYIujAuPDeT2MKD/Xs581rJ9j6hAyzbiqzn/SpdHvVE8r0KpGPMAE5fNw1wtCy1o
         l88A==
X-Forwarded-Encrypted: i=1; AJvYcCWoXhB9OGW4Ptc07mnVvcquYfBM5jf1GK+yvGUR7waShXRds/tem/hZFHMqZzdxlCkskaTEUEqJtYtFZvQOYkJ3Dys8eQ==
X-Gm-Message-State: AOJu0Ywik/Tcu22XmnQlNOchUXWfX/NJh9vv4tw6nff3+Dfpd4Gq+B5m
	vir6CmzZI4v6S9oI0AUjGLKFRbMX71cxa++XoX6i80tD7/iRZTV1
X-Google-Smtp-Source: AGHT+IFD4uxS5AVpTZ118zy+ZVLuALlh6ZcR9Zu6I7AtHzgx0POKa9T0KapT+m3+rTw73sgKM4TITw==
X-Received: by 2002:a05:622a:1991:b0:431:2033:d4cc with SMTP id u17-20020a05622a199100b004312033d4ccmr1554788qtc.21.1711165868328;
        Fri, 22 Mar 2024 20:51:08 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id u15-20020a0562141c0f00b006914fd6b64dsm1720995qvc.127.2024.03.22.20.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 20:51:07 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id A9D9A1200069;
	Fri, 22 Mar 2024 23:51:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 22 Mar 2024 23:51:06 -0400
X-ME-Sender: <xms:qVH-ZW4FrOSzwahl5ramjssW7SxMVfTQJmjdD76pMTyXqRhcx90nYw>
    <xme:qVH-Zf4_fZcCtZK_9G_yt9M7vwMz5ncdKwaXlByCGCS_j9kdsHMNcK4ykdat7TUrs
    OaaC9H9YuI9xEI8UQ>
X-ME-Received: <xmr:qVH-ZVfLWkHO8sVCfzBQT_GTtTCU2sRNdTd9amSAfxdtCSer0kYgQuD9Qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtfedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeevvdejffefgeffhfelffeikeeigeehjeekgfefudeugfejfefhteekvedu
    teelhfenucffohhmrghinheprhhushhtqdhlrghnghdrohhrghdpiihulhhiphgthhgrth
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtd
    eigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehf
    ihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:qVH-ZTIqcJEoLeanZSlZC5k_5HItxTlYyKa9aLRTD_A8_fO3kcmCdg>
    <xmx:qVH-ZaKnBjFPDQZDsvlC_ZnwGmallN_4yfYdOM0axg0MWjQINyB8eQ>
    <xmx:qVH-ZUyIr2CuXdaoX0SKcBWjK4RUxa0K9Q6WvX2Sla7SjFmsXpGc5A>
    <xmx:qVH-ZeLh3t_XFyMhhoAOZl4sim8E0nu988qgE-W61aErvZ-nIrttow>
    <xmx:qlH-ZXLM7aZ3LfCgWK2Iac-ifZCDo-m-vja8Hj0d3q9AZcE9OrBiLa-Hxnq1AkaD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Mar 2024 23:51:04 -0400 (EDT)
Date: Fri, 22 Mar 2024 20:51:03 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
Message-ID: <Zf5Rp0zR_fyZMADn@Boquns-Mac-mini.home>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
 <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
 <3modld2dafaqjxa2b7jln47ws4ylzhbsvhvnphoklwvzange5p@wlir7276aitp>
 <Zf491DuptReGqvfd@Boquns-Mac-mini.home>
 <34r4signulvsclmsiqgghskmj5xce3zs5hwgfulzaez2wdyklr@ck6zrj732c4m>
 <Zf5FEFCfuy0TAjV6@Boquns-Mac-mini.home>
 <qsw2v5ikt2w6m2xfr6h4e2xauobhy37nrskarlfjro4ek4qw4b@jgxhav7bia55>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qsw2v5ikt2w6m2xfr6h4e2xauobhy37nrskarlfjro4ek4qw4b@jgxhav7bia55>

On Fri, Mar 22, 2024 at 11:10:36PM -0400, Kent Overstreet wrote:
> On Fri, Mar 22, 2024 at 07:57:20PM -0700, Boqun Feng wrote:
> > On Fri, Mar 22, 2024 at 10:33:13PM -0400, Kent Overstreet wrote:
> > > On Fri, Mar 22, 2024 at 07:26:28PM -0700, Boqun Feng wrote:
> > > > On Fri, Mar 22, 2024 at 10:07:31PM -0400, Kent Overstreet wrote:
> > > > [...]
> > > > > > Boqun already mentioned the "mixing access sizes", which is actually
> > > > > > quite fundamental in the kernel, where we play lots of games with that
> > > > > > (typically around locking, where you find patterns line unlock writing
> > > > > > a zero to a single byte, even though the whole lock data structure is
> > > > > > a word). And sometimes the access size games are very explicit (eg
> > > > > > lib/lockref.c).
> > > > > 
> > > > > I don't think mixing access sizes should be a real barrier. On the read
> > > > 
> > > > Well, it actually is, since mixing access sizes is, guess what,
> > > > an undefined behavior:
> > > > 
> > > > (example in https://doc.rust-lang.org/std/sync/atomic/#memory-model-for-atomic-accesses)
> > > > 
> > > > 	thread::scope(|s| {
> > > > 	    // This is UB: using different-sized atomic accesses to the same data
> > > > 	    s.spawn(|| atomic.store(1, Ordering::Relaxed));
> > > > 	    s.spawn(|| unsafe {
> > > > 		let differently_sized = transmute::<&AtomicU16, &AtomicU8>(&atomic);
> > > > 		differently_sized.store(2, Ordering::Relaxed);
> > > > 	    });
> > > > 	});
> > > > 
> > > > Of course, you can say "I will just ignore the UB", but if you have to
> > > > ignore "compiler rules" to make your code work, why bother use compiler
> > > > builtin in the first place? Being UB means they are NOT guaranteed to
> > > > work.
> > > 
> > > That's not what I'm proposing - you'd need additional compiler support.
> > 
> > Ah, OK.
> > 
> > > but the new intrinsic would be no different, semantics wise for the
> > > compiler to model, than a "lock orb".
> > 
> > Be ready to be disappointed:
> > 
> > 	https://rust-lang.zulipchat.com/#narrow/stream/136281-t-opsem/topic/is.20atomic.20aliasing.20allowed.3F/near/402078545
> > 	https://rust-lang.zulipchat.com/#narrow/stream/136281-t-opsem/topic/is.20atomic.20aliasing.20allowed.3F/near/402082631
> > 
> > ;-)
> > 
> > In fact, if you get a chance to read the previous discussion links I
> > shared, you will find I was just like you in the beginning: hope we
> > could extend the model to support more kernel code properly. But my
> > overall feeling is that it's either very challenging or lack of
> > motivation to do.
> 
> That's casting - that doesn't work because compiler people hate
> aliasing.
> 
> But intrinsics for e.g.
> __atomic32_read_u8(atomic_u32_t *a, unsigned byte)
> __atomic32_write_u8(atomic_u32_t a*, unsigned byte)
> 

so "byte" here is the byte indexing in the u32? Hmm... I guess that'll
work. But I really don't know whether LLVM/Rust will support such an
intrinsic...

Regards,
Boqun

> should be doable - that's perfectly fine for the compiler to model.
> 
> That would admittedly be ugly to use. But, if Rust ever allowed for
> marking any struct up to word size as atomic (which we want anyways...),
> it could use that under the hood for setting a member variable without
> cmpxchg.
