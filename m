Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039E2C82
	for <llvm@lists.linux.dev>; Tue, 23 Nov 2021 18:11:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CFEF60C4A;
	Tue, 23 Nov 2021 18:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637691096;
	bh=mkOOAhuKzpN8AI9CMyUMguhJC0UuaaY0M4GaWM3pB3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffVr8t9+q8MtImkg+qJZtLI+OvJT3YLPB9FZ2pM0OzUGF4ti6KEhZDyvpUDGakjiu
	 xeFwlgrpa3tnIhqesEyiHCqoyBzqSy537uXpEH0fZGlTBVEFlsT2oarYLsrFmxv7p/
	 0VHkvJ38KkM5t3ig5J2qAvEnJ7j38drIw+RfPqimAB9u1BVICozC/1mJm8gnvuBA1t
	 BUhc0IOpa6zIjdH7mOayQv/r2smMrdTp8PmTWmGjecQ/Fk+Jl6egDhqnZ0Ok5gysSI
	 P+cL4Xz/Org02xBoV5Mnq9ORElc3EGFrdXkfJA0r/Z3232C2jOFsUKJ3hQkBYJwMEQ
	 Qo1q9oHU1vYtw==
Date: Tue, 23 Nov 2021 12:16:48 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: arch/mips/mm/tlbex.c:2243:3: warning: unannotated fall-through
 between switch labels
Message-ID: <20211123181648.GA9405@embeddedor>
References: <202111230719.OZDUHU4z-lkp@intel.com>
 <20211123005528.GA550759@embeddedor>
 <ea07a2f1e20503965c7c2eba7c0a7a4538457265.camel@perches.com>
 <20211123165057.GA7382@embeddedor>
 <b73d287a696c10279cd0c931840ce95b03876d58.camel@perches.com>
 <20211123175610.GA8713@embeddedor>
 <7b6e9af20d5e18315986c8e004a13c3840afb9ad.camel@perches.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b6e9af20d5e18315986c8e004a13c3840afb9ad.camel@perches.com>

On Tue, Nov 23, 2021 at 09:59:58AM -0800, Joe Perches wrote:
> On Tue, 2021-11-23 at 11:56 -0600, Gustavo A. R. Silva wrote:
> > On Tue, Nov 23, 2021 at 09:25:17AM -0800, Joe Perches wrote:
> > > On Tue, 2021-11-23 at 10:50 -0600, Gustavo A. R. Silva wrote:
> > > > On Tue, Nov 23, 2021 at 12:52:30AM -0800, Joe Perches wrote:
> > > > > 
> > > > > Perhaps this would be better:
> > > > 
> > > > Feel free to send a proper patch.
> > > 
> > > I commented on your proposed patch.
> > 
> > And I reply giving you an option if you want to proceed.
> > 
> > > And I'd prefer you actually look at and improve the code instead
> > > of merely silencing warnings.
> > 
> > If this is a matter of preference then I should express my preferences, too.
> > So, I prefer to give you the opportunity of improving the code and not being
> > pedantic at the same time. :)
> 
> It appears to be difficult to give you suggestions on how to improve
> what you do.

No; that's appreciated.
What I suggest you to improve is how you communicate it, and to take
into account a "Feel free to send a proper patch."

Thanks
--
Gustavo
