Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1E72E9EC9
	for <llvm@lists.linux.dev>; Tue, 18 Nov 2025 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763498185; cv=none; b=T/3ySZrL5YTg9eG3aIr1hL19Qnc4Yzbyr4NLznymOyj/Lr6IdxP1sFIC7D3ekzi6pcphr/VwnvKI4LgQWekWRYV/rm6Sn8dUwW+X9PanN//2jJR1+wKKHs97Sx0Ee0Y32Op8KjNOqtRxmAp5sc8We7MKU2CrcAMOO+TUJgFl9gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763498185; c=relaxed/simple;
	bh=EpQB4W4oN+k+80/90KKIP9GuppeQYjcHPM3+Ma5SH3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3/W0AdVoEx4l7/rf9xwbJMBMZo3PbtnYnxcMnhfCQfu2gkDaE4LoyNxW1+kpIJFouSZbdPaR5i112+YJCWyvcyb3epkt1nqkN/noJ82hP+or1tdsXoLeyDK7X1K3IZjwPNZWq5k10uq22oz38VaejIw+LMVImrEOv/ZalYAyKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dQYjUwS0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dQYjUwS0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8ne+SHPq+6VfT3qkrqy+bvDWVXNhMCjamVWYxqPzmM0=; b=dQYjUwS0F/eF5JFHzulMGPE7/R
	Nsv3HHQLChzccVJNLthlJVWge4zFzSRLsLVQQ37whooTxdTj1bcsEA6UpxPEvPMvM1NZPz1by65We
	WivCwDtXzheyVYkA9qVxWQ+QNJ2IgFKH1oFKL5FWHaFORTBwG5GCR23W0MYZdCeZh+TqcEwT3BIJs
	pAfRj/aTKtsRa0rydgsDjGuvnO3v7F4yYBZbJK3QWFrdkK/S+9TKmdaVtFpBEnRuE7jurKaILpvSk
	PQbASaYi5nvrMq9E7lf4ng4/y60qkhks4T/rc0Cu711O6g/vAAy0ZQOhJgxQsBvaAGS86NJm7xsVA
	/GIt6h3Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSQb-0000000G1y8-01Pb;
	Tue, 18 Nov 2025 20:35:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A093D30029E; Tue, 18 Nov 2025 21:35:51 +0100 (CET)
Date: Tue, 18 Nov 2025 21:35:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Maciej =?iso-8859-1?Q?Wiecz=F3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, kaleshsingh@google.com, kbingham@kernel.org,
	akpm@linux-foundation.org, nathan@kernel.org,
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de,
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com,
	kees@kernel.org, baohua@kernel.org, vbabka@suse.cz,
	justinstitt@google.com, wangkefeng.wang@huawei.com,
	leitao@debian.org, jan.kiszka@siemens.com,
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com,
	ubizjak@gmail.com, ada.coupriediaz@arm.com,
	nick.desaulniers+lkml@gmail.com, ojeda@kernel.org,
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com,
	glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com,
	jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com,
	dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com,
	yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com,
	samuel.holland@sifive.com, vincenzo.frascino@arm.com,
	bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com,
	kas@kernel.org, tglx@linutronix.de, mingo@redhat.com,
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com,
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org,
	rppt@kernel.org, will@kernel.org, luto@kernel.org,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 15/18] x86/kasan: Handle UD1 for inline KASAN reports
Message-ID: <20251118203551.GQ3245006@noisy.programming.kicks-ass.net>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
 <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me>
 <20251111102719.GH278048@noisy.programming.kicks-ass.net>
 <a4vtlaxadmqod44sriwf2b6cf5fzzvngl6f5s2vg6ziebahjtv@yctbqspkdn2b>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4vtlaxadmqod44sriwf2b6cf5fzzvngl6f5s2vg6ziebahjtv@yctbqspkdn2b>

On Mon, Nov 17, 2025 at 09:47:20AM +0000, Maciej Wieczór-Retman wrote:

> >> +void kasan_inline_handler(struct pt_regs *regs)
> >> +{
> >> +	int metadata = regs->cx;
> >> +	u64 addr = regs->di;
> >> +	u64 pc = regs->ip;
> >> +	bool recover = metadata & KASAN_ECX_RECOVER;
> >> +	bool write = metadata & KASAN_ECX_WRITE;
> >> +	size_t size = KASAN_ECX_SIZE(metadata);
> >> +
> >> +	if (user_mode(regs))
> >> +		return;
> >> +
> >> +	if (!kasan_report((void *)addr, size, write, pc))
> >> +		return;
> >> +
> >> +	kasan_die_unless_recover(recover, "Oops - KASAN", regs, metadata, die);
> >> +}
> >
> >I'm confused. Going by the ARM64 code, the meta-data is constant per
> >site -- it is encoded in the break immediate.
> >
> >And I suggested you do the same on x86 by using the single byte
> >displacement instruction encoding.
> >
> >	ud1	0xFF(%ecx), %ecx
> >
> >Also, we don't have to use a fixed register for the address, you can do:
> >
> >	ud1	0xFF(%ecx), %reg
> >
> >and have %reg tell us what register the address is in.
> >
> >Then you can recover the meta-data from the displacement immediate and
> >the address from whatever register is denoted.
> >
> >This avoids the 'callsite' from having to clobber cx and move the address
> >into di.
> >
> >What you have here will work, and I don't suppose we care about code
> >density with KASAN much, but it could've been so much better :/
> 
> Thanks for checking the patch out, maybe I got too focused on just
> getting clang to work. You're right, I'll try using the displacement
> encoding.
> 
> I was attempting a few different encodings because clang was fussy about
> putting data where I wanted it. The one in the patch worked fine and I
> thought it'd be consistent with the form that UBSan uses. But yeah, I'll
> work on it more.
> 
> I'll also go and rebase my series onto your WARN() hackery one since
> there are a lot of changes to traps.c.

Thanks!
