Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445341A3BB1
	for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718395995; cv=none; b=AO6cxklX6x1gPQxwxUDpbcpofGAEGEifrySFjXMC8kCfD5l6VXhwzdvZfySmG1CCC3UFdBDdg/gSM1XGSFV+BKzA6SuHHER67q75G6lXs2DWmRjUpwvB53RNM32M3ZbUVdxL/c4gz1F5AYCyYfCPCGN59x57fixFpA48wuVbRfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718395995; c=relaxed/simple;
	bh=QAkkkToNqaJ54H1Gf/4uegxz1byZkIwNDrgYfIhVFzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnRKrfXJUqS/a3hRk4CCE44YtdA/1JPBBtPVf2IRHZJdA593zlyTg+rHzeUcDinCjsqElQE+3AxbnDuZKrZlC66t9nTk8LaPJFsZDD4aI/KeJMTXFZLWcHJHe0gyMww+b1gPkgFdT7jilvGL/Vz9gF+zxSwEV4RXSEw1NoQNH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9CqD03+; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9CqD03+"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d226c5a157so1544976b6e.2
        for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 13:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718395993; x=1719000793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bHm/aaPtqr+seGxV2S60l3XmS90OeMKM4QcbWBal74=;
        b=W9CqD03+JeuAytUDEekkqhN+thmZ7n3ACVePIB68jfk+fM6zTGjP9yONZqWPxQL5vE
         SNJ8Fq8UDkgSqm9lhOrPzNKocP/KcHKPmlV1TOoy2K/jBA1+SWBZsnHDmy/nKma5j2dl
         A9Civsbw/rGpGrfp/3hHoNS3QyHxfa0haaKoMns4vt7GhV84zU753BnaAo72XuWrgvBj
         24tNDrNjZo7D+tHyRLeqtGw+HKZuygKHViBUABmIik327B3uANsXvyqSZrc1D0yAjuNw
         oDo2/iWy6V4/J1Za5OSLFkn2wByOwZLbLzFc07vFjJKA72suUmHJXPddcbyKd3qck/pB
         1LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718395993; x=1719000793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bHm/aaPtqr+seGxV2S60l3XmS90OeMKM4QcbWBal74=;
        b=LTDixPJ7FDdStRX49G+/D/H8ZVNNqW5vNQ3IBcQBgfAC7cAq9M6sDTEaYP06NArgZM
         u3nkr8lswG4xvaSOT0+qTM2ziMk48iASronQRbGtMCfUhI7xLE9c6+aU+kWJeIjKPsmD
         27DIG1TfC9IbgtADGYBkwmVyYFCDW/20KNKVN2CfRQWW//d3KRYvvPgfQfkAIyPrKbEs
         VNrg731taGtKCDIdXaUPGsoqr6BeNLOTYNXTF4XNKW7UNCSbS6jyWpXWWLADJ4YSfjhG
         xHtDJcAONUrgjPfme2nzelI+ZuwWcMS6Jgisewr+LDJOT4kEmOanaid5lzrcYZ6CxAyV
         Uxag==
X-Forwarded-Encrypted: i=1; AJvYcCXiPsp+OOWlsUBF+ExQAMog9iUUDHg2M7EdOqodYSzpdN4LUYkzOLfC6nsOhB4FeLGm7sd634QuAOJSEejqo+H9BGjh4Q==
X-Gm-Message-State: AOJu0Yx3cJ8/p6WewwjR1mqN2CBP1wtqgzuaW+AQ4llRaBHRevNJI7iQ
	VJ6EAFO2BBNPKxWH9FfrL5kCAtXfZRf2Idyavmvh3lDCiNec0czH
X-Google-Smtp-Source: AGHT+IGQ/7jt+p7Vy+rl8KY42hsPlfY6qspnV6dIbABmXy17cfCC4w/P5jUh7xtu725fkfqJwGMFrQ==
X-Received: by 2002:a05:6808:e8e:b0:3d2:1ce7:43da with SMTP id 5614622812f47-3d24e9bc08fmr3473362b6e.49.1718395993043;
        Fri, 14 Jun 2024 13:13:13 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aacb1e6dsm176551585a.13.2024.06.14.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 13:13:12 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 5DA3B120006C;
	Fri, 14 Jun 2024 16:13:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 14 Jun 2024 16:13:11 -0400
X-ME-Sender: <xms:V6RsZjT5NgAWoJYubZWx-Lwxb4FJ9gSKADveBGwK-qXJYeQRozIpuQ>
    <xme:V6RsZkzvMpf27JRJ3RDeN-g63RvQfkM8PfrNJIwaWTFsgVjcXTMriEdo56-_9eDph
    9QWeewN60OuzMGCww>
X-ME-Received: <xmr:V6RsZo2DHp2viMNt4J3Zs6ORsw47sKyJT-N1L1CkczmYFDQpzA13b_KRe1FI7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepffdtiefhieegtddvueeuffeiteevtdegjeeuhffhgfdugfefgefgfedt
    ieeghedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:V6RsZjAdDiGhWMrmZv_UZx76-FJd3AbsXWS-0syxZFg5_adnu5Bgwg>
    <xmx:V6RsZshRv4VnqIAfLJLkox3Y3uJM8HJbR6Z1Eefe3yfo8pyT2tD1BQ>
    <xmx:V6RsZnoeNisY7HCHMnzVjlC9EjL1yYV8CNU8dzEsI4EsXrURx0daRQ>
    <xmx:V6RsZngnglzREGg7aunmYGGyKmiJzVK8vrZCyRiLun_lOG6iwycPsg>
    <xmx:V6RsZvRqMc5ns4tXEa_NKp24JsLLkk93O0HE7aDXHVoCa6cTKkvGcXFZ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 16:13:09 -0400 (EDT)
Date: Fri, 14 Jun 2024 13:13:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
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
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com
Subject: Re: [RFC 1/2] rust: Introduce atomic API helpers
Message-ID: <ZmykUtq45z0fGn26@boqun-archlinux>
References: <20240612223025.1158537-1-boqun.feng@gmail.com>
 <20240612223025.1158537-2-boqun.feng@gmail.com>
 <ZmwcBWjxf7gm89wA@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmwcBWjxf7gm89wA@J2N7QTR9R3.cambridge.arm.com>

On Fri, Jun 14, 2024 at 11:31:33AM +0100, Mark Rutland wrote:
> On Wed, Jun 12, 2024 at 03:30:24PM -0700, Boqun Feng wrote:
> > In order to support LKMM atomics in Rust, add rust_helper_* for atomic
> > APIs. These helpers ensure the implementation of LKMM atomics in Rust is
> > the same as in C. This could save the maintenance burden of having two
> > similar atomic implementations in asm.
> > 
> > Originally-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> FWIW, I'm happy with the concept; I have a couple of minor comments

;-)

> below.
> 
> > ---
> >  rust/atomic_helpers.h                     | 1035 +++++++++++++++++++++
> >  rust/helpers.c                            |    2 +
> >  scripts/atomic/gen-atomics.sh             |    1 +
> >  scripts/atomic/gen-rust-atomic-helpers.sh |   64 ++
> >  4 files changed, 1102 insertions(+)
> >  create mode 100644 rust/atomic_helpers.h
> >  create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh
> 
> [...]
> 
> > +#gen_proto_order_variant(meta, pfx, name, sfx, order, atomic, int, raw, arg...)
> > +gen_proto_order_variant()
> > +{
> > +	local meta="$1"; shift
> > +	local pfx="$1"; shift
> > +	local name="$1"; shift
> > +	local sfx="$1"; shift
> > +	local order="$1"; shift
> > +	local atomic="$1"; shift
> > +	local int="$1"; shift
> > +	local raw="$1"; shift
> > +	local attrs="${raw:+noinstr }"
> 
> You removed the 'raw_' atomic generation below, so you can drop the
> 'raw' parameter and the 'attrs' variable (both here and in the
> template)...
> 
> > +	local atomicname="${raw}${atomic}_${pfx}${name}${sfx}${order}"
> > +
> > +	local ret="$(gen_ret_type "${meta}" "${int}")"
> > +	local params="$(gen_params "${int}" "${atomic}" "$@")"
> > +	local args="$(gen_args "$@")"
> > +	local retstmt="$(gen_ret_stmt "${meta}")"
> > +
> > +cat <<EOF
> > +__rust_helper ${attrs}${ret}
> 
> ... e.g. you can remove '${attrs}' here.
> 
> [...]
> 
> > +grep '^[a-z]' "$1" | while read name meta args; do
> > +	gen_proto "${meta}" "${name}" "atomic" "int" "" ${args}
> > +done
> > +
> > +grep '^[a-z]' "$1" | while read name meta args; do
> > +	gen_proto "${meta}" "${name}" "atomic64" "s64" "" ${args}
> > +done
> 
> With the 'raw' parameter removed above, the '""' argument can be
> dropped.
> 

Fix all above locally.

> Any reason to not have the atomic_long_*() API? It seems like an odd
> ommision.
> 

See my reply to Peter, but there's also a more technical reason: right
now, we use core::ffi::c_long for bindgen to translate C's long. But
instead of `isize` (Rust's version of pointer-sized integer)
core::ffi::c_long is `i64` on 64bit and `i32` on 32bit. So right now,
atomic_long_add_return()'s helper signature would be (on 64bit):

	extern "C" {
	    #[link_name="rust_helper_atomic_long_add_return"]
	    pub fn atomic_long_add_return(
		i: i64,
		v: *mut atomic_long_t,
	    ) -> i64;
	}

and I would need to cast the types in order to put it in an
`AtomicIsize` method:

	impl AtomicIsize {
	    pub fn add_return(&self, i: isize) -> isize {
	        unsafe {
		    return atomic_long_add_return(i as i64, self.0.get()) as isize
		}
	    }
	}

see these two `as`s. I want to avoid handling them in a bash script ;-)

A better solution would be what Gary has:

	https://github.com/nbdd0121/linux/commit/b604a43db56f149a90084fa8aed7988a8066894b	

, which defines kernel's own ffi types and teach bindgen to pick the
right type for c_long. If we prefer script code generating to Rust macro
code generating, I will work with Gary on getting that done first and
then add atomic_long_t support unless we feel atomic_long_t support is
urgent.

Regards,
Boqun

> Mark.
