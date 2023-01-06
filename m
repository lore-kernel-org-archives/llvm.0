Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8D11863;
	Fri,  6 Jan 2023 23:58:16 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9C1991EC04E2;
	Sat,  7 Jan 2023 00:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1673049484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=N1uU3JL/AsQjSJUQMe3X4Bn6CDUQwr8KVnWN9T4MLD0=;
	b=HFiFHjDg7gC2nadwkUOj7Ky7+z+n9LzRZpJpQk4BYBjnFwZRNC+klNuXT8mHTwqJuGgbrm
	WgxOZWqO3nMtEb1DmBqiGxsc0lLRKnfV6CCF34W6BVHXcjUU5QNR7+7vSQu+DX4kFQ+u3+
	ZLOBHUoEUYxQARClJf9LPWuymxkJd14=
Date: Sat, 7 Jan 2023 00:57:59 +0100
From: Borislav Petkov <bp@alien8.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [bp:tip-x86-alternatives 1/1] error[E0588]: packed type cannot
 transitively contain a `#[repr(align)]` type
Message-ID: <Y7i1h3lCMKfxB532@zn.tnic>
References: <202212272003.rgQDX8DQ-lkp@intel.com>
 <Y6r4mXz5NS0+HVXo@zn.tnic>
 <CANiq72kc60aPcx5LwFhOGL4AXOhZsZj32iOg75K5ZxLaaRaYkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72kc60aPcx5LwFhOGL4AXOhZsZj32iOg75K5ZxLaaRaYkg@mail.gmail.com>

On Sat, Jan 07, 2023 at 12:25:17AM +0100, Miguel Ojeda wrote:
> Yeah, note the x86_64-rhel-8.3-rust config name. It is a config the
> kernel test robot added for testing with Rust enabled (which explains
> the version text you saw for `rustc`).

I figured as much.

As I said:

"These reproduction instructions look insufficient to me."

> The script is meant to be called as a Make target, e.g. `make LLVM=1
> rustavailable`. Perhaps we can put a message if the script was called
> directly.

No need - I ran it by hand just to show that I don't have a rust compiler
installed.

Bottom line is: if I get a build report involving a rust compiler, there better
be in the reproduction instructions a hint how to install one so that I can
reproduce. Alternatively, I can always simply ignore it.

And while we're reporting bugs: the error message from the compiler itself could
use some "humanization" - I have zero clue what it is trying to tell me.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
