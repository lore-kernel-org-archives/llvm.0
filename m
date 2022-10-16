Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D88ED8
	for <llvm@lists.linux.dev>; Sun, 16 Oct 2022 13:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB21BC433D6;
	Sun, 16 Oct 2022 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665925413;
	bh=JY9MTSghZsCBk9g5JsDbOVMRgfy19GPXwrXNlSmJsWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d48gRXCculTo2kBZlqpZ5UoytCpgMSCO48eIBxxgb8cfkEbV0hxmh1HevRvzHd4bf
	 lK0arrgUOTeTdrI3Lb7wDeUH0eguEKWfHfoaHD0i8RWeUe8hzUI1x6MpyjOUBvdBoh
	 yWqzRv9lyYYMh75TIGbmARdVpIDhPvJ1y3adNhVQ=
Date: Sun, 16 Oct 2022 15:04:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev, Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Backport of 607e57c6c62c009 for 5.10 and 5.15
Message-ID: <Y0wBSkAgE3jsMT/t@kroah.com>
References: <Y0heKubSc1P6rbNB@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0heKubSc1P6rbNB@dev-arch.thelio-3990X>

On Thu, Oct 13, 2022 at 11:51:22AM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please find attached backports for commit 607e57c6c62c ("hardening:
> Remove Clang's enable flag for -ftrivial-auto-var-init=zero") along with
> prerequisite changes for 5.10 and 5.15. This change is necessary to keep
> CONFIG_INIT_STACK_ALL_ZERO working with clang-16. This change is already
> queued up for 5.19 and newer and it is not relevant for 5.4 and older
> (at least upstream, I'll be doing backports for older Android branches
> shortly). If there are any questions or problems, please let me know!

All now queued up, thanks.

gre gk-h
