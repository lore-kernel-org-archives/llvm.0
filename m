Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32F2F5E
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724176378; cv=none; b=AJyqsEWHcTITjPELGNtjveJqrv8A5Ratl/Be27IQCnglvD7KOqt2gdak32s6Z+MUApaI8l8z5xW2Ti0z9caq3xhxjrPUL0Wveu2m18QSLgUOFKdJ8hSzyocxPitzCcbtEv4Z0MOCHP93NIVlJApCFRJugcsgMihkQFVn3lO/wHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724176378; c=relaxed/simple;
	bh=iAAo5fMg6K+SAUBPBbNUtjGDqd6INwOgww9z6xt2Ojc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDYEZhJznMe1vS1eOzD01rolEvXQ717MOmh/kqIqwVNXZcy6a5l7iETvUQeoK0XK3ikfGCpKq7U/GcKzFsfoKJPMKBgdJwmEP0D9UyvLr65KDBqTUUtE2CsFt4+Y88XxDEf5rsr3TjZwPVrjASEsclvOfGVSPZqI0lWUbv3PBNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io; spf=pass smtp.mailfrom=ryhl.io; dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b=Do/drMqW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aOrQjEVx; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ryhl.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="Do/drMqW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aOrQjEVx"
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7E900114C014;
	Tue, 20 Aug 2024 13:52:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 20 Aug 2024 13:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1724176375;
	 x=1724262775; bh=FmUZfUav3BKMSvLL7a8dJXOXth5me8Z3O4LEP0Z5+eA=; b=
	Do/drMqWrJ59QKiFGgYWGAbMmCDMrFkgTPPllcDJuOAckZgUC3DGkV85JlDgtSqD
	S2BXR5SAm0WGfKrD9d/GMeY+e+EOXtGkfTaz2gYSB8KGWITuLIPoXP2VM8ksgxWP
	bVSMRf5GjnE6EcIay50rXp7dtLe+jZcaLl1xs2VMVdqUbPpSKkmp+BKrDsyIGe7R
	FfnvIkzC7TFW8wW3oRYYFJnBK8Af4fybGL3rTUoXLUXoZ++0JSmUXqTLuO6Q1NYk
	GKmPF8h6y1ZWCuMCO0PA6yGwKWUX06h55KsrvcoWmrPLYbK2RJu8EFBLNpONJDVM
	MPdsaWLcCqO9HfvlyX0cjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724176375; x=
	1724262775; bh=FmUZfUav3BKMSvLL7a8dJXOXth5me8Z3O4LEP0Z5+eA=; b=a
	OrQjEVxi2ATTsRTLRBTsLt79F4GlMAr/Iv9E6aGAU+ZJ2P1JbeGthHB+rG2/3ElC
	6lAKZ0iyA+4D6PkciDCvLzSrLpH3W+JDNDGqYldGWKADMnG+S4QPVy0yLxoCe7cE
	+5GSnCkHq0IlaR1x+Jm2SPbPS5WLSgSjgWCj1obwqZaWBTzbgEaKvlG0XZoxY488
	iGe2HqABjpuSD/GlvHrmZEEnb8tlQbL7Jj6k2HRQW3FYyDcpPmgN2Ndd7TEVTZkO
	HS5VcdAcwz8XOw1m3DzPGhJOuYgze+roHXqkjSNohc5maFAq8gzoWeZDThHFbAkJ
	/SSt0P7AfYY8BWQFjXjwA==
X-ME-Sender: <xms:9tfEZhzAgdAA-bW8OMZtHZKOT6uYZ97YP2IoG5apHHAlOmPwpH6soQ>
    <xme:9tfEZhQQngPNEE1UZkr_bvU6uMaC19-bftzJs4k4jxWO2XZAvGs2sWGHW7N4iHL2c
    IDWDnlSK3ITx18lag>
X-ME-Received: <xmr:9tfEZrUoj67aa7dHtZ0tJAyQuqSAqvZ93Xw5zHPndRE4o1a3_IiC2Dk-W1o48P1PL-m-asXqqhG8Cqur2XntRGFg_MdVAfTV9zXE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduiedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddv
    jeenucfhrhhomheptehlihgtvgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqne
    cuggftrfgrthhtvghrnhepfefguefgtdeghfeuieduffejhfevueehueehkedvteefgfeh
    hedtffdutdfgudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihgtvgesrhihhhhlrdhiohdpnhgspghrtghpthhtohepvdefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehmmhgruhhrvghrsehgohhoghhlvgdrtghomh
    dprhgtphhtthhopeguvhihuhhkohhvsehgohhoghhlvgdrtghomhdprhgtphhtthhopeho
    jhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvhihknhhvlhesgh
    hmrghilhdrtghomhdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepfigvughsohhnrghfsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhl
    sehgohhoghhlvgdrtghomhdprhgtphhtthhopehsrghmihhtohhlvhgrnhgvnhesghhooh
    hglhgvrdgtohhm
X-ME-Proxy: <xmx:99fEZjhfRrMqzgkpGd9hhUi7E9B-_0S8w5Zx2DFug1oFHIlFul4rJg>
    <xmx:99fEZjCfZiKxTy6ZTfFJxK-Om95jjUtrg4SIauFtB4BIVQutbLQ4Hw>
    <xmx:99fEZsKD3bnRmfxVFCGM2QoXZ72QrntbQzcZk2rJWnhEpTd9YP2cWA>
    <xmx:99fEZiD3Jk0jhuFSUCEfrxHqawpqzlOPqsF9hBkDnuXzsWPUVziJMQ>
    <xmx:99fEZgyaMNvkyoMedsJClIsMceGU0erYbuZdmiGZvxuDXDUaxjuzLxKz>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Aug 2024 13:52:50 -0400 (EDT)
Message-ID: <d1e5e8e4-3d54-45d9-aae5-183a5642e0dc@ryhl.io>
Date: Tue, 20 Aug 2024 19:55:41 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Rust KASAN Support
To: Matthew Maurer <mmaurer@google.com>, dvyukov@google.com,
 ojeda@kernel.org, andreyknvl@gmail.com, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20240819213534.4080408-1-mmaurer@google.com>
Content-Language: en-US, da
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <20240819213534.4080408-1-mmaurer@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 11:35 PM, Matthew Maurer wrote:
> The notable piece of feedback I have not followed is in the renaming of
> kasan_test.c to kasan_test_c.c - this was done in order to allow the
> module to be named kasan_test but consist of two .o files. The other
> options I see are renaming the test suite or creating a separate Rust
> test suite, but both of those seemed more invasive than the rename. Let
> me know if you have another approach you'd prefer there.

If you're sending another version anyway, then it would make sense to 
mention why the file is renamed in the commit message of that patch.

Alice
