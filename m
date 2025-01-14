Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389A42080DA;
	Tue, 14 Jan 2025 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736890864; cv=none; b=UwfTW5bv+YdjK4Zc607wXe1iEdtQNb6G8qs2EcOLVnbvgQ3jq8JbMIPNtGRIOODqYbtf0CmJC5Q3Q12fC1ul6yFmxwHGe4whqRrPN4Z7TD42UZjqTCoEMyElklJW0DoaAlHSgsfkvYzOKiEuN9fOiW10xMOcG/dSDxrbwNB9N7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736890864; c=relaxed/simple;
	bh=plg/Q6ofa18FL4UN3PcTWR+2FNwNHvTV+qNM/TSn/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m9nKtCk8hue4UNZiNfFozBk7X6TARIVJ+yjLUCrns8i32wB4AUPHxFpBZtS/tFWJ2FEcJ88+nO1TEicDotgZmnFwpR/lKbYWcFkIvD4dPi1tuXXt0xS9U1nvQ0DYqBPniom3nbT/7ZtqBamO1fvfiBfK5gpzO+a4Tpw7rsrz5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YptTMFvt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YptTMFvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA600C4CEDD;
	Tue, 14 Jan 2025 21:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736890863;
	bh=plg/Q6ofa18FL4UN3PcTWR+2FNwNHvTV+qNM/TSn/8Q=;
	h=Date:From:To:Cc:Subject:From;
	b=YptTMFvtt9E2HSJUMkoerC9UREjwu2jI/bHUJkxk2y6P5s1XplzI3n6Lb++vJz6Uj
	 yV26fKx5Vmwy5KferV+wnot+YvbRp65oKv0sdnaY9mZ2vv2HIysqb1QZyEwaDgkpNB
	 /SofYDEt5D0DzkG+dQTu2CnUHgRTwkIZ3yJK36OlEi8eJ/9ZKDJYMlfLN6khWAWPVJ
	 TNyrExnAw6YpaTff5sPC5nnffI3G9g4CCcNMca9nLMvaM195+6/aN2ktmqA3UqRWwQ
	 G7bl9k6UCX8CKt+jzOriIa8Y2AowkDrJcAYyCa0RSl2KbPcPtspnfaTmRGVd8qr7kj
	 +TBTefWWJ6zFA==
Date: Tue, 14 Jan 2025 14:41:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, ojeda@kernel.org
Subject: Prebuilt LLVM 19.1.7 uploaded
Message-ID: <20250114214100.GA331869@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 19.1.7 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 19.x
series is no longer supported.

Cheers,
Nathan
