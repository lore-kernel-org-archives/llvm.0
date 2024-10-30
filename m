Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988719E83C;
	Wed, 30 Oct 2024 18:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730311502; cv=none; b=lada2HUv8O4nviICkUBxtnBvNXKdAOJf28t9W5DRXiEPEl0Q+VP4OrvjtT1qgZ7F6+ziQAG1OHkyJssSaidvM22Hz7l4Qc1mLIuUGdD3PyQn36XmiCsg/Ks3g+WEKVaKinEiOuYaybX8UvBIVEEkyA3I5n0MWhNR5Ni86XK8h+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730311502; c=relaxed/simple;
	bh=XzAFniMuEX1fstfaMCA7hO/Y0ipLqVVFLC5C4iwsU7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rphqiP8sW7G190FijMXq2QaaENJMq3LM515aPU/SMA6RO66ND6UcScD8ep2RhfqmW0HUsieiaWRx9ElpZ+uRsgEAtO3lcueBoiv1czdgTxvyMgHD2W722rZordjMkqvlWIslPizFIwzsI6X2/Bd+0dDsvkmZpt9lazIWCXkpS44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQjxKW3Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQjxKW3Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8376C4CECE;
	Wed, 30 Oct 2024 18:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730311502;
	bh=XzAFniMuEX1fstfaMCA7hO/Y0ipLqVVFLC5C4iwsU7Y=;
	h=Date:From:To:Cc:Subject:From;
	b=BQjxKW3QoErE9P9t3HdqweVEgnCLnHmyfvXutmu1zQY4MRq0fmunN5CqzjlF1GzhI
	 D7iggNjp+pU8MaZfblxAyy/klDi6BXz/f6hZsdGJ2vXhQoAU5KTk0Tf5fcEvi/PaRx
	 RaiHF2Pf/pb2lXEkf9lLZwgp8HGp9opOKU4S/Siz5b4OsvWs9ttQeg6YUgiLENLpuU
	 823pCE0ZVrNLjNN0jAxBu2Bu/UhrYB8MtB9TrSV/Wh+cm9/Fgk4EmZaw2qh0W5Xv0S
	 cYL8r+7ADvnKSHhSwqR4+uB3aiv3NFx4B0X7+nL6XQqinKwGx9I3F50J50/oJgwBdY
	 lkNmS9s4Guobg==
Date: Wed, 30 Oct 2024 11:05:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, ojeda@kernel.org
Subject: Prebuilt LLVM 19.1.3 uploaded
Message-ID: <20241030180500.GA2334578@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 19.1.3 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 19.x
series is no longer supported.

Cheers,
Nathan
