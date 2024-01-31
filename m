Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEC138F8F;
	Wed, 31 Jan 2024 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706725821; cv=none; b=tVnXjrWFaRQeZ5XV0LY9v6/A8/fghHMeLD3R73iLPD23AE/L4PzbMHOYGu7edepCMu+6b1YLI1O0IlPcs7PQzAT56t9qrlaxOHYQBW5X9o5BEVqDhLDylfWdEO1+qQyY5ZcqHc8QfzBcu9dOGTTTyZgHzi01QgTPP9U+85nQLZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706725821; c=relaxed/simple;
	bh=r1Ng7ZF/2p6XuLx2B6gkXcy/kzt01Tiqwdn97xflGWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqEsTc2pzpOUlLABwisOJkg+UjWRp1lxJ5J1SjhdU7jv+Z7+mLGWucV9tOKdK6OuMvSaVX2rYWqMoCCCXf++L+J70YLju/l4wc8ykI7gToanuscrUOxdeKhNqPTSra4hKWshcqIkoKSbhuQqWHtkK+O5aTy7sb9W4tfOAEB8ui4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LWH+Mshb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LWH+Mshb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D212040E00C5;
	Wed, 31 Jan 2024 18:30:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id S2T9VafLywYD; Wed, 31 Jan 2024 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1706725814; bh=/+NtwTeM2WJJmwO5s2FNbBwsFJel7210irlJXEyfKSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWH+MshbXOQDOug2oC0/qmgLf9e0lWP6Acf6uWxiooq36saxvU3ZxVpGm3/EAXg5a
	 TGqBwUZQWx5d6HpUAm2etuL2sWfz2FmtIG2jnxwPsrcBfYGfiQIUn91gUKT4cXnFXQ
	 CjKULTC99gfVESdzx262x0zDY/0JsAZo67ZLV6MifBHQSY215jexzpb7UledkVRL2w
	 GGE5QRV+a3MwdqWRRImmc/E4JqVawFpQjydgyDF3ueCPFLqay1oXQ6fnv+N/6dAnXT
	 4loWAhFCFIbgGm3aK8jCz/QrRSuOqtUfrIbFb/kT51+iCCfSEOV+BCABMgH3FChcRc
	 rkRVaowWvfbC1FbRdaEVMa3jb6UmHIOXPf9W+ky5BK/j0xvRmk43lfSJS3F2RHeMNH
	 WIzT4g31JKZWXVrPDwX72MMA0c74B9+J3hsVMu5Jd31qDIqE6v8jeXJhEYo3BE40rD
	 ol6cq+SjP76XPOZN8mZWCn2Y01sbWrkSMWBQJnoBPa2I5uwdFbN8GGlEiYDsTZ3RHQ
	 ntmSC33VLC3P/NjKwslRjzL7auI5Tk59OYjV3and5arLRAvKtRNltgA4pOoERbodrP
	 W/wiQrtPl7g0cZv2YgraIDNVSMPiR1x20l0lfWO9jHAR+1vKP43bYgtJuEY0aawcjm
	 YJ4lvT+zcVpGm2jhLpD64TK0=
Received: from zn.tnic (pd953033e.dip0.t-ipconnect.de [217.83.3.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7F10D40E016C;
	Wed, 31 Jan 2024 18:29:50 +0000 (UTC)
Date: Wed, 31 Jan 2024 19:29:44 +0100
From: Borislav Petkov <bp@alien8.de>
To: Jacob Xu <jacobhxu@google.com>
Cc: Kevin Loughlin <kevinloughlin@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Pankaj Gupta <pankaj.gupta@amd.com>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-coco@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>,
	Andi Kleen <ak@linux.intel.com>, Adam Dunlap <acdunlap@google.com>,
	Peter Gonda <pgonda@google.com>,
	Sidharth Telang <sidtelang@google.com>
Subject: Re: [PATCH v3 0/2] x86: enforce and cleanup RIP-relative accesses in
 early boot code
Message-ID: <20240131182944.GJZbqRmBN_KDgK_nmB@fat_crate.local>
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
 <20240130220845.1978329-1-kevinloughlin@google.com>
 <20240131140037.GDZbpShX2b0elXlqDA@fat_crate.local>
 <CAJ5mJ6j-Vw2P=QLK-J_J79S35UggvZPtm5sia74=enR1qq9X9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ5mJ6j-Vw2P=QLK-J_J79S35UggvZPtm5sia74=enR1qq9X9A@mail.gmail.com>

On Wed, Jan 31, 2024 at 10:16:55AM -0800, Jacob Xu wrote:
> We're interested in fixing SEV-SNP guest boots which are currently
> broken when using a guest kernel compiled with clang. It seems like
> every other user of SEV/SNP linux kernel code uses GCC to compile the
> kernel so they've avoided this issue.

Lemme give that a try here.

> E.g. Google COS uses clang to compile the kernel and we've made do
> with an internal fix for a while. 

Which means that, theoretically, you could forward-port this internal
fix until the issue is fixed for real, I'd say.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
