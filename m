Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277054;
	b=AK405fIODc2m0ix9HFOM6MrgexNiOxViiy6mGArDyB8GxPzvpQ3OIv6B+H/ZqI/oP7aW
	 0XacIydaVqOdPFK+pUYI1W7L2M2XNQ7Jik3opNMVpR+oMjktZy03yzpss4FL5EGsTHEGi
	 dhNVh4a3RX5qqLB4Gw/PUZPW4yPOGUWWi0qB0WuGbluf9Dsmr+RIqAfRcplaOQsstWyTA
	 HstC2zmzqHcCY/l3t/K8sq8Ev/TV70NiYFxveUiHMa/BYnSQsMdNF8GkRuBcRvrpISAgx
	 1EgDak5wmW5Pftcqacu/yIxFQdVtQmNWRuNzAqO1Sgwoz74ExYl/MmlfhuNvM9vc+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277054;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=wt9SuCj5pVLQlIXTvc3SLwO1v9us1ek+fs0MfH+LY1w=;
	b=aleg3tPPHt3Ce2ClfKq9aGp5oSqing4x2kyGDLj1E1T1dOZdtcIymm68Y+nNfdRSB9yJ
	 knNPquRNI3YdPzy5kCk6daDyUm2H6YWbhbkEMLRUpbhMvPSjYhaTYtJge7CAN3y/Tyshi
	 ZnB84l3VZq2CKD1qxMXKshDkqHa4xhlOvxIP+mXqhQfTMXjKvugJA9h0/RQ1Iw2Q1niHR
	 d8wGiRLSuW/8nJbFrJKIP0+kciuJh/oWlGyjX0mN9uk9KL01WBI7lyvggaKeZ6DXDb3d6
	 /WmAL6hvnU5G3n6NkWGX/uWjUbbCftZDUHRNKfmiQNekMjhXfBkRtjToEtsZDkVMdjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=SvhAGPfm;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD6606A31E;
	Thu, 29 Oct 2026 12:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=SvhAGPfm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wt9SuCj5pVLQlIXTvc3SLwO1v9us1ek+fs0MfH+LY1w=; b=SvhAGPfmMIWHnMnArou7ChGvDG
	s1LljHJcRq3vkDTjiGZMLeSMCvHWb6na3h4QMzSCJt7qZ1ypfQNZQbwx8jPsoAogmmj2RRSCVblK1
	f8rMP6129W7D8GS2bO4Mt5n61TMDhtCoJOeo3poNELFoFAwkXcK4UFz2IZKOMia5uLzQE3fSPQTDY
	FdufY9805ysn3INeGujAJ1J8ukmaUkxJbRGAElkG5Lty8rmgkf23PvbL4xCqMx28+ZhKjGrep/jew
	7ok9IKe2jfpiTpmOMEb3J8gCwNvk5hqFtiobDGvWCuHcL2gt5yCy6xRwUGDPgKJU+033o6LCW/d6i
	6poNouFg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMPH6-0031N9-0o;
	Thu, 29 Oct 2026 12:30:32 +0000
Date: Thu, 29 Oct 2026 05:30:25 -0700
From: Breno Leitao <leitao@debian.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-team@meta.com
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <auM6mSXz-BVIjYBc@gmail.com>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
X-Debian-User: leitao

Hello Peter,

On Thu, Oct 29, 2026 at 11:49:38AM +0100, Peter Zijlstra wrote:
> On Thu, Oct 29, 2026 at 03:27:23AM -0700, Breno Leitao wrote:
> Bah, this reminds me I still have these patches:
> 
>  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=x86/syscall
> 
> which make your patch impossible. The reason for not dispatching through
> the syscall table is that syscall hijacking becomes a _LOT_ more
> difficult.

Cool, this would in fact solve my problem as well.

My goal is to make booting with mitigations=off equivalent to building
with CONFIG_CPU_MITIGATIONS=n, so we can ship a single kernel and pick
the mitigations at boot time. Your patches get there in a different way,
but that doesn't matter for my use case.

With "x86_64/entry: Unconditionally use -fno-jump-table", x64_sys_call()
becomes a compare tree on every x86_64 build, so system call dispatch is
the same whether the mitigations are disabled at boot or at build time,
which is basically my end goal.

That said, can I do anything to help those patches land? I see they are
from June, and I am wondering if anything is blocking them.

Also, KBUILD_RISTFLAGS in that patch looks like a typo for
KBUILD_RUSTFLAGS.

Thanks,
--breno
