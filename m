Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9CC1E3DE7;
	Tue,  7 Jan 2025 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244954; cv=none; b=o0vPv9es3MptQwdIg6Qv5IGOGxlm4QJrZ7Jt/Tek0oqPWl6kNPenDcOlNlzuMa9fPAWgT6hMkrJ3CZ7LLv9Mz7yTXaxMiNN9ZAX3HF3e2bNSPHcZEP6fI3kFrJBF7+GxuLRKOdBEWA2dai5T2aMis8Xj+rSp8VDddUxAM7VePGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244954; c=relaxed/simple;
	bh=kt8kTVh53GL0EVtDdL/LiO9PfUAI+F1mQTgxGJrcRZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKN8XAOUpDa45LDLBlnWXIdutIlvYsq+5ZbbdkhHCiHaV9abVdTepER1TJG1hkKuzIbme7Qa/Df41vn1lRfguypIrn6YBcADi+xAK0N7cGYebmd0GBuBMPMFLeiL5n2/gRevbRfbZsaOHxtIlpjwZTTYTHcN3JXVd59A9ffww/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXtzj4Nd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXtzj4Nd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A6BC4CED6;
	Tue,  7 Jan 2025 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736244953;
	bh=kt8kTVh53GL0EVtDdL/LiO9PfUAI+F1mQTgxGJrcRZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SXtzj4Ndk+cWfddOoP/YcgyIpl+ubCyz/KfvHjtcLGg8TxKAEjBsNxN55P3zzWynN
	 qXzXKjY850YAKqheOsWGWvxFFc9Kqqy8xGpQuQKIfSWO7LICn6hNqhBOduJ3vm5TEf
	 KQTT92D/nV1jfzXbXlM53ooW4wuHk8zAIb+xr3xq8MxGFQU/YkVyUXwGT8vrsrud6P
	 g65IhS+VV4W/K0hEmDdVawY+crs7VpsOAkRwWapqSqwOZcDkWlcu5Qplj8PjlqiNRw
	 abBxYg5veKnoXHHoqksMSahNA5QAzLszY18Fuo53qffe3hIBvIUp72J4CjKpMc3Awz
	 SfGZ5IdV+s0zA==
Date: Tue, 7 Jan 2025 11:15:47 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rust: alloc: make `ReallocFunc::call` inline
Message-ID: <Z3z-0xLgUvPcVTO8@pollux>
References: <20250105194054.545201-1-gary@garyguo.net>
 <20250105194054.545201-4-gary@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105194054.545201-4-gary@garyguo.net>

On Sun, Jan 05, 2025 at 07:40:06PM +0000, Gary Guo wrote:
> This function can be called with different function pointers when
> different allocator (e.g. Kmalloc, Vmalloc, KVmalloc), however since
> this function is not polymorphic, only one instance is generated,
> and function pointers are used. Given that this function is called
> for any Rust-side allocation/deallocation, performance matters a lot,
> so making this function inlineable.
> 
> This is discovered when doing helper inlining work, since it's discovered
> that even with helpers inlined, rust_helper_ symbols are still present
> in final vmlinux binary, and it turns out this function is inhibiting
> the inlining, and introducing indirect function calls.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  rust/kernel/alloc/allocator.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index 439985e29fbc..aa2dfa9dca4c 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -80,6 +80,7 @@ impl ReallocFunc {
>      /// This method has the same guarantees as `Allocator::realloc`. Additionally
>      /// - it accepts any pointer to a valid memory allocation allocated by this function.
>      /// - memory allocated by this function remains valid until it is passed to this function.
> +    #[inline]
>      unsafe fn call(
>          &self,
>          ptr: Option<NonNull<u8>>,
> -- 
> 2.47.0
> 
