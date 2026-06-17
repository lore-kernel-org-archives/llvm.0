Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066753A1C9;
	Wed, 17 Jun 2026 02:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781661644; cv=none; b=blE2/lqUbdw95z38HExz/onzWQ9cjxifBvYUeVn5PAL29h7D0t2VwIJGCDCZliMDgwx+A48NRJqfhnM1fjwTXELSDlmsGfKj9+8onIVTBgQDlUxqAWIEOQQHYbTz7wmEQYht2Jzur24qzyvxdVob9MVsLS1HXYBj94ZDD8ozBfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781661644; c=relaxed/simple;
	bh=qXYAOQqyJyv+LdyAOJhdtjhS5PzBpPPQfc4xPBEiLnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tkRP4xBYf2XUVU4n4Rq9/Xv5L5I+LQadYuv/qhJfcKRRSRouxyZXM2ZpU/aYqMF1nZ5NnXRayQO/09ZKvMJ97Nwuq1QuU7ouwdTc7+yEMcQ9KOdm2equl+d55GRrF89Mtda4dS/WYvUt9Awja64/vK3UOeYYToYTmER4kpvityc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JE2ejaDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JE2ejaDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62371F000E9;
	Wed, 17 Jun 2026 02:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781661643;
	bh=qXYAOQqyJyv+LdyAOJhdtjhS5PzBpPPQfc4xPBEiLnI=;
	h=Date:From:To:Cc:Subject;
	b=JE2ejaDdUqnAQPk0/k26glhzuW8OVNGZwlz3PtS36L/j4oDLKr2q4XQ0ub/vNMMjU
	 9zIWTRmrcKu+q6pBpxdWZhpKjXPOMSu9WkItpiGLgkTt0/VmEWDIbmsE+ytw8G+laG
	 q+6j0QctDiKlZmg2sIU6Rlc97Kzo15OsKEL4dpADPkcNjUICOXEJKkzq3w4aoVY21U
	 vYLoD3XD5kHCUetoLLzF1sBW28q8szQ68BV20ERMWUSGBY3ZPzfqKYCSXmGNobV5XC
	 SG8lMgJh2AaPd+jh8TmpGefaDDK6Ph8eyXLrCZ1TC3qsUps3s43Iss40oeToaX2D1f
	 u6/dED3/M2OHQ==
Date: Tue, 16 Jun 2026 19:00:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.8 uploaded
Message-ID: <20260617020040.GA3268077@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.8 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new. This is the last
expected 22.x release.

Cheers,
Nathan
