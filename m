Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA02285050;
	Wed,  6 May 2026 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049655; cv=none; b=tAezunyx9u6XPyY5z656Eyz9HJPdvr/FNX3zjdHYe/Ab/NcoWuAWLycagkKf9LYKYN4jdrF0tJ5u9Td8OjLocZk4dLzFbHCQ7ZeecAiw4AGKmrgbusQmcghdkSj/mlVzd6R2Hx9HkxgRCloO8gWAOgIH8lWtG70gD45vsfaGl0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049655; c=relaxed/simple;
	bh=TARYk5nbmxrfjZnTp4mYnpKwPp/SiQnbgV/ZJD746N4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inkkq27Ked8kdddgTTiSK8dTwpu/0RQz5kQlb3xN7psvF0+/c3R9CV2Lr+UWTrArB8B8AX3PBO32/UR9gq4GWUcWAfT3O/8m6KouZypd+s5SP+IkWlVHSMBOOEQVKIjmFb5Y1Csa4CrHf+mtZDWhMnr9bjpzOCeDwRv50q2bCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmRl9CgS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmRl9CgS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31929C2BCB8;
	Wed,  6 May 2026 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778049655;
	bh=TARYk5nbmxrfjZnTp4mYnpKwPp/SiQnbgV/ZJD746N4=;
	h=Date:From:To:Cc:Subject:From;
	b=CmRl9CgSHWC6pfoWL/nN1ONpA/LybbodJwP73p0s65CBqTxWW3piBC/e6n/f8EjjW
	 axLJzlowy5dHylaaVTepoxQcTzqXvKxFgmKYKaAMOvKDG5JS0JksSWttJgJAxWn7S4
	 kZ+J57/uaS287PRFz5dlgW4D2nkw8wmtvbXP/LAOFjWaSxRjvGiPFOtukDKyPDqV3C
	 dWg5r7kImCnUpTI0cWjMcbHCsPYhNWmVcXD9tS/OTIS75pefzo6zPnH7F9JDZzqSN0
	 gn25brxfVZnfAHE/Dq9iRVqY9nUwQZ3NGujJdjt9+F6NQASKWWyoOzx8KBIwaL4BKN
	 9uIMVXT+i20RA==
Date: Wed, 6 May 2026 14:40:51 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.5 uploaded
Message-ID: <20260506064051.GA324058@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.5 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 22.x
series is no longer supported.

Cheers,
Nathan
