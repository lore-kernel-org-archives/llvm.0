Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4061C3D4126;
	Wed, 25 Mar 2026 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447455; cv=none; b=hG6RueixC9HlUkt9qPmH20oiEQBy+xU9Z8F7jm3drZGv8KxmtfyWDYxg5aYcJ8nkO6aKTX2HS+sRjIRGnv5ANgFFDjOY2VLtZ6dD4Si7OPsnJ2x/ouV4YDp+V/SRV6Aw3LuIpGgAx1LzgZuR3S7rHfBOS+E5YWXDrQhPTL1fqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447455; c=relaxed/simple;
	bh=KJQwlcR/AcSyY+ADzwJfyjsxqitEvvW6As2zMtsT50E=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=NEoyssP88Eiv6WYj3+/Ww+g8r6PDELAe0LRMGGbAaUHNHiKsKaCBJZY+Wo4gsYSkW6m7soi75jB/vY9NRsBcylsMPKm/rC2mxIUzTZTsUC8ycGQSTJURVmNT+vkKXgkeIwFTHEpxUz03kKZN81bshmx5gghctvi6CAQi7Z1HnCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7Lpdh5b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7Lpdh5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E15C4CEF7;
	Wed, 25 Mar 2026 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774447454;
	bh=KJQwlcR/AcSyY+ADzwJfyjsxqitEvvW6As2zMtsT50E=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=U7Lpdh5bGP93oRArkXGezXHZD4zZVjx/IFrP3HBGwqdhhJ9ICjposxyb5dWcSTh8d
	 6g09S9rVSnnNXlheES1Z6BcBCdR0yZhyaoH8TYbhRElDhNmqa2/O3UFdVE25/n4hay
	 HZlfXjsclAgy+HMSEckj+U2lkolRYneXu8+Rk4fKjdRcnNSx+kBlInzzts7tEKcB1F
	 pA1j6X8dG5Tk9w1J7T+RVb2ZqYIy/IlbzHdciGPVsnz3bt7hGpVmSfTsU66GjI7lmL
	 15vX3NLBRpQnImlHdNwPH5MvQV3ao6jukUiBYE8BaUAAuGwybe69cOci+fGiVuIFVS
	 FJCJOdicCGkJg==
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 15:04:09 +0100
Message-Id: <DHBX4GM8TBIY.1BPXJPVQAQAKH@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
Cc: "Andrey Ryabinin" <ryabinin.a.a@gmail.com>, "Alexander Potapenko"
 <glider@google.com>, "Andrey Konovalov" <andreyknvl@gmail.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>,
 <rust-for-linux@vger.kernel.org>, <llvm@lists.linux.dev>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
 <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
 <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org> <acPLYM0HtGfW1Q6X@google.com>
In-Reply-To: <acPLYM0HtGfW1Q6X@google.com>

On Wed Mar 25, 2026 at 12:47 PM CET, Alice Ryhl wrote:
> On Wed, Mar 25, 2026 at 12:06:50PM +0100, Danilo Krummrich wrote:
>> On Wed Mar 25, 2026 at 10:26 AM CET, Alice Ryhl wrote:
>> > We do not pass -fsanitize-recover to clang, so for consistency we shou=
ld
>> > not pass -Zsanitizer-recover to rustc. Thus, remove these flags.
>>=20
>> Isn't this because clang forces it regardless? Is this true for rustc as=
 well?
>
> I forgot to mention this in commit, but I'm actually a bit confused
> about the situation here. If clang forces it somehow, how?

I previously had a very brief look at the source code and came across this =
[1],
where

	static const SanitizerMask AlwaysRecoverable =3D SanitizerKind::KernelAddr=
ess |
	                                               SanitizerKind::KernelHWAddr=
ess |
	                                               SanitizerKind::KCFI;

But again, I only had a very brief look and it might well be that I got thi=
s
wrong.

[1] https://github.com/llvm/llvm-project/blob/main/clang/lib/Driver/Sanitiz=
erArgs.cpp#L750

> I don't think rustc does anything like that, but not sure. If it doesn't,=
 but
> clang does, then maybe rustc should too? Depends on how that happens.
>
> Alice

