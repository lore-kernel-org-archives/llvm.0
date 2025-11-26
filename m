Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E2B148850
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 00:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764116611; cv=none; b=XtAb6g5ospPBSCgEZZKLJE4wqZ4D3ffjirS9pJfH+R+E7wMRTNgtSi11px3Fss6VZcJxTfSmOaWKDHrz9loDWNEEWHnXyGDWp7xMKBJZKYnUQNVURsSk36laGyCpkAPFdjE4DIAGNY9s1wFdmcZI/quZBDsvRf/Re1/UPoxhQo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764116611; c=relaxed/simple;
	bh=6Aw5yE62Uc5atKKXoEk/zTmr4Unh5SymIEPNz4XYEUY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYhHVYFUMNoWMLnqZ0o1QY43/zRDEGLEIODpIgb1/GKJA09+eph8j3jjNRJcA04MP199o0PWGPYODxk62XKL+fkGVE+gsN3Ic4FaoPbYKK5DnvnY45/3Hlkuh7wQmjkhyt1Ec1fcmBziD89oQ4XNaAh/jE69Grd1MkBSSVbbdNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDkglMKc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDkglMKc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA5DC4CEF1;
	Wed, 26 Nov 2025 00:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764116610;
	bh=6Aw5yE62Uc5atKKXoEk/zTmr4Unh5SymIEPNz4XYEUY=;
	h=Date:From:To:Subject:From;
	b=aDkglMKcLn7f9IkK5hKladgszOX0G7TbPSWUuT1ikfRdAYAbKb10Ti6uYQV8F28ks
	 a1Nf0VLdpgFBhbRveZmph17GnqPE7pfp66PdFpNRMxaZHYK4K6ULsqYDN52vt+qps6
	 mSVqVbUvxk0HCMrVnbQEWFxZyN2NDgojqMzjRmV/slujAYEzF2gEx4vKgVWU50odFh
	 IVhQ4lqo3HAMGEQ+RI9TiH3hiHHp9+5YWelqFNU+xnJFG/dlxMBoQA761UgUuYvJqH
	 YpBhbOqRUKIuojtA2mkarrtRK/HR9XcTC+5I19WEjVxbxwx7KAuGPD8yQj8Lxq6cSm
	 R6X5iVFTzqVPg==
Date: Tue, 25 Nov 2025 17:23:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, arnd@arndb.de, tstellar@redhat.com
Subject: No more ClangBuiltLinux meetings until 2026
Message-ID: <20251126002327.GA1593195@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

Just a heads up that I am taking a half day tomorrow due to a prior
commitment so I will not be hosting the ClangBuiltLinux meeting. If
there was anything pressing to talk about, feel free to comment it here
or find me on IRC or Discord to chat about it.

Additionally, I will be in Tokyo for Plumbers on December 10th and out
for the holidays on December 24th, so the next ClangBuiltLinux meeting
will be January 7th, 2026.

Cheers,
Nathan
