Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB616C941
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 18:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8262FC433EF;
	Wed, 19 Apr 2023 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681927597;
	bh=bMLoxOhWXVqY8Sas+obj9neqtDS1gz9HD3YT4tNYF4g=;
	h=Date:From:To:Subject:From;
	b=hdPyq+L2uovQ6bVoqiEOmg9Ogb9KC7nYh+j0FHub2G7yjvCHYEE7XDSAX4WdFnN1M
	 15HLIwOiXFbj+rM4Ju5P0LOTpk2sHgEs4UHjv4J2Mfb8f/Pw8YbyWBFcd6OkC/aTov
	 EIke5VVrHR3T9YhwCXR9Z1Dd7j4P+z7B/DfY18XEosANAJ6wAkKo/Q+W5PZfKvx1Mz
	 JM73RELtgbEOeeyGbxjCsvGBHQX542cKTz+JCARijSRRcSWDz7uZdqXjiRxca4pKec
	 i0UFsX3z9S+xIsqH+8dF3yewZp5TEPqOpNYwwYiAwHXQYGtmhOvQ86tEpmLG9lUDvg
	 ttsBucwsP/U+g==
Date: Wed, 19 Apr 2023 11:06:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 16.0.2 uploaded
Message-ID: <20230419180635.GA1965688@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 16.0.2 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

This release includes a fix relevant to the Linux kernel, which you can
read about here:

https://github.com/llvm/llvm-project/commit/bf80902fdd43eed5b7a4c401bccc0a06ceac582c
https://github.com/ClangBuiltLinux/linux/issues/1815

It is recommended that you use 16.0.2 in lieu of older 16.x series for
this reason, although there is a kernel series in progress to resolve
this for older 16.x releases:

https://lore.kernel.org/20230412-no_stackp-v2-0-116f9fe4bbe7@google.com/

Cheers,
Nathan
