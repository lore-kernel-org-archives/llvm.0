Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E396746C
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 20:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCA9C433C1;
	Thu,  1 Sep 2022 20:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662062726;
	bh=iOc9+0GNgABm7fesjder0qm3JUPhsUZuIxj/BUlS0DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLCKRs84bnUbq3xsodIbWHV1rtb9Yjdug6UHeGa0RoKvn32PnxRfPUWUt1tJWXDMp
	 t2uUe7vlx3Kp8TfWGck0MSL4wmTCEZWlIif4W04OAkWN2jTRNr84MCyJKuwoKg3Fyr
	 KLbuHVW8iWbGWSwVXN8Fhzf8fAx11mIEOJPbkvSV1ydcXehE+g4Wf4hulJxpCLpJTx
	 MWTqE+3CUK91jok+H0IcrlhGEmyhmTpmcEShWRLMxYb0cfQ7lP8spNFzIckDCTo72s
	 jbqyvgVJj9hpGJIJyt7Uugeu0dDlbiWG+Cz/p0mCWybjHyIx7w68zv5RMaX0+SrMtV
	 aQprBRIBlH2UQ==
Date: Thu, 1 Sep 2022 13:05:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] fortify: Add run-time WARN for cross-field memcpy()
Message-ID: <YxEQg+fOpaPuS/NH@dev-arch.thelio-3990X>
References: <20220901065914.1417829-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901065914.1417829-1-keescook@chromium.org>

Hi Kees,

On Wed, Aug 31, 2022 at 11:59:12PM -0700, Kees Cook wrote:
> Hi,
> 
> I'm hoping to at least get this into -next to see how noisy it ends up
> being. I've tracked down several false positives that are getting fixed,
> but I'd like to see this get wider testing. For details, see patch 1,
> but this is the run-time half of the recent FORTIFY_SOURCE memcpy()
> bounds checking work.
> 
> -Kees
> 
> Kees Cook (2):
>   fortify: Add run-time WARN for cross-field memcpy()
>   lkdtm: Update tests for memcpy() run-time warnings
> 
>  drivers/misc/lkdtm/fortify.c            | 96 +++++++++++++++++++++----
>  include/linux/fortify-string.h          | 70 +++++++++++++++++-
>  tools/testing/selftests/lkdtm/tests.txt |  8 ++-
>  3 files changed, 155 insertions(+), 19 deletions(-)
> 
> -- 
> 2.34.1
> 

I took these two patches for a spin on four of my test machines (one
arm64 and three x86_64, kernel compiled with tip of tree clang) and I
did not see any warnings. Not to say there are not any lurking but my
set of drivers did not appear to trigger anything.

Tested-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan
