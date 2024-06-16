Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C180ECF
	for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718552051; cv=none; b=Igrp/CCiqW/DN8cJHfk7qwe9ZpYimn1HMWPeo9fpUdvLUPrHCvYWTrKUBKZjD0bilfyrAA89CIl4Xis2V87xp3MpNqsgg4H2FqYKhRIZopJ5YFwcF/NBkdbyRgXAE2mHI9RcB6QtMH+R50w89ITnrLziTCM0t2Q6qWAGVFG6sIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718552051; c=relaxed/simple;
	bh=VKRWJpIMK0S9pLhIAa3900ms+s65QYjuPQ5MXIGQAlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjfkTibyqq7b/g0ruA29rGL2OWIrcoK8Lt/6VAF9PlGxh4pivZlz92B2ZqKrMnsO6b8vbCs4eI+YqpX9DmQwy/0nAXqBx/lFC5A5Vr3BNmhvwswv02ZOyH8vnZ7qAW3ZujmHA2NnkOkoG4X+2lqKev8IKxxCnJbF6nQ1++/yibs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqQCQ0Av; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqQCQ0Av"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7954dcf3158so248020285a.3
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718552049; x=1719156849; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WNehZoTaz85gqFG0QqkiBt7ebsvNFSADphoVI/M57sg=;
        b=hqQCQ0AvXvF52VvQ4W7Fy0ZEJpWD95RmZy7ab/XR6noZ6uHit2TPywbneC0BSvP2zg
         PyKZcs6TaXRaV9m+82+fzPkumVESM9JY0R2iCx/syBMjHHN1xurtCgwXXBZuyjVFYUoU
         0m299Zq7GecDezCqEb6OFIK97D/+HDRY+qG9eS/2PghjnX6dn6uQ6+5RHuvfcPTLNPnn
         7yCswMM70DmoC5D1uA5jISshWsPovjqJcsgYk7oUEN19PzlfGeoAdQnXyU77YwvOj6Qj
         +TfFv7lAJyVYVp6rTOuZBESe2WV2qDJKii8v6Y2HjThRNWqsehgMRtLG3VN9uG7GGCYN
         uldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718552049; x=1719156849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNehZoTaz85gqFG0QqkiBt7ebsvNFSADphoVI/M57sg=;
        b=YHMjOFb0gwNFGf8KvX0tOrAa9/anDrNCOb6sq2FHWgPrw4U0umC7YovlDcagOPN5jg
         qjh0+Th/3ry9pBMPIPxV+SQ4XSmnJ3lU+3Pj2KK/poN1KZdS9v7SGDcCbZzr04esbJ9m
         xt/9/FAOIoGsk5OCHtQWXCfgMJXk7+Yr0bzILliHMnl43ZXqVLn/U55ZLiJgTeLwn/3d
         ptYze5OYYDwUOADYqnDyLAQ7EAFVKNo4hcdGcBqBlFcZe5Vv7jWOKrzNEYNp5Hk1/uDo
         5e/YtrM+8Mr+swbPOZzd2dxaeVgKVGHFP8/xfS/N3t5Z1C3LVSDKFKy2u/zN4U9cS1n4
         o3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUxTKS7CXWzGRslyAK3UBYUh0OoTFNOLr795OqxF2TRCTbu7PmC9md6danCdG23sSBqzNtAH8RlOMHAaKfTwlaV9qWceQ==
X-Gm-Message-State: AOJu0YxEjvwmZWbnGcIK82dxDWFm/FnJrWcHMN5xAczn2V34swBK6hbX
	e0/BsJ4zz9Pg1KtLDMaFsqqYWTp4OuHpCHesv9gd7lI2Fwcjb1Fb
X-Google-Smtp-Source: AGHT+IGQyJi1xBczI9a6p2s72H0D18BKeAPhCIA+Oxy+LTN60yYXLSMDM4mN0jpIXUCjGtJ5LCQpKw==
X-Received: by 2002:a05:620a:19a6:b0:795:68d9:b297 with SMTP id af79cd13be357-798d26ac129mr808839685a.67.1718552048939;
        Sun, 16 Jun 2024 08:34:08 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef3d89ddsm37367111cf.15.2024.06.16.08.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 08:34:08 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 8A1C9120006B;
	Sun, 16 Jun 2024 11:34:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 16 Jun 2024 11:34:07 -0400
X-ME-Sender: <xms:7wVvZgTl0u3hHMvJ-K_6jflrC3h7rVLICDr16EzrdDK9pF654mu4Dg>
    <xme:7wVvZtw2M5x8gR6oToUyBI6ZkPXtLF-bDxAcLxwLWnWRpnaj5aBeRkP1G3LvnY4-B
    -Tp6JX9rHIDcxzabw>
X-ME-Received: <xmr:7wVvZt1bSNd1v0RwyvifmbImOODdlX9WcODUnt5611we6rGr1x7yJU7a-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefh
    gfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:7wVvZkAX90YBVXbwjDPiIJ1U5KGNXKhxis5vwS7giFZJ0Og4b4z8tg>
    <xmx:7wVvZpgqXGGHE9_0IusBitpffNp1vcIopheKM7IrnaDJlqT6CbvzSw>
    <xmx:7wVvZgpPidd37yB7B7xb9NIhB7jDHA0c_LUi0Drilpo3HsDZyIo1mQ>
    <xmx:7wVvZsg0Tx6I03mFRTGfASAJ2MU_6XrHw_-d7n8_Mr8Yj9_-OAYTbA>
    <xmx:7wVvZgT2NTJbZ0xbso0IXC_NJvJ1ZgLQQhDnBrzr8TAnOjmBy7KSvkr9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 11:34:06 -0400 (EDT)
Date: Sun, 16 Jun 2024 08:34:05 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Message-ID: <Zm8F7ZFnUFJkFGQ3@Boquns-Mac-mini.home>
References: <20240612223025.1158537-3-boqun.feng@gmail.com>
 <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
 <ZmxUxaIwHWnB42h-@Boquns-Mac-mini.home>
 <c1c45a2e-afdf-40a6-9f44-142752368d5e@proton.me>
 <ZmzvVr7lYfR6Dpca@Boquns-Mac-mini.home>
 <b692945b-8fa4-4918-93f6-783fbcde375c@proton.me>
 <Zm4R0XwTpsASpBhx@Boquns-Mac-mini.home>
 <d67aeb8c-3499-4498-aaf9-4ac459c2f747@proton.me>
 <Zm7xySzPJcddF-I_@Boquns-Mac-mini.home>
 <f29cb2fd-651b-4bc5-8055-e3a412192e29@proton.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f29cb2fd-651b-4bc5-8055-e3a412192e29@proton.me>

On Sun, Jun 16, 2024 at 03:06:36PM +0000, Benno Lossin wrote:
> On 16.06.24 16:08, Boqun Feng wrote:
> > On Sun, Jun 16, 2024 at 09:46:45AM +0000, Benno Lossin wrote:
> >> On 16.06.24 00:12, Boqun Feng wrote:
> >>> On Sat, Jun 15, 2024 at 07:09:30AM +0000, Benno Lossin wrote:
> >>>> On 15.06.24 03:33, Boqun Feng wrote:
> >>>>> On Fri, Jun 14, 2024 at 09:22:24PM +0000, Benno Lossin wrote:
> >>>>>> On 14.06.24 16:33, Boqun Feng wrote:
> >>>>>>> On Fri, Jun 14, 2024 at 11:59:58AM +0200, Miguel Ojeda wrote:
> >>>>>>>> On Thu, Jun 13, 2024 at 9:05 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Does this make sense?
> >>>>>>>>
> >>>>>>>> Implementation-wise, if you think it is simpler or more clear/elegant
> >>>>>>>> to have the extra lower level layer, then that sounds fine.
> >>>>>>>>
> >>>>>>>> However, I was mainly talking about what we would eventually expose to
> >>>>>>>> users, i.e. do we want to provide `Atomic<T>` to begin with? If yes,
> >>>>>>>
> >>>>>>> The truth is I don't know ;-) I don't have much data on which one is
> >>>>>>> better. Personally, I think AtomicI32 and AtomicI64 make the users have
> >>>>>>> to think about size, alignment, etc, and I think that's important for
> >>>>>>> atomic users and people who review their code, because before one uses
> >>>>>>> atomics, one should ask themselves: why don't I use a lock? Atomics
> >>>>>>> provide the ablities to do low level stuffs and when doing low level
> >>>>>>> stuffs, you want to be more explicit than ergonomic.
> >>>>>>
> >>>>>> How would this be different with `Atomic<i32>` and `Atomic<i64>`? Just
> >>>>>
> >>>>> The difference is that with Atomic{I32,I64} APIs, one has to choose (and
> >>>>> think about) the size when using atomics, and cannot leave that option
> >>>>> open. It's somewhere unconvenient, but as I said, atomics variables are
> >>>>> different. For example, if someone is going to implement a reference
> >>>>> counter struct, they can define as follow:
> >>>>>
> >>>>> 	struct Refcount<T> {
> >>>>> 	    refcount: AtomicI32,
> >>>>> 	    data: UnsafeCell<T>
> >>>>> 	}
> >>>>>
> >>>>> but with atomic generic, people can leave that option open and do:
> >>>>>
> >>>>> 	struct Refcount<R, T> {
> >>>>> 	    refcount: Atomic<R>,
> >>>>> 	    data: UnsafeCell<T>
> >>>>> 	}
> >>>>>
> >>>>> while it provides configurable options for experienced users, but it
> >>>>> also provides opportunities for sub-optimal types, e.g. Refcount<u8, T>:
> >>>>> on ll/sc architectures, because `data` and `refcount` can be in the same
> >>>>> machine-word, the accesses of `refcount` are affected by the accesses of
> >>>>> `data`.
> >>>>
> >>>> I think this is a non-issue. We have two options of counteracting this:
> >>>> 1. We can just point this out in reviews and force people to use
> >>>>    `Atomic<T>` with a concrete type. In cases where there really is the
> >>>>    need to be generic, we can have it.
> >>>> 2. We can add a private trait in the bounds for the generic, nobody
> >>>>    outside of the module can access it and thus they need to use a
> >>>>    concrete type:
> >>>>
> >>>>         // needs a better name
> >>>>         trait Integer {}
> >>>>         impl Integer for i32 {}
> >>>>         impl Integer for i64 {}
> >>>>
> >>>>         pub struct Atomic<T: Integer> {
> >>>>             /* ... */
> >>>>         }
> >>>>
> >>>> And then in the other module, you can't do this (with compiler error):
> >>>>
> >>>>         pub struct Refcount<R: Integer, T> {
> >>>>                             // ^^^^^^^ not found in this scope
> >>>>                             // note: trait `crate::atomic::Integer` exists but is inaccessible
> >>>>             refcount: Atomic<R>,
> >>>>             data: UnsafeCell<T>,
> >>>>         }
> >>>>
> >>>> I think that we can start with approach 2 and if we find a use-case
> >>>> where generics are really unavoidable, we can either put it in the same
> >>>> module as `Atomic<T>`, or change the access of `Integer`.
> >>>>
> >>>
> >>> What's the issue of having AtomicI32 and AtomicI64 first then? We don't
> >>> need to do 1 or 2 until the real users show up.
> >>
> >> Generics allow you to avoid code duplication (I don't think that you
> >> want to create the `Atomic{I32,I64}` types via macros...). We would have
> >> to do a lot of refactoring, when we want to introduce it. I don't see
> > 
> > You can simply do
> > 
> > 	type AtomicI32=Atomic<i32>;
> 
> Eh, I would think that we could just do a text replacement in this case.
> Or if that doesn't work, Coccinelle should be able to do this...
> 
> > Plus, we always do refactoring in kernel, because it's impossible to get
> > everything right at the first time. TBH, it's too confident to think one
> > can.
> 
> I don't think that we're at the "let's just put it in" stage. This is an
> RFC version, so it should be fine to completely change the approach.

I'm fine as well. I wasn't trying to rush anything, but as I mentioned
below, I need some more design from people who want it to understand
whether that's a good idea.

> I agree, that we can't get it 100% right the first time, but we should
> at least strive to get a good version.
> 
> >> the harm of introducing generics from the get-go.
> >>
> >>> And I'd like also to point out that there are a few more trait bound
> >>> designs needed for Atomic<T>, for example, Atomic<u32> and Atomic<i32>
> >>> have different sets of API (no inc_unless_negative() for u32).
> >>
> >> Sure, just like Gary said, you can just do:
> >>
> >>     impl Atomic<i32> {
> >>         pub fn inc_unless_negative(&self, ordering: Ordering) -> bool;
> >>     }
> >>
> >> Or add a `HasNegative` trait.
> >>
> >>> Don't make me wrong, I have no doubt we can handle this in the type
> >>> system, but given the design work need, won't it make sense that we take
> >>> baby steps on this? We can first introduce AtomicI32 and AtomicI64 which
> >>> already have real users, and then if there are some values of generic
> >>> atomics, we introduce them and have proper discussion on design.
> >>
> >> I don't understand this point, why can't we put in the effort for a good
> >> design? AFAIK we normally spend considerable time to get the API right
> >> and I think in this case it would include making it generic.
> >>
> > 
> > What's the design you propose here? Well, the conversation between us is
> > only the design bit I saw, elsewhere it's all handwaving that "generics
> > are overall really good". I'm happy to get the API right, and it's easy
> > and simple to do on concrete types. But IIUC, Gary's suggestion is to
> > only have Atomic<i32> and Atomic<i64> first, and do the design later,
> > which I really don't like. It may not be a complete design, but I need
> > to see the design now to understand whether we need to go to that
> > direction. I cannot just introduce a TBD generic.
> 
> I don't think that the idea was to "do the design later". I don't even
> know how you would do that, since you need the design to submit a patch.
> 

Then I might mis-understand Gary? He said:

"Can we avoid two types and use a generic `Atomic<T>` and then implement
on `Atomic<i32>` and `Atomic<i64>` instead?"

, which means just replace `impl AtomicI32` with `impl Atomic<i32>` to
me.

> I can't offer you a complete API description, since that would require
> me writing it up myself. But I would recommend trying to get it to work
> with generics. I got a few other comments:

We should work on things that are concrete, right? It's fine that the
design is not complete, and it's fine if you just recommend. But without
a somewhat concrete design (doesn't have to be complete), I cannot be
sure about whether we have the same vision of the future of generic
atomics (see my question to Gary), that's a bit hard for me to try to
work something out (plus I personally don't think it's a good idea, it's
OK to me, but not good). Anyway, I wasn't trying to refuse to do this
just based on personal reasons, but I do need to understand what you are
all proposing, because I don't have one myself.

> - I don't think that we should resort to a script to generate the Rust
>   code since it prevents adding good documentation & examples to the
>   various methods. AFAIU you want to generate the functions from
>   `scripts/atomic/atomics.tbl` to keep it in sync with the C side. I
>   looked at the git log of that file and it hasn't been changed
>   significantly since its inception. I don't think that there is any
>   benefit to generating the functions from that file.

I'll leave this to other atomic maintainers.

> - most of the documented functions say "See `c_function`", I don't like
>   this, can we either copy the C documentation (I imagine it not
>   changing that often, or is that assumption wrong?) or write our own?

You're not wrong. AN in C side, we do have some documentation template
to generate the comments (see scripts/atomic/kerneldoc). But first the
format is for doxygen(I guess?), and second as you just bring up, the
templates are tied with the bash script.

> - we should try to use either const generic or normal parameters for the
>   access ordering instead of putting it in the function name.

Why is it important? Keeping it in the current way brings the value that
it's not too much different than their C counterparts. Could you explain
a bit the pros and cons on suffix vs const generic approach?

> - why do we need both non-return and return variants?
> 

Historical reason I guess. Plus maybe some architectures have a better
implementation on non-return atomics IIRC.

Regards,
Boqun

> I think it is probably a good idea to discuss this in our meeting.
> 
> ---
> Cheers,
> Benno
> 
