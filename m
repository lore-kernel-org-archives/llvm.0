Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F403C0C
	for <llvm@lists.linux.dev>; Sat, 24 Jan 2026 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215829; cv=none; b=AYiqZs0R24CD8KTLOcwMzD4ryAu5KxUhEJESUBQkQeXOfus06GdkO+O/TGyjD/KpZCIEJFkFjdNYqHDihnLprs7YUqFf3Vf3XoHpmoFTEZ4toA1qBVPq+cMVO1DHjNS6qoCIfwcfjzcAcRwQe7AUtb1RlwCuhSks4qWsVTHU3z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215829; c=relaxed/simple;
	bh=4YYMCUSMHusIIKJ7Gn+mDB7Nqsnj37inU8q3B0JyRjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0Cftrf08Evg0j3uXd2/IqYbZbtjLVNouhD5Dns+0L8dPskuXNjlz5gxNW9NyspCpVv3lBOwJZbYpso19QkrUKK8p6vJHYkGFwEKUgMuMhyVT1qw2zgc6SZjTADMyBtwXNgSv+YaJOEV/xMU+UkHtW2slnGBCExtx9CwzGiUl0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Sza5EiF1; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Sza5EiF1"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60O0nSu11199224
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 23 Jan 2026 16:50:02 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60O0nSu11199224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1769215803;
	bh=jeGqMzGZSjxSnUjXzypoToG5FZgBdXCJnXQg+Brwh6I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sza5EiF1TyD0HY1Zkvu3ggtQ6u6MyA4QGBiPt0i7+d2sB734hFVBKjP0J96RH/iu2
	 j0beg3AXA1IW+BjBmyZd058gkb5hadDypQX5xF50OIXCMHl86QOUHV+WlAKvaORIVt
	 rsr3dqeC+emx5Y4uirnAbMZeAeBhj3awc3foNv9Xu/jNa+O3Ri64vvxp1GYeTtunk5
	 88SWnCXV2t0fIcH1h/tTv/3+NhKN7Aj/QJaMUmO40Qo+D2Mf71L84bttu7jXS+47JW
	 8oMXzXIHZJnXCs9hMRONyTxxi/mDReXbWDGWMuIS+WF//47w1d2R3r+DKOkTNI6rYU
	 mmi8OlV7c/8mg==
Message-ID: <f6a53599-f3ba-4ed7-bf93-3fd3edb4f490@zytor.com>
Date: Fri, 23 Jan 2026 16:49:23 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry/vdso32: Omit '.cfi_offset eflags' for LLVM < 16
To: Nathan Chancellor <nathan@kernel.org>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20260123-x86-vdso32-wa-llvm-15-cfi-offset-eflags-v1-1-0f412e3516a4@kernel.org>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260123-x86-vdso32-wa-llvm-15-cfi-offset-eflags-v1-1-0f412e3516a4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-01-23 15:20, Nathan Chancellor wrote:
> After commit 884961618ee5 ("x86/entry/vdso32: Remove open-coded DWARF in
> sigreturn.S"), building arch/x86/entry/vdso/vdso32/sigreturn.S with LLVM
> 15 fails with:
> 
>   <instantiation>:18:20: error: invalid register name
>    .cfi_offset eflags, 64
>                      ^
>   arch/x86/entry/vdso/vdso32/sigreturn.S:33:2: note: while in macro instantiation
>    STARTPROC_SIGNAL_FRAME 8
>    ^
> 
> Support for eflags as an argument to .cfi_offset was added in the LLVM
> 16 development cycle [1]. Only add this .cfi_offset directive if it is
> supported by the assembler to clear up the error.
> 
> Fixes: 884961618ee5 ("x86/entry/vdso32: Remove open-coded DWARF in sigreturn.S")
> Link: https://github.com/llvm/llvm-project/commit/67bd3c58c0c7389e39c5a2f4d3b1a30459ccf5b7 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Unfortunate, but simple enough.

Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
