Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B133A1CF9;
	Wed, 11 Mar 2026 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213417; cv=none; b=R1RaKYYTooSzM/yCh9qjFLKOATZaLPeOgT6zT7J7qGcQC67EjULgYV3Yp3f9DeaXd4xPH8xRNlaZbkNN69KLIoJWMFyOlTNksuNyjYCHzHhjkilWut7aEO5QX+GFTCMVvj1Ku4QTgJz23xBPqZN/uR4ZNGaRKcoewy/LkF5PwV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213417; c=relaxed/simple;
	bh=qcw7KkwIxrDtN041uZHU6tZrXDn3Ej6pFWTEJKGoKnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffIPuS2YEYrfFR8D7ygHeuiRMuhS4fnwdwM/lumHctnyO7g9L5lub7ma8dXfegihLJp1nG6Q8W0rL7+YdqYgtCzQpozQ/AY+OBAr8V6tki4ZFGcgDlxuosS7yJxwdOnNLGy5XX9tSy/wdQIQCUm3ASlflJNgdz1tLugA+x6G40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcssIypV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcssIypV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A32C4CEF7;
	Wed, 11 Mar 2026 07:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773213416;
	bh=qcw7KkwIxrDtN041uZHU6tZrXDn3Ej6pFWTEJKGoKnA=;
	h=Date:From:To:Cc:Subject:From;
	b=YcssIypVT8AtUYkq4gPzzah2lJSnpIW0BarXOsfql+1EKZi9LpUuKZQCney7pFP5K
	 tROtKZOajof90Bi/4str0PgYGBA+D5ztGDq2foQFf4sfWnn3zGgGmRMzSk2BjhPvan
	 4vlkrI5MGPEdufUQTWLpEXsTl4MM5GbT/31CfDQ1MfxSUWEFhsvsbxQTBjfUkW6FWV
	 FVdL7sTd2DU4egs8FzuyTOAXg+Z9ZwZiZLLMmTRUzYbroYFLN1xetedVGzPfOE0LOu
	 +S3S+HdOywWMVUlCtxubG4nPBDHUgldO9XGeFUCG0EmPKXGHgpiX9JTZJrHUXkaHfp
	 qSq0iwo/db6gQ==
Date: Wed, 11 Mar 2026 00:16:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.1 uploaded
Message-ID: <20260311071652.GA1991880@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.1 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 22.x
series is no longer supported.

Cheers,
Nathan
