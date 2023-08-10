Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09EA1E1A2
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 15:14:23 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 740BA40E01A0;
	Thu, 10 Aug 2023 15:14:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Oh8NazHFxDwj; Thu, 10 Aug 2023 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1691680458; bh=A6xFfUpRho6D8k1f+ST5DHr3WVBXqj26i9AmyFnvDuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIndakUbhIA8ftcyjCcKuR7UKrZzgxv3j/NfOHXP5yzAakEz0bmUAYHfAjFQyJiRF
	 DJffiujRk+blxEGGCB357omme2HbucAR3N/VRfChePtVGTTybpL8ovm15QAR4s2jIN
	 +D1Y2ODJVghZ2BxSj9IziViwTaXCUbjw0A3qwqYvsfPDnXi0mue5P6Gw39wzY8KI1s
	 g6+JvbsnsexHzZOPu34RNMIyguvm77ZR5bztabp66NgKs29IfE7mlfiTsP+f0XCocD
	 fwbuxl7r4FeofsIKkox1u1tG+ElghM32k8WjK0r/EY3y7bhHUl/ZAhu/yTB1RcQuH1
	 Oj2pzBtJzrWsktDLdWD2/CmxWcK4qMPKhqgussRfn/jgTzAJw+hRzi/qUTTdf5GJdq
	 UpC0ylmI7oKGk7h2YEaoHpIh+IXZi3yNuO/3Skd+jZf6zxzFBQaOtygW9NIuxIhFMA
	 4xh3d6o856MZAPzAneUePLIKQNyqq0Kv/BxpvtM/PJhk2+qtnmcdTaXUiJ45WCRNs/
	 PKPcB7qC2tOJMw6b1wtrMbGf4OwlVlQx+7IwQ9mYqv2+I2H3Ny1N1nyvDpOkpXP3Wc
	 7pKfm5I5NTQoDanHSsx4TPao4XN+Fat6MaJmVxqBtYJbdhDhri7BOwWYxnbjxdqCFz
	 2NFXUT+buiYIEguLNu6Up7Rs=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9BD6840E0185;
	Thu, 10 Aug 2023 15:14:14 +0000 (UTC)
Date: Thu, 10 Aug 2023 17:14:10 +0200
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: Hang when booting guest kernels compiled with clang after SRSO
 mitigations
Message-ID: <20230810151410.GNZNT+wn/cLBWiU6dO@fat_crate.local>
References: <20230810013334.GA5354@dev-arch.thelio-3990X>
 <20230810081038.GAZNSbftb6DOgg/U7e@fat_crate.local>
 <20230810090835.GBZNSpE6tCw+Ci+9yh@fat_crate.local>
 <20230810101649.GA1795474@dev-arch.thelio-3990X>
 <20230810125122.GIZNTdSuFvA3Cjfexq@fat_crate.local>
 <20230810132706.GA3805855@dev-arch.thelio-3990X>
 <20230810133216.GKZNTm4KpohRR4gVsT@fat_crate.local>
 <20230810134056.GA130730@dev-arch.thelio-3990X>
 <20230810144344.GLZNT3oM6MLVdzGlyd@fat_crate.local>
 <20230810150706.GA42856@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810150706.GA42856@dev-arch.thelio-3990X>

On Thu, Aug 10, 2023 at 08:07:06AM -0700, Nathan Chancellor wrote:
>   [    2.408527] microcode: microcode updated early to new patch_level=0x0830107a

Hm, a wild guess: can you boot the *host* with "dis_ucode_ldr" on the
kernel cmdline and see if it still reproduces?

Also, can you bisect rc5..master to see which exact patch is causing
this?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
