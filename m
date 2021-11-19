Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098FD72
	for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 13:30:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4A6261A07;
	Fri, 19 Nov 2021 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637328640;
	bh=B8x5TgLuonTjLI9voMBpfKdzdUzngPTVyw0SgA5Mk0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=01ADNcT4F+EE/uZUlW+hhcYPzN5IRb/8chom1RW5PJF0Pv9WXdlSN2fmHNRHrZFfq
	 W2NkqBS0irTD58tgUjGEDW63RhEvn2C0Hh4ie26HsPvPjh9L4IzNVbgWqe8O1vbp0e
	 ge/h1+D4cjJJo4No1js1Vmk6IXTniJWwxi44FK5g=
Date: Fri, 19 Nov 2021 14:30:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sasha Levin <sashal@kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
	Lucas Henneman <henneman@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Subject: Re: backport of 14831fad73f5 for 5.10 and 5.4
Message-ID: <YZem/VtituWK2zkd@kroah.com>
References: <CAKwvOdmaGrk80s5T9uDMd-XEVTOUupaCxiU1mbtkk9K276KS5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmaGrk80s5T9uDMd-XEVTOUupaCxiU1mbtkk9K276KS5w@mail.gmail.com>

On Thu, Nov 18, 2021 at 11:30:38AM -0800, Nick Desaulniers wrote:
> Dear stable kernel maintainers,
> Please consider applying the attached backport of 14831fad73f5 to
> linux-5.10.y and linux-5.4.y.
> 
> 14831fad73f5 first landed in v5.16-rc1.
> 
> There was a minor conflict due to missing e35123d83ee3 ("arm64: lto:
> Strengthen READ_ONCE() to acquire when CONFIG_LTO=y") which first
> landed in v5.11-rc1.
> 
> It fixes a minor warning observed during `make mrproper` for Android
> kernel builds.

Now queued up, thanks.

greg k-h
