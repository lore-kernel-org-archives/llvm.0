Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2DA18DF80;
	Wed, 25 Feb 2026 01:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984118; cv=none; b=t1Cnz1vr+ACb6mDROe5eFKoUYborZUTVm0HhUk6A66Y2yuA6gTmkfUXUA5mEXoeGkRd+8/WvHRDQTE+Y4ZXZp3Zc6tTBhjdb8CSYNFG+s0hRw7qFR62USIJ1tWgcDHk6azNvxJ9xr8rHaj0eQL6DyvBPJxUTkNBXLe5yLKWLwkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984118; c=relaxed/simple;
	bh=ybpuErxNY9Eonrjwdb6f8sQT+liUqXuiNAI1ndpB7WA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W/7TSuBfZCzr0mpRpqLsNcqjtDIWyv3c8lBQfjBShWb5sL0uhxlKxYFXXFqU9nu9garUx3wHX8R/0PCtZ55fXcuQVn27PhgyluaEp11ZJVayge5Kk/m7XPX0lP0fyQ12Rb5IpMLYY5yEqIGab6gCMjB4n5Y798rfpqgMWOeHPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFNs4PQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFNs4PQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6468CC116D0;
	Wed, 25 Feb 2026 01:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771984118;
	bh=ybpuErxNY9Eonrjwdb6f8sQT+liUqXuiNAI1ndpB7WA=;
	h=Date:From:To:Cc:Subject:From;
	b=oFNs4PQdpsObSr3rpxqs+rnUtlCylksJXueQqRLZ+cFesrOvGpfa51uRH2ohOHRoK
	 k9xWj1yg3tlWZqqstp2wIw2+xHEiAoIrgF4wtDL7mBCQ2qtakF6NtfcPzxEVROErmT
	 mQcJxIu2KXodF0+EjTnqt0bPxU8ZUHnMcn8vGhopcwOZkqKA1wTOLcMJWq38AbKNFI
	 AV7XrrP9dDvSlKdtEbXA3VhY6YvPf2Gpid7lxuYTtp4bOuc4g/HpeOpmRPXnVAEUhf
	 AUDny0CBWy12PHGCRB+bSWSBXVM1YjtUpe/8NvrqSsDFk592EAHPEd60Gd+nDMHZ8N
	 fwsPalKG/ak3g==
Date: Tue, 24 Feb 2026 18:48:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 22.1.0 uploaded
Message-ID: <20260225014834.GA1284670@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 22.1.0 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 22.x
series is no longer supported.

Cheers,
Nathan
