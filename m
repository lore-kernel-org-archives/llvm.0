Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D333C0C;
	Fri, 26 Jul 2024 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722028349; cv=none; b=CaZM4hC5+qFs8jLS333QK2s8daweQxmB/t8hVwJWaFP4mWJdA9gKfrJd4bPMHvTV2PDPDEQ2dH3wQQpLga18DCqBgqHlUDw5gHckQjiZ8Tl55393SMy4YGxGqb4d4wKOopPDsBQmGcJD4VoOa05iIiA2wCEyG+oXnVRggbpeB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722028349; c=relaxed/simple;
	bh=7/ETfGK3W22XLfsv/JMf4/FR+zSQseYsZet7fs/hBRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHChwarbIhwEedDOFExfBYGOwOHWZTqZKlcjrblj+vp+fiDBLBFa4Tza/Z7L4fFx862BhPiOH+RBXkTwxwtk4qySQCVBgzI7pseLxJk8OsHKJ1vxH4uAlZuJ7LNSwU3TTpYT7Ah5NvrPjPvBXIVR4QRRGutMaDiop2b3D7uK+Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JX4lWrhz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JX4lWrhz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C103DC32782;
	Fri, 26 Jul 2024 21:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722028349;
	bh=7/ETfGK3W22XLfsv/JMf4/FR+zSQseYsZet7fs/hBRw=;
	h=Date:From:To:Cc:Subject:From;
	b=JX4lWrhztt2lYlmfKff/a2WJfjzHncDx7k/gtMhizmhZrg3G/SlPkuJPkbPrs253f
	 o7DYeZvxPPB7jQ36gCUZ3S7uAWFdwL+Q4vvVGRCXPkC56pUYsDSuC4OTswGyQ3xuoA
	 L7qc2sR2QowYbFGPtk0QJZ/m+0j7QqxIsx0xjImy1OeuiPYA3hCGlfcbgYxw80IFFP
	 0f7Ouqp14cIXKa8X4raljZZKkaPYs3egGQonZICq8MKnsuPyGTuPwaig4LkJBioHUu
	 30jnOSzsQ9sIkoHUckoT5stprIWQ5XMHqu0kGaMrxmgBBDxOszCRmM+8RGH/M4Q9DF
	 eIicbbwSJUJTQ==
Date: Fri, 26 Jul 2024 14:12:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, ojeda@kernel.org
Subject: Prebuilt LLVM 19.1.0-rc1 uploaded
Message-ID: <20240726211227.GA1347002@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded the first LLVM 19.1.0 release candidate to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the initial
19.1.0 release happens.

Cheers,
Nathan
