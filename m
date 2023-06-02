Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC51332EE
	for <llvm@lists.linux.dev>; Fri,  2 Jun 2023 18:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34B4C4339B;
	Fri,  2 Jun 2023 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685729101;
	bh=5soD935rIUEaVUUyAuaL2xfQUYxGKk9PRg0iyd9bILM=;
	h=Date:From:To:Subject:From;
	b=c8iT3i6TA0OQU1sd6K6H/Pjm0hnN6t7H/PKIXQWwHjiFrVFv/JAKtAOITtD/JLE8R
	 WOPQpA3i5BAnEo0m/wRhVvfsLQEfolnbCEA/F9b3gBqshhyw+ntSfoZX0Zbdb3q7/a
	 D+W9jvn8xcA2u7AlnKEhMlgaVpiXwXh5oTfZ8vqhQxBE41TWrOAEsOL7zzGeSFrH6S
	 ek5/STn9w5B/j/KlFsYc7f1EoYWx9Jc+/V6QLbyfZadIiOKNyyGsAqIOqfH1i2QAVN
	 YzzJ/3mTP2DfkJnBo2JPmz1tfENBLIaQRQkgkysGVysyxKBwwVOmUYwE9wFDYlb5BB
	 IDDL5dF/jAYPQ==
Date: Fri, 2 Jun 2023 11:04:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 16.0.5 uploaded
Message-ID: <20230602180459.GA574022@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 16.0.5 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

As far as I am aware, there are no changes in this release that strictly
affect the kernel. If there are any issues found, please let us know via
email or https://github.com/ClangBuiltLinux/linux/issues/new, as we only
have one more release in the 16.x cycle to get regressions fixed.

Cheers,
Nathan
