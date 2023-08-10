Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2372F1E1D6
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 13:32:28 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DEA5540E01A1;
	Thu, 10 Aug 2023 13:32:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id evPqkES7QNkf; Thu, 10 Aug 2023 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1691674344; bh=Ch/5z1MkCvKFFipvsI9iaL7m5l55GAQOvEb/qwxXSe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFX1WChqjnjJblW1BWn7Ml7clSKGTohYoiLUvctOVKHkD40ryZAubko2vfr8tYjLF
	 FTuwzvAwoYYfn3e0XnIa9uZ335PgdsD9OTN04B6fYoS4C2TiXSSPfqtzP7DteHCyf+
	 UzZIeDvFHrL8/CVOcIZuyZ8pPg0YQwtAvEauAqWAj+/XKu/SAx3inAgl1YZTwzHra5
	 VARplhlLpgsvqKGWsuFnB4M0RgBvfKWVE+rAHZbT00Zf/NJsUz92TciDeT+JwXWD46
	 9inor0or4SidhCbMHgdP/M1+fQGRrIYBgEMfH92Jq9b2OoE5l4K3FcoJvqSYXtTQsP
	 OavCkmoCn0Zg7QnPDdGgtIkoAj2pdUnxfISpHOjxJkYApWdUhyvVZIO063ytugMx4U
	 PIMkhCjV3f7hxd+LNsDiAgfNWLJCmuBJBA6KiHjQW/4nAiOqF+RcTmd2m8JlyOJNXX
	 1wVh+usbrQCd3SRX2rHWhfgY17Wi6aBEom5oZ22d/FrBgeTdBjUsmTbKMjFNIFK/xT
	 KkQ3A8oAyPFSiAQ2GPU9oMo1OHexig8wPADT2JX3HtUB9CUla09EZwR1/9BGEvAHmX
	 vxeRGlopCYAVs9LTxqyJSY5u0AZloTN0LznJpYX+h2tsrOu8lsB7cwBXnmEywiRz4W
	 Pb8ha63exjuTskjbo7fPLQW4=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9AB9140E01A0;
	Thu, 10 Aug 2023 13:32:20 +0000 (UTC)
Date: Thu, 10 Aug 2023 15:32:16 +0200
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: Hang when booting guest kernels compiled with clang after SRSO
 mitigations
Message-ID: <20230810133216.GKZNTm4KpohRR4gVsT@fat_crate.local>
References: <20230810013334.GA5354@dev-arch.thelio-3990X>
 <20230810081038.GAZNSbftb6DOgg/U7e@fat_crate.local>
 <20230810090835.GBZNSpE6tCw+Ci+9yh@fat_crate.local>
 <20230810101649.GA1795474@dev-arch.thelio-3990X>
 <20230810125122.GIZNTdSuFvA3Cjfexq@fat_crate.local>
 <20230810132706.GA3805855@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810132706.GA3805855@dev-arch.thelio-3990X>

On Thu, Aug 10, 2023 at 06:27:06AM -0700, Nathan Chancellor wrote:
> But my host kernel was compiled using GCC 13.2.0 from kernel.org for the
> sake of testing to see if the compiler used to build the host kernel had
> an impact on the problem and it did not.

Ok, now I'm confused.

Lemme see if I understand it correctly:

host kernel:
 - SRSO enabled
 - built with gcc

guest kernel:
 - built with clang
 - SRSO not necessary

Is that the scenario?

Anything else?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
