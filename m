Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338740;
	b=vrCipjkxIUXeFImw8ZTMXfcW7/7RqBOONnCSX3pX7v6U3sdt5jXzYIu+s+XXPGcdscd7
	 DJu6o+L8/zh8ERO4ITvFD7mU38A0SGHQXhO7Ow5xfAVPlc3EibNcpZrhP1CLKVHdwGlyR
	 Ha8xSRy+xJ3JulAEfNsJ6RpCD995RVoJFwONKvEIB9TfWJe31EzhTK2gWHfx2NG/YDOe2
	 rcabtYN3DHhwc/bSP9NZSoLaKkmJn8g4UlZGwwODuIY4WkETYHO2co7SgXebXLxRdXGXD
	 TROhRq7cJmA7CWcumMQ7/7N9TD1LPOEfUoNwwzH4Eb6eaE4e5Q/tZoOc3BVecxo2xXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338740;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FznyGR9DffnzS9tg5Z7SBGY0a5yXeXjM9mNEpGJjTNU=;
	b=QmuBnCSw/uT+0AKxiGa29jv16DPpN/48kTUjEEDWu6m45zl8nygYwp9CVWzD76jjnb1k
	 9EmTq/eiVGY36YlJKZtdMbxC9sLCfHhatuNGyCEpR7gM+YeHiKBoZWDy/rJ2S2EV7fPlf
	 gB6Z4Ql53UxGkKxVwxqRzfzTQbd5tHhklpV6dQT4NUgShfZoOGDttNDG/bfpG48Ini3+U
	 xnvR0ribguB/Ym0MKI3shJs0au/mTK7TfX4PPbFO/aAib7foxDb5fl+zd9d1HSiUo0omh
	 OhU6WtTQGCCT3fkd+ESnXGwBWKuMaNQqgtT/Eo7tOyr1aIibsuhOWkqmI9CdB/lzZhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=k2cPH3ga;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AAB606A31A
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 05:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29AAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=k2cPH3ga
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0DCBC40E04D6;
	Fri, 30 Oct 2026 05:38:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qgmdnCPv0jOs; Fri, 30 Oct 2026 05:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793338728; bh=FznyGR9DffnzS9tg5Z7SBGY0a5yXeXjM9mNEpGJjTNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2cPH3gaq4iwLO6fAcfQc5OVWaRzHLrntefm6f/tLjMNhM3AbDKcKJ1+h5EulWtx1
	 sa63oHetRuPWRtbWpdM4QWO1ySFrSXQnteRXhSLHwmYy6MSOMM1q3CGMkNbBcNCM1p
	 BLoLlph7M7/RAtku+O/tUlJRItbPN/KTUZt9zqvS5Ezl4qwyBX6tJIZiKtAI8da5Tf
	 yQopmyD7d7LJkZmOOgAb959LjPK9ojEwEacczB+l6uCuM7Su83GTICns3v/VJWifCN
	 LY8gJDgkdwc1XHqc97Lhcqp8ojkFnye70Z6tL3c+AHhxuykvvLQtQWFpZjluRaX4ib
	 M4BQ86MTVK/5hBmxvWAw39BVA8altRlReOA1b9kDmMDjVir+/BLl79gPQQVqU0Oj8W
	 nyi8Vj3hfKdfeFiwGqCTRcmwyGnxlJALuT6YMKF2f0rtmr5OfksbhtWAgH0TrQpQI9
	 8KWDbPQh9mULmrJKJjZaBQmUAeGeHDPPWU8obJEa2godAgz2w7UZulqwTLUrKrPLtY
	 ImcE2Jy7zuX7ZDPbFpQkbdiDg38JKhd4JdBhfMGaiYVsn9ysLoh6EaPJbBEq82K//F
	 JqoWlhMf9CxRrc2ciTOInCs5WS/YiCvgIWiD0LQ0DUaSHco0yec89fpkt+4BDhhgWi
	 LAAhrBfa/kdbcOzFI85m1xgI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0E5AC40E04D5;
	Fri, 30 Oct 2026 05:38:28 +0000 (UTC)
Date: Thu, 29 Oct 2026 22:38:25 -0700
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-team@meta.com,
	David Kaplan <David.Kaplan@amd.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <20261030053825.GKauQtUX0pauVeLsGg@fat_crate.local>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
 <auM6mSXz-BVIjYBc@gmail.com>
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
In-Reply-To: <auM6mSXz-BVIjYBc@gmail.com>

On Thu, Oct 29, 2026 at 05:30:25AM -0700, Breno Leitao wrote:
> My goal is to make booting with mitigations=off equivalent to building
> with CONFIG_CPU_MITIGATIONS=n, so we can ship a single kernel and pick
> the mitigations at boot time.

This might interest you then:

https://lore.kernel.org/all/20251013143444.3999-1-david.kaplan@amd.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
