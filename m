Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00623A5
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 09:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC835C433EF;
	Thu, 23 Feb 2023 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677144935;
	bh=PPW4ovevPOYy+ixLQRF8QjDSD29QNIbuuE0De3uCRRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThcmPSp3vyqNZfBMq1IvoCOirvCqkBZHmw05n6pyrgMx6wZNTTZKY/JFhn2G3iu+S
	 AlpmLsVZAyONn4sLWNdMquftMBgvu7f5ZqZmZJIb+H/3dxZcaVqaNVBI7TiJ5V0VO1
	 UPjeCrT8hqf4mb48iqEthdvgtfWstAPkh86XZBFM=
Date: Thu, 23 Feb 2023 10:35:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: static call fixes for clang's conditional tail calls (6.2 and
 6.1)
Message-ID: <Y/czZBVqsaG/P8iU@kroah.com>
References: <Y/Uf9WUi/rANmOk8@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/Uf9WUi/rANmOk8@dev-arch.thelio-3990X>

On Tue, Feb 21, 2023 at 12:48:05PM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please consider applying the following commits to 6.2 (they apply
> cleanly with some fuzz for me):
> 
> db7adcfd1cec ("x86/alternatives: Introduce int3_emulate_jcc()")
> ac0ee0a9560c ("x86/alternatives: Teach text_poke_bp() to patch Jcc.d32 instructions")
> 923510c88d2b ("x86/static_call: Add support for Jcc tail-calls")
> 
> I have attached backports to 6.1.
> 
> Without these changes, kernels built with any version of clang using -Os
> or clang 17.0.0 (tip of tree) at any kernel-supported optimization level
> do not boot. This has been tested by people affected by this problem,
> see https://github.com/ClangBuiltLinux/linux/issues/1774 for more info.
> 
> If there are any problems, please let me know.
> 
> Cheers,
> Nathan



All now queued up,t hanks.

greg k-h
