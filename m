Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189645003
	for <llvm@lists.linux.dev>; Wed,  1 Jan 2025 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735727983; cv=none; b=aju/n/xWxf5kmRjdC1HPnUlrjGFmcsk7B7oZuSJ5klinf+mHmX/JMzNapNGFRXfxgPUOwY3NLLOSmFBJ28J6ztCv39CIaTBz0v26wpn1FOU2wuZ+PexM3KdnrvUpIuLG5kbPWDZvPHcJ29jjgawng41lkS/wJiRIq6Adm3aBnYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735727983; c=relaxed/simple;
	bh=eGkcmhyp3IduDcCNJMPAi0Pm+aQIc99+rwa6u6Gle90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NG4E/ZnMvScAUfEj1avq4KczUk2btjSAv9778sBh8rDUF4QIvx1ALjOrMqLE5+MAuaNfOOT4vNfcTqHfFjzoT9X92Wvit3S2a2QCZBCo4Zuxiu/lSB6z9hh0B5L3zP2vW2mNGzdKsm25/2nM5P2M2Sh2hoMIKEAxjTJJ1qV6jKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OHUmS1aa; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OHUmS1aa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0000E40E02D6;
	Wed,  1 Jan 2025 10:39:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fI6xinlXt3R6; Wed,  1 Jan 2025 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1735727970; bh=3Spysl7StRDXlgaNxoTn5tSakE3xE5afnmdiTEaYgP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHUmS1aaOER/0/TiNhBoVNDwSrG2cpw0RU+e4YJ8qIPfJ35lKw9quKebkJ6GU+7Wc
	 1udU3B18hvGq7lLg2wlsbHRk5pebhfil2Eh15zwoz9bNsYpHLCI1tHyNC1VZFJAAdO
	 nIfpM241h+TyArkVEMeY0+Fr/CnpV2MG6psotygheO7lqbfXvEq5Pb7nYMakPlMJt0
	 /fcKAd2lmQsftvKytzAtURmpgtaB1yvwH7+YG0gNMc5m+gmqvPRBPt56xkjr0SIMza
	 Nw/29dxqurRwys94FAYU1j5H6G2UBU+rd2NvAsdPiGAA/vfwl8WXxThTiq+Dabyaj4
	 gouWj7jjjNUVtKc9R0Jcc7Z71eHztjcZVtI1iuobUIjMV8+nTfeCUeqmpXoWCyX+RE
	 /f+iuvLHdoMtwpOr8vf+bcXhVNEiesVI7Q5ycLN7xow5VvM81KGOnMri/Sg6eEFbQ/
	 mXyKQAWPTnSPMfy4qv41XLOug8I3LxQN9zrPoCBGImCN2RRV1ZV//I9bhiJPDihj+m
	 AqwjMcqzQBVtTalafhpBTdNw86Shc89p//9OkTLsS4VkNROgS5WA9Rw1T9M6YTR/RX
	 9QNCWqcxf5QNTXV6lzeKvp/pcWG9fBDytWk0+zLKax5lOCJ5AfofZww83fmsO4OFFN
	 mSqQVU63f7q9iqgH3wSUQQX4=
Received: from zn.tnic (pd953008e.dip0.t-ipconnect.de [217.83.0.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AD4B440E02C1;
	Wed,  1 Jan 2025 10:39:13 +0000 (UTC)
Date: Wed, 1 Jan 2025 11:39:07 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>,
	Kevin Loughlin <kevinloughlin@google.com>,
	linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v4 0/7] x86: Rid .head.text of all abs references
Message-ID: <20250101103907.GAZ3UbS0WqxmG-z4J3@fat_crate.local>
References: <20241205112804.3416920-9-ardb+git@google.com>
 <20241231100137.GBZ3PBAdixv2CR_H9C@fat_crate.local>
 <CAMj1kXGAEc92TfEO-i+9SAmsso-NqqX1HbqFf49CC-QbOmpT1w@mail.gmail.com>
 <20241231103510.GCZ3PI3gSuuDzkG1q4@fat_crate.local>
 <CAMj1kXEj7-PadFJ57uYUTC_TCicX6E56rSiEF8Rr9_vH_G8PoA@mail.gmail.com>
 <20250101024348.GA1828419@ax162>
 <CAMj1kXHqV6eQCnfFsj1Pi-A1oXfC_ZM8t5FL22NOLm96tu2qMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXHqV6eQCnfFsj1Pi-A1oXfC_ZM8t5FL22NOLm96tu2qMQ@mail.gmail.com>

On Wed, Jan 01, 2025 at 09:01:49AM +0100, Ard Biesheuvel wrote:
> Thanks for the analysis.

Ditto.

> Should we perhaps just add the below? All the other sanitizers are
> already disabled for core.o, which is the only object file being built
> in this sub-directory.

Yes, please.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
