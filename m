Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4574372
	for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 12:35:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BF3B619BB;
	Fri, 19 Nov 2021 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637325324;
	bh=Q/8XfwlgqZkL7qyt+Eo4KuzW8HvK1T1iBYvnkFqwP1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWUmXFHFAUrDL0hsA4iKW6MrBhqoE/oEX31QHkqNWqCP5oUfcmvdwJTnA7LnM5WBZ
	 rkqoN0eS0KwpHGbgrrgSd0/XbWLZYDfPW1LJ5jktKhGBzhkWkLkvdL7Amttd9L8lem
	 c2C4LxWOuTgkcCwt1mHIesD730N7FrkzT31IY7y8=
Date: Fri, 19 Nov 2021 13:35:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Apply a52f8a59aef46b59753e583bf4b28fccb069ce64 to 5.15 through
 4.19
Message-ID: <YZeaCndfOGSZLHgX@kroah.com>
References: <YZKpVkYpYfYfHD50@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZKpVkYpYfYfHD50@archlinux-ax161>

On Mon, Nov 15, 2021 at 11:39:18AM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> There is a build error with newer versions of clang due to a broken
> FORTIFY_SOURCE implementation, which has never worked:
> 
> https://github.com/ClangBuiltLinux/linux/issues/1496
> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/1457787760
> 
> Please apply upstream commit a52f8a59aef4 ("fortify: Explicitly disable
> Clang support") to 5.15 through 4.19 to resolve this. It should apply
> cleanly.

Hah!  Oh the Android people are going to _LOVE_ this one...

{sigh}

I'll go do this now...

greg k-h
