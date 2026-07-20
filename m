Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC70224D6;
	Mon, 20 Jul 2026 01:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509431; cv=none; b=QyMoUxZrcUkmcv25mifWG1HUJvfH8ozzFCPW5g1hny5kIUzsYDBTVCCclrVOCTAwRd/JWYHira/y6GzZWsv02zf6xH+Miet9d4LnmtFCM4JcVMBuBWylM+RLXijJOarn3n/uqGUyG/WVTbANlFuKwzEUJCc2qCBeOuOafdqjgYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509431; c=relaxed/simple;
	bh=IQOVz/Guv3kGJk6n3n8vmWFtFS6gK84MpF77fN0+nF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eRwMKzvRJHF97UWaZO10bphUxwcRToH/SpjtnW3WuWyNi1Dv10wNU1ZSSxvemy9N3mivCPT8JKqRopaBMg71szqENqlQAe/TduHroVFO7qHsB5e7ViTAIRBGdF1tac1cX8nqTBPnIJl7Lj1ZbWKZDLZEWzxhVaA9cKkoesJTpmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIv/s//1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIv/s//1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476F61F000E9;
	Mon, 20 Jul 2026 01:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784509430;
	bh=IQOVz/Guv3kGJk6n3n8vmWFtFS6gK84MpF77fN0+nF4=;
	h=Date:From:To:Cc:Subject;
	b=HIv/s//12I/oKbDtAvM82I0vWnK6Ao5FK5OHfvIoj1Q5wdzpNWavlXVYj/rdWAH8N
	 ojysEig9zaoJcO6GsFX65ytZ2A1F+dCsCCXWpLYpoCYYAUOKd1ZuEt69Oi/fX8Mn95
	 DqAcDIkUk9kgmRmSdqQrq1xlyMYjNJk3ZyhtZloR7FV+gqpYESEMWMKq/iLe5wlUnq
	 Nsf57ig4E1aHG/7Clw1COXErcFERzvre0eHN1ZhdMikm9RpgBXv8I4NBI9B7nv7aCw
	 bj1xnrzlsKYp+kaQXeV3QVpWxaDy0pzDdlBa/HYsIV4jCbIYSNb58uEhdpj00RfmJZ
	 wPOi5G3qwoPQw==
Date: Sun, 19 Jul 2026 18:03:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.0-rc1 uploaded
Message-ID: <20260720010346.GA2880389@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 23.1.0-rc1 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

This is a prerelease version of LLVM, similar to how the Linux kernel
release candidates work. If there are any issues found, please let us
know via email or https://github.com/ClangBuiltLinux/linux/issues/new,
so that we have an opportunity to get them fixed in main and backported
to the 23.x branch before 23.1.0 is officially released.

Cheers,
Nathan
