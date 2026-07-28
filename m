Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF333AEF4A;
	Tue, 28 Jul 2026 23:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283123; cv=none; b=X1XTPgNpVHu83PujFwgvSYnGYM4+QfY4Z+Glqpe/kITvLUuxzMyhE9y2bbrfOkn/h/7xkp6XZhZsaDn9xeO55bbuhBcYTnys8WEVRUApQKz8bpYfUIlgjd1nsT6mtOcwgmajHXkmB2GwiZGhkhMF/raIRV05+Z8aBFr66z81Qck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283123; c=relaxed/simple;
	bh=piLTxRNcGLoVU25WBrpfaJMmJrRMcV+iD61B5qMs3qM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NxTwY//Hbs2GMRLpL8BwuwWWt1i8kXUeY4QVk8uV59RNkzEHmAcaxVIRmt7cxdZtIcer39SJthocB2Vbm/BD5Ffyi6hH94OVTHlQNkox0IVbg1DJSsUjuK3LL3IEqRJEtKOoMsljuMgiWW6uRoDoTNAm8MZKOCiZAeqOIzMsV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8Urtphi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8Urtphi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A906C1F000E9;
	Tue, 28 Jul 2026 23:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785283121;
	bh=piLTxRNcGLoVU25WBrpfaJMmJrRMcV+iD61B5qMs3qM=;
	h=Date:From:To:Cc:Subject;
	b=i8UrtphiWAYPoU8G6Bw9Ip4eS3V4naVtSRYCyf/IiTLvg9URHBrwARYZcjFmMwW2A
	 RPHLT01xftZhoi1T8K8Yyn6oSmOk3yhzGke87oiTcQiJdRHgy0HAqyEVvxbH2BJWmi
	 NMdek4pPN95i0k5wHpa3WBAdG7EA+Og3r1bETSO+glc+bnKo+kTtKjZSgz/B5jVbVI
	 hiViDuFxMfxq7G8eT6jAWZvaWbDu9x+NNOjPacZBOnXLC+HRYgFK33yChvDy4gYcpc
	 DPvdbyK4V13xL/KslsjkScEe4Jb2zwpRYW7PTLc+RXX/PMcLY7sBDkZ1N/RgYPp1mm
	 RDE0F7MJ6UPbw==
Date: Tue, 28 Jul 2026 16:58:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 23.1.0-rc2 uploaded
Message-ID: <20260728235838.GA2745605@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 23.1.0-rc2 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

This is a prerelease version of LLVM, similar to how the Linux kernel
release candidates work. If there are any issues found, please let us
know via email or https://github.com/ClangBuiltLinux/linux/issues/new,
so that we have an opportunity to get them fixed in main and backported
to the 23.x branch before 23.1.0 is officially released.

Cheers,
Nathan
