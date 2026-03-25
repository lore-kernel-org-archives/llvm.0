Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC211FD4;
	Wed, 25 Mar 2026 00:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774397293; cv=none; b=QpXAsFFWpwQVFET+LNPcPbyIg8BgepOfN1oxCGDUmV1BrLOtOZna7oVO9Rfb6lPKY4u0AQBdG49Wi4bPVYWaIVK9sj5EBU1VIZ/Z4aEvIGD3x+pvJhf/hBSmG5tNT1hJWoeYtM2qAGWh3dorqYAPy808GZDWDZ34liMEfisoasU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774397293; c=relaxed/simple;
	bh=prmG8kVezT04YomfLowpkIDBeIB7Rbo+BkENBHE1SDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NuL6LIHb1GlAcxkeWfs3JRRjW1UNuoMmbrji+HRchbjToDGEw+hFjgAc6TBBtu/c9y2IfKKD2xdOMvCxv9re4/ys0f3LToqkcQuCEmIAd3oIeAJEHuDvF1ZQ3BXQSxqYvAwjwos64NmGIXcNh1UVAWbbLRErGwKBOSewve0pHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbWD4OS9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbWD4OS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFF3C19424;
	Wed, 25 Mar 2026 00:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774397293;
	bh=prmG8kVezT04YomfLowpkIDBeIB7Rbo+BkENBHE1SDs=;
	h=Date:From:To:Cc:Subject:From;
	b=TbWD4OS9zHlKhU9GIH/SahDL3T1/dnfASKzML0rvj7rw/AGjw6xM6L1UIceTVPzcx
	 3asV6BrW0y6SMPxdqUe9s628hKUBbbFQ+7fwKrd2sQyoMmi1ZwDj5r+CxQ6ictt9VR
	 mhNwHR1R7oNfXLKFeKZZmRxobIDzR7/PQzhPw2pEDd9m6CQbPag9Gv8mLH1QgDuoCZ
	 GVAhv7iQ4NUsBG4IdnW98ak1XLV9dCg4L5ZNhddPHKtFuNIiGqyf7/54F18zAUavfW
	 MteNO3cREPlABLug3JGOewXWJrLr7iuLeZQxPAuhZPR83FbSswjWfK4vyJv61yZ6vk
	 CR+rRBQ75/gnw==
Date: Tue, 24 Mar 2026 17:08:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.2 uploaded
Message-ID: <20260325000809.GA618985@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.2 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 22.x
series is no longer supported.

Cheers,
Nathan
