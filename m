Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459031;
	b=2aJ1/Ynjp2YFVq1BrhZQtBJRZHK/aHH3NxoRpZSaCrmWrKkXYQ/uXLzGptLqZxyaIBRS
	 W+zyAInPL9/KQYIt0ikaLC2jmy/oMH6cCM7fkNxt1Aygv8qiQcwStCsu6pa6cz9nnStOI
	 lvBbNS8/pbvmAJigxKYUxhQNPyKyD/nWsylJLQ+xV7PGw3Wno7+S1qBsq5yqBSC3HKr9T
	 okKUt8wS25OSbPCMlv2Gb6vdiGLfuMO9GlIsZdADTkgYTMt/Q82YwgROBzh6VIlCVWAlY
	 eiZpnz6fr4NipPxcJaLbyrzGCt96hjX+bHGyeVdCmznXWusB2m6KiY5ntI0qtgP27lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459031;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CfaKIr9QJzWWz1VVs8FkrZ+izhaJ5cnnPkDiCFzD7Ng=;
	b=edxmxzjntW9Mxpu929VO3/gIyTcwG88/Q2PSYHa74IaaxfZ4GXJYcDkpNwI08VxMZofA
	 /WIULHvTkSgbI0ors/5SG335bwOMJyqDkmgwV9TbunQCglPCM4X1bT69eIy2spsz8EU0G
	 tiCuJ1TVlBhOdCUk6DTvynDPlSr/DheiXRxjIer+ThZYrWaMzJ09xpYnzhh6kGaHSjsjj
	 gehZQAnud0sETHY3l/GTu4rltT9CUXcQ2te8nA+y0xvnViO2niXs3RqnSdPT5/Hr4T0eA
	 /X9bGXGJuy28rsQjCYRAoactL/nLZ6EeXLaSPHOt9KUayJel3OlyKQSMEBWpMHTLI8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e/9hgXrv";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20D606A319;
	Tue, 20 Oct 2026 01:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/9hgXrv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785A61F000C4;
	Tue, 20 Oct 2026 01:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792459030;
	bh=CfaKIr9QJzWWz1VVs8FkrZ+izhaJ5cnnPkDiCFzD7Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e/9hgXrvlwr+yaBFP97oW1lHnwhx4PyqiYmHt3wXQ5eBOEVP02BJ0aGRcIIwc24zx
	 a0H3jMaos0+mxJ/RDhu6wd+SHc73IDRBpIh8SIZtnhOTrFlDrMU61bGWr4eXYM1qw/
	 6l/sPA9tS6/kzODm9SkulcB7H2EwnCkBIea5C1yebMiVZwq40c93uu8UQ/SCUeG6RT
	 Z6s1tuxRto4pQhyN5Gy6mFfrmmso+i4KeU62PC5Ny+32jmZudjw9Fcm0DkAITVSgR5
	 JDRcNOA0tTm8HZk+S9uIx/tiZZWFsleZYCzoyKydtHjW2N57hAkcBIZSRT+/fDU/ZD
	 2HzftL8DBH87w==
Date: Mon, 19 Oct 2026 21:17:09 -0400
From: Sasha Levin <sashal@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Rosen Penev <rosenp@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit
 csum_ipv6_magic()
Message-ID: <atbBFRU1Wm94oYB7@laps>
References: <20261020003238.2823758-1-sashal@kernel.org>
 <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
 <20261020011140.GCata_zHOTeTXLdlr2@fat_crate.local>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020011140.GCata_zHOTeTXLdlr2@fat_crate.local>

On Mon, Oct 19, 2026 at 06:11:40PM -0700, Borislav Petkov wrote:
>> On Mon, Oct 19, 2026 at 5:32 PM Sasha Levin <sashal@kernel.org> wrote:
>> > KernelCI's kbuild-clang-21-i386-allmodconfig job has failed on mainline
>> > with this error since the 7.2 merge window, v7.3 included.
>
>This'll tell you how much people including us care about 32-bit...

I'm not stopping you from dropping it :)

>> Same as https://lore.kernel.org/all/20260904000833.2058186-1-rosenp@gmail.com/
>
>Except that Sasha's commit message explains it perfectly clear how this
>happens while for yours I would've asked how you're reproducing this.
>
>OTOH, I'm not sure I care about Sasha's AI's blurb about what params should've
>been in what registers and so on... :)
>
>If only you guys would agree on how to merge the two, assign authorship and
>drop the unnecessary blurb...

Any objection to just taking Rosen's? Maybe with the tags I had on mine to make
tracking easier?

-- 
Thanks,
Sasha
