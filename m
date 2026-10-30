Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362327;
	b=Gm1/df6/Qnl1o1qPRZshkm8TpmOc1dNyBLYxSXioMRFwVJZIfRnWwSFjEf03i/wsdNc6
	 42QwlGYmnoVyCXowJhdG2rxup6m8VAgr8DnqSAY+fRitvphg/fZyDe7oY5ybXMPl73ppv
	 esyb6pVrcv93C5Me+EXVWZpztcs0CCQnAmmBncmKoC7x0ys2Sq6JC0w8YWQSg+ON7gtPw
	 CZZyRfizAG2CDsmWyL5GJS2Mkm3RS1OodTyRq0MugLui65nPSmQfJCAu3HeOMfkwx7PmK
	 o/AC1XLN69mJnKl/of5PcSPjtcl6JfI7EilCs/yjPmkuJhtgdZtPwyU4Yn5dqpMINJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362327;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=hna6sUJpKyxlDIEIw0dw2U7po5M91zQRyB5zbyinf68=;
	b=5gZk2iyCSBnMr2XJXjs+YcSXIH+3otniJBYw+jgApAHDpPARbNvKi9f4Me4z9uHsZB7B
	 R1T1TR3gSVcxG5hIPAUg7sOHzR9PzAA1iu365vgpKXYiDflPHpvRtcuSOxu+YXfIzqT2R
	 Kunu74ze1edv3cYpIQpgxTtJdr/JRgSMxF2z/jEG/giopyTPhET205Kwn8dM8DCdw4Zrx
	 Sbpn5WrGXVJ4J3ROEJ9ORYwYR3W6xeiUp2SJ0BqZOPTzWOhwYsT3Deg8DzDn03SJwlnq1
	 pGHc08doVSHoWjng6xI9R+cmmnZRyy5C4+SSW5gDRPYjStfb2uPqFStIgkCYeEUPpoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=L8eKm6FO;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C48606A31C;
	Fri, 30 Oct 2026 12:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=L8eKm6FO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hna6sUJpKyxlDIEIw0dw2U7po5M91zQRyB5zbyinf68=; b=L8eKm6FOGqhX8si7wvCVyP3e5C
	L44EYuq5F1f2qlNbSc57ggV2a+2EpUqo0BNt7QgsvPgkKDIUU8s0mV7T4vzmqpi/2UnwbWi+Ylsgb
	IWBJ5IE0OFGRae5AF1bn3kDRvy9M6OwsZnGUTFMyWFnjossjH1wL9GlOihTsgg31cyXms2C0f2kyB
	phmQd8mff3inYBmhGupdtcN+ilkEDgkrW/Ebacmpfx0N4/9uw0tDbjLrc6aCF9cfyglvLOoQ+dyW8
	igLqsxvLUQ5K5peQ/Ql2i/l6ipqAL8VXrcjsVG7ydZp4epoTwhRsbyeIoA8As6Mb2vH59QBybq3rs
	Ul8KsZtQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMlSU-003o9l-2F;
	Fri, 30 Oct 2026 12:11:46 +0000
Date: Fri, 30 Oct 2026 05:11:40 -0700
From: Breno Leitao <leitao@debian.org>
To: Borislav Petkov <bp@alien8.de>, david.kaplan@amd.com
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel-team@meta.com, David Kaplan <David.Kaplan@amd.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <auSIfywq5DhT-SBt@gmail.com>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
 <auM6mSXz-BVIjYBc@gmail.com>
 <20261030053825.GKauQtUX0pauVeLsGg@fat_crate.local>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030053825.GKauQtUX0pauVeLsGg@fat_crate.local>
X-Debian-User: leitao

On Thu, Oct 29, 2026 at 10:38:25PM -0700, Borislav Petkov wrote:
> On Thu, Oct 29, 2026 at 05:30:25AM -0700, Breno Leitao wrote:
> > My goal is to make booting with mitigations=off equivalent to building
> > with CONFIG_CPU_MITIGATIONS=n, so we can ship a single kernel and pick
> > the mitigations at boot time.
> 
> This might interest you then:
> 
> https://lore.kernel.org/all/20251013143444.3999-1-david.kaplan@amd.com

Thanks for the pointer. I am very interested in this.

I read most of the thread. As I understand it, there is a desire for
something more dynamic, but that is non-trivial work that still needs
to be done, and it is unclear if there will be follow-up (the patchset
is 1year old)
