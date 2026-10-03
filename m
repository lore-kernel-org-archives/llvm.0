Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7A945D1A8
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791043396; cv=none; b=lCRjJEapaTjBqV271TQzSBQVAeKFCCTQps8CYzZ794gnVD5I0GjvKVvmxp9u24giyVY/QDPNPof584mMSdcl7z0kzyBiSczijTS1O9nSEkLUDqb8R2QRWK0gVwcw3GGnd7E82pplc5eig12ZMKXh3BD0W746E1qjeSDGS2t0m6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791043396; c=relaxed/simple;
	bh=raScNH55YyHKO9o6R9zNWW+p8fAddrS2wh/1QF52HVQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tEL0fkfMGbUO5GjjxstNKf5vA+p/aoNqD7r6BRBv9VwmTnfa6ROO1D1gvUXeV96LL12XrmIjsc8EYEe/9e4yWV7VGPYvKptKwcyC8LN0mPgvvyfUIm+LCCBjlUcUB2YBMF2usuyrZ3HIQE5goNl1pQIG56KrTlxUVNiE4U6hZqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.helo=mail.mainlining.org; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.helo=mail.mainlining.org
Date: Sat, 03 Oct 2026 17:03:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>
CC: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?ISO-8859-1?Q?Onur_=D6zkan?= <work@onurozkan.dev>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: rust: Enable Rust support for ARMv5TE
In-Reply-To: <20261003093827.77857-1-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
Message-ID: <E4C8623E-CCCA-408F-A03E-1B2C7DFD0D75@mainlining.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 3 October 2026 10:38:25 BST, Karl Mehltretter <kmehltretter@gmail.com>
wrote:
>Rust is currently limited to ARMv7 on 32-bit ARM. This series extends
>it to ARMv5TE.
>
>Linus Walleij asked for older ARM cores during review of the ARMv7
>support [1]. Christian Schrefl tried ARMv5 with the armv5te-none-eabi
>target at the time [2]. He hit missing core atomics, missing
>__aeabi_mem* symbols and a floating-point helper reached from
>pr_info!() formatting. None of these show up anymore. The kernel crate
>now implements atomics through the C helpers, and the
>armv5te-unknown-linux-gnueabi target used here keeps the Linux EABI.
>
>The only remaining problem was a link error. Pre-ARMv6 __arch_xchg()
>has no 2-byte case, which the Rust Atomic<i16> helpers need. Patch 1
>adds it the way the other pre-ARMv6 atomics work, with interrupts
>disabled. Patch 2 enables Rust for ARMv5TE.
>
>Bradley Morgan's two-byte cmpxchg() emulation series [3] does not
>overlap with this. Its ARMv6 part was dropped in v2 and it never
>covered xchg() or pre-ARMv6.

On purpose! It'll be dead code after one of ards changes

>
>Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2.
>
>- QEMU versatilepb (ARM926EJ-S). The Rust samples, all Rust KUnit
>  suites and 355 doctests pass.
>- Microchip SAM9X75 Curiosity board (ARM926EJ-S), at91_dt_defconfig
>  without the ARMv4T AT91RM9200. The samples, all Rust KUnit suites and
>  356 doctests pass. The Rust sample modules (rust_minimal, rust_print,
>  rust_misc_device, rust_driver_faux) load and unload cleanly.
>- Build test with every Rust driver, abstraction and sample that can be
>  selected on ARMv5TE (rnull, binder, the two PHY drivers, cpufreq-dt,
>  the DRM panic QR code). PWM_TH1520 is the exception. It uses a native
>  u64 division, which does not link on 32-bit ARM.
>
>As a further test I ported the Atmel PWM driver to Rust and ran it next
>to the C driver on the SAM9X75 board. The port is not part of this
>series. The comparison found a prescaler bug in the C driver for
>periods of 2^32 clock cycles or more [4].
>
>I plan to get a Raspberry Pi 1 Model B+ and then add ARMv6K support as
>a separate patch.
>
>The ARMv7 enablement went in through Russell's patch system as
>"ARM: 9441/1". Unless someone prefers another route I would submit
>this series there after review.
>
>[1]
>https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
>[2]
>https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
>[3]
>https://lore.kernel.org/lkml/20260922173354.14404-1-brads@mainlining.org/
>[4]
>https://lore.kernel.org/linux-pwm/20261003083036.21584-1-kmehltretter@gmail.com/
>
>Karl Mehltretter (2):
>  ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
>  ARM: rust: Enable Rust support for ARMv5TE
>
> Documentation/rust/arch-support.rst |  2 +-
> arch/arm/Kconfig                    |  2 +-
> arch/arm/Makefile                   |  4 ++++
> arch/arm/include/asm/cmpxchg.h      | 14 +++++++++++---
> 4 files changed, 17 insertions(+), 5 deletions(-)
>
>
>base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
