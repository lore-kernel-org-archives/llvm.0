Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490A12DD8E
	for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706723088; cv=none; b=eKhBXdmVvJby893r7F5gwWPQm0FU55HDYNuRhuyf91xwpJENaItui+rgrfsBmj07gmCIfn5YBw5aJmnRVa0pyluPJXgoW4O1+Kh7lPtXEzbU03+reR+H0QKBogiYNEm3X4FPUGMcqZhzBEl9QYPwdv9byLWTOcPoBf4Jovs7gmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706723088; c=relaxed/simple;
	bh=WvkKnW/2x5hzQoYwyK3MOGtGpCsKUFdHG2PCVAZyWRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OIcQu/RqKQ7EjU79+rip9Tx4aC9GkpEElwz+sLWb4NhDy8Kf0E+Kp5tF53VfQE3uDFeLW26YJeEjah1PHq+lQICmEFDWNBcaVr5YQ+z5WXg10OfaCf8dm0QDbAXeY7fZ1Sqbo9vyBMwqOxbABIWdfydhqXk20pbHhYEq/QuZjfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX3aykPI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX3aykPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF5CC433C7;
	Wed, 31 Jan 2024 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706723087;
	bh=WvkKnW/2x5hzQoYwyK3MOGtGpCsKUFdHG2PCVAZyWRE=;
	h=Date:From:To:Cc:Subject:From;
	b=kX3aykPINe3mHlQ+88AyuBclDKbVa5G1BUn8JAGkpSCb/gVJOwwHL/cvXOo+UAAVH
	 TcsigavSd7ZP2kmRy8WDWbl05r5YjnlrQai4F+JRKAri+AbPJheIsYBuMxnYazjsKW
	 xwqzpSID45AM53+KnG9nvDLPZD95jz3tye+MJNzrQCbaGl1qElHptyN43hcv+pbxOH
	 0eYrfkeOIXGq2qhuyTrWAsfsMf9VGZiiiz29U4YLOU89NzdH2Fx06kr6jFuaAHkFZT
	 ZYqfZ8tudVH7e/d7a0YAyLHNExCfbbuZIoaWevCb5CMy7BzOLKcw7Wm4eMarkKM1mT
	 aZJxzpwFeMjhA==
Date: Wed, 31 Jan 2024 10:44:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: sylvestre@debian.org
Cc: llvm@lists.linux.dev
Subject: LLVM 18 -> 19 transition missing from apt.llvm.org unstable
Message-ID: <20240131174445.GA535345@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sylvestre,

I noticed that the main branch's transition from LLVM 18 to 19 has not
showed up in apt.llvm.org's unstable distribution. It seems like the
last build happened a week ago. Apologies if this has already been
reported or is already known.

This caused issues for the TuxMake folks because they use unstable as a
base for their RISC-V container due to the acceptance of RISC-V as an
officially supported architecture there but Bullseye for all other
architectures, so the -19 packages were installable in Bullseye but not
unstable.

https://gitlab.com/Linaro/tuxmake/-/commit/03a8658a53f899f0d92307a47fd33c7b070dcfa6
https://gitlab.com/Linaro/tuxmake/-/commit/f684ca4ddc9b655e705f5ca7a3fa01efa55b60f4

Their workaround will break our CI because we test RISC-V there, so it
would be nice to get this addressed so that our testing does not suffer
for long.

Cheers,
Nathan
