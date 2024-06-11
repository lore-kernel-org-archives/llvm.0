Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9E171C4
	for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718141477; cv=none; b=LS+3urmrf0/BV1XHq7g/dXu+9isqrnhq4NWYlRZlkZ2NDBXp2i1/6AlzuMhwZ7lMYeaELB/sjjF2bSAFUmhpt7yizqC4sQzBtAksUVy1bImJfo6Qdo68gtEwarRpzntuHTJAug1mRJtJv36PUvmKlDPI7pfFGkHUgEM3/42mfbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718141477; c=relaxed/simple;
	bh=ncCd7SFzjeY4sm80nCdZTNzv4d2KdtCh13A5GPUy0r8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lPWmkAQAwIRay1DWejZfI3aSkDACqG02uzuBwiW2Q9XrCV47NCvCVx9UaD0nTmi1b3FmDg4rifRr7Wb0jANswypDu+V4aQU2tQ37Kc8wzsbarnSW4wXzHy0DIlUR9G2NQybf3PzAS+slGjylkrgwd4Us1cs1xXSlmdE8qz2AN+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7aJU40d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7aJU40d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820A4C2BD10
	for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 21:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718141476;
	bh=ncCd7SFzjeY4sm80nCdZTNzv4d2KdtCh13A5GPUy0r8=;
	h=Date:From:To:Subject:From;
	b=p7aJU40dF9B8DG/cRPbtDoC2rrbdjI+ShMd4aRSeiIjoZ9BBLC4TajVJkr749s0dp
	 AbMVrp1sQe0/51/Qo7JHVIPScSCYqieQqLQZpaXCgIKrrdxFJhJhVhAIxdUUeSCdGo
	 W4PMnxQgZdh0asjefoxE5YrOXbhfspBAYITY2ZtLyJiwpgQiOSxinqYX5pEvGQ7r8j
	 /kuy1WP3w5jX19mKiFzQxXI4jbqVQWjFp8Fi88g5lDKH89N2Vg6w++La9cuxyu6QKX
	 oMIiUGrwcXPOsgRVNH7SVDtC100d/7//vx7WOBbxG9SORY7Ytu7UjUZLT9I0lbJTy4
	 8/nuLUlbc7qgQ==
Date: Tue, 11 Jun 2024 14:31:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev
Subject: CFP deadline for LPC 2024 Toolchains Track is approaching
Message-ID: <20240611213114.GA1803083@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

My apologies for the short notice but the deadline for the call for
proposals of the 2024 Linux Plumbers Conference Toolchains Track is this
Sunday (June 16, 2024). If you have a talk you would like to give around
LLVM (or GCC ;) and the Linux kernel, please submit it on the Plumbers
website using the "Submit new abstract" button in the lower right
corner:

https://lpc.events/event/18/abstracts/

Please spread this around if there are people you know who may have an
interesting presentation topic.

Cheers,
Nathan
