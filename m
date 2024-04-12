Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E04438E
	for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 22:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712959658; cv=none; b=hKf/lE/B6EOSUr6noSNGRZPw8Tcl3YDX6twxFZpeBkKRFzkSCK6bz3vy62/5ZIQcnxUOqT1+O4Kvl82l6TNvY+cG7oV6hlLzy2ShFdRnGBi261lstSujqHgftgh/DejGZw+glu2yD5w24EBI18wJ/77NctRC+uEgFWk21sWwlE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712959658; c=relaxed/simple;
	bh=tfq73iyyWgAoURfJklfX6aQkJhE28zb97p8a2gm93xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+0rAIE/3MqwYsqq7iijK2J+++SeGUi8Me6M6aEIJHbiK0VZdmcm+hGp0zCvs14jctQK7TQOMVASYo1c0qpAIhuKNqnkg46qZvp1vk3E5neWgHawP5Qv5OGnAix8LMTLeDdHhhxdQ0gIOEv5drwODcpcFAU7IFox+uxjZCAtFUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4N0jgt+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4N0jgt+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD38C113CC;
	Fri, 12 Apr 2024 22:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712959657;
	bh=tfq73iyyWgAoURfJklfX6aQkJhE28zb97p8a2gm93xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4N0jgt+nshM0QaGSw5cwyL8iqyuu2tU9Z8v2/mUi0AZrknzozTg/P3jXr91ja7R0
	 aO79BrhKTsGgPzyoXoYipRMvqNNiAX10Uq+CBLsM71yq227uy3KizZrBBhmxqrpTBO
	 4Ts9fZlf8UPYxm5rQEV8M/tY5tvxw8Y0QJUlxAawcizT5D0pQXpode3r/iJqaNh/ts
	 xh5rwu+3JZxeqkyfVGReakbGAPSeKIB77NZEDOHRfdyzm4Sd58lYczEp1htKUsLVS4
	 cZ2A4AwCjHParGzNTlDbNamc4/6OPed2YtRgU9fQNZUTquDbkx/NkLIW/TvQhvWfDZ
	 +tU+kfZgljEpw==
Date: Fri, 12 Apr 2024 15:07:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 0/8] CFI for ARM32 using LLVM
Message-ID: <20240412220735.GG2252629@dev-arch.thelio-3990X>
References: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
 <CACRpkdYW-8gC7rGtt-jg8Huv_smB_4Dze4NYgeRL53YczzzDNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYW-8gC7rGtt-jg8Huv_smB_4Dze4NYgeRL53YczzzDNQ@mail.gmail.com>

On Fri, Apr 12, 2024 at 09:38:24AM +0200, Linus Walleij wrote:
> On Thu, Mar 28, 2024 at 9:19 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > This is a first patch set to support CLANG CFI (Control Flow
> > Integrity) on ARM32.
> 
> Not much reaction to this apart from Kees' ACK and I think
> most patches are pretty straight-forward so I'll soon put them
> in Russell's tracker, I can always update them if there is some
> issue.

I've given the patches a quick glance and I do not see anything
obviously wrong so consider this a soft LGTM. Given that it is an option
and I am sure there are arm64 and x86_64 configurations that are not
clean, I don't think having all CFI issues patched before the support
lands is necessary or desirable.

> As mentioned, there will be some rough edges (e.g. eBPF)
> but a slew of machines boot fine with it and it should be able
> to provide additional hardening on a slew of embedded use
> cases.

Agreed.

I will try to file an issue for the EFI issue I noticed before so that
it can be investigated and fixed at some point.

Cheers,
Nathan
