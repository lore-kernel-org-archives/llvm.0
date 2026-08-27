Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF041E5B68;
	Thu, 27 Aug 2026 19:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857477; cv=none; b=QehTrOJ/RIBCyZtkn2wHIaxR15FgYZwIW5qml4hOGhmI87gjJ6juf5H4DHzi5L2yt33LDfs1LP4cX6m+zwHcnEy9ccDxoVB2vzh/pz5FEK6Yn5C1cqxoQ8yvm2EIVR+gQ08HrIihpUOEOw2Kv7ZDwiY7sxJmYxKH862SYtByCAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857477; c=relaxed/simple;
	bh=kJ5W3L8T88AvkH5z2yi4J/gsWwrkSNRt9CVUiL+ovOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tgUS5fGIkl8LZ1Mn3KYmw9z7O9rFbrxlWqduEJj6czv+8+9qq+wOpWBaIa6UOH96oL2P81UBX/nE1xGAAM/pjA9GwnXGACHT6RxKaOfKeA7kNnwdO2E1EcViobb1KOrNsnuN1U+pOjobGJwXm2Ip4jscWe1Pf2cDDJmKN8TylQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfKGuWdb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfKGuWdb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F2D1F000E9;
	Thu, 27 Aug 2026 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787857475;
	bh=kJ5W3L8T88AvkH5z2yi4J/gsWwrkSNRt9CVUiL+ovOc=;
	h=Date:From:To:Cc:Subject;
	b=WfKGuWdb5cLbDPpTAWJAgTr0RFRBxOu7dg41e2c4FJy3vEl0HPUxmj661ZWKo0c0l
	 gmpy50cNJ9SR68Uu4Oin7kcVDyBLzNK/JCaSb4BGA9y0aH28sOoKUbYzTD3BA8eHV2
	 VgzAyvmXLF9emOB1Fp8CL+XixxKJnPCCka7J4ANkt7dMzoMCOBeSWFr+kfkEucSXI2
	 NzeBeNFydY/7IpGtid5pPD/wfOgAzOM7l4T0AeEw1Xd0LzbH8XODYRLxQ7N4fqaavA
	 YFwEy2yLVrGXE6l5+II6EtkxYqW4SuTOLDUDHUxDVIh5dEW59RF/FunUDv+9Rw9Ahv
	 4btbQ1GEILaMw==
Date: Thu, 27 Aug 2026 12:04:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.0 uploaded
Message-ID: <20260827190431.GA1817346@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 23.1.0 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 23.x
series is no longer supported.

Cheers,
Nathan
