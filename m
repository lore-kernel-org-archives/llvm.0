Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497124A2627;
	Wed, 16 Sep 2026 22:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599433; cv=none; b=gA5/m+ORHjnggiGiO2ml1wDAnHWodguT5bxeZnOuLfHZ8/CR3LYBWB6FYFF6KJeRfh3ItGQkRAs0nMSuMg6zMe4wDdGodeDzRUj97NlP6TQGw/lz9rIx8g3cskL1xe1Y0wtooGsfiSDkNBE+D6vbiBNcBt1y7q5k2ukFINXka9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599433; c=relaxed/simple;
	bh=py8ooCkYDKzECb646Je5yuc6IenL4VGdBpDSx+JTSVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aehmvCD0omGkQVg/9YpDqg8UO6D/bHEn/PPFs+HkzNehXG4BwCqlhoHe3GBFZ6h7GmkAiM+/HtmhR5tjXyUimnrCsSvr5HVcYiQGRtmT1iMt1iy+cr02OQZM4Nzz0CqrFOiLY1Dva6hxcMGgTG/2foBojcXJmeXj5OoktKG4+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqU3VIbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqU3VIbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9616B1F000FF;
	Wed, 16 Sep 2026 22:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789599425;
	bh=PG1Cc4kb4r1rV5EvtqYvbUVOtRkSG7c5OffR+4dVeCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lqU3VIbt+cRsZC9jV7X5yvTiWVUbaHe5Q8zHEfEk2/gP6uZZ4UD38uXgZEaNF9MCg
	 3QSYMnXau4Zyq1BDg6ZVshGgEohec1lHGZcIGi8vEUR4rzCR6WYly5IpFcy+VAs94+
	 6J+8MJG1FpiFyUx7A+P6ehXZJpsI2lk5hAqDK4+R22uOEoGxWw5vQKGnFF1t9TbT/+
	 r2ljaGBHO/serEedW2vzx7HhQDwZthrq0Np+jRJJEVJ4rcRSUBrP8tLluNvkkvHvBI
	 uDyuYf0bfaqTrMDNqdmvpfQ4fyCXyu/JjfSUT2tKhw93uxuGrmfaq3WFIInKCX8Jpj
	 jJ26h2dbV8J7w==
Date: Wed, 16 Sep 2026 15:57:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260916225700.GA4107307@ax162>
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <CAKwvOdmnfkra0N34v5w8qh+8bb4X5AxLTtOULu46S8q9KCvzMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmnfkra0N34v5w8qh+8bb4X5AxLTtOULu46S8q9KCvzMQ@mail.gmail.com>

On Wed, Sep 16, 2026 at 03:08:38PM -0700, Nick Desaulniers wrote:
> Link: https://github.com/ClangBuiltLinux/linux/issues/2183

Whoops :/ thanks for including this

> Do we need to tag stable (I imagine this might be visible for older
> kernels with newer llvm)?

Yeah, we probably do, as I expect this error to happen with 6.16+ due to
commit ee0d03053e70 ("RISC-V: vDSO: Wire up getrandom() vDSO
implementation").

I will include those in v2 once the maintainers have had some time to
chime in to make sure this approach is okay.

> Any idea why we only see this for riscv?  Would think loop idiom
> recognition would make this transform for any target.

I have not confirmed this but based on looking at the aarch64
disassembly when deciding how to tackle this, I suspect some backends
can expand certain calls to memset() to a set of instructions, as I saw
a set of stp calls with xzr as the source and offsets into params as the
dest.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for taking a look!

-- 
Cheers,
Nathan
