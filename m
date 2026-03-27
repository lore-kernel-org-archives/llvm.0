Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF2322DAF;
	Fri, 27 Mar 2026 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774599680; cv=none; b=ijDGf+g0cvvx3dAdsl2a9QXWwHa+f5iynj0MwQ+TiIYUwBBiWqJSBHj8DMepVAim2b1FP86k4fPJ6GLOrl7rSoFklJeEEiYsmYJrnbBOhDBSnjFII6MWdOCH4ODz/2Lpt0W4VrFWxJr87MH/zika+t1cOq/dOSHoGxTY/+OXa0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774599680; c=relaxed/simple;
	bh=Vn5F78ip/X64SqJwzuFmEuGT3eHZ3TyVB/hj5cJy9/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jtfcin+kU5712VqpVclVq2CBS3VVtxVLAfAINzJip2LSySI+zK5G1Ofq6gbzNnFFPXorVU9WWHZKqgHbt9V+9QziaBAopXzeO2IVtNG0AiFq9RgJ2rGl+nzCTb9wtS88+/2MSZ1vlJp7ZTwYzKZSchqzIm+JdM2ByehxC/oT9d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sorm3rRN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sorm3rRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08347C19423;
	Fri, 27 Mar 2026 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774599678;
	bh=Vn5F78ip/X64SqJwzuFmEuGT3eHZ3TyVB/hj5cJy9/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sorm3rRNaRNDfAjT4J9hR/IWzCxlACPy0pbXyhcARMkL9jT57MW46Ez5FfAN0P5Pz
	 FbcnahzNwio7jIPutZZrB08Nn8TLOVqY09xba67/xAfYSbFVhw+4G5zmfg3OhGwPCs
	 Z428HSylHslVB/N8MedJn1Hmofz7koYmtkijwPTuDwjahVb9n1cHw3TpREh/Wq0LGW
	 JRq5+v/XzmujthnkmNRFarReqqzWXYWl+mBtGtJaE90VHgcXoTd/8NJ6Z91s4WtFnN
	 4lMOSYL+sDJk2Ssf2x4t3EvRCZwWaPuKyqsNGa1ViO9fJlikKFs8fkD/sD2qkkfX5l
	 iWWgFyLvMwGIQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 6/8] rust: io: add `read_val` and `write_val` function
 on I/O view
In-Reply-To: <20260323153807.1360705-7-gary@kernel.org>
References: <20260323153807.1360705-1-gary@kernel.org>
 <x9CNNH_pSn2n9-PCo7dX7L8m_TykniwA_-YZSe604nqWvAJAKe534_yo9gacCO-pD833mKwNx42DshdzaPgehQ==@protonmail.internalid>
 <20260323153807.1360705-7-gary@kernel.org>
Date: Fri, 27 Mar 2026 09:21:09 +0100
Message-ID: <877bqxy96y.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@kernel.org> writes:

> From: Gary Guo <gary@garyguo.net>
>
> When a view is narrowed to just a primitive, these functions provide a way
> to access them using the `IoCapable` trait. This is used to provide
> `io_read!` and `io_write!` macros, which are generalized version of current
> `dma_read!` and `dma_write!` macro (that works on `Coherent` only, but not
> subview of them, or other I/O backends).
>
> For DMA coherent objects, `IoCapable` is only implemented for atomically
> accessible primitives; this is because `read_volatile`/`write_volatile` can
> behave undesirably for aggregates; LLVM may turn them to multiple
> instructions to access parts and assemble, or could combine them to a
> single instruction.
>
> The ability to read/write aggregates (when atomicity is of no concern),
> could be implemented with copying primitives (e.g. memcpy_{from,to}io) in
> the future.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/dma.rs | 40 +++++++++++++++++++
>  rust/kernel/io.rs  | 95 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index ae2939abc166..fcdf85f5ed50 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -877,6 +877,46 @@ fn as_ptr(&self) -> *mut Self::Type {
>      }
>  }
>
> +/// Implements [`IoCapable`] on `Coherent` for `$ty` using `read_volatile` and `write_volatile`.
> +macro_rules! impl_coherent_io_capable {
> +    ($(#[$attr:meta])* $ty:ty) => {
> +        $(#[$attr])*
> +        impl<T: ?Sized + KnownSize> IoCapable<$ty> for Coherent<T> {
> +            #[inline]
> +            unsafe fn io_read(&self, address: *mut $ty) -> $ty {
> +                // SAFETY:
> +                // - By the safety precondition, the address is within bounds of the allocation and
> +                //   aligned.
> +                // - Using read_volatile() here so that race with hardware is well-defined.
> +                // - Using read_volatile() here is not sound if it races with other CPU per Rust
> +                //   rules, but this is allowed per LKMM.

You are not covering how we satisfy "Reading from src must produce a
properly initialized value of type T." I assume you need a bound on `T: FromBytes`?


Best regards,
Andreas Hindborg


