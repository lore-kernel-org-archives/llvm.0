Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0EC6E2A4
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 21:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="TJosacg9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ob0/5+i/dplkA8aeloC30i9UVjoXlmEru6XWrA4njrk=; b=TJosacg92BzELf3f/C9b2mNlgW
	JS58+N92PYhSO0HC8MeVwNSmBt6jQw6sAc15OuEryEYCON3dY35drua95BjcpxFZRhgwrWDM9L0FQ
	rLtzbAH8sFvZ+xSdERvnJY+pAXgjsXC2XqDzQIlWowfJsCuUjd0p6MdfSJiVaByK6NEep7j+nWzrB
	QItb8tPCpIv0T6LuGMJMVR9WWwXl/8NnCBVfGTPjvX10koJnCnQP/xzQurWEGA7egS/IpwgeE6SC+
	Ei5NZhfd3Rf2bUu9QJpTuER90O742ilR9Vn4GA11kYFRMsdzcxFUcsLFYLAPAN3k4X2vAL1tOrhH9
	V/gZQ6zg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAdCx-007TVQ-1R;
	Tue, 05 Dec 2023 21:43:59 +0000
Date: Tue, 5 Dec 2023 21:43:59 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, tanzirh@google.com,
	Kees Cook <keescook@chromium.org>,
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
Message-ID: <20231205214359.GF1674809@ZenIV>
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com>
 <20231205130449.8e330a26ecbed1f7b5ad5d7a@linux-foundation.org>
 <CAKwvOdn+VTM+LY6ALcgaZTL57JpiKt5rBPMSPNXsgS3MCENhDQ@mail.gmail.com>
 <20231205132452.418722bea8f6878dca88142a@linux-foundation.org>
 <CAKwvOdn=og6h5gVdDCjFDANs3MN-_CD4OZ9oRM=o9YAvoTzkzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn=og6h5gVdDCjFDANs3MN-_CD4OZ9oRM=o9YAvoTzkzw@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Dec 05, 2023 at 01:39:47PM -0800, Nick Desaulniers wrote:

> The tooling Tanzir is working on does wrap IWYU, and does support such
> mapping (of 'low level' to 'high level' headers; more so, if it
> recommends X you can override to suggest Y instead).
> 
> arch/nios/ also doesn't provide a bug.h, which this patch is
> suggesting we include directly.  I guess the same goes for
> asm/rwonce.h.

See include/asm-generic/Kbuild:
mandatory-y += bug.h
...
mandatory-y += rwonce.h

IOW, sh will have asm/bug.h and as/rwonce.h copied from asm-generic.

Still, includes of asm/*.h had been a massive headache historically
and breeding more of those shouldn't be overdone.

More painful problem is arch- and config-dependent stuff, though...
