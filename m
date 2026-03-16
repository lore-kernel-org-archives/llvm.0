Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A1034B434;
	Mon, 16 Mar 2026 23:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773704241; cv=none; b=tlEvcdSypxrfgyKxvCjsOY+RQT2UfmWsBKAPE3avk1zO2BMpbhNWPNH6jQqlw/YMAsmkViJ1XbFvRvkIorii8ns0v1fzXDqP34kohdW/oRdZ+pZ67OlAwICQbOl8B3c+zX9xXvl33F3ImScRu75FxQEEFrBD8Zx1jwUjD5tU5rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773704241; c=relaxed/simple;
	bh=S+lf83P352ONiWt5Oxfez1dYw+llENHgLdCSYdGltzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=meJLguyZFpijHIOp4PC1jiKkONGP3Uk5qA2w8AeyYRmkIi5xmNeBIyquWaDvLfRQDDHPdY0/rbVRLRvbbIOXn+HXKKinVTW4xjK+WkAKDU1nh91WyAW+7kcizW2YXWZGKxwxWs8dgXWze2dEtktKmDCs6ArfhsrRi1Yimla5bg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgxOcbYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgxOcbYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD5EC4AF0C;
	Mon, 16 Mar 2026 23:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773704240;
	bh=S+lf83P352ONiWt5Oxfez1dYw+llENHgLdCSYdGltzw=;
	h=Date:From:To:Cc:Subject:From;
	b=KgxOcbYdV505UOsLjaZ7P4Qmg0qu3Hz3EO4NxCNS/k61ra5gatuYtw0ZB1SWH2PRq
	 RiSpbvyvLezGfH0VGkxEU7VkDD+G6Fq3xb0mvkuS7pyXgkaoEYFInKijwbjfra3Afe
	 EdANAeNrUsgcwSGS8AGMKNmChpNBgTqDCxeGdsg/yWQ3emjGHMbHNzfRWZlB9RmNip
	 JsmYLy2BPs9l0PhfG2kyxyehS8IavRs8y4/yL8gwYGVL0ApLd2OitP2wYGqt5LWZTx
	 LUHJqFzyjEmjyn7vNK2ebMPgTOvx0L1SghbzRAiH03VXNBuON5tUPJHeMBd+XW+Ba7
	 8nGODklXrL4MQ==
Date: Mon, 16 Mar 2026 16:37:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Apply e2ffa15b9baa and fde0ab43b9a3 to 6.12
Message-ID: <20260316233716.GA758717@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

Please apply

  e2ffa15b9baa ("kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang < 17")

and its follow up fix

  fde0ab43b9a3 ("Fix CC_HAS_ASM_GOTO_OUTPUT on non-x86 architectures")

to 6.12, as it helps avoid bogus errors around cleanup variables.

If there are any issues, please let me know.

Cheers,
Nathan
