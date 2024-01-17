Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3206A208A0
	for <llvm@lists.linux.dev>; Wed, 17 Jan 2024 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500448; cv=none; b=k82Y6eIpfx2xQMDyF+D8nMgkRvrhHG1qOvtsromBxR8OmqogYv0jYDUrwX5bJn64SFrNUWpurwYtrwFM3yBK6FHfC5kyssL1WBZ2iEZ6FZHcyb4mly7q6bFXR6YfNptA88yliAvR4ZjZv3hib7U6Y6nlB4z0n5ow/KqhdQH51Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500448; c=relaxed/simple;
	bh=hzQKlOA37RqNeiwf+rTQ3L7sVhR7KIht5e1fJGRLsO4=;
	h=Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=nWYxL2ECVmQ7e+gxEuln1TdynfGicIkTKLwLjSSh7fKA1QBsiptTmqctsnnTAGeJA4jY19/Hz+q3IjyUbxqXsKOpfcJevsQm5JKqmbgbPu8jrxhQ51qufRyqEPBq58gMXobjnMzPbt8MCwiOAAVYzT0Skz6tYag4NWyj6PrwRaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B01A11FB;
	Wed, 17 Jan 2024 06:08:12 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.37.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B76FB3F5A1;
	Wed, 17 Jan 2024 06:07:24 -0800 (PST)
Date: Wed, 17 Jan 2024 14:07:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev,
	Michael Guralnik <michaelgur@mellanox.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH rdma-next 1/2] arm64/io: add memcpy_toio_64
Message-ID: <ZaffFMJy8cHOvtu8@FVFF77S0Q05N.cambridge.arm.com>
References: <ZW4NAzI_jvwoq8dL@arm.com>
 <20231204182330.GK1493156@nvidia.com>
 <ZW9cF0ALVwgvcQMy@arm.com>
 <20231205175127.GJ2692119@nvidia.com>
 <ZW97VdHYH3HYVyd5@arm.com>
 <20231205195130.GM2692119@nvidia.com>
 <ZXBWXodu2rxQ7Szz@arm.com>
 <20231206125919.GP2692119@nvidia.com>
 <20240116185121.GB980613@nvidia.com>
 <ZafISDVeAA1swx2I@FVFF77S0Q05N.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZafISDVeAA1swx2I@FVFF77S0Q05N.cambridge.arm.com>

On Wed, Jan 17, 2024 at 12:30:00PM +0000, Mark Rutland wrote:
> On Tue, Jan 16, 2024 at 02:51:21PM -0400, Jason Gunthorpe wrote:
> > Hey Catalin,
> > 
> > I'm just revising this and I'm wondering if you know why ARM64 has this:
> > 
> > #define __raw_writeq __raw_writeq
> > static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
> > {
> > 	asm volatile("str %x0, [%1]" : : "rZ" (val), "r" (addr));
> > }
> > 
> > Instead of
> > 
> > #define __raw_writeq __raw_writeq
> > static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
> > {
> > 	asm volatile("str %x0, %1" : : "rZ" (val), "m" (*(volatile u64 *)addr));
> > }
> > 
> > ?? Like x86 has.
> 
> I believe this is for the same reason as doing so in all of our other IO
> accessors.
> 
> We've deliberately ensured that our IO accessors use a single base register
> with no offset as this is the only form that HW can represent in ESR_ELx.ISS.SRT
> when reporting a stage-2 abort, which a hypervisor may use for emulating IO.

FWIW, IIUC the immediate-offset forms *without* writeback can still be reported
usefully in ESR_ELx, so I believe that we could use the "o" constraint for the
__raw_write*() functions, e.g.

static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
{
	asm volatile("str %x0, %1" : : "rZ" (val), "o" (*(volatile u64 *)addr));
}

However, the __raw_read*() functions would still need to use "r" due to
ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE.

Mark.
