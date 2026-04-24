Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5012E625;
	Fri, 24 Apr 2026 00:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776989057; cv=none; b=IvmtDKumOaCUNZOtX5CxYzWLJGob2PwWSilLxeMrqHuSNvgHQZCsuIda/fQQJlLNEW3WDzOIj5CJsVD8PnYyGTlg6N3qk1qHQMlYjdOdSwICmOPSGmWwUk9yHbYp5TCd/80KlyGUkKs1L95WAYC411W5FcVGInfiPnZmIlYn808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776989057; c=relaxed/simple;
	bh=FBP1QMpZvU+K8ZsHJxtOUnrV+D38784dku4cXyjD2YM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bjPnkgGcGCeF/aSFh73rCRp395SAoFvpDsHfocfJ1ltyWFFar/yiGAqwcmdc+4sNe7RDHZXMLIB3gtKc15k/sp7iIatjncHZDX0lOMNzbL9KSXtgwfzGxin0oWF8D5hfpGs0IyaXaYCO4gkQu0t8iZ9hCTS4Blws0GuwEw8hBv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1bGx3nG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1bGx3nG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BC1C2BCAF;
	Fri, 24 Apr 2026 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776989057;
	bh=FBP1QMpZvU+K8ZsHJxtOUnrV+D38784dku4cXyjD2YM=;
	h=Date:From:To:Cc:Subject:From;
	b=M1bGx3nG5cpdC4x5uVL3hCYp2my0Udgor4BQNC9F39QGJLzBGwDqSKlJ1UUrTkZ+r
	 vsvwKgMP84Gz2cCZibY4/IRwaa4dZmUlFOlslWziOibazBOEJXwC7v7kdrb99p3VHA
	 prFmuHQ4Ml/+8FkzaVwmZ6zxf8V+jz1fNO+jEDBYsHrKMki5GFyUO8igEIi88P541A
	 6pHqHhh6AHFjgD9ec7CFOoi0vUQIo/Uwb/6ZKQzq44uBdxrDkHszdkpKkpABTfMjGh
	 oadmjHJqTyVdJBZI4g16cJHb6SMDXJKAgtBUrPfF7XAPTnMU4snDSQZ6X4Sr7IkvDm
	 w7UL9/Zt+V/7w==
Date: Thu, 23 Apr 2026 17:04:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [GIT PULL] Clang build fix for 7.1
Message-ID: <20260424000413.GA1031124@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this single build fix for an instance of a new clang
subwarning under -Wunused-but-set-variable, -Wunused-but-set-global,
that appears in certs/extract-cert.c. If there are any issues, please
let me know.

Cheers,
Nathan

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git tags/clang-fixes-7.1-1

for you to fetch changes up to 4f96b7c68a9904e01049ef610d701b382dca9574:

  extract-cert: Wrap key_pass with '#ifdef USE_PKCS11_ENGINE' (2026-04-16 14:21:10 -0700)

----------------------------------------------------------------
Clang build fixes for 7.1

- Wrap declaration and assignment of key_pass in certs/extract-cert.c
  with '#ifdef' that matches its only usage to clear up an instance of a
  new clang subwarning, -Wunused-but-set-global.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Nathan Chancellor (1):
      extract-cert: Wrap key_pass with '#ifdef USE_PKCS11_ENGINE'

 certs/extract-cert.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
