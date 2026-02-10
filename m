Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4932E12E;
	Tue, 10 Feb 2026 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754818; cv=none; b=Hd/m0kLQSE+GYHQxSdOKz+tVwQQEDR9MrthlCV6UtVqjHv5xUwcbTpSPq4f4RNDECNj0ssw9RU3AngfriT66s7jy5/55ODJqlNWjLNbbH5fwRO9XNRrdJ4aeaC+J/s+7xXra5RY+7eI8TF7K5h797VpIBvufcqVMW84u4LvORCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754818; c=relaxed/simple;
	bh=qmLS28iCiM5CIvcITuzTpq7gpbqpV5UcrhCZXckQNvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1WuB6FYlbovIT3y5UFaNDqrStOsOoAo7wGEukStsUrKNhYA5BLki+GUmG8tMXRvpmDUz1HQ9pQYHkb5WwzzI/w8HsrjQIlbvkG9Z/GPNracpYbTotlDNL7c0cst2c3NfBQpEEa1wLCFRdzdw5iQmFXNKfADAvjnBGWU1d5dvdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oD/eONWb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oD/eONWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73969C116C6;
	Tue, 10 Feb 2026 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770754818;
	bh=qmLS28iCiM5CIvcITuzTpq7gpbqpV5UcrhCZXckQNvY=;
	h=Date:From:To:Cc:Subject:From;
	b=oD/eONWbQU2aBRQ6NS6zPPNsyzzEj+As3EpX1jGK29nEIMgMu2ocDX999cU76LKOg
	 I1euJPJ5YjpcGWmlHczugr0OF6A/knETE+f0EcFMWL5pvddPXOLw+/G5X4Wy34o8J7
	 33XILolAMM0uFoZmkZJaNLCmMse1H94ob+fnSIbp2v0Dp45++iI7RDjf9xoPpkfsJ6
	 rnHRW8wnzKr5MQduNtzbJkW7XhOvD8xcKcnsCQ4sQtQbL+Y1mdNDolg3+pgGeOZmMU
	 NEzmegst5N1gBfYsfSR3gr/gBb6yz9PoHTZ9cnG+VT8ig3ap57fTDwL6eweY6vNj2J
	 JvH3+/nPfcLQg==
Date: Tue, 10 Feb 2026 13:20:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.0-rc3 uploaded
Message-ID: <20260210202014.GA1098715@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.0-rc3 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

This is a prerelease version of LLVM, similar to how the Linux kernel
release candidates work. If there are any issues found, please let us
know via email or https://github.com/ClangBuiltLinux/linux/issues/new,
so that we have an opportunity to get them fixed in main and backported
to the 22.x branch before 22.1.0 is officially released. This is expected
to be the final 22.1.0 release candidate, with 21.1.0 final expected on
February 24th.

You may notice that these packages use ~35% less disk space than previous
22.1.0-rc packages. I have switched to LLVM's multicall binary option,
similar to busybox, which allows much more code (namely internal LLVM
libraries) to be shared between the various tools without being
dynamically linked (which has a noticeable performance penalty [1]).
There should be no noticeable differences with this mode at runtime (at
least when building the kernel) but if there are, please let me know.

[1]: https://discourse.llvm.org/t/rfc-llvm-link-llvm-dylib-should-default-to-on-on-posix-platforms/85908/62

Cheers,
Nathan
