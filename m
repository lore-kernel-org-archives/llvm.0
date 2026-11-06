Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000727;
	b=IymdpXlDGs47J0fyLmJpg3sI9lCFtrmRKJdlZtrMtlwO6WMWWgbPoXDkV6jjN65K4ec6
	 WUokL1QZfb8F+9+tFhInyPb8iDzOwcokAcV3HjAT53rNAZI3mLPeu07Jb/0OSlPV+vti5
	 ltZ1304NyQGZQOYmNJFKPzWqz2fnVuvfrqirfSG2JUYmxT7/UAlHPjGbWf6DPdI5L8432
	 nME8NAMFGXS3NEcovEcoaMY8wsaGNiVCddORLqqS3lKBqqaem0keNJkMjpvJ54+bs4RQV
	 1f+U0j16lXpHUlHl0cVgt0Pg/5p30j98hWMGHodp4twtHSQr1d7hp0YbnEYMwC3Q14A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000727;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=y/v6vHoZMsulYl+hiJykQ6oeqPe7EbafphMm7CRCkRg=;
	b=2r1XTR8dMZ+L5Uud94tFTg6NCgYfFh2j6r98jMByQs8xmp0z79IGJVdsanv/JltsWIjj
	 bDy9UGYYv5CMAUzt4N6DIwzBUhESgCnZPgPqcYZJfcMaw/G2IbHGlKJXa4uy7J/JsASbR
	 sU7B6s5si6kSXyap0zdZn1xhMCItManLwY1lHt9TdgqTFXNIN/Sj118fJ+uRQoECzfJSh
	 b0762WMFAX4pzurn6bCowgJveTsxkjmxQ5HgjmGz94DstP1CIhwPREQDQvHrYNWFHBZtH
	 hYoiJ6wvfmwhTktJbjyDdkZvhc2RtvRBGBHs9diTCRMn1lo2a8GyO+IQ679MVzyaGaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2d8VJQ7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097CF606A329;
	Fri,  6 Nov 2026 21:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2d8VJQ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605441F0089F;
	Fri,  6 Nov 2026 21:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794000726;
	bh=y/v6vHoZMsulYl+hiJykQ6oeqPe7EbafphMm7CRCkRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S2d8VJQ7SPc6KCEbjbUV9fbIj5gvca7bGsu5tKRltEl3ZDp/msq5ccwE4/xm3MA21
	 rUDoBPzMhdeNjKBTrv38pyRAl983aQxlFrwVaVeQ9BF+Ajp8gt3ZiV2MlDbUrGlTMZ
	 Ii39aE50lndMFePAUF4IetOVAFP0SIdVWSPm1tTo74jak8QK/YbXShB0g0I2bzRmO8
	 aYejoqimq7GhRjjKqAQpapB3LaeoovBQyCf4iuOriGhMIMB7KxxFp7t4Lllz99q/kM
	 FFceHEAKPuHxO3ct9Sm2FEtXG1VH1D+LPMYZ8I8dkEkbDc7Cz3TA0PntHI+CYjAjoR
	 z6fClOG3FF3Ow==
Date: Fri, 6 Nov 2026 15:32:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Saravana Kannan <saravanak@kernel.org>, llvm@lists.linux.dev,
	devicetree@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] of: reserved_mem: mark the early_memremap() array
 helpers __init
Message-ID: <179400072224.1844309.11382493077872563963.robh@kernel.org>
References: <20261102224528.2495168-1-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102224528.2495168-1-sashal@kernel.org>


On Mon, 02 Nov 2026 17:45:28 -0500, Sasha Levin wrote:
> early_array_map() and early_array_unmap() wrap early_memremap() and
> early_memunmap(), which are __init, but the helpers themselves are only
> static inline. If the compiler decides not to inline them, the out of
> line copy ends up in .text and modpost complains. clang 21 does this for
> a riscv allnoconfig build:
> 
>   WARNING: modpost: vmlinux: section mismatch in reference: early_array_map+0x30 (section: .text) -> early_memremap (section: .init.text)
>   ERROR: modpost: Section mismatches detected.
> 
> Both helpers are only called from fdt_scan_reserved_mem(), which is
> __init, so mark them __init too.
> 
> Fixes: aa05faf81583 ("of: reserved_mem: allocate and map the reserved_mem array early")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> KernelCI's clang-21 riscv builds fail on this once dt/for-next is
> merged, so it will probably show up in tomorrow's linux-next as well.
> 
> Tested with a riscv LLVM=1 allnoconfig build (fails at modpost before,
> links after), plus W=1 builds of of_reserved_mem.o for riscv and arm64
> defconfig with clang, and arm64 defconfig with gcc.
> 
>  drivers/of/of_reserved_mem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

