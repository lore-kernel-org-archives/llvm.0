Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3431A3CA488;
	Wed, 25 Mar 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436956; cv=none; b=nEfIqEuVZ68SqXncOsAtriUetDC3MOMsYXIZC+NKmZ7ZXalM8cPpHaxOVHeWrCFWQxjVRBOjvnlJ7HI51nGJbSFIFDHjdd3sPivszh8dHA4o9xye7gb3nJCP0A/T5LCrLLDNVNhwjTMGz72uTMJ2OU5dF+6jB8rtHCuvMZ8CA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436956; c=relaxed/simple;
	bh=mNX55ZyxEMJQS2TuZj43CChmRdvT5RMKVgLWbx9Z/gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuJqsql/nhriB/9U5YG+Fuco4LsuoJH4+3hMwRDXn80rmgWJOL16snHTccsoJ8ABgNWjSyrtgEzEy6XV6pPjJz8D9woS/xiox2yymUO1vztGiskkr0tsQe6yvv2jnB4jgQerNysKkDpjmdl7WRNUjOX1x9xyU7c9frSxoXufWWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkUg02q3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkUg02q3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8089C4CEF7;
	Wed, 25 Mar 2026 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774436955;
	bh=mNX55ZyxEMJQS2TuZj43CChmRdvT5RMKVgLWbx9Z/gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lkUg02q3+rHOGsaJ2+Y6SJVW1fUV22VHAR1/tMTquamKnOipfWRLVr1+qm6Q5nD27
	 FK6L7OI9IK5WFsFkP1b6P7DiTLrGKzHTtgY2u0xUW2uwz/xsgaGD3Cv9wLxrfZ6nQf
	 H2ncHwTJLOWVZdugsLsnobAI4tOTP6hbYNLZzTnBbaRLrNQXPZm5RWoJ2fP80ePGIa
	 sWDl+rjXAbC4FaWFtJK9rVILUJGbgk1oF8rOGLzdMy+UW4UBcOCxmAkwLXizbHwNVb
	 1fFf+UdRD2VR2gCzZVsgKQF26o3WWE2y63OYTXDEVDWz14+yztzSiMpQNda+W5pHAk
	 ZdyCkp9gtmXsQ==
Message-ID: <65f74ed7-8e08-4637-b309-3b189a8076b4@kernel.org>
Date: Wed, 25 Mar 2026 12:09:09 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: kasan: add support for Software Tag-Based KASAN
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
 <20260325-kasan-rust-sw-tags-v1-2-7d3a765a72aa@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260325-kasan-rust-sw-tags-v1-2-7d3a765a72aa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/26 10:26 AM, Alice Ryhl wrote:
> This adds support for Software Tag-Based KASAN (KASAN_SW_TAGS) when
> CONFIG_RUST is enabled. This requires that rustc includes support for
> the kernel-hwaddress sanitizer, which is available since 1.96.0 [1].
> 
> Link: https://github.com/rust-lang/rust/pull/153049 [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
