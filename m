Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED5C2F4A0C;
	Thu,  5 Feb 2026 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770321751; cv=none; b=i4zSWbR6zUNt/BXftMHX69zyVjh1A676MeAW5ryr2J+o/ynILqkR5Dlr977Ghwj6X8wSC4j+Unt+uX2PXSfoqRjztvgxcvGdu4an5wX3RI62eZpM2SXde/bhlgbknmRWVZGZVjSAdPpOVCAEjRCDM7GWiwqjjQs7C1eZL/znhxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770321751; c=relaxed/simple;
	bh=SFGAh9JJzYHViSrH+N5Q4JCcy+AltvYYtmD2XxefkXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhycFS6WcnFv47isTpU241WGBsWyK7Xrkm8klHkhhuNGt1y8m5EzrJ6A8YEQQXZgsmSZzHn748JBKJljDeoRPm8xDrp9eIkFqJQca/fw+H4IRzne1/qfXWOBnyVSzlSm9hfVvJCMRWwzxf2VeyPExey8b1yt9GIhpDZFhejiPcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK/Rgv0W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK/Rgv0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1987AC4CEF7;
	Thu,  5 Feb 2026 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770321750;
	bh=SFGAh9JJzYHViSrH+N5Q4JCcy+AltvYYtmD2XxefkXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WK/Rgv0WoN69gXl/scqZ7qkgu6PdyplCxPfXa+i3e7YHDx+PkO8ZL86NwJfvjJr0E
	 HIDg+Nt874Yw4XyK+b4w2qGGhHvGVAmCAxrMtHcPzC+XjzYp3IhuGLMjElm+jNc1AX
	 aZI6l0HE+Oje1bzOFYJLXRbWL8PkHCpj2tJypG6ZpPkfZ5xlUaSP6OaNMAB3wZPYqa
	 KUkvwaCRDgiuoVFtrAQVUDAOS6XtZ/NqpeeOQ7fwqSRzUdFgyOlOczAOGMFVJTZcri
	 ZsT0SFt5I2RJLHjBe22NpcgwUXYel3f7RhICE0EyG+tOJTtyIT+ajPMw4DXlxUFC3W
	 PpmUzAX2rnMJg==
Date: Thu, 5 Feb 2026 13:02:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Jubilee Young <workingjubilee@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <20260205200222.GA1298159@ax162>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
 <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com>

On Thu, Feb 05, 2026 at 08:34:27PM +0100, Miguel Ojeda wrote:
> On Thu, Feb 5, 2026 at 6:29 PM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > use rust version nightly-2026-01-28
> >
> > the latest one has some issue. I just raised a bug for the rustc
> > here[1].
> >
> > [1] https://github.com/rust-lang/rust/issues/152177
> 
> It appears to be a bug in LLVM 22 for ppc64, not present in 21.
> 
> If I understand correctly, then it may be fixed in 22.1.9 if it gets released.
> 
> Thanks Jubilee for the quick reply there!
> 
> Cc'ing Clang/LLVM build support, in case they didn't hear about it.

Thanks for the CC, I had not seen that issue. LLVM 22 is currently in
the -rc phase and I see that the fix has been merged into the
release/22.x branch as of yesterday so it should be in LLVM 21.1.0-rc3
when it get released on February 10. LLVM 21.1.8 was the last release of
the 21.x series (hard to keep up with all the numbers...) and it sounds
like this is only a regression from the LLVM 22 development cycle.

Cheers,
Nathan
