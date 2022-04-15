Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9027E
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 14:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D91CC385A7;
	Fri, 15 Apr 2022 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650032459;
	bh=5dZZoj3pOKho1MGAkY4/NjwfVebCG/c1u6DOO+KCsXk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=aoy5PBKEaK6SDewNMRsObqZAfJKPFcfrASqHE2kpJMp7JREmx1sEiZ4X+FB75LVS6
	 PhZNiB2msnvrXDu06lGbVejgoyTw34WBIzwIvaKTWwY4HPA+fp3EBEIb0X4lZ4el5d
	 L0ICSgERZD32oH6M+8F0b9q76UbbkifG13Z/mGWiuW4eZLJ8IPEw2V1oCuU6VRejlS
	 EBmS/bsRUh4LkfZn1q+VFrJyEmTd1ohjexn56o/7PXGKbEtsXw63qB5Dfa9TBInoBF
	 hs8AFmTSgP4xtVDtqHkGjgWB1DckUd+HnoWgoUbeQAGcGGXZCrfotNztQO6jVGAeam
	 kD8x4B7hPihgg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1EA355C034B; Fri, 15 Apr 2022 07:20:59 -0700 (PDT)
Date: Fri, 15 Apr 2022 07:20:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Paul =?iso-8859-1?Q?Heidekr=FCger?= <paul.heidekrueger@in.tum.de>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, Marco Elver <elver@google.com>,
	Charalampos Mainas <charalampos.mainas@gmail.com>,
	Pramod Bhatotia <pramod.bhatotia@in.tum.de>,
	"Jose E. Marchesi" <jemarch@gnu.org>
Subject: Re: Dangerous addr to ctrl dependency transformation in
 fs/nfs/delegation.c::nfs_server_return_marked_delegations()?
Message-ID: <20220415142059.GI4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <Yk7/T8BJITwz+Og1@Pauls-MacBook-Pro.local>
 <CAKwvOdkEULT_OOeaaCneJjbrE=O3kC8SMDs2thFa9gBfpuo2Jg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdkEULT_OOeaaCneJjbrE=O3kC8SMDs2thFa9gBfpuo2Jg@mail.gmail.com>

On Thu, Apr 14, 2022 at 02:21:25PM -0700, Nick Desaulniers wrote:
> On Thu, Apr 7, 2022 at 8:22 AM Paul Heidekrüger
> <paul.heidekrueger@in.tum.de> wrote:
> >
> > Hi all,
> >
> > work on my dependency checker tool is progressing nicely, and it is
> > flagging, what I believe is, a harmful addr to ctrl dependency
> > transformation. For context, see [1] and [2]. I'm using the Clang
> > compiler.
> > [1]: https://linuxplumbersconf.org/event/7/contributions/821/attachments/598/1075/LPC_2020_--_Dependency_ordering.pdf
> > [2]: https://lore.kernel.org/llvm/YXknxGFjvaB46d%2Fp@Pauls-MacBook-Pro/T/#u
> 
> Hi Paul,
> Thanks for the report and your (and your team's) work on this tool.
> Orthogonal to your report, Jose (cc'ed) and I are currently in the
> planning process to put together a Kernel+Toolchain microconference
> track at Linux Plumbers Conference [0] this year (Sept 12-14) in
> Dublin, Ireland.  Would you or someone from your group be able and
> interested in presenting more information about your work to an
> audience of kernel and toolchain developers at such an event?

+1 on presenting at Plumbers!

							Thanx, Paul

> Would others be interested in such a topic? (What do they say in
> Starship Troopers...?...Would you like to know more?)
> 
> [0] https://lpc.events/event/16/
> -- 
> Thanks,
> ~Nick Desaulniers
