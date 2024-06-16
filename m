Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B9317571
	for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718557512; cv=none; b=nNAsq6he2k/g6Mc8Ke68umEj+tJFZnpcFf4gm4wb+Gk3CKVkfOBeCGpZF2fSHnzBhGFrKPBXwNAhm+2GkQ58d14/DBUEdfIZsUfNr6Rn6guNcJ1reVAYOnSw1xRkCuGRZmyWyNPR3HNh/zluzKKShVxcfiYwPuSgxAyPTzm0VRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718557512; c=relaxed/simple;
	bh=RIvx9kOHWKLvcoJfK4R0q0IiIfjt7q/a7nOFuOC5niM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7OXNYFCH+qYeqfWjubimW3/EM8wxFpC1EyR694XgYeEfjwUnoA1KZO75go+BQBE8EmiGAyQla3Sb4rQM51ASjxZoUoOZ8zcYQvZeo/CffCZhLr8yPoj7L3HPF0Nilndqh7KJPGWBVWj+mvMnbNoikjd0qmSIvD0ndjDecr/1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fltwJKu8; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fltwJKu8"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d23a0a32afso2132742b6e.3
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 10:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718557510; x=1719162310; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb/VuEkpep0deG9cMLgNvTgMKIQq7qL3KwU1FP8n8Zw=;
        b=fltwJKu83dxG8yAypTn69n2Nw6MtRfAEGzV3pZIk5N1niu4hPWUmzwfzmGoGDM+naF
         zte0o2jZLDWLWcWPsDGaHTTlnEosv61WTT2ybzWjLc7/pOsVtEHUnvc3k4bsbD8Ru+QZ
         4WwLy1XLiy/R3RvnqtMK6WiwV/OQ7TKeGK+Sr2Gf9NHvvKq+eQY2ANhRVF87rWUViTsA
         iuo65az7/bS87zlhoiBLxNDIBrtBQ9OwyUr986R8lOAU/5KFamZTCNOCcFQV1LKhWNJ7
         zS3hOlQL0sG4UBGAGEttoFeBOr8Lcha+DnTlWJvSSZxzbkh/NEBhZcngEAjeOD9nsvlO
         62Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718557510; x=1719162310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb/VuEkpep0deG9cMLgNvTgMKIQq7qL3KwU1FP8n8Zw=;
        b=HtRu6u4qFFd6Khj1zaTpl6FzUc2K/zGG2ZaNXpDHapsreEIu1SOvx7CJ28AxHqp5v0
         0vR8GEjCR320N54c2huFGWTu+hRCwsYvirsmFYLlyduM4Oyl0n1T/Vxr8vfUqSgGyTbS
         DGXhDY8YPAWBPYzKYn92lezw+pzWpJfZS0uCW3W4NhWpZvuwuduzMG7Nn3nVhq0/Mj5A
         wFDIm9SOvhWFXPAzwHnZcOZtd30/cgEZB02nZRvZyowWx8H5MrlE4PhCx35JFmyaaocq
         qoIRSwoq/xYeEwqVTW6E8Ovl7+S4uRiBRmXS6piczMsJwZEvRph/qcCeVmvmXRdmwM+y
         DZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWHQ/CmSRcDqOoK1WwZru7FseGs0HeCs3TQJVI+EiKTzh9pKDPLoTs26ttMhJDrHoICnouMB2oWT9NpaJb6Tbkp+0jxag==
X-Gm-Message-State: AOJu0YxdrKqtHHHWb5FdFKrjbZxH7WvUOsc8AQ61fFblAEtJGiOW237h
	eYq/RhUyHOMwCPxBGvRu/RKO/8ml4GykniGigBxxbrrBIT9EDIac
X-Google-Smtp-Source: AGHT+IGelQ5mYwaNQtvvsfM75dkmU6tbIL7wNO/AXelpy/8mWu1xuPwyHTXC3de/DOySHWI05Gx5qQ==
X-Received: by 2002:a05:6808:1520:b0:3d2:2356:d273 with SMTP id 5614622812f47-3d24e8a9973mr10166314b6e.6.1718557510442;
        Sun, 16 Jun 2024 10:05:10 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaedc360sm354994185a.33.2024.06.16.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 10:05:10 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id F3B401200043;
	Sun, 16 Jun 2024 13:05:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 16 Jun 2024 13:05:09 -0400
X-ME-Sender: <xms:RBtvZj2OaSyEI2y2V9-SV8zns7pXtwAuifBua7R-qHZJIEnPe2vrag>
    <xme:RBtvZiF67gwxLmmCwKTmfYcWn3G0RadywiVzA6IV6wWYsLCfpw5McAa_d4fWSaM7r
    nBI0EETouif78uJwA>
X-ME-Received: <xmr:RBtvZj7-D-81dAgltMEDzAkUxvpGg7h9V-HW_LOEYutBUzCFu1SXJIQ8UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:RBtvZo1gRpIqhEQGdujZa859eZs3naawX8BSbi2KvwkOmKC4fwgdkg>
    <xmx:RBtvZmGO9Qbn7U4XLSTouWlILV5JfyISsOlJuEZ2Mj4_O4A4g0iVJg>
    <xmx:RBtvZp9hy3T4Q-uXgqlbb3h_q3dCAX1_n3jZKg8eg6dR6MQ6nbKENQ>
    <xmx:RBtvZjn8fscW1pBdQVrMgRmOKdBhTcFGgzwXfwGh3MPVaIFWqAbavw>
    <xmx:RBtvZiFn6QKs4Xn-sXl847Km0MmKF90_4OfR1iIggUg_yS6i662ClvYs>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 13:05:08 -0400 (EDT)
Date: Sun, 16 Jun 2024 10:05:06 -0700
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
Message-ID: <Zm8bQktx4D-3glG5@Boquns-Mac-mini.home>
References: <20240612223025.1158537-3-boqun.feng@gmail.com>
 <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
 <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
 <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
 <ZmxUxaIwHWnB42h-@Boquns-Mac-mini.home>
 <c1c45a2e-afdf-40a6-9f44-142752368d5e@proton.me>
 <ZmzvVr7lYfR6Dpca@Boquns-Mac-mini.home>
 <b692945b-8fa4-4918-93f6-783fbcde375c@proton.me>
 <Zm4R0XwTpsASpBhx@Boquns-Mac-mini.home>
 <d67aeb8c-3499-4498-aaf9-4ac459c2f747@proton.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d67aeb8c-3499-4498-aaf9-4ac459c2f747@proton.me>

On Sun, Jun 16, 2024 at 09:46:45AM +0000, Benno Lossin wrote:
[...]
> > To me, it's perfectly fine that Atomic{I32,I64} co-exist with Atomic<T>.
> > What's the downside? A bit specific example would help me understand
> > the real concern here.
> 
> I don't like that, why have two ways of doing the same thing? People
> will be confused whether they should use `AtomicI32` vs `Atomic<i32>`...
> 

BTW, we already have something similar like this in kernel, we have
SpinLock<T> and Lock<T, SpinLockBackend>, how should we do about this?

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
