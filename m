Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFCC3451AB
	for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771443286; cv=none; b=n59rERUUe4cDN6RvXYLxOr9w7Tt/QNa5ak8J8Dj7W857CxNMOuAry1gbDIx7VvpkjvX1kUT/jcYv44K4J+i8lzsajZP0taLQjthYDWNdRZPP3EFQOQ3NqKwyYNa1L1b9URwfEcz54O9DDWeFDj7T0HjMPvsvUO7vAKaGXvNHSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771443286; c=relaxed/simple;
	bh=IG31AiFfOJUmSLuowWqXZKSA/8W07j+Lq5NnL99uB8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nxo+tJJ/ZpuiVAv9b9INuws7CiEQygOY3/CVgdCAwV4sTUASsFeQvk4J8VZFhixj7JfpCzznWjJks8gad9DlUIs9NemCClFlP76qjVVTMokfg+NBTF+yBFmpxmXbdCOZlT69NY7n4JOLgnmv7reQamZh/xi4gfw5/U0enNXmPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7wyd/ey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7wyd/ey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E97C19423;
	Wed, 18 Feb 2026 19:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771443286;
	bh=IG31AiFfOJUmSLuowWqXZKSA/8W07j+Lq5NnL99uB8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7wyd/ey2rAalvxmE041e3AXOiw62JALEwyCCO0BepP0YD5mpKXPR91FZqPzRUiao
	 Gx41laxTi8PtkPX9L8YgaBbBiuHy0djgADSP2ywQ4X4QbEQGUPlDSbHErzX+b1JE08
	 BgeuiFk9JiXLavG0ORKGNsiNtreM0p/2oHq+nhh+2uKt+wr+OBMTdnisqMH6MO5rlX
	 D6OQrvObM+/fAGvqwjzlO6ql4yQw999A7bCwFbhhGv4uoBQpqxTJ+GkUEbJGxyOnl/
	 CLVDxBWJTHpdH1WabqvMoPtCdODdyaxpG2JmO2vsOCyw9XUz87sYawOIXYBjLBK3X/
	 KUwhw8WcMbeUw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3A2FDF4006C;
	Wed, 18 Feb 2026 14:34:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 18 Feb 2026 14:34:44 -0500
X-ME-Sender: <xms:VBSWabUJHK8dHyAhIXPwg5eDXaaguua-NScAB2_pxgEDGjVQtzZVyg>
    <xme:VBSWaR-q9_uMavDPPvIdzhPjUUWsuCTBY5aQuAsqxLRdeKAVq41UD91YmAeYiJZns
    KSIdCCl-Q2-hiV2aLhgAQxFDSJcBQjW081gIP7mhX999RUqHvTVNA>
X-ME-Received: <xmr:VBSWaTYCS_03rd-x1HoflHhVCJtI14EZ2BwZYl5--115uM6_FUdvWiLivrOpU8oRWUhgZMMtuZKzD-1Ui1KpwqgxPDVUxU_S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdefgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    efhefgffelkefhheeifeeggefhgeeuieevueegfeeugfeuffeludeuhefhleeggeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthho
    rhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    gurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomhdprhgtphhtthho
    pegvlhhvvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigse
    hlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:VBSWaZcLENvDLqm_2hJn0V7OUA0gz_Z-1GPA_eqQLgXP3whZniAB4g>
    <xmx:VBSWadq6PFsAAe0StSnSlkSlpTB743dcysE__bTBhfRH2p9XIFD9fg>
    <xmx:VBSWaQAfwn9YlJgs0mk80JzdcG-78IN4xS307UiWo7pKC-wzul8b5A>
    <xmx:VBSWabVAO-Ci5MxtBxXEhjh5vqLZeHqots1U2mxMjnnA_Opbd5HRKA>
    <xmx:VBSWaU7cCvACd46tKHb25Ea1JYK7u1ScdLO_jYXbNQipBrcfU1E0uxLk>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Feb 2026 14:34:43 -0500 (EST)
Date: Wed, 18 Feb 2026 11:34:42 -0800
From: Boqun Feng <boqun@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aZYUUsROBSpoPtav@tardis.local>
References: <20260206182650.6c21b0ff@pumpkin>
 <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin>
 <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin>
 <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin>
 <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
 <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com>

On Tue, Feb 17, 2026 at 08:32:32AM -0800, Linus Torvalds wrote:
> On Tue, 17 Feb 2026 at 08:23, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > But last time I looked at it - which was admittedly a few years ago -
> > the compilers we supported didn't actually do anything reasonable here
> > (ie the built-in atomics were fundamentally worse than the ones we do
> > by hand, and even basic things like __atomic_load_n() weren't
> > actually; better than just using 'volatile'.
> >
> > Maybe that has changed. We've upgraded minimum compilers since.
> 
> I  just checked a few test-cases, and I don't think anything has changed.
> 
> All the trivial things where __atomic_load_n(__ATOMIC_RELAXED) *could*
> do better than just our old code using "cast pointer to volatile"
> resulted in no better code generation.
> 

By any chance, could you share the test cases? It'll be really helpful
to represent what semantics we really want to compiler/language folks.

[Cc Alice and Gary]

Regards,
Boqun

> So we're sticking to that "cast to volatile" not because it's great,
> but because it continues to be reliable and no worse than the fancy
> modern versions.
> 
> But at least it's explicit in the code, not hidden away in code that
> *looks* like it just dereferences another field in a structure.
> 
>                Linus
