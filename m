Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299422FE06
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206510; cv=none; b=b7Q4jFire3+NeikAa6vjfbYqv968X/h+b5lzyA7qjb9yL6wLwBsiypdRRIhTafDN7Ht1NTLMqSBsUZZHxBzMStWbLn9ws89Z/eBeQmIGY3kjIu6ndiIYFbLV/BFJQXGBntkHw5ATPKhSzMAI1iuK2vnSQu+QHbamfkAfi0OKNdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206510; c=relaxed/simple;
	bh=6lX6qd6cHpyeXJtN8CbDJig30k7qEU+St8Ur0Q+BBN4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSl+KDP1I+z9pGOiJ+8N83lTX/VBzA2fUCSg51wP7XL9gVkEuwlu6g4fgZ9KAgyOBaleZIv9Fcbhgp8KRFn7Q23Irq11j+M76iC3OG4pKk64OaQNcjXqNKcuKiZKDyQF4/LPoN5Y77wsH4lxv4Q3ZSZvDXgf7Sv7nirycBWwwkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=eEMVrUb2; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="eEMVrUb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7dlnzbwkrbdztmvpnxie6e4fom.protonmail; t=1742206500; x=1742465700;
	bh=IpqGC6kjpj6asVKqkNZWmw1IDhP0itPNVW7PmK6LSVA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=eEMVrUb2yhzEWNshPrV4mjw/plLWFOaMJtj9b1jMtF7zOGpkqezMj8q9rgOtl29w4
	 zKN3N8Eman9k8RvFBma/jF7r4AqLHf/U6OnCV+xS7qxMon4ZOrlqdfWfG5FDxFtA+9
	 gliew1Q5l1GwV8JVucZO1/LEk8Z543Hd85//JH/FQ7GySdVeu+DqYf1IImS/dKY/hK
	 u8hYrOFhAXE8AIPL5cHSqT8cW3ypuX2d3HSnqQi1/UeyTaJs0Jl9n6O3SZ0sOBfo4B
	 DIXezs+bH97aRUiFPBSRn4Iy1Q+16BQpkTbKXLBJibg+9FjVjCGKg6E7JFNvdc9BUJ
	 kvqnRhaHMDgxQ==
Date: Mon, 17 Mar 2025 10:14:54 +0000
To: Kunwu Chan <kunwu.chan@linux.dev>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, Grace Deng <Grace.Deng006@Gmail.com>
Subject: Re: [PATCH v2] rust: optimize rust symbol generation for SeqFile
Message-ID: <D8IGNMOL2WPU.P9UB057VLDV3@proton.me>
In-Reply-To: <20250317030418.2371265-1-kunwu.chan@linux.dev>
References: <20250317030418.2371265-1-kunwu.chan@linux.dev>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 27001cdd7b13d5926d7c25cd21d0175d031e299d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 17, 2025 at 4:04 AM CET, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*SeqFile | rustfilt
> ffff8000805b78ac T <kernel::seq_file::SeqFile>::call_printf
>
> This Rust symbol is trivial wrappers around the C functions seq_printf.
> It doesn't make sense to go through a trivial wrapper for its functions,
> so mark it inline.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
> Changes in v2:
>  - Add link and Suggested-by
>  - Reword commit msg
> ---
>  rust/kernel/seq_file.rs | 1 +
>  1 file changed, 1 insertion(+)

