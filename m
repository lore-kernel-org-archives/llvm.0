Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7101514DB
	for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711574506; cv=none; b=ckBjG4F2kcVcFnj/gd9OdxU4h6qmVwsvVN5P6StT5hUtpSTec/xts+mGueoJ0lcdvBtb41oV7S5oSuUoDBIneDHobOysXrzEfdyr9PWASYvFb+66FBEAXDFSeGAJfQFCmwi/59L9t6RnsXZ5GDkAuvVmJmE7k74UFw/TFW/fb7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711574506; c=relaxed/simple;
	bh=92sHhCo4mE16EEY2gWj9OXJXpJBX3IDmAVU4FCwQsfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enf2BtTeNWHVYN6fgVbZmhU1VzGBdmWjSLTzyOzMIRP+gcKHU7Jo7u5Wu9IVMJx/dLtFYqws+fKfsaJf8rwuO1SeHXF34QswXzoUt/G3Og2iwwyNy13nvGFjEqyazmAXI1XkzcW0H1qAuG9acEyS5Td3U8L7mXcxjATB3OCKJ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7QN8yMH; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7QN8yMH"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e6d089cad0so171027a34.3
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 14:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711574503; x=1712179303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPexr1qL1sWHkOO5VvKGmiwPJykaCN4OnZNa3Q9bZFY=;
        b=V7QN8yMHjVxFYy7LJqln6t4q8SwnEgDhqQJ9s8Sc/QJwrnnTIAkZKTeMBGzhgxmMVw
         YHAA1pj0exujlYMc+RJemX7PmWQesKiKb/MA0+b3cL5cPYUYhRENAFbLOoEs3AnBfk7M
         /2Myc+jQVADYw7tZl5EF7WipFhGHop+YBnN1S4EYTFWLdsrvbdcFn1D5UwbVL6aR85uy
         oz6fEQzTfzzVu8lwI8e2mb8nLPJMjY0uuHez7ci9Z0oJepUbc+LF6TmF6KzDTgd2L/lr
         udT7ZjIscjxkkF35Ef79B2AX/fTW1ML7M2Ccbd4a9442BS5WHt8cN308Xgc44UpmoRaP
         FUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711574503; x=1712179303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPexr1qL1sWHkOO5VvKGmiwPJykaCN4OnZNa3Q9bZFY=;
        b=oXZi+dcXUl6SllU+ceV5pqiYs2YB28xOZo/VGxOXtU65fPQRQZDEzdtJ9er5Gztf5m
         NAd8IlP/hkNn3VZ+bQY//gCdVmCZBervzQOnpE/vX/D+OhapY69ewe2IvDrbQe6eBvxS
         J2oFHu5FM6sb7fUGlKoTXkaV5GKXBdBexTXLNpilmeIwVahbTD1j9lGqEItlW182CF1M
         GWbDU/R+lDHat6VBF8JkTfBo2JZt/7fv3yTpsFbIaobzrp3iKHxNdNT6H9umUZaemvFl
         b2FwYZ7pLImymvAVv93n0cPE2NZCPDpBmLNlZ4j7STQHilC9WMJkzk5v8Mk4dBjpxTzO
         KP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAQL6EIXpr1o7Q+jTp+bT/jYeRDQu1vMfPpJmCtVWlKMK5TZpLEbRn3oaRHIkbtZgyjXSL1iZ7fG/IqXWtHnNt7eCALQ==
X-Gm-Message-State: AOJu0Yy48mbGxnrAlQxrXba48jGStk5BHXwE83WhMoopNjXNqiABFQOS
	QRn9xU2d5yH7IpSwh3DKBf4T9b5xFdAfOdEWPN7K0qnG4MK/KS9f
X-Google-Smtp-Source: AGHT+IFwWxghWoZ03Kxvmq00ZJlmOcZRRjCIxBBmZTyM+9J4sTcFCpjAUAyRfv+g/a+r1EiNjL0Udw==
X-Received: by 2002:a05:6830:11c6:b0:6e6:a6fb:7a11 with SMTP id v6-20020a05683011c600b006e6a6fb7a11mr1161746otq.6.1711574503519;
        Wed, 27 Mar 2024 14:21:43 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id b23-20020a05620a119700b0078a4590c62esm16536qkk.87.2024.03.27.14.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 14:21:43 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfauth.nyi.internal (Postfix) with ESMTP id AE07E120006E;
	Wed, 27 Mar 2024 17:21:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 27 Mar 2024 17:21:41 -0400
X-ME-Sender: <xms:5I0EZmbZ27cWDN4rQSFDPD1mGD6J3gqPft95zmx1NK2_xZDwSctJQw>
    <xme:5I0EZpZQ6_OjJ4OxvaOAM9cbcgHQYN-sa1Vg36pOmk5WuxGGnxIwp5wZepZad9RGI
    IYMvvAo4wC3huvp4A>
X-ME-Received: <xmr:5I0EZg9sQJuKoJIbDUUTmu5CdPGalgp7jZROwpQq7h1O-iLEi9ncRTxMTws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduiedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:5I0EZoroOuCjY_LShRVntoYM4wBUgSW3y-Onjc31X25vu4l66PRUPA>
    <xmx:5I0EZhrDfK09Wfn5luLpWfnAQAXMzB9Uq5Ed0yTLBa7g1yum1g2u9A>
    <xmx:5I0EZmQKR94LcuhQkl-PDs_FjWU9DhiTb5rGtKjJy6FbvOqcsjCPFA>
    <xmx:5I0EZhrWYjaeSHmP1Tey_GBMyjcLKy9yKka_xoeMHz-c__VfBmPMrg>
    <xmx:5Y0EZkGtaDc1thMvTzTc1feW91AvSQk7aNfAr8PRT7LYvigqA7DzUcqTii7S3a-J>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Mar 2024 17:21:40 -0400 (EDT)
Date: Wed, 27 Mar 2024 14:21:03 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,	comex <comexk@gmail.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Philipp Stanner <pstanner@redhat.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
Message-ID: <ZgSNvzTkR4CY7kQC@boqun-archlinux>
References: <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
 <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
 <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
 <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
 <ZgIRXL5YM2AwBD0Y@gallifrey>
 <CAHk-=wjwxKD9CxYsf5x+K5fJbJa_JYZh1eKB4PT5cZJq1+foGw@mail.gmail.com>
 <160DB953-1588-418E-A490-381009CD8DE0@gmail.com>
 <qyjrex54hbhvhw4gmn7b6l2hr45o56bwt6fazfalykwcp5zzkx@vwt7k3d6kdwt>
 <CAHk-=wgQy+FRKjO_BvZgZN56w6-+jDO8p-Mt=X=zM70CG=CVBQ@mail.gmail.com>
 <bjorlxatlpzjlh6dfulham3u4mqsfqt7ir5wtayacaoefr2r7x@lmfcqzcobl3f>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bjorlxatlpzjlh6dfulham3u4mqsfqt7ir5wtayacaoefr2r7x@lmfcqzcobl3f>

On Wed, Mar 27, 2024 at 03:41:16PM -0400, Kent Overstreet wrote:
> On Wed, Mar 27, 2024 at 12:07:26PM -0700, Linus Torvalds wrote:
> > On Wed, 27 Mar 2024 at 11:51, Kent Overstreet <kent.overstreet@linux.dev> wrote:
> > >
> > > On Wed, Mar 27, 2024 at 09:16:09AM -0700, comex wrote:
> > > > Meanwhile, Rust intentionally lacks strict aliasing.
> > >
> > > I wasn't aware of this. Given that unrestricted pointers are a real
> > > impediment to compiler optimization, I thought that with Rust we were
> > > finally starting to nail down a concrete enough memory model to tackle
> > > this safely. But I guess not?
> > 
> > Strict aliasing is a *horrible* mistake.
> > 
> > It's not even *remotely* "tackle this safely". It's the exact
> > opposite. It's completely broken.
> > 
> > Anybody who thinks strict aliasing is a good idea either
> > 
> >  (a) doesn't understand what it means
> > 
> >  (b) has been brainwashed by incompetent compiler people.
> > 
> > it's a horrendous crock that was introduced by people who thought it
> > was too complicated to write out "restrict" keywords, and that thought
> > that "let's break old working programs and make it harder to write new
> > programs" was a good idea.
> 
> Strict aliasing is crap in C and C++ because we started out with
> unrestricetd pointers, and it just doesn't work in C and C++ with the
> realities of the kind of code we have to write, and we never got any
> kind of a model that would have made it workable. Never mind trying to
> graft that onto existing codebases...
> 
> (Restrict was crap too... no scoping, nothing but a single f*cking
> keyword? Who ever thought _that_ was going to work?)
> 
> _But_: the lack of any aliasing guarantees means that writing through
> any pointer can invalidate practically anything, and this is a real

I don't know whether I'm 100% correct on this, but Rust has references,
so things like "you have a unique reference to a part of memory, no one
would touch it in the meanwhile" are represented by `&mut`, to get a
`&mut` from a raw pointer, you need unsafe, where programmers can
provide the reasoning of the safety of the accesses. More like "pointers
can alias anyone but references cannot" to me.

Regards,
Boqun

> problem. A lot of C programmers have stockholm syndrome when it comes to
> this, we end up writing a lot of code in weirdly baroque and artificial
> styles to partially work around this when we care about performance -
> saving things into locals because at least the _stack_ generally can't
> alias to avoid forced reloads, or passing and returning things by
> reference instead of by value when that's _not the semantics we want_
> because otherwise the compiler is going to do an unnecessary copy -
> again, that's fundamentally because of aliasing.
