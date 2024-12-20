Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F1221B1BF
	for <llvm@lists.linux.dev>; Fri, 20 Dec 2024 20:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734725182; cv=none; b=YJzwFt/5imaiCd09cmkVDT4vUjOkavk58tPlS4XAiN+MdEmYZCwpE9eTEON/hlIfLQuz9pkJekXhGiFXCPomK6w2HaPWor/6OqiFIwi8THQdVqQX4g3vYVCM05yyih6Bekw8Tg8+NSVTjZ314E+1xMXuqqXOEgHptVMeAgrRr1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734725182; c=relaxed/simple;
	bh=F2km0OPe9oMbYtjUZPTeWKGZOHBNCk2qSzmQW3PBJu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVltb24+vxmB6YEr5Op3ZwEZSwaFooayo0oxROjGt6CfTXyeSYNh3/pF2dVBfWReXLTLwY+3pczRylO/MkzDQA2ZqhzVAJu1OU0d3yhoG7k1jrXMM4a/AJFGkIvl0I+RSVtl0jemjaYvlqJqg4qd3KTdcstpOgDAf/GIYXy/bjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjeHgsWa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjeHgsWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4144DC4CECD;
	Fri, 20 Dec 2024 20:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734725181;
	bh=F2km0OPe9oMbYtjUZPTeWKGZOHBNCk2qSzmQW3PBJu0=;
	h=Date:From:To:Cc:Subject:From;
	b=YjeHgsWa01GcXqKxC1biF5d6x1O4uSlq3kOxTVZqoWM92MM+waOj9GUOBkdUVHFEO
	 M5d3vkFXqyTqbLNSa9gjjIJgedVqXxOQpkKtuAPDGArkzFmy6vSPaMaRkorGIG/Q9T
	 rEFMl/DQNdIpEFuXBkp1IGCGHmF1D3xhU4GVeBZzTPU7trR1k38aTy8jLHQCWW0DaR
	 s1CE1lr3a140MKA2wDcx2Zm2XPKKQAWpyXiYPCDsEBc3LE4+HFk4kGm2AJDglBshln
	 l78IEiYFkTdSneQommXlvBW5r5AqW5jiPFyZcVz+Zlnu2f/BwkSQRDEFxBEo6ul6A4
	 +Z2M1yK6bT8EQ==
Date: Fri, 20 Dec 2024 13:06:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Philip Li <philip.li@intel.com>, lkp@intel.com
Cc: llvm@lists.linux.dev, peterz@infradead.org, jpoimboe@kernel.org
Subject: Removing LLVM objtool warning filter
Message-ID: <20241220200617.GA936171@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philip and other LKP folks,

At some point, I believe there was a filter set up so that reports of
objtool warnings that appear in clang builds were sent only to our
mailing list (llvm@lists.linux.dev) for triage. At this point, we
believe it is best to treat those reports like other objtool reports and
send them to the author of the change that introduced the warning with
our list on CC in case people think it is a compiler bug or need further
help understanding what is going on. Is that possible?

Cheers,
Nathan
