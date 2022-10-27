Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EAE1C04
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 10:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C00C433C1;
	Thu, 27 Oct 2022 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666866818;
	bh=oRS2JbLnUGHEIGFpXpT4+mx+XXpT86+fg/dRm3+f+Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zhkLY9UK5S1gydJSNOlOqUvT9kFJqdwoooTFTqMsmtThtnc1UbcKdg19Phv0hhsym
	 +rnLE/TFbpYo1v3U4JyxIcA1yb/eTLnTT5zpkWtSHrzBCHNKThiv+CztNQrsaNN51t
	 LdPEw83WZDycVo457Qq4Xkyx2mAkdbH4yrshGEhs=
Date: Thu, 27 Oct 2022 12:33:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sasha Levin <sashal@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	"# 3.4.x" <stable@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Alexey Alexandrov <aalexand@google.com>,
	Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>
Subject: Re: backports of 32ef9e5054ec ("Makefile.debug: re-enable debug info
 for .S files")
Message-ID: <Y1pebfXQAj/cLbci@kroah.com>
References: <CAKwvOdneUW4e9==CABAk68uePCGNt7Sq6P-84tR41HRB23zFTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdneUW4e9==CABAk68uePCGNt7Sq6P-84tR41HRB23zFTA@mail.gmail.com>

On Mon, Oct 24, 2022 at 02:06:52PM -0700, Nick Desaulniers wrote:
> Dear stable kernel maintainers,
> Our production kernel team and ChromeOS kernel teams are reporting
> that they are unable to symbolize addresses of symbols defined in
> assembly sources due to a regression I caused with
>     commit a66049e2cf0e ("Kbuild: make DWARF version a choice")
> I fixed this upstream with
>     commit 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files")
> but I think this is infeasible to backport through to 4.19.y.
> 
> Do the attached branch-specific variants look acceptable?

All now queued up, thanks.

greg k-h
