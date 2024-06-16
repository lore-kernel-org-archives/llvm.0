Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8291BC57
	for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718559009; cv=none; b=D5f53EK+W78VcFZQLsF7PRFymIGD2OKTY1Auepd4vVzZZPQgkz7WzAqvfs2TP7jmWJV5laNG8HwaJeoX+LEqJ2LzgLWZ1oUZNrDJgIq3Iyda4D0qFpyrkHmM57W7mJnwvfQqu+aPpzFpzanA9s5Qg43iImHtq0oUkT8uN07azvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718559009; c=relaxed/simple;
	bh=YYPRvJuMbdP+DqpVZ+wvMU/+2eTody1ahJhl0TxFmgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+K9VOJPsEsfIUe/c1RSuKJUd2EABBuf18UNQFcWQ2evtzwZlCX5uArYZ0T99sWZxZlBxJUANzbIEqCewfKGfNv6gR4BtB0o5E+QSRtk7S8dKph/SelR6lia87fAR1LUq1Q1vCvEroQ9KWsvTogox5JJjwWXLDUZsQ83bnpwE70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lm2DzqHt; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lm2DzqHt"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-797dcb558ebso232198285a.2
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718559007; x=1719163807; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JmxJHYyKzSP+huyZ3h4SyddcKqp+ekNG/X00GfFHNDw=;
        b=lm2DzqHtp1HaW3Qva15o4OSAekszKH64YEk6UuRarCqRZZSk61f0EZvl7LZUo2L2Uw
         7BIV4Xw8c9DbP5Byr1dGzlomPCXPgW/mRMNMpEbqdCjZzmOqqNgE/3Ww3SBN8BZRE28Z
         Jhc/E8MiNGe1pdIUcR+bM59xIPoqMCR5NmtxH6N+qoYmhSEQ6d/zRY3b5k8u6U3sObDo
         8wI2v6S68ZAxm/Eo0qXKCk1jbS7DCtPsLfV88wWdlxJ9vc+uqfmxjKCrL6VOOGMy7Te+
         Z88/GqcWkVmuu3yO0oE5UUEP3uJdjJuTC6rbZW84Z5B7dmX2+L7ZOYCwU05tmJCPlaRK
         WFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718559007; x=1719163807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmxJHYyKzSP+huyZ3h4SyddcKqp+ekNG/X00GfFHNDw=;
        b=nJfnpoYtNSfph4n7ec6ed6fgpWroiSmO26mYp2nEINloIC5eUILDv5DP2Dcff3UTOm
         vOAWM8PxFdWL0Kk3oFGZqVAysJCg6Xuwy0YpkLC6s4cq9P7mnpRxmLR8aRL0do6NrWRU
         VXkz89rKGiBgyikmF2nAEtRGW4RCeir7iW2ifHp5XIJNDskbT3KebST0SCeuHXS4uMNa
         oPYc7Im3/TNhftnjdOVjgvy7+h3HitTjCc3IE4PGd+zI1RBmqGku9xFkDTMr37aaHwOH
         ib9J4v7RxLtD6ZshrhmXu7n/UMAwNyezwVfeQ9Io9zmLwfqfazJ75hCTBzvmEr6DeFLR
         WLXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyOSTscYJ7NXOwpXXMniYjT2gsp+GKXcVLuZVvWNzAFRXs3OrNoKM4P3cZki25AAKPh8zqum3S5NyI6rcjU6zCqzSDiQ==
X-Gm-Message-State: AOJu0Yxb99ghwS8vfiulG1g3tH/oBxygAveLnQwjhYwPnzY7li08/r0I
	HdF9gHi0Bd/sdONUKaCtow7rPM5VrWVGfkj1w4SOAJ+v7D/EgZjW
X-Google-Smtp-Source: AGHT+IGD0LBYpLjhnDJ8/c78ZEe8vd+3798taTNVryqcrkBUQwNhtIxR2qGRwtBRr7oBG3T2TvxzMg==
X-Received: by 2002:a05:620a:444a:b0:795:9eb8:31e with SMTP id af79cd13be357-798d243af92mr990827285a.45.1718559007198;
        Sun, 16 Jun 2024 10:30:07 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aacae71esm355603985a.17.2024.06.16.10.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 10:30:06 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 741E21200068;
	Sun, 16 Jun 2024 13:30:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 16 Jun 2024 13:30:05 -0400
X-ME-Sender: <xms:HSFvZgsUctLCC0oyYySwNG1sFuDZ4tZUylyYAo8Dn6mmtPB6wEUhaA>
    <xme:HSFvZteGrmRQDUTw3RAMfIjx9C5AqdSJT7VE9f0Ih-vcaPk73Anzsv9ipq5R-tdv2
    9e9DoA6ePpTqlcMjw>
X-ME-Received: <xmr:HSFvZrzrCGPFC9DjUZcw3b-CniYLdJQrF0hi2gbUmEtdCQ2h_wiuUDjMVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepueho
    qhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtf
    frrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledthffgheegkeekiefgudek
    hffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeeh
    tdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmse
    hfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:HSFvZjOzyszX57_ZBFFag5QjmKUHO-ZmiVubPxrTYt8Cgp8benUnqA>
    <xmx:HSFvZg_jlfiKkxp4-FJOnvi_HPWn-zKZHVoUbJRVDvJVrnHBnjT1IA>
    <xmx:HSFvZrXDi1byzz6EIMgiVRN9pNkvFzpmjYmdcxpSKIgEpxfSNoRadA>
    <xmx:HSFvZpeD0D74A3UlQrIYXOgma5OhQWBcoeESiNOLzd51orEqCEhm4w>
    <xmx:HSFvZid-5l57RCBHqQzdjR1bZho8OR9unqqz7yphfBOSei0XvBZtofWB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 13:30:03 -0400 (EDT)
Date: Sun, 16 Jun 2024 10:30:03 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com
Subject: Re: [RFC 2/2] rust: sync: Add atomic support
Message-ID: <Zm8hG58nuE3HrnyS@Boquns-Mac-mini.home>
References: <ZmxUxaIwHWnB42h-@Boquns-Mac-mini.home>
 <c1c45a2e-afdf-40a6-9f44-142752368d5e@proton.me>
 <ZmzvVr7lYfR6Dpca@Boquns-Mac-mini.home>
 <b692945b-8fa4-4918-93f6-783fbcde375c@proton.me>
 <Zm4R0XwTpsASpBhx@Boquns-Mac-mini.home>
 <5lwylk6fhlvqfgxmt7xdoxdrhtvmplo5kazpdbt3kxpnlltxit@v5xbpiv3dnqq>
 <Zm7zvt7cNT2YpiIi@Boquns-Mac-mini.home>
 <CANiq72mz=OzzHJJyOPeWcxEtppP+v0KUq63_u5NB7-R84avaPg@mail.gmail.com>
 <4pez6kilgykarr5qeutgaw3pvkxf2nmh4lzuftadshmkke7d3q@3jfgvjveqdbz>
 <Zm8KoUNQ4v7UvVOE@Boquns-Mac-mini.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zm8KoUNQ4v7UvVOE@Boquns-Mac-mini.home>

On Sun, Jun 16, 2024 at 08:54:09AM -0700, Boqun Feng wrote:
> On Sun, Jun 16, 2024 at 11:32:31AM -0400, Kent Overstreet wrote:
> > On Sun, Jun 16, 2024 at 05:14:56PM +0200, Miguel Ojeda wrote:
> > > On Sun, Jun 16, 2024 at 4:16 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> > > >
> > > > Hmm? Have you seen the email I replied to John, a broader Rust community
> > > > seems doesn't appreciate the idea of generic atomics.
> > > 
> > > I don't think we can easily draw that conclusion from those download
> > > numbers / dependent crates.
> > > 
> > > portable-atomic may be more popular simply because it provides
> > > features for platforms the standard library does not. The interface
> > > being generic or not may have nothing to do with it. Or perhaps
> > > because it has a 1.x version, while the other doesn't, etc.
> > > 
> > > In fact, the atomic crate is essentially about providing `Atomic<T>`,
> > > so one could argue that all those downloads are precisely from people
> > > that want a generic atomic.
> > > 
> > > Moreover, I noticed portable-atomic's issue #1 in GitHub is,
> > > precisely, adding `Atomic<T>` support. The maintainer has a PR for
> > > that updated over time, most recently a few hours ago.
> > > 
> > > There is also `AtomicCell<T>` from crossbeam, which is the first
> > > feature listed in its docs.
> > > 
> > > Anyway...
> > > 
> > > The way I see it, both approaches seem similar (i.e. for what we are
> > > going to use them for today, at least) and neither apparently has a
> > > major downside today for those use cases (apart from needed refactors
> > > later to go to another approach).
> > > 
> > > (By the "generic approach", by the way, I mean just providing
> > > `Atomic<{i32,i64}>`, not a complex design)
> > > 
> > > So it is up to you on what you send for the non-RFC patches, of
> > > course, and if nobody has the time / wants to do the work for the
> > > "simple" generic approach, then we can just go ahead with this for the
> > > moment. But I think it would be nice to at least consider the "simple"
> > > generic approach to see how much worse it would be.
> > > 
> > > Other bits to consider, that perhaps give you arguments for one or the
> > > other: consequences on the compilation time, on inlining, on the error
> > > messages for new users, on the generated documentation, on how easy to
> > > grep they are, etc.
> > 
> > Yeah, rereading the thread - I'm with Miguel and Gary.
> > 
> > Generics are simply the correct way to do it, if the wider rust
> > community didn't do it that way I think that can be chalked up more to
> > historical baggage or needlessly copying the base integer type scheme.
> > 
> > Let's please do it right here, and generics are the correct approach.
> 

I think the disagreement here is not non-generic atomic vs generic
atomic, it's pure generic atomic vs. AtomicI{32,64} etc + generic
atomic. I said multiple times that I'm OK with generic atomics if there
are real users, just I'm not sure it's something we want to do right now
(or we have enough information to go fully on that direction). And I
think it's fine to have non-generic atomic and generic atomic coexist.

Regards,
Boqun

> If so, maybe we should do u<Wide> instead of u8, u16, oh, and probably
> just Integer<Sign, Wide> instead of i{8,16,32,64) and u{8,16,32,64} ;-)
> 
> Regards,
> Boqun
