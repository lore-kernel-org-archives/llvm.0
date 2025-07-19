Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3804B9476
	for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752945030; cv=none; b=GyXporOdgQzaM/7lC1z47iYhyfEskIlHmsA5o5oX9ewz03QPzv4s2/etkFc40vN4sL6IR5vvVqviGX7MqTt8d3/mxnp3pUByO85FZOkDoEtKpjN98HWj6AJEAZX9FTIpggF8survlFdFejgBI77LJ6aIDfWqG/ZoXhh4UO/DAYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752945030; c=relaxed/simple;
	bh=R1SB8UXIkKfKnwFlhylFe9hvYXgDoqCECHtY5u98rZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNF6v3knMrPI8Z7cJ+JsTHfxFq7B5pL+wCtJ+HWSK1O6/suW9DvqgSWpAZj4i2x8BQDEzFOrS11bWj1vAUKCn3N9eVL+Dt1r57M9lqz7rZDyt+3HJMQvJ7Rdx9YbV+v9ZNccPc90quAjbEziO/q+UyHIAWgFxpLz68CFJOBey2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BavXkQRv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BavXkQRv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5769C4CEE3;
	Sat, 19 Jul 2025 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752945029;
	bh=R1SB8UXIkKfKnwFlhylFe9hvYXgDoqCECHtY5u98rZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BavXkQRvW5GJubPNX73bKdUIYysevCy+fh8ReR7Pp8OpTvX1tP6HsvW0G2cc8/3D2
	 v/mdzo1MdCO6EBmD1R023NBbgvq01PPlRxaWmnInPZfTI4vx+gYImdS5iB2UW/vsJe
	 N2PY18kQIHvyuAm4J8wraFyrs1TmrY81R6W+ucm3v23hfVqh0PYSqPCu9OxPN+h59q
	 q5f/D+wm2zNp4xvwhCRlsrUL1NrmGox2zzn1Hmx9GYVWs2X7sjVGZF1YzK3IuuEIeq
	 aLIXYBDj1Aa5x270micx1zrkZjBG+zWNo5eOwkjlWxRGFP74pgv7Bk4/OzEKL+8gA8
	 pkD6qYEXo1HWg==
Date: Sat, 19 Jul 2025 13:10:25 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev
Subject: Re: [LLVM/Clang] Known issues with Linux v6.12.39 and CFI
Message-ID: <20250719171025.GA2048381@ax162>
References: <CA+icZUV_NGd5R3=YdE9zg7HeBK1adhj_j7Kpp5-GhOMJLsXyWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUV_NGd5R3=YdE9zg7HeBK1adhj_j7Kpp5-GhOMJLsXyWw@mail.gmail.com>

On Thu, Jul 17, 2025 at 09:54:24PM +0200, Sedat Dilek wrote:
> Hi LLVM/Clang folks,
> 
> Hope you are well.
> 
> Writing from a Windows host...
> 
> So, Debian/trixie aka version 13 is FROZEN and will be released soon.
> 
> I was using LLVM toolchains from kernel.org - my last Linux-kernel was
> version 6.12.11 compiled with LLVM-19.1.6 released 17-Dec-2024,
> 
> Normally, I use Debian's kernel-config - modified to Clang-CFI and
> using mostly ZSTD settings where possible (ZRAM, (de)compress
> initramfs, etc.).
> 
> Are there additional patches necessary - kernel-side - planning with
> v6.12.39 released some hours ago?
> As you can see I did not follow Kernel development for a while - 6 months or so.

As Sami noted, there should be no kCFI regressions from 6.12.11 to
6.12.39. We are not carrying any patches for 6.12 in CI right now, so
everything else should be fine as well but bugs are always welcome.

Cheers,
Nathan
