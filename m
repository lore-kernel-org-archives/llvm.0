Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D98253B8
	for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 18:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40684C433C8;
	Mon, 17 Jul 2023 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689619640;
	bh=gG8Qtg+6gAPECuyv5M9ybxIcpPtXFhZu0+wr3l878S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1OJZgHQjwWIylW/GnYltW3mG3ittxtGjzkGYptUF9FmQKinWYSQOw1GTFoTrVb1v
	 QGdl/N9RdiLNjrh7dzcHCEXn3ZCer9cOQ6jFpyHLAf+DJifLGY7Hz4xipEL6mydEqM
	 rhzF6Km/b1jU0Yrq3o4hZ+Bf0RfeNkv7CAngbB54=
Date: Mon, 17 Jul 2023 20:47:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-stable <stable@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: stable-rc 6.1: x86: clang build failed -
 block/blk-cgroup.c:1237:6: error: variable 'ret' is used uninitialized
 whenever 'if' condition is true
Message-ID: <2023071705-enforced-overplant-fd80@gregkh>
References: <CA+G9fYs5n6aobE04YZy3Qy1ZMhAvH6-uQRqidgFmSoei91iW8g@mail.gmail.com>
 <20230717132426.GA2561862@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717132426.GA2561862@dev-arch.thelio-3990X>

On Mon, Jul 17, 2023 at 06:24:26AM -0700, Nathan Chancellor wrote:
> On Mon, Jul 17, 2023 at 12:55:42AM +0530, Naresh Kamboju wrote:
> > Linux stable-rc 6.1 build failed x86 and i386 with clang.
> > 
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > 
> > Build log:
> > -----------
> > block/blk-cgroup.c:1237:6: error: variable 'ret' is used uninitialized
> > whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
> >         if (init_blkcg_llists(blkcg))
> >             ^~~~~~~~~~~~~~~~~~~~~~~~
> > block/blk-cgroup.c:1287:9: note: uninitialized use occurs here
> >         return ret;
> >                ^~~
> > block/blk-cgroup.c:1237:2: note: remove the 'if' if its condition is
> > always false
> >         if (init_blkcg_llists(blkcg))
> >         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > block/blk-cgroup.c:1222:33: note: initialize the variable 'ret' to
> > silence this warning
> >         struct cgroup_subsys_state *ret;
> >                                        ^
> >                                         = NULL
> > 1 error generated.
> > 
> > Links,
> >  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y-sanity/build/v6.1.38-599-g5071846d06ef/testrun/18327562/suite/build/test/clang-lkftconfig/history/
> >  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2SfFoWj9NmKWHRijR0hcoXGjLhr/
> > 
> >  tuxmake \
> >  --runtime podman --target-arch x86_64 \
> >  --toolchain clang-16 \
> >  --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2SfFoWj9NmKWHRijR0hcoXGjLhr/config
> > \
> >  LLVM=1 LLVM_IAS=1
> > 
> 
> It looks like 6.1 needs commit b5a9adcbd5dc ("blk-cgroup: Return -ENOMEM
> directly in blkcg_css_alloc() error path") if it wants to take commit
> 3b8cc6298724 ("blk-cgroup: Optimize blkcg_rstat_flush()").

I'm going to drop the offending patch now, thanks.

greg k-h
