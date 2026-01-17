Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2150094B;
	Sat, 17 Jan 2026 00:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609106; cv=none; b=k1JAe+B6rUFB0lH6DgocfkqNKeh1C/EXUeLxwOgbJpyeFsdr2qye7lsPdnM27GMskZwaJMiMbkTxF+VdBM0EnouMyxn8OmF84CizQUb+pROrhOfXnL3gpR63oiV11RZI/OTjiX+J77ukFRFvcSEUX+9mcG35v2OT4XuUJuzqZ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609106; c=relaxed/simple;
	bh=oxLxn6ty/3JyutMyGcQjC5ymxa9eBIVHOfm9VSHtLss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j66T5yrZ75V0888vQB/FdXDgxBwqlLwFH2lrxMtXfS6DlVXtN8pm4EapHsV7pJ18N7XtBx+ukdzbCytd1WKaqi6kTNL+Vi5XEGHs7Wqmpmn/DGBLzWcpaAsw9JE6GS4BypDV5EKt11oD9nzJDLQbpsqG1zqWviDTpg+1X/TRmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbndGzxO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbndGzxO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376DCC116C6;
	Sat, 17 Jan 2026 00:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768609106;
	bh=oxLxn6ty/3JyutMyGcQjC5ymxa9eBIVHOfm9VSHtLss=;
	h=Date:From:To:Cc:Subject:From;
	b=rbndGzxOI9754jF2JGI5VwQIOiTyZ5VZo8BOa9zmStu61dIh57FK/d0E/qIg7KnxG
	 y0KVD4El51j6WM6adq4JGTIe9Fsr1eQHDi6L4mhhSyM0RZC6bn8D13jzVSqBi/t0SM
	 tWysOP6U4ELwHncH7PRYBwFl8tPDl+Xo54l16sKzrzq35suTUPuVJ5PcC3qX42CsV8
	 l8CvKfIGJsIErbEzCbHLO/NMlLeV6rxDuMU1NGmLMCxxLIFynNQ9qY2M1QeaYNmzsD
	 FUKSwCK39YU8TBaNbbuJiTsy6SYBFrxC/c+h0Tkj/O+/WKIZ7GHOf/XzEsZosZzFG0
	 XFmh/Rp4PoJKg==
Date: Fri, 16 Jan 2026 17:18:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.0-rc1 uploaded
Message-ID: <20260117001822.GA1195901@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.0-rc1 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

This is a prerelease version of LLVM, similar to how the Linux kernel
release candidates work. If there are any issues found, please let us
know via email or https://github.com/ClangBuiltLinux/linux/issues/new,
so that we have an opportunity to get them fixed in main and backported
to the 22.x branch before 22.1.0 is officially released.

Cheers,
Nathan
