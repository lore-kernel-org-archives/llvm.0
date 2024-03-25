Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CB545976
	for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 19:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395917; cv=none; b=LclKsG0YsaivDc/UWpqAv7d5814VezepusotMeeL9c43p1O5W2MELrBqHHUsqTUzL2Ss9wRIRkoeZTutEe254+0nq1pEFzO7IaqhoFRqABsveeECrcCvFZFvRC2mol+QZ3J2WLCdbIWjukptVyb9BzYTv19ciU4jxpF9go78iNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395917; c=relaxed/simple;
	bh=A9iFiK6Y1wte6MuOGQxLuhRQjW57DRplpjuGYIs8fYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNh41MKJnwseDRQVAuQ2wyYyzFY5fuvbFdKAXSBhX7wmqr7HtkvWb4PsmtFZEs7id6KyIqCKBCTxXK9jV9ZiIsH/wWHsyx/IVglw6xBtLFSA6CfC//cOT41rlBlGgMwCyNPsYZHVOFub1I7PvZS0Zirz+pf6O9Tcyaw7EoHb6kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WKXpVAJy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WKXpVAJy"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c12c73ed8so1724623a12.2
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 12:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711395913; x=1712000713; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/SDMeVL08gBgcdBP5iWFLp8wMiMUpYFhuW9V2Wg1OXU=;
        b=WKXpVAJyOBzJxE5tCVmrHi+e5X9htcoXwLGar1tVKwumZ5PJBz52gQKrYPEdF7B0Wv
         IXQ3G5jElMfF8/8Z20FAIjZE8Jf0NuGGwznpICJeDQwbSMgytX1I6ABxxhD9SUiEqeZy
         for2ssmTLOeJ0EqvVBHJQkovstCTkCBdmGSdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711395913; x=1712000713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SDMeVL08gBgcdBP5iWFLp8wMiMUpYFhuW9V2Wg1OXU=;
        b=Y7t7V0fRF7bIARqGgXQ3dhFfsisIdjTtzUVXpLxJh7xCHgjDmcxMkVUZbGb0TezsUc
         QzHjjBSRS3w/OXNsbOvxnpitZBgKgedyZBc6yX9HKOe3cGNDGYq7Sq/IB+Vjkay/dfFG
         lK3q5sUWT/frmzGimnCdLLkFw+pyzxch3a9kTxrXqa3nDBeo+XEpan4eksskMuhrR9uR
         legbtxZM+qkeAJ4Vm1GGT7aDHNsof2B15756Hb/ls1N2zVEFkNKqLx7vYFzC0bXbnDPS
         AJEbv9wxxvB2vf52OdLd/6EnTZiyYjtaj//PNqAx3Uwm2FGOJtww3Ufd7eNIVrsESK3K
         ciYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk7wrl4xTP7yqn/8+mFpdDVGLE2rIhbLFJwbv0ldXph5IOR0G1DOcVWN73HaC0GzP+gJAW0h5qT1ac2XYLfXtVYXMdiQ==
X-Gm-Message-State: AOJu0YwcSwbrDmGfSxJRTpYzXFM1HHBX0rdes8h01ikHU32/g2otfvnO
	DTAdVhAvqPC6FkEDUbpmPdysruCM7XYBwBHYHUdTZ4zzMIRQxXJyiHL5xy10kBdZFcexK7bIphK
	W6Eyh8A==
X-Google-Smtp-Source: AGHT+IGQxH76ePC2VnDKfojmRTr/vyRDeaNYDGIuSC/3BT9jQybMiU4DwdQ4Cpc9GmKK5NPwCKxXNA==
X-Received: by 2002:a50:f69e:0:b0:56c:1bf7:164c with SMTP id d30-20020a50f69e000000b0056c1bf7164cmr1479083edn.20.1711395913251;
        Mon, 25 Mar 2024 12:45:13 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id d2-20020aa7d682000000b005682a0e915fsm3301428edr.76.2024.03.25.12.44.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 12:44:51 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4a3a5e47baso147789266b.2
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 12:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXt+LPkUfxH0RmCb9sCKXmyG0NRuOo79avtFY0KQfAztkV8CjcvJUrPl9tEhgcc9nvU83G1SYJA1FZQz2QkV5ClHSgv1g==
X-Received: by 2002:a17:906:4a56:b0:a46:9b7c:c962 with SMTP id
 a22-20020a1709064a5600b00a469b7cc962mr5818699ejv.47.1711395890869; Mon, 25
 Mar 2024 12:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
 <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
 <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
 <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com> <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
In-Reply-To: <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 25 Mar 2024 12:44:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
Message-ID: <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Philipp Stanner <pstanner@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 11:59, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> To be fair, "volatile" dates from an era when we didn't have the haziest
> understanding of what a working memory model for C would look like or
> why we'd even want one.

I don't disagree, but I find it very depressing that now that we *do*
know about memory models etc, the C++ memory model basically doubled
down on the same "object" model.

> The way the kernel uses volatile in e.g. READ_ONCE() is fully in line
> with modern thinking, just done with the tools available at the time. A
> more modern version would be just
>
> __atomic_load_n(ptr, __ATOMIC_RELAXED)

Yes. Again, that's the *right* model in many ways, where you mark the
*access*, not the variable. You make it completely and utterly clear
that this is a very explicit access to memory.

But that's not what C++ actually did. They went down the same old
"volatile object" road, and instead of marking the access, they mark
the object, and the way you do the above is

    std::atomic_int value;

and then you just access 'value' and magic happens.

EXACTLY the same way that

   volatile int value;

works, in other words. With exactly the same downsides.

And yes, I think that model is a nice shorthand. But it should be a
*shorthand*, not the basis of the model.

I do find it annoying, because the C++ people literally started out
with shorthands. The whole "pass by reference" is literally nothing
but a shorthand for pointers (ooh, scary scary pointers), where the
address-of is implied at the call site, and the 'dereference'
operation is implied at use.

So it's not that shorthands are wrong. And it's not that C++ isn't
already very fundamentally used to them. But despite that, the C++
memory model is very much designed around the broken object model, and
as already shown in this thread, it causes actual immediate problems.

And it's not just C++. Rust is supposed to be the really moden thing.
And it made the *SAME* fundamental design mistake.

IOW, the whole access size problem that Boqun described is
*inherently* tied to the fact that the C++ and Rust memory model is
badly designed from the wrong principles.

Instead of designing it as a "this is an atomic object that you can do
these operations on", it should have been "this is an atomic access,
and you can use this simple object model to have the compiler generate
the accesses for you".

This is why I claim that LKMM is fundamentally better. It didn't start
out from a bass-ackwards starting point of marking objects "atomic".

And yes, the LKMM is a bit awkward, because we don't have the
shorthands, so you have to write out "atomic_read()" and friends.

Tough. It's better to be correct than to be simple.

             Linus
