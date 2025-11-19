Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1739A1369B4;
	Wed, 19 Nov 2025 03:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763523594; cv=none; b=hQxAPrPK4RZISNcQCpj32DSG3ABcYpzIFwr4WOLqjzz+udOqc+eOG6iA9D084rfC0qNXFMOPt8zH3lOyiXj4yNPiajXn6KLNwn94I8Rzx0Vle3K+0jAWzpbtM0nlb3BpizyicdBpntrnG6EK6Cq2hK6Vwu9Wx2sMhw9LUc/2i0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763523594; c=relaxed/simple;
	bh=Dr3pEJCW2f3bAqMvEUYOnRc2r5zqsq1+Vz+5plYEs2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3tNStb58sQvV6fbI7IWXJ4hdWvE0VcKlKnVK9UuNLhp2VXhVbwibACE39NtOGMAb93yIbzfPFtrLQytPggFjfwla5ygd48N+ueKAcbDlnCHOJL4egqGSbyokW+Hj5lniE/7wEagRs+fapjko+qdvJT/E3sn2vRDQ/YIVkfSXjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFRZaV9N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFRZaV9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DA2C19424;
	Wed, 19 Nov 2025 03:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763523593;
	bh=Dr3pEJCW2f3bAqMvEUYOnRc2r5zqsq1+Vz+5plYEs2w=;
	h=Date:From:To:Cc:Subject:From;
	b=OFRZaV9NKGAWI1iu4uiD8BeyXXkcYty1+BpuAZZ/z7v0tWgswdQ7pT2d9cMImH3CN
	 tRrVLp0IkMd02CxlZCVG8tM4BV7jpR8hHSnWMlMiRmYY7PBoCGC+jS2F3tUc8sM645
	 hyOeEYSHUfNGmWl2SUu9WB0FlzeQwRS+dMpsCORZe5wFT2j82+PhjcEbOZSBAdZ2nq
	 1cBMd6Njk4gZ5fgsNrs6W04tDsJb/rWBPHiUaY2yawYO4bRUbwPJuyH4GSheCkkTCI
	 DYWQal2tf1ts3dg9lB8R/oFgURGnPj+N8Q3Ngrvqpf+2zO4KWmTKjpmiA/ymT3hS0o
	 qreU3u+lydJOA==
Date: Tue, 18 Nov 2025 20:39:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 21.1.6 uploaded
Message-ID: <20251119033949.GA2155408@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 21.1.6 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 21.x
series is no longer supported.

Cheers,
Nathan
