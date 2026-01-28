Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878C8156236;
	Wed, 28 Jan 2026 06:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580438; cv=none; b=SHCYsEfsl4fhkruj8sY3mtrZaM/3KpPD83RpaATZTnzYEvz0OaaxCNDdcDeu6Zu46SM+fY/4+lu9jNyJJTZbSVHH4LuNKDP+LX70cci9/JaRGW99olVc0rXBp4Nn6TGyH28+zEsAE7eooRekAdvP8m9ebvfAu1Nw5sZtPX7hPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580438; c=relaxed/simple;
	bh=hacaL8Godb5x4Da0yMgMGbJf3wz2wqXEJzCEDWL98eE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aJmw54+NjA9xgVMivGnShkTE7vDm65ylzkcm1nxFzsSG1/OE0xMhkvCD9/wfEwD3H49V0fWbAGKDg6Jlh2owBzFSrwn1mSm0lqqdOgn9jW5LFRa6EGniIVLBpWaDwoEO6BnS1/3YFAWcQXjoCjgXAPK7uV+g3CjivOjMYcquZjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDvIRb5u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDvIRb5u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FC9C4CEF1;
	Wed, 28 Jan 2026 06:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769580438;
	bh=hacaL8Godb5x4Da0yMgMGbJf3wz2wqXEJzCEDWL98eE=;
	h=Date:From:To:Cc:Subject:From;
	b=pDvIRb5ua2AR9v+fmmeWYx6w+BId5UY9qtOCZgCZQV4RXEHrbvPu95aGwaCi/iw39
	 +x/XIoDrHw/sTWyJ1B5sO7V8hDaJqgO0X7IcwtY4Gl03m/aVog2S/Bf9moWIYFLKBF
	 9AkaTW2BznNktw7AYZXXLNgDFrLIXXBrVDX2nJg1VOtEyb7amka4O2QL50RAs4Baj7
	 juAjyuizc5jWCeIgtFrfhouP6KS/s1vqQ3WKH4lzuuxzqPUH03UqtLbuxL0Ow9t+CP
	 CV9Z/M7ATEMw6YrZ88LUwFuILWJ/GiXRbD1jPRNjIAGx8zgqLsczGJi/U5eZ70c064
	 /vDBGHy8b7RVQ==
Date: Tue, 27 Jan 2026 23:07:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.0-rc2 uploaded
Message-ID: <20260128060714.GA1181796@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.0-rc2 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

This is a prerelease version of LLVM, similar to how the Linux kernel
release candidates work. If there are any issues found, please let us
know via email or https://github.com/ClangBuiltLinux/linux/issues/new,
so that we have an opportunity to get them fixed in main and backported
to the 22.x branch before 22.1.0 is officially released.

Cheers,
Nathan
