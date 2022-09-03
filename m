Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4BD184C
	for <llvm@lists.linux.dev>; Sat,  3 Sep 2022 04:28:23 +0000 (UTC)
Received: from nazgul.tnic (unknown [84.201.196.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 388361EC068C;
	Sat,  3 Sep 2022 06:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1662179297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=CgxVGHbcD6eBLXY0Rv8tA3Z9PMAyTxATsYR3svKe7OY=;
	b=ZnwSSY9N+SjfnUMLmSNNXiiMfoCC6xe5ndI41dF/pnrKq5y+iOXVkImza9x1/eVvm7Vq6B
	btQI0n1TumNj7EfMoSrhKrr3I2IQ/IZAwdSGLGTJnM4HmmZ4XTTarbeEID+Z+g+ty3W9OC
	z16HA8GL3jtpTh5lF70Z/wz2MlBR21c=
Date: Sat, 3 Sep 2022 06:28:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Bill Wendling <morbo@google.com>
Cc: Juergen Gross <jgross@suse.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] x86/paravirt: clean up typos and grammaros
Message-ID: <YxLX5i0aUoe9zBsx@nazgul.tnic>
References: <20220902213750.1124421-1-morbo@google.com>
 <20220902213750.1124421-2-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220902213750.1124421-2-morbo@google.com>

On Fri, Sep 02, 2022 at 09:37:49PM +0000, Bill Wendling wrote:
> Drive-by clean up of the comment.
> 
> [ Impact: cleanup]

We used to do that type of "impact" tagging years ago but we stopped.
Where did you dig this out from?

:)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
