Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3AE7083C
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489579; cv=none; b=P0yVpOFKJ6u6tMlY6q2HVyHSmdLpgJz5fwZmAgsneFenpw8KC2W25E9zl/Qsm3pruTzTKOKpicrCN7R1MjUCexWVaK2A+zoo5VcGORtZn5dGONLvOfEsbmclKj4lwp7lMvjinFP8RMdUnhsuGuEV70iFahRj8swumeCpfLlr/OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489579; c=relaxed/simple;
	bh=RK9XuvbxKXQd6RwDsBtTtJfz5zGoTdmIFy8cGrS6qjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8QJj4NHOk9/zmYlQM+b+XRQgpCBFlMztxO5zLyKb67WROYqrSV1lY9G2yLQaoWCsWQpbBlyY/cJbhRCf4NlInJAMiqDeeHhQfcbnRxM/o8qJvcQTU85yWyI2xnan+a1Au4yl1UAvVWRzrRZ1CSU4RxI0/QLifBL9dUhtb00rwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuWtQ9A7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuWtQ9A7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CD7C19421;
	Mon,  6 Apr 2026 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489579;
	bh=RK9XuvbxKXQd6RwDsBtTtJfz5zGoTdmIFy8cGrS6qjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YuWtQ9A7gKWKMBtGw3+XCgsQbhcFAZXOUTfAHFM/lAoT8xqMAwBxSVhbOSDw7jusn
	 Cl5k6VGFAdlJ0TcUgtdVYj/qHp7AnI/2JFwmrrbv9bcyHdABV//ePt02sL6LQlsP8L
	 EDZX8QmpldsfFeTcADzYLilO6PSFxcajryBjf8NCv/W/bl0VT/PSzJEobqvN+lBQ/o
	 RtBQ9x1OI97KROvHAQ1y+J0LxSJtUX9TX+1sfBpA8/CusjWPe+5JtZZjaf5G4/iqLR
	 g/6LdhkXPgxZYATetVl0QpBoDRC20iFPW9wO5vKocNew/8FZk6pHtNnABbytRZN/Hm
	 Yu1sQwpXQ8eNw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id EAF90F40068;
	Mon,  6 Apr 2026 11:32:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 06 Apr 2026 11:32:57 -0400
X-ME-Sender: <xms:KdLTaaQmi1rSBUtA0L4T2l6KtEcgV1N4sGwDhXDxKe6Qt0-nRbcUpg>
    <xme:KdLTaaLgW_CFEwKxYwJEakjOAbap7CUhP71P86zRD9lVPyOQ1sIEzmEGqLZODYk99
    Qzac63jvLIdTBB4oN7ihwDDV_Ko_TssBLTugIDZ9Du6H7Z_2BcjHY8>
X-ME-Received: <xmr:KdLTad_QDiHjMg-rkM7RF-77ULEj0EatZGnEBd-kBg2o50lX4jTCaifU8q3tlbonBW7wxHuc5ArWg2jQRKeZCwbx3GkGi9Tf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddukedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepud
    evteffffdvkeelvedtjeevvdekteetleegkefgjefgjedtteetffegkefhjeehnecuffho
    mhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduieejtdelkeegjeduqddujeejkeehheehvddqsghoqhhunheppehkvghrnh
    gvlhdrohhrghesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhs
    sehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:KdLTaRJt8m0inlq6dRosiRXinifdk9jr9dvcz45L6dJJoTdnNVyKmA>
    <xmx:KdLTacGh-Vrm86xT8NGuyLp7JJBqQBBHHNMtSJzmjWEh2y3aMWWtag>
    <xmx:KdLTaVy4M7MuoljjQ0vc5amrfyifcz9-zuK8gOuHNUH0rTuhvSn-Fw>
    <xmx:KdLTaV6XW-I6k22vP3Qj1Kr9eqLQb61NEgOKk34bdfWrR6BCQVpujg>
    <xmx:KdLTaae2NxBfbTO2yEIeb8TFOMvQIY6brhoSTm5e2CyIYZh_9CRwVjPH>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 11:32:57 -0400 (EDT)
Date: Mon, 6 Apr 2026 08:32:55 -0700
From: Boqun Feng <boqun@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] rust: kernel: update `file_with_nul` comment
Message-ID: <adPSJ3lHAzWFZpbc@tardis.local>
References: <20260406095820.465994-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406095820.465994-1-ojeda@kernel.org>

On Mon, Apr 06, 2026 at 11:58:19AM +0200, Miguel Ojeda wrote:
> `feature(file_with_nul)` [1] has been stabilized in Rust 1.92.0 [2].
> 
> Thus update the comment to keep track of it.
> 
> In addition, this will help to sort new conditionally enabled features
> (i.e. `cfg_attr`) around it appropiately.
> 
> Link: https://github.com/rust-lang/rust/issues/141727 [1]
> Link: https://github.com/rust-lang/rust/pull/145664 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> ---
>  rust/kernel/lib.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b48221a5b4ec..0fa9d820fe7c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -23,7 +23,7 @@
>  // To be determined.
>  #![feature(used_with_arg)]
>  //
> -// `feature(file_with_nul)` is expected to become stable. Before Rust 1.89.0, it did not exist, so
> +// `feature(file_with_nul)` is stable since Rust 1.92.0. Before Rust 1.89.0, it did not exist, so
>  // enable it conditionally.
>  #![cfg_attr(CONFIG_RUSTC_HAS_FILE_WITH_NUL, feature(file_with_nul))]
>  
> 
> base-commit: 232e79c72f572782434b43d0fc72581271cea7f3
> -- 
> 2.53.0
> 
