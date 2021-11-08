Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432F02C80
	for <llvm@lists.linux.dev>; Mon,  8 Nov 2021 06:57:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5205F60041;
	Mon,  8 Nov 2021 06:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636354635;
	bh=oXPkLG9UQMbQzEsjgMGmo5rrYLPdclwno9fWmRJctjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Go/gI09zs0oo4A+YPy63Q9cK7ZQz7ocpXYguw6iDCBQ8ILfX08egRVUqba0FSp3FB
	 6nlxff0D3Ek4MeS6SxEM89/oBw1gVMRE+7p9bu1LJaUQVVeGHseEtJuhrEbZ905yHd
	 YXGn9VsUMpy1BdC/rCA5DUbD/y+SIyS3kPuRjsLE=
Date: Mon, 8 Nov 2021 07:57:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Please apply 3d5e7a28b1ea2d603dea478e58e37ce75b9597ab to 5.15,
 5.14, and 5.10
Message-ID: <YYjKSQ4Axy44KNcs@kroah.com>
References: <YYQjyo/dKfDb/no3@archlinux-ax161>
 <c3757fc0-09fa-b0f1-7165-795e0363058d@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3757fc0-09fa-b0f1-7165-795e0363058d@redhat.com>

On Fri, Nov 05, 2021 at 09:44:05AM +0100, Paolo Bonzini wrote:
> On 11/4/21 19:17, Nathan Chancellor wrote:
> > Hi Greg and Sasha,
> > 
> > Please apply commit 3d5e7a28b1ea ("KVM: x86: avoid warning with
> > -Wbitwise-instead-of-logical") to 5.10, 5.14, and 5.15, where it
> > resolves a build error with tip of tree clang due to -Werror:
> > 
> > arch/x86/kvm/mmu/mmu.c:3548:15: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
> >                  reserved |= __is_bad_mt_xwr(rsvd_check, sptes[level - 1]) |
> >                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >                                                                            ||
> > arch/x86/kvm/mmu/mmu.c:3548:15: note: cast one or both operands to int to silence this warning
> > 1 error generated.
> > 
> > It applies cleanly to 5.14 and 5.15 and I have attached a backport for
> > 5.10. I have added Paolo in case he has any objections to this.
> 
> No problem.
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

All now queued up, thanks.

greg k-h
