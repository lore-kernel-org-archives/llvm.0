Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385323;
	b=wM3LA4M66PqBxWX2w6htl2s9bxDMwlCU2xTUFxdwdXxsK/ScqgtqqgyqVTPW/lp+0q0d
	 WRLZ1wAsAImErqtEz3HDySMUyr+Isiq2myZEGvHViyPBMMn+ik72LbemNIgX5usxn0keW
	 5Q9Q/OfmVtZBCMQBpE3E2VewydXjpAkj3C2JHT2WrtLXoHDhiqTDWJs+0ihCVHaXFHK8n
	 yybpPaicDGTTa2wJRMOf/QNrc5sPO+g/UV/tsc+Jqx2PFncboAaav0JDbg/s2bKRuTasE
	 wwwd3SKGKvD7UBINILqzZ6T0CwI40wyy1W5cweOGJofu4zSa+Ha44YjRZxmaAj6aPpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385323;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X31MSaNYy5A9TjyHtuzQzoXsaJ7T3g1SAiJDg1zqAmU=;
	b=N2bBpLJr3arCmAytwvYdRkbMMQBOonNaYPCBDZNCWJXNmCsSokaYYIbHeX4tPOFdDdbB
	 DDiNaAJ0FUJzOaEx2qLewl6pntrJUoNsIQ4aY5xXPRRstrLPEmNMeb7LpOLgCvcyQoyeF
	 ttX7zMP+HPcA/qAcRtq6F25DLzgLGOhRgc+mwMS3gDkx4JPJ6JrlQv3Gc7osKZ8iD69Ln
	 wTEJESdbdJI0yLfplUFJl3rSlwkyk8fRWx162JGIcos3wwJ541TZgL24/3+VPq2TIDmtn
	 4oB0X10AFNy7/92d9SlZpmJwObkUKJj2qOYE9jE6YiFnc1+y0D9EEGDL0aGAIa9DjuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hh53Qcov;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A1606A31C
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 18:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D2A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hh53Qcov
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E0F0D40E03BE;
	Fri, 30 Oct 2026 18:35:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mp69dl5ZuUdR; Fri, 30 Oct 2026 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793385316; bh=X31MSaNYy5A9TjyHtuzQzoXsaJ7T3g1SAiJDg1zqAmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hh53QcovOBqMSo5hCSffGR/EKSQz4BPdId59k8O8EO0hurbSaf9OKZmrM82IFsFuU
	 HpHByeIYsaz7iLp3oqZEo8FK7TzrGUtnVKU0TUmHczHRSvYsPGqWR266/Mdk/4fWgX
	 qKcNm0LFd9D25uvlcO/wM6lqNYY7260q4RplVIs6xGEcRBBCFwQilG9yKfVZ/iBuT5
	 R8IiLDCyGuCm+9U5F/2/+htrlGrlcnuYwNb2lZ+LP4tPz2LtfmIYbnEJ+2zkQqs/jl
	 XKossf080g+55E7dE90W6TT7DaH2WDzSluNeO1sE2Q7VsqvbL9/BaJ/rjkLHm7rCkC
	 nuGyArwak9HN6TmJPm+MVuanJ0VW7/WS0eoQi8yGfghOQvPBWAnKNSm/h+PPfGDNNX
	 JGlsd7gREWPsPnPlJOEZap0zxBCmPIiZ/nODiFWVscegV6zS2LQ7X2DtYUu/2VO1FB
	 agNHF6tzqH8CgmGfqdfOWpeTJU/t6Xh8b3sL76y9lZwuvdfV1BpkwSgnVUEncdMbg3
	 1YD2mDwbY3nqyz9zQX3k/vYHb684sjjEDg3aFCWvLxc91r9K1Zvi4SJpcmb7zCfewB
	 khRvp3R2N9eTu0HG4p2f7Fs48/TF+HNPa4UwEDzJVFpGfk4nKiLbCuDK/QvZADvNby
	 FrQ31Q8KphlUL/kKyua4I8Pc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2A49640E02B7;
	Fri, 30 Oct 2026 18:34:57 +0000 (UTC)
Date: Fri, 30 Oct 2026 11:34:54 -0700
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: david.kaplan@amd.com, Peter Zijlstra <peterz@infradead.org>,
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
	llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <20261030183454.GDauTjTmOSFyeeUqAx@fat_crate.local>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
 <auM6mSXz-BVIjYBc@gmail.com>
 <20261030053825.GKauQtUX0pauVeLsGg@fat_crate.local>
 <auSIfywq5DhT-SBt@gmail.com>
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
In-Reply-To: <auSIfywq5DhT-SBt@gmail.com>

On Fri, Oct 30, 2026 at 05:11:40AM -0700, Breno Leitao wrote:
> I read most of the thread. As I understand it, there is a desire for
> something more dynamic, but that is non-trivial work that still needs
> to be done, and it is unclear if there will be follow-up (the patchset
> is 1year old)

It needs reviewers and testers, yes, exactly because it is complex but a good
thing to have, as you guys show interest.

The day has only 24h, however. :-\

But yes, we are going to refresh and update the patchset soon(tm).

The prerequisite is the stomp_machine NMI stuff:

https://lore.kernel.org/r/20261015211426.49114-1-chang.seok.bae@intel.com

which needs careful poking at first.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
