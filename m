Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71718C2C;
	Wed,  8 Apr 2026 00:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775607061; cv=none; b=ebNXo9p5og5/AAJIO2okzV4hpFCuvMCg0wLIfQeXJW1Qz8XMSB8B720O9+H/RuzTIk4B/g4GFIjPLYNY26csNJfHHfW0UQu9XOfAAAZWemXKet+rzHoPRt4yhNjhFRkaVaG/nUpDCbYKk5HRFbDTkDf7tLRDPw47jP1bb5aW8Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775607061; c=relaxed/simple;
	bh=PUNkN3R1Pm37bYTqQIdt7bxqrx0h6Ce8pdi5XDAYIdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQ7BCVys7nEkh5+Jk0mgGOova76oPrjgbJE1vSGwhg1Jm80JNjERnOJOxzMu7mE8BnTYEQjZ1z60HuMYFbsVWGH1Se1uZUg7tcn+/B+9lJ1wp1BUG5mrduJe3gAYVMOGvKrkIK8Xk4ACzl+Irrp3CVYU5ofMkA9G8+nLAiDAo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r7GvfKRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r7GvfKRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4F9C116C6;
	Wed,  8 Apr 2026 00:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775607061;
	bh=PUNkN3R1Pm37bYTqQIdt7bxqrx0h6Ce8pdi5XDAYIdg=;
	h=Date:From:To:Cc:Subject:From;
	b=r7GvfKRmxuj4ON0pvp1qQlBJLULLAChQzy3hsaZ9YlCISse+9DEDkRkNTyUd+FGHr
	 bKNlWscBH5cOvhg0uEdpVOCRwM84HKwbSI3e0LVL23P+JO2c/7pEIr+Ly1TVoUd39A
	 lmbZX/6iyQMvMYTi8caIDg+mD2fmUT+UN+a2vK5yFwttM2NiV/80t4w+BvoQrskmTv
	 KZUI+ri2iMCwI5FBmGIRXFaT1upDaoJt9YVEIJc/oCL3W1y+DHOZn0P4H3j9pmSY2L
	 nxsGMAUT+4i3JcAGiPuHYKTGKc+5wtJsXJmJE70aKsMfqUxkJ8gOUelUFmoxw+PCv0
	 YdeL55XmLQWRg==
Date: Tue, 7 Apr 2026 17:10:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.3 uploaded
Message-ID: <20260408001057.GA3264248@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.3 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 22.x
series is no longer supported.

Cheers,
Nathan
