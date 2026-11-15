Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757991;
	b=gH1GBdS1Slyfy1+22NrHQ7gKXnC+TPSUL9wL1XVwZC/DL3GS9XW69m+PM87jhlWijFJK
	 y9qlVDmc5IM9jk2mvIbO5LGLA8SfyNFMi6sdgZzpp4cHt0PLXPHsOpkhXnmMJN3rqx3Um
	 ybqZsQlO5vhCnASWLiNXyIqB+qMWHhU/HGb81ZAhTESeLnRqLnuOl9Kkkak8ru1zxwYTD
	 4LGLQwzAyTU076sk8NRpHh5h9juq31xiLhzfkArqQZvEv8r5XvYvlhe9XQF90mzCBFyUx
	 Ga8+j6DYSBno9mESE3v41RcqkKr2g1KPzm2ZVDqe3JyTtc5MTaFjNXqD0MQGNgGeofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757991;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=br1F6rx2z239r/9xCTQgT7hTSXdQ1STMvzPD8aikQWs=;
	b=yVT7qk1FthUyAAbEeLx0ZAYfMpSA3FdKxVn7/sbDXOz1FDwl3f8l8eFlVWc0vN8F400q
	 QaN+oryeIasZTQBOCQDK4IweG0b7P5oOQ8iHoN/bouET0anEIjxAUADTO+pdZZdhaAfdY
	 oxbsf6gSG7WBjFDtA4Bzkk9bXrkWi4wgEuqClGW/3VjG8SOfpWkBpT54xUxktvOa4nbyM
	 MEQbFctidXY9XveEqm721CWvqKSa2VkYIfc4w/CMWWPM8cR9MX/Z5gIKKpUG6nzqXRj/n
	 5zsw+C1JuDbFGkr0UMVGSxXHh/ABtTIwdeT76ofZUuDmXSXwnDyCOceIw7Jt5qw4xEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KrFT9Mhz;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E6606A31F
	for <llvm@lists.linux.dev>; Sun, 15 Nov 2026 15:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65E6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KrFT9Mhz
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 89CCB40E01F4;
	Sun, 15 Nov 2026 15:53:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TvAwHo6x9pPC; Sun, 15 Nov 2026 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794757979; bh=br1F6rx2z239r/9xCTQgT7hTSXdQ1STMvzPD8aikQWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrFT9MhzFLLDqOxM2wzt59BT3y58CHCiRcWr7hmsUQ+Bx2E5xNr1XiKejqJRIH2+B
	 8US7qzAyJGcmksh+zbUGIorcQx8uBVDt8gLTuPId2CxDuIqaomfPZbjOIFLs1Y74lN
	 di4+DgCwFvDWydLV0vG6+l5WSS1B+7GvIeO139mZls5yUsl4SgiRzwpV/v5YZBxsUm
	 DY9By72tWc+rm1+9woElIRKVZULwZd97HROlhedNvmzjeau8Aksh4F+Lf1E+/qQLgb
	 60BW0Bz/P238gHPhLKYFqwyZ5KX7eiwIwI2p7gi95Tn0O9Dj8PBBjoHW261QoA9EDS
	 CujsvfTllPvt7UPCwh1WJM/fsMB2O2sPyQKx49sfmFmBs99iIp38kg8L1b8EbaHLa1
	 Aowb0QEVB3kuou/37Je0A0GtmBSrQZ3sAHCKsVyRaQRErYl0V46CBTE5EgWdODtn3g
	 10xTEqEHJK6RPYWZC6Dz5AgVLj96PKJZ6ePdDWmlkIm/+2GA+aELJ9rX0+jFOnU+D1
	 q4ilqqLrXrcZbLo16x5lK4z29DljODIMSldXtrG3v4DLkqi71ioKolRxOG9QLmw6lw
	 AEeGz0fAVKPEP4FMB0fS8dxz5YR6dyoFOumNjx+hOib9vB3sysmvzSBGsehot9eptr
	 Rrcm+UOssG/cLrGWlPU07xZk=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E0D6740E00DC;
	Sun, 15 Nov 2026 15:52:46 +0000 (UTC)
Date: Sun, 15 Nov 2026 07:52:42 -0800
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] x86/build: Do not allow X86_NATIVE_CPU to be enabled on
 non-x86_64 hosts
Message-ID: <20261115155242.GAavnVSv7VTBO51JGK@fat_crate.local>
References: <20261113-x86-no-march-native-on-non-x86_64-v1-1-cbc8b096d1c4@kernel.org>
 <20261114202524.GBavjDtC9Z3j7PrV3Y@fat_crate.local>
 <20261114204605.GA173332@ax162>
 <20261114205806.GCavjLXgsKNNwK0zLz@fat_crate.local>
 <20261115050730.GB600738@ax162>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115050730.GB600738@ax162>

On Sat, Nov 14, 2026 at 10:07:30PM -0700, Nathan Chancellor wrote:
> Another option short of adding this test or killing it entirely would be
> depending on !COMPILE_TEST, as I only noticed this because
> CONFIG_X86_NATIVE_CPU gets enabled for allmodconfig.

This sounds better to me, TBH. As in: we don't need to do native CPU compile
tests in environments like cross-compiling on another uarch where this doesn't
even make sense to begin with.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
