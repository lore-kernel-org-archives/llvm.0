Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B147A
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 10:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9948C341C8;
	Tue, 12 Jul 2022 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657620774;
	bh=mLrmLqzTtmLB7H+6kJe3yIOgyd7GxtXKOM0u5WSZMNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEVFzkMR91MxJpFetnlno2ZaR6hbjYAzIcC+w/aFNokTe+msBrHCZfsNps690YH+Y
	 52atfKYxMctWDKO4hQC8zWpNejLZwnD0doeE3spK1LIMJ6d9sbyUfVYonTUuZOqKLD
	 BW3RA+M8GcSO2N2q5f5aiCSSfX8wA7AhzUgPRB0A=
Date: Tue, 12 Jul 2022 12:12:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Darren Hart <darren@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] Documentation/process: Add embargoed HW contact for LLVM
Message-ID: <Ys1JI3nhgQHmUJ2F@kroah.com>
References: <20220711181101.1559558-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711181101.1559558-1-ndesaulniers@google.com>

On Mon, Jul 11, 2022 at 11:10:58AM -0700, Nick Desaulniers wrote:
> Should the need for toolchain mitigations ever be necessary, add a group
> for toolchain ambassadors.
> 
> Add Nick Desaulniers as LLVM's ambassador for the embargoed hardware
> issues process.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Documentation/process/embargoed-hardware-issues.rst | 3 +++
>  1 file changed, 3 insertions(+)

Thanks for volunteering, I'll go queue this up.

greg k-h
