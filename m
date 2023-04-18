Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59667C94A
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 21:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF6FC433EF;
	Tue, 18 Apr 2023 21:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681853905;
	bh=8y2e9kv+5/6L0m6GFF2Jgn9ApZtit/ZIKZ7FL8RXKgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsV6C3GiEJWwXRZErvjXUuqGAUYpgpzUOMe+zavOQJgfGagu23c+CxuHDCSH1+RYR
	 IIzk5Myi9+9b5NSLqJWdQwJ5hJ6koxwNCwJWIrlAyd4Uk0VdPAV2O7eahnlJldlgwm
	 6U3fU1uzXKPEJBRLYfrbxwMU/IUzGuWbuzhiE4uCWhLT0MPoLCb37KO3A0H8CooNwk
	 i0Vcetpc//Xdag4h9NHPuY5jv1T3r09zcneLQAAlO6RHQx2jeaNiPkOikk/e1jtMgh
	 8m2SlrI6Q9n87mOUh7Mll+d86Mk5wuXV1aeXiYH6ASWWyX2croUMMrU+qEDSrad4FA
	 IQayVyNw5i01Q==
Date: Tue, 18 Apr 2023 14:38:22 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: ndesaulniers@google.com
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/2] start_kernel: omit stack canary
Message-ID: <20230418213822.xauewkuus25k2aj6@treble>
References: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230412-no_stackp-v2-0-116f9fe4bbe7@google.com>

On Mon, Apr 17, 2023 at 03:00:04PM -0700, ndesaulniers@google.com wrote:
> ---
> Changes in v2:
> - Rebase to avoid conflicts with Josh's changes.
> - Fix comment style as per Peter.
> - Pick up tags.
> - Link to v1: https://lore.kernel.org/r/20230412-no_stackp-v1-0-46a69b507a4b@google.com
> (sorry for the spam with v2, mrincon is helping me get kinks worked out
> with b4 and our corporate mailer)

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
