Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA82DDF67
	for <llvm@lists.linux.dev>; Wed,  3 May 2023 19:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40230C433D2;
	Wed,  3 May 2023 19:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683143765;
	bh=inXYG25XNMxCThfqdns/inVWUVeH622IrEawgu1mqtU=;
	h=Date:From:To:Subject:From;
	b=evnu2ZYiJtnIgpBfj6NG9CPF1dRdsWCXB2Ddsz4zQ+HJcH6ibqW80/nOmO2DLc4h1
	 +RkV5edJxfZiYw9Uvc+kRECVxLVY4jeu/FEtF8+rFDbMOhXTPgQtlssoqTsLToH/+9
	 hbZYqmJUsIAC+1E1etNt6u0M/TqE8mqDHhOm889B6VrdcSjV0R+kkjyGBaU9ieyBru
	 GoRZ9gFlqMaltumg8NOpCywfU4Ddw9RUywvN/gk0vRJ5poB296BJL3Y+obWNJgCe9/
	 pRdIJuuDuLniyotB9QpuhDDNzq7co/g8+J2DniZ/E8/oi7x+LJ8cRUTBbYqwa8+Bpo
	 XET/QBVudkYcA==
Date: Wed, 3 May 2023 12:56:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 16.0.3 uploaded
Message-ID: <20230503195603.GA262195@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 16.0.3 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

As with 16.0.2, this release includes a fix relevant to the Linux
kernel, which you can read about here (thanks to Ard Biesheuvel for
helping debug and Nick Desaulniers for the fix):

https://github.com/llvm/llvm-project/commit/012ea747ed0275c499f69c82ac0f635f4c76f746
https://github.com/ClangBuiltLinux/linux/issues/1837

This issue is not super widespread but as always, I recommend using the
latest stable release of a piece of software whenever possible, so
consider using 16.0.3 in lieu of older 16.x releases. However, I
have shuffled the tarballs to a subdirectory to allow older versions of
these toolchains to be downloaded with more ease, which can be helpful
for tracking down regressions in warnings or code generation:

https://mirrors.edge.kernel.org/pub/tools/llvm/files/

Cheers,
Nathan
