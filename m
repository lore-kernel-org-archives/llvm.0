Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2C59440
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 11:57:58 +0000 (UTC)
Received: from zn.tnic (p5de8e687.dip0.t-ipconnect.de [93.232.230.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B071A1EC04DA;
	Tue, 21 Mar 2023 12:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1679399870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=tJTLPFrCxjtK1io8o+ICWrix+0DFGFZh2QqywcB+n2Y=;
	b=ADKm5mLh4ClOXv8F3RCPYMKXCxf/FNOmpMAu6z8Wc5H/2tIwyjI/nhZD18fAegzahK9z2P
	RCSEo1aHASGD6BjLzDI8phbKyumXzbeh0RGPaI4sR6dFBSpi3WviT/pa0ay6H7IbKFkL80
	1WzaZ2NCHpRTzPJoYz/oGnlGenpJf44=
Date: Tue, 21 Mar 2023 12:57:46 +0100
From: Borislav Petkov <bp@alien8.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	nathan@kernel.org, trix@redhat.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>,
	linux-toolchains <linux-toolchains@vger.kernel.org>,
	Fangrui Song <maskray@google.com>
Subject: Re: [PATCH v5] x86: Avoid relocation information in final vmlinux
Message-ID: <20230321115746.GBZBmbujAI4ZBxVn0G@fat_crate.local>
References: <20230320121006.4863-1-petr.pavlu@suse.com>
 <CAKwvOdkFvMgYypc4w+UChO2O50wSHqXJUct2fkxrd+Qgn2C4Cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdkFvMgYypc4w+UChO2O50wSHqXJUct2fkxrd+Qgn2C4Cg@mail.gmail.com>

On Mon, Mar 20, 2023 at 11:35:30AM -0700, Nick Desaulniers wrote:
> Why do you move this from the arch/x86/boot/compressed/ dir?

I got an explanation here:

https://lore.kernel.org/r/16941b45-0f4f-e7c9-4602-d9acb0c612c3@suse.com

but my counterargument is:

vmlinux.relocs is used there, in that dir, so it should stay there just
like the rest of the by-products generated there.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
