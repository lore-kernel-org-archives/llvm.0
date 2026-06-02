Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091D8383338;
	Tue,  2 Jun 2026 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437576; cv=none; b=DubKOzPZ9ujr1e5lH7LeKECsDyqdtoXU137UXbIFO6+UAEZiL75CiPAVx0R5zP9ePKAwGanywZDwoTE1CohUOefp5oE0z0Vi5dBsZTMn6SAyHvLgK1GqF0Hx1/cqemGqG6BAnN6SI9o9/6Le/W0957IiYxMT+WZwWcYTrAOWI/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437576; c=relaxed/simple;
	bh=I+JFDs7rKzmvXNpT65QTjeCR309q02sjDjIEU+Lp5Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZeVAmt/KTQQUDLlnXw1d2YlofVaJWj/TUzdnRh2bRfC8bB253rCtM9gp5YYGMWIvKg2ixlhcdMSde+W214PBQ5MRzB5EqMyk+6QAjOqUbXx4vGqcN4l8qB4tJLp7QzC7IGnc0wgeFDY1opmN9A4SPEl2rLSvlw9Iu7+SgUjIjkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSXuqleK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSXuqleK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4BA1F00893;
	Tue,  2 Jun 2026 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780437575;
	bh=I+JFDs7rKzmvXNpT65QTjeCR309q02sjDjIEU+Lp5Xs=;
	h=Date:From:To:Cc:Subject;
	b=eSXuqleK04cC0QrLrbCKpuWwZwJRNyY9j80IU2QWioMaHQkUtgXzEK1oYYhPeF6cM
	 CTWwfujkSE5oomAsj1wplGCiQ22WhsAn/lcuAYWT42rF/Lb3IR6Taoro1pZl4luxYA
	 kVTA7M1Nq/zfOdNs0jsSPyGm1NWYz7DENhuwMh5xSvkz4QAm64s27HpKlXa+AJTOD6
	 oQMEJUs8wjVeIKGIm/GQGZHanoXujoeheXn41XHGCNXOCmgNtMDhB6Ojwjz3Br14Tn
	 o2MKvKgPeu3InHBbHb5cUXPf2zU5E0mYonPit8pxdoC/h6ypdNec/JUQATlWueNuIF
	 a+U4hFrRQ4sgw==
Date: Tue, 2 Jun 2026 14:59:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.7 uploaded
Message-ID: <20260602215932.GA1352412@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.7 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 22.x
series is no longer supported.

Cheers,
Nathan
