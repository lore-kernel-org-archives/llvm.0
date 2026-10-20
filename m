Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459754;
	b=f0oHzwdbF9jwd8Eu3sUPeyxqt1qx/nB3rdoU0Yal1+Ce5FBsrFSu+hvMRnGZxCcmovTY
	 uqkud4BMVWI9EwUALZJtcQZDywxqjANHsBqQcKCbEMnmPOvTQ01fvsZtKPlQH47Bv0iqJ
	 h9rxrs31KI7B0nK7bWpL8d/l7CnXMmxwDwv4e9loJrplv9b5yGWXKzQ/MSgomzgLBgxTI
	 iMC5RtcdolkmDKnKih0X494yJobPrbn1ycpK5nZDFB+wM7YAUDioKIpMjIic4Uiswxr0Q
	 7bjgP7WsR1ZI6L0XTqeREYVS5sC/AKmt1nFhvEvq3WZpTj7cebnAjVniSwSUTVfQGpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459754;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fIqhj+O6y/smeL+V0+rXQRpO6E8ZU3+BVpVMiUWAO/k=;
	b=xKPq2eX5yVKRAiWzuN7qoIpcprrX5gl/0yZlwLr1EMh2+65TSGpkTKe8OLlMql6N0DWy
	 UaN1C1/5tIRGO7lojUo485XKVWKxa7+xY5Wlmp2taaxXy6amRQOLnkbaamWWm2MmSV27E
	 N696ENY/sK1vWlRm3cI1Xb4OJC43FHEygfULByYeqJpn/55mOiROYLxtdoVdghBLdrxBH
	 dncLwiBAixqyQOfLp/V972JbxoAz8G2Z9qky/RhokidGyrjR6ZK28TGi/ygCernDFPSHJ
	 tmzzQsmkP/CdvJqyP0yySqbTfDyne5yf9oA5xiVWMiQIuuZLNRjOrRemGFSP2SgrgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hMyrl7zK;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D323606A31B
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 01:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D323606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hMyrl7zK
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 32A0B40E00E8;
	Tue, 20 Oct 2026 01:29:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6m933wAgKqxb; Tue, 20 Oct 2026 01:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792459744; bh=fIqhj+O6y/smeL+V0+rXQRpO6E8ZU3+BVpVMiUWAO/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMyrl7zK8vn3BRxJ5siMJZ9dgVt/ist2ggRRnhcznD2v4q9mQ+LP+uZxjAntElYpy
	 L5TOleI0Ppx19biyjPfA9tmGNulUvUmV8N0zsfuPM/vYsJoiNRUoRd1gBLZQt5ikfv
	 +NJDmceDKkoSI5B1fx+ij8UktCG2NJs4fyWApCZIfQKGM1Tk9W8SR/HPyUPIDnDrxa
	 f6RbaKGBd5L6pF+6NSUIW6o1dQkPsNFDqytnTQ4OKkdxP7sSBgA+UFEPYrmZ/OO4EK
	 cU460MeLAB+85/O233BHhdd+egn/pkUX/eOUoGDbRUqjnxZ9N0oVUKFWqJQrq1NOAB
	 xXFdE8jVhZI7mj3qIVIpklCBH+L/Lqk2nplkjRtN09V4L+UAun6Bsls+vR3QIoaO3u
	 Si/8DhgRTdGoOAi0GrXDWEFRQFCXOksbaP2ufAbDRoU4W+GXpKvyUivfMFotwfI52W
	 cja0PK9sJ/PjcyBW6eptAdx7odedDXwHuvsPPWpbI50Ugz64y3CNTL4iPRlzfAZJhb
	 m8aT4PO7Bnol8EMav0rqhaDJf51ac6yD+9FHrayuOt37nRlVfH9uq6pyQED8iLw+k7
	 5G7QTEkR3Tr+62R/MDLM1+Pv2XGKwhlNj4kijS+h9HbrQDmmL3ERn18qIDRnSKrjeT
	 s1fAgkTP01Y1bICQGVTbHYWU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 81C2340E015B;
	Tue, 20 Oct 2026 01:28:47 +0000 (UTC)
Date: Mon, 19 Oct 2026 18:28:44 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sasha Levin <sashal@kernel.org>
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
Message-ID: <20261020012844.GDatbDzDp1zC0NtI6k@fat_crate.local>
References: <20261020003238.2823758-1-sashal@kernel.org>
 <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
 <20261020011140.GCata_zHOTeTXLdlr2@fat_crate.local>
 <atbBFRU1Wm94oYB7@laps>
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
In-Reply-To: <atbBFRU1Wm94oYB7@laps>

On Mon, Oct 19, 2026 at 09:17:09PM -0400, Sasha Levin wrote:
> I'm not stopping you from dropping it :)

I'd love to.

> Any objection to just taking Rosen's? Maybe with the tags I had on mine to make
> tracking easier?

Thanks, that's nice of you.

I'd like to use a trimmed version of your commit message because it explains
the big picture better as to why we need this in the first place.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
