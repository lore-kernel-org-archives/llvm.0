Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA2C155326;
	Sat, 13 Dec 2025 01:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765590611; cv=none; b=GEy23IdyAi1kzOxRXiUCKFZxO0hWYWgRnlt6AHLXHR5Ojpey8/zhjnc+oq7FnvQsMf+rL/GLOLf3GqUsTVsFO7my6hrRX7TWs276dwVEBs1k14bFzbSNyrwB6oj4s6jTHnBHWm0GQHVrYF6wDHR6ti1iPcA5KkweWQoPBmylb0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765590611; c=relaxed/simple;
	bh=9oz2NbUpkCIfo6RHC26HsocvBxrxsYD2PY+nLG8VDQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfa1Mk1K0q1Z/i6r3RNZpjuzuauTlxtOUwkWDjcBxHkO1fCzYpO1QdG2AXn/CeaMnA4ifGk8cTegrNpUvpF00Xcbg1Ye0zvLIa547ZoUtzcXmjv3Dl+BpFlSgtSyacjTnyR1xdl57ARmik6V9iYR7CT6xxECYWYV4dntRZvO/XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZrYOkg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZrYOkg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BF6C4CEF1;
	Sat, 13 Dec 2025 01:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765590611;
	bh=9oz2NbUpkCIfo6RHC26HsocvBxrxsYD2PY+nLG8VDQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZrYOkg9NsVVtxI4QJM1muthbEzYqbJbgJT3BWOV5hwR8HtaU1zPCFVfnFEh2Gc+f
	 p5DQ21bK8a2SmBYW5QyIxLhbutr+gF16XrBXPtKd7f4cGWear6AkQr96AXVbDhHTd9
	 UsxjH3Dbw88uXfGNzWNuHRO/VtisoiGTSA4SL2wJ/1Yh0/uBISU3O9bnGh+nVKDsjm
	 RTJq2DlhWrYP2s7wxOzY549z26arl6CWshOEiX+iHu2MxV3qpZt2OX7hfVWAGTLnom
	 Nq1y2mZmAQaenM09xi18+Tgr1JRJ0Kf5cyrbgJNjp+FQTP4sfzJCAUJ8zFhObtFQGB
	 S2Gp94eRrEUpQ==
Date: Sat, 13 Dec 2025 10:50:06 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
Message-ID: <20251213015006.GB3115176@ax162>
References: <aSAr-aA2U26lr3iI@google.com>
 <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
 <aSBy3HQ9Z-h2LbB8@google.com>
 <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net>
 <aSB623GKVDR2TBc3@google.com>
 <CANiq72kUk_R0HGbX4eW9iucCXergJqBBeutnh7cb8SNAzGjG+g@mail.gmail.com>
 <aSQ1VNuGHhFXYE2e@google.com>
 <20251124144810.2fb0e99e.gary@garyguo.net>
 <aTtqI7Mu7LYu0fpx@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTtqI7Mu7LYu0fpx@google.com>

On Fri, Dec 12, 2025 at 01:04:35AM +0000, Alice Ryhl wrote:
> I looked through a lot of the cases where BUILD_BUG_ON is used. All of
> them seem to be checking that some constants are equal to something,
> different from something, less than something, etc. It compares #defined
> constants, and stuff like sizeof(struct) and such. But I could not find
> even a single example where BUILD_BUG_ON used for bounds-checking a
> runtime value, which is the use-case I think is problematic.

Right. If BUILD_BUG_ON cannot be elided (i.e., its check is not
proveably false at compile time), there will be a build error.

You can see some of the cases that we had to fix with ClangBuiltLinux
from our issue tracker:

  https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aissue%20__compiletime_assert

Cheers,
Nathan
