Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6626525BEF1
	for <llvm@lists.linux.dev>; Fri, 19 Sep 2025 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758320889; cv=none; b=G/ah9jdt4Bf5bF8NQGRitNkY6kQUXnLkf3ILTSGN2dTzuMewA88eDIoWWrrMKS4Xk+jkwNfwsm0q57qwGLmRrCVCAyoy+MHcF7LqN7a8sHFs1v8xcss8VV/FIRuYwUuWCLOxxt0NQClSIJN449WBgsmIj0A7E6+KxnV95JISLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758320889; c=relaxed/simple;
	bh=Y84KteTHYJ4DAZ8QIqjiQleYtmkFVDSOiUlD/F/ayqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaGEqA6r33VvcxEPmjWOCX8vMaT2OT4I4zw8H3GK+D5ArUkoTwKmsFRlnKC3PR5dCe0+JR1DV3Qt+QtNkkgs6SEy0gsMnOpLYnftx/A5Moq2ZbhWsTNCKKAud+Mb5b0IA9RFKzzEDvLlOT4e+rU/8bq9GIqPyoRW5sGgFWHlRoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8b5++pT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8b5++pT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B311C4CEF0;
	Fri, 19 Sep 2025 22:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758320889;
	bh=Y84KteTHYJ4DAZ8QIqjiQleYtmkFVDSOiUlD/F/ayqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8b5++pTwDpYbFDh6mS5iqYWkGHN1t6Xtia5PUSoL/e9NMLxXXg2Ty9uHcjgzNR9o
	 DuJUHFeWkFVe25nvOb54iu52ojHitqvM+/9JZiVJDkK8Y6rn1rKvU9DCHkr+Htca/C
	 UVyHpXQ7lABHJ3p9HEaclQ1oShkL7r5pH7axcuMVI0L38vWZNROwU8bB1X9PlN6ckO
	 8BG6+r1hh0PNZWTJyw1R5Ax16NqMYa3wgpz/vtYGEOMGycqkqAJZYvfamSORVv0OQd
	 h2zR8Z9pMDSyjRO0XiNCh8S7Zcs/RmA9dZFVBB6wwoN/fRPIm+sWCKnfbdvTaes1e6
	 JngcGHeOhYxGA==
Date: Fri, 19 Sep 2025 15:28:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: clang nightly builds failing on PowerPc
Message-ID: <20250919222804.GA44805@ax162>
References: <CA+G9fYsJq0sPC+q6vLNKUgBqCGmmjDrfeP4R1-95Eu28FJRY_A@mail.gmail.com>
 <20230612185424.GA2891387@dev-arch.thelio-3990X>
 <CA+G9fYtX6YNqmz9vxJxa5cA5Uf2rr=RNM0nkoTzRpg79Azp2tA@mail.gmail.com>
 <CA+G9fYvmqz3nQ=Cgs=7J6vtRj=OhbNzgkLPmxxN+vOBTU=9zVA@mail.gmail.com>
 <aM071XHb5cppdEKK@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aM071XHb5cppdEKK@stanley.mountain>

Hi Dan,

On Fri, Sep 19, 2025 at 02:17:41PM +0300, Dan Carpenter wrote:
> Hi the Clang nightly builds are failing on PowerPC with the
> ppc64e_defconfig.  They started failing on Sept 11.  Clang is failing on
> PowerPC in both linux-next and stable so it seems like something changed
> in Clang and not the kernel.
> 
> Unfortunately I don't have ready access to the /tmp/vgetrandom-fef220.c
> file that was generated, but hopefully these logs are enough to reproduce
> the issue.

Indeed, thanks a lot for the report. I was able to reproduce this
locally, bisect LLVM to find the problematic commit, and report it
upstream:

https://github.com/llvm/llvm-project/pull/157206#issuecomment-3313700961

Hopefully it can be resolved quickly.

Cheers,
Nathan
