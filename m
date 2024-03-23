Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896E37E6
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 02:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711162647; cv=none; b=N5ni2tVvelS5qQNZ9IlOhJNZ1D2qoiYxjGQNHd0Y/wh/ZpA7NL3qwPon9RcVFqruQ+CHEsnwLqH4f9Yd4rOPmsKHk1B3aCbfKgZ+05RQTM63qicY9t4wv2J1q1Sr1a6w/iMN4MIJuYob9AOJZAyzUQf7myX8nqfHTc7qi5yEW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711162647; c=relaxed/simple;
	bh=vpZhcowLAm3Dy6FfbLwUZs3OgFJBOZ6DIZw//2d1m3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMv3+EKX5051XwkonLraYiWXWhYIr2k2jgYR3sGI0OUQ1ximGqK4EMiTMdMyPBamYK8bREWT1xnADU5uR+jTv3rVsxCM+ufxYHSdaL3cQeUIMLCVTl6q2kZeeze7XIIof9oSWUDAvVRRTqKZ3fMDRJGnT0n58b5uWSMOkNYhkuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UT4kui+I; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UT4kui+I"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-789e209544eso165865285a.0
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 19:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711162644; x=1711767444; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpSl8o7jNHU35uGRWAm6lGoxX/v+3hFWNREiHEQrRxE=;
        b=UT4kui+IIBNIZQJ7gi+YXTFnAhjs7/QjrymEVGWsS/YAOrvYTmdablzCC90ag5HJww
         bF0nrKysDT9gnPqQ4LQPhJ4bj63T4pDej+M653Lwv+XjDSyfMF1gVRdTUpqX19zRX1fy
         ox2PpbB5SaKV8pBO5A8L2NvVYJLPY7UW5gOC5YAVTnOmiKebtGbJ6pljqSgp6F1vUNi3
         +ZhV7ZPyuXfFgiUfKbOP47Kr5MT8BXzIrz7bZSQYzlUevKxAFR53xxKWdKLyw3LnjfCj
         f3McHp4Z2N4uQg4+7MwOMOYCfXyFxcv2WuLCvwG0A9hhF7YJhLEfvMxcDfAuUjVqm/Ls
         y+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711162644; x=1711767444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpSl8o7jNHU35uGRWAm6lGoxX/v+3hFWNREiHEQrRxE=;
        b=taPsTajhoalvEcZIUEu363re2HXSxV7z9//YML8Ytq42jpMsbz/JxGgLmLzGZD6qeV
         Pi3wTwjooNLChH+y7A77MVU9cGbLf6QPUcBU2c/zOadAfUtP25BdeeVgvwP/gbnu9kmA
         r5ZDJyjv9amNl8UVbNzA7+4CT0ro3SR8bIMdiKQw0ZmiOJMPGOPhOUalpnHyon4L/wEa
         +0d9K1lx4cy9BbnHMwHZ3rxHaaEUtiDn0Hx/R/8c+PCo+wQtUP53c4LTb8xnJ3MSi6Ar
         gqH0bajOpv4nOR0Qt77jyy9KgjAVdC/dXvw2uACxJwo1thI1fzjk6OUcVzTL91spTydL
         gtrw==
X-Forwarded-Encrypted: i=1; AJvYcCWrK4SnEaavbOjXtBp8mmBs7BiDl2MYADW6jbhT+aqzLGI9shfokazSXwVoUjbrpcmkKyu/nfhWmEqGhCle1x9BI50kJg==
X-Gm-Message-State: AOJu0YwK7yVI5lKlueAcDM6liFqrarY75xt4Qi3UlBKrzkH/32rwxoBW
	g+NqUTUBbz9I1//Qa+C5vGUxxBC7BOz6kJ+OiuDC6PEHncytfn9v
X-Google-Smtp-Source: AGHT+IFGkguh6CxSo1IGeVd0RUnDbg2suvzRZLhnT/eomKsCIq41qcusHAcYijHLmqEB7POPWFAOKg==
X-Received: by 2002:a05:620a:a93:b0:788:12af:3f0e with SMTP id v19-20020a05620a0a9300b0078812af3f0emr1255744qkg.56.1711162644512;
        Fri, 22 Mar 2024 19:57:24 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id h26-20020ae9ec1a000000b007886b695939sm363844qkg.118.2024.03.22.19.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 19:57:24 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 1006A1200066;
	Fri, 22 Mar 2024 22:57:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 22 Mar 2024 22:57:23 -0400
X-ME-Sender: <xms:EkX-ZWUWoFJ1t0cRNnA5Zc-VisGrYKqDMSSXYFqObRIDBrQ-YoM09A>
    <xme:EkX-ZSljWoU8H6J7Q3T_ydvSQhy2ZYgMoA2pu0uyWAv7YMU_SSWs1-xjWzBKyt_Zk
    ZwoNzYecRlPM6bHmw>
X-ME-Received: <xmr:EkX-ZaZmv-vA8u1V2UzWjywzYbdHASy7_Ym1sio6tH2uoPduMfpgmUSkzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtfedgheefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:EkX-ZdVEozB0BxgFY-STMfQCuHowpTL2DNdWOwaMAaao7KCeMLT5vg>
    <xmx:EkX-ZQlx-8smTld-37bF8c0rGBGXyck3a_ZhHOyJEu5QVdNxNKyfcw>
    <xmx:EkX-ZSfTz0SLKyOyVvWl03heLWNqJKN6Xllmhe12StU-PRSJttptdQ>
    <xmx:EkX-ZSGDw_DLzGS86c3wF8OJ9dedlkzaVVYt3srBqrsbVEflE7yvMg>
    <xmx:E0X-ZRldPvzoz7BY0J37kf9eVFZNbhief402kGZbZoqLp5McurxYH_Kuiyvkv6mB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Mar 2024 22:57:21 -0400 (EDT)
Date: Fri, 22 Mar 2024 19:57:20 -0700
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
Message-ID: <Zf5FEFCfuy0TAjV6@Boquns-Mac-mini.home>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
 <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
 <3modld2dafaqjxa2b7jln47ws4ylzhbsvhvnphoklwvzange5p@wlir7276aitp>
 <Zf491DuptReGqvfd@Boquns-Mac-mini.home>
 <34r4signulvsclmsiqgghskmj5xce3zs5hwgfulzaez2wdyklr@ck6zrj732c4m>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34r4signulvsclmsiqgghskmj5xce3zs5hwgfulzaez2wdyklr@ck6zrj732c4m>

On Fri, Mar 22, 2024 at 10:33:13PM -0400, Kent Overstreet wrote:
> On Fri, Mar 22, 2024 at 07:26:28PM -0700, Boqun Feng wrote:
> > On Fri, Mar 22, 2024 at 10:07:31PM -0400, Kent Overstreet wrote:
> > [...]
> > > > Boqun already mentioned the "mixing access sizes", which is actually
> > > > quite fundamental in the kernel, where we play lots of games with that
> > > > (typically around locking, where you find patterns line unlock writing
> > > > a zero to a single byte, even though the whole lock data structure is
> > > > a word). And sometimes the access size games are very explicit (eg
> > > > lib/lockref.c).
> > > 
> > > I don't think mixing access sizes should be a real barrier. On the read
> > 
> > Well, it actually is, since mixing access sizes is, guess what,
> > an undefined behavior:
> > 
> > (example in https://doc.rust-lang.org/std/sync/atomic/#memory-model-for-atomic-accesses)
> > 
> > 	thread::scope(|s| {
> > 	    // This is UB: using different-sized atomic accesses to the same data
> > 	    s.spawn(|| atomic.store(1, Ordering::Relaxed));
> > 	    s.spawn(|| unsafe {
> > 		let differently_sized = transmute::<&AtomicU16, &AtomicU8>(&atomic);
> > 		differently_sized.store(2, Ordering::Relaxed);
> > 	    });
> > 	});
> > 
> > Of course, you can say "I will just ignore the UB", but if you have to
> > ignore "compiler rules" to make your code work, why bother use compiler
> > builtin in the first place? Being UB means they are NOT guaranteed to
> > work.
> 
> That's not what I'm proposing - you'd need additional compiler support.

Ah, OK.

> but the new intrinsic would be no different, semantics wise for the
> compiler to model, than a "lock orb".

Be ready to be disappointed:

	https://rust-lang.zulipchat.com/#narrow/stream/136281-t-opsem/topic/is.20atomic.20aliasing.20allowed.3F/near/402078545
	https://rust-lang.zulipchat.com/#narrow/stream/136281-t-opsem/topic/is.20atomic.20aliasing.20allowed.3F/near/402082631

;-)

In fact, if you get a chance to read the previous discussion links I
shared, you will find I was just like you in the beginning: hope we
could extend the model to support more kernel code properly. But my
overall feeling is that it's either very challenging or lack of
motivation to do.

Regards,
Boqun
