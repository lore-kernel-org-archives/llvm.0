Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387DC1DFFE
	for <llvm@lists.linux.dev>; Tue, 31 Oct 2023 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrQJTcEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E761C433CB;
	Tue, 31 Oct 2023 18:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698777896;
	bh=9wGTy7Wt84oCiSWMImzHFsPZyAT+ja9sdl/yy3vYpYk=;
	h=Date:From:To:Subject:From;
	b=CrQJTcEFaW/CNKVu5949tBpPErqoJaFBYtv4VihHtBmViSb8yZbIYKYoOj7NHbvmd
	 6uBWMil+nWYxzd7pyLvMBLTJSA3/LEr2F+rGN8QzjmSnBifur14Cj1OMQ+fmIFDsp6
	 HdRtEflOpnH0LqAUAdw+SKqNpmp+B2IWff/Q3siqrL783YetHPATGWB4CUYzMSi0sE
	 8No4d9JrSnNt1oMqoxfZZTul92oc4izfi0Ke6i2olY/rViCwGjiTCuaFJ74ZCoooKs
	 aASQMNQo7sS23h1aXbBrrx3YVAIB7OrIrAWLiyBQ2cR0/s//NzcTKSbSz2y8QT9dtY
	 uZP4suqLs4OOg==
Date: Tue, 31 Oct 2023 11:44:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 17.0.4 uploaded
Message-ID: <20231031184454.GA1258100@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 17.0.4 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 17.x
series is no longer supported. 17.0.5 has been tentatively announced as
the final 17.x release, barring serious bugs being discovered.

Cheers,
Nathan
