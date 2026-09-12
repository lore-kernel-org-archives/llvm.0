Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270623F788A
	for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789214381; cv=none; b=M7pid4ZHeKrW350HB3VF2zMB9Lq8pU+J/pbFUBPTAPya3TPVYfRJXZexPE9l3saj8RWw4pKr6JgWjMCP+61AFudFGAP2Buv3Igw6bJxB9DnfbxjUTut3s94AolV50StbDaoOv4zh9jfcW3jxpvG5ZIJyTUYL1rSuls296q+CS2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789214381; c=relaxed/simple;
	bh=G6mmFANjJXAB8RQFP1tL/aszZQhBPwFQSG9j5/5FQWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEzIaSUK/Z9QrQlHqmkhtEoUq1vd5YQ1QIEhI7lNC92bnXs/TR+bsUUJbYS3cTP71dXPD9HSYUsi7JcQTjGkyCdfr8BHX3xMWVsGyshGiFnVRd3sDu8nJdBanOPEHbnnrzHZ2E4YQd2hELafsUEQpw3uK9GN43iu6XtEOenTmp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=droneaud.fr; spf=pass smtp.mailfrom=droneaud.fr; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=droneaud.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=droneaud.fr
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 7C4824281F1
	for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 13:51:13 +0200 (CEST)
Received: from [IPV6:2a01:e0a:125c:c670:72c:339f:43cb:52bb] (unknown [IPv6:2a01:e0a:125c:c670:72c:339f:43cb:52bb])
	(Authenticated sender: ydroneaud@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id E93ED6012F;
	Sat, 12 Sep 2026 13:50:01 +0200 (CEST)
Message-ID: <4e447b33-574e-425e-bc92-2b728128cf18@droneaud.fr>
Date: Sat, 12 Sep 2026 13:50:00 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] modpost: perform srcversion hashing in parallel
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-17-5dc1ac01672d@kernel.org>
Content-Language: fr-FR, en-US, en-GB
From: Yann Droneaud <yann@droneaud.fr>
In-Reply-To: <20260908-build-speedup-v1-17-5dc1ac01672d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 08/09/2026 à 22:55, Lorenzo Stoakes (ARM) a écrit :
> modpost does a lot of single-threaded work hashing files from each object's
> .cmd file.
>
> This makes the build slower than it needs to be, so do this work in
> parallel.


If you're going parallel, it would be nicer to do it under make's 
jobserver supervision.


> This is egregious for allmodconfig builds - for instance x86-64 can end up
> opening 200,000 files individually and hashing them all serially.
>
> Parallelise this operation by maintaining a thread pool for the hashing
> work.
>
> Combined with the per-file hashing commit this cuts modpost's run time
> nearly in half for an allmodconfig build.
>
> Module.symvers and every *.mod.S are byte for byte the same.
>
> modpost is on the serial tail of every allmodconfig build, however
> defconfig does not set CONFIG_MODULE_SRCVERSION_ALL and is unchanged.
>
> Whole build, 128-thread Threadripper 9980X, best of N runs:
>
>                                           before   after     delta
>                                           -------------------------------
>    x86 allmodconfig, touch mm/vma.c, gcc    33.4s    30.2s     -3.2s (-10%)
>    x86 allmodconfig, touch mm/vma.c, clang  31.1s    28.1s     -3.0s (-10%)
>
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>   scripts/mod/Makefile     |  1 +
>   scripts/mod/modpost.c    | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
>   scripts/mod/modpost.h    |  2 ++
>   scripts/mod/sumversion.c |  3 +-
>   4 files changed, 74 insertions(+), 4 deletions(-)
>

Regards.


