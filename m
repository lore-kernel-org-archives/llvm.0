Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458579;
	b=KUneE20bc3DrhzddNuTl36YP2CWH/Wy3nWKZ/IpU5BemxzwDce4UvYyEZjPB02FoCIfY
	 4BpmkoC3GTYWvG3xBjPz2idP+Vdi+LKONitmxHhPfQiuJO5dhRXC6L00ThlOSIFSEVj7/
	 ixSKmlO00fSPvD4kg9/5lQC6ncsFQjKPfh65stM4VbAD9j+kEM/6VErqpKouMI7S0NENS
	 pBxL20xqGU7xLSlLpVWoWw0lLc+EjkPkOVifwYGhIHa1LjmBP+O81p8t2BuSf9ZQTzOCB
	 2Jw+UO4QHWZHeObchHjuFH+KxvurkeAB1qB7o1PpFUf8p3aa0+yYx5r+N+ch5st46Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458579;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Date:Message-Id:In-Reply-To:
	 References;
	bh=6RKT0O/a2ICAVlG42q1U3NHIVPPuSmn9M7UwQWzHXqA=;
	b=NfI0ZejvVggpgI0EePPzpLfzsHgX6UasiMVXFBPkZvOLRptrKNzDeLJwQsr9IbX3JXPc
	 9g4HVNK7tSvDI02kwJWJS80F6hY/3BVBoloSarD0a2BJmRii31RsVJLjFt7rVYSXGEgsG
	 FHy2XrzwrIQUK+0ORgTN/diJj/Mluh+Q+vQmBWTnatywm52USJu9nTeYltD0w8MmCMFn0
	 6kE2yet/nMH4O3uIOcueIknlQan/cyIEJqBmwhLKlq4ckvG2IGKQ4t6psF19Kvw6W2UKF
	 jSlb3yfdi1LWNWHOU3TbWiIgRBxcButh93DNDFiqs8YepygcXtmb4hllN88uzaOAipw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cressey.dev;
	spf=pass smtp.mailfrom=cressey.dev;
	dkim=pass header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=tZSy5iHx;
	arc=none smtp.remote-ip=95.215.58.11
Received: from mta1.migadu.com (out-11.mta1.migadu.com [95.215.58.11])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C421606A337
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 18:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C421606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cressey.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cressey.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=tZSy5iHx
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6RKT0O/a2ICAVlG42q1U3NHIVPPuSmn9M7UwQWzHXqA=;
 c=simple/simple; d=cressey.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795458576; v=1; x=1796063376;
 b=tZSy5iHxpKXau/8scmsuCbWl6lrffVjXRG9VmFdr3C/kIKixag/xuel4IMc9mid9ozacPLHA
 ZwBVAitu9Ix5fQLsX/y4FV+KRD4kElSq40dCiPbGBPPKLgbJAfjzJ+CH02wM3eOyEwEhHMVgyQQ
 VcrTR8zCd8PJbLaZdZnlVpD6o48DPDoHeZnNj5kAW49GkxlXO0dNHyQn6Zu+spbl82575q5D7zt
 t2lvnHHR//HwtqhdbwqwD9nLd+Nzv6pL6EHV6qRFrvYYsQ9yYqoaTLoDzHvNSeqKtRcnBwwY+hl
 T9ph0wRW94wyZZPhmZZKPtVH0XlQ6mQENx77z6oaCJCzw==
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 37519310d25481af;
	Mon, 23 Nov 2026 18:29:36 +0000
X-Mizu-Trace-ID: 37519310d25481af
X-Migadu-Flow: FLOW_OUT
From: Ben Cressey <ben@cressey.dev>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, kexec@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86/kexec: Type relocate_kernel() to drop __nocfi
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Nov 2026 10:29:13 -0800
Message-Id: <20261123-re-5825067c5cd5@cressey.dev>
In-Reply-To: <avVUv4_eeOOr7ZX_@jpoimboe>
References: <20261111-x86-kexec-kcfi-v1-1-b4d41ea14deb@cressey.dev>
 <avVUv4_eeOOr7ZX_@jpoimboe>

On 2026-11-12, Josh Poimboeuf wrote:
> No objection to the change itself, but PLEASE no LLM-written changelogs
> or comments, they tend to read like Rube Goldberg machines and these are
> no exception...

Thanks for looking at it, Josh. You're right that the changelog and
the comments are much harder to follow than they should be. If this
goes to a v2, I'll fix them both.
