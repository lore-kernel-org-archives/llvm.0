Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1FE195985;
	Tue, 20 Aug 2024 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724176787; cv=none; b=hXXZq8hr9D9b6djZ62+8C9h8QSBUbFh4y0Tz0EZ7lmZRiNRm+z7fkLTKHEGsl2jizpqQRP6XjJ3Re3jLTrQQrt9fYiX2z8q+xjCs9yRz+SG3fGFazHJAHKXmJUgGeMm19mjVevw+6ULYFe7CIiAQmi4S/NKeUgExI9R0eiHRQjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724176787; c=relaxed/simple;
	bh=nRPHNiD1RaX4VxeXm1tZPqPZgNEJBW4SmXzGIHPHDtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/jVlUge7cnBBEHF03wBDi0jEzcVStMbK5NkRQw8NWoXG+2PsXZ/x4WGYaspTjO/XJFLtt45yuKBajc/WlOvrsIMkVGH5pwXq5fFdoF+HVrVbMe6f2a936k5nTpBlW0gc+F0QLCEqm/L/zufvtyqo/vCwDWgCuRjHcmPfk2WYTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdPNo1mA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdPNo1mA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E89C4AF0C;
	Tue, 20 Aug 2024 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724176786;
	bh=nRPHNiD1RaX4VxeXm1tZPqPZgNEJBW4SmXzGIHPHDtU=;
	h=Date:From:To:Cc:Subject:From;
	b=IdPNo1mAFTLG0OkS+1GfXjT1csQO0BfcBqcxisZEXKxOyuXA4S1fdzwnzQs1RTXBK
	 R01DT4zN1dcfYQKqoWdXXIMRBylFu3WWJjN2VvpKpPakbVoiuyKCltCqIiF73rLRTG
	 V7fN3qqhB3G279cfmkUopTAQNUy1+rHNx0SoCB0RwCXaMFQhmAVT94moeKjonqO5i3
	 QQ/IT78PGxfC3HicxV+5JHWSrktaBebu4BCp7JsMZb0t9eXZ9DRebzeccZeC5otyWv
	 6yDpBDtwc118EgRblmFyAZpBNP4doPYfHwL+bpPgkr4EFdHhVzcamxvHf8UMjdOLbi
	 V29+ujgMrJPKg==
Date: Tue, 20 Aug 2024 10:59:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, ojeda@kernel.org
Subject: Prebuilt LLVM 19.1.0 uploaded
Message-ID: <20240820175944.GA2015979@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded the third LLVM 19.1.0 release candidate to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the initial
19.1.0 release happens.

Cheers,
Nathan
