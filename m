Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD381BA41
	for <llvm@lists.linux.dev>; Fri, 28 Oct 2022 22:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16695C433C1;
	Fri, 28 Oct 2022 22:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666997855;
	bh=+BV2t4GgwRbOB5h/5jzRUzd81/DfmzD3pGnqG7UMbmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkb3nmGOOt8ph62u+0hOpOxsFNkwuX13YJft3XGsTKoiy8x2FlwFEZ8EkcPZno87+
	 7t4ahSiqVRnHSrvUEqhxVZlYR8BcTIEHHqFntycHbYvX+ZYr9PDltx10PqXPL0kCdE
	 Kd2HNLXhBGjicoEmHJuScEwsp5zdEvdTtfpuJHgkAdUF70glgy23C26Iu10Hl1+L4j
	 eSAjGc/KJlMEGau/sQXMAaRtHL3xWLvo0o8jHNwH3+dyNJBind4UzNHAtUHBW89DQb
	 QBlD0Oo0E12qgGtnD7I7d7KIP2+hiuG9kHJzBMPYRYAau5lxMFahnBw5Oe7d3lPDZg
	 ChyrlQAcEHAPg==
Date: Fri, 28 Oct 2022 15:57:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: twd2.me@gmail.com, linux-riscv@lists.infradead.org,
	ndesaulniers@google.com, llvm@lists.linux.dev
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
Message-ID: <Y1xeXUhnONoB0S6P@dev-arch.thelio-3990X>
References: <20220512205545.992288-1-twd2.me@gmail.com>
 <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>

On Tue, Oct 04, 2022 at 06:57:10PM -0700, Palmer Dabbelt wrote:
> > Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> > issue [1] in prior LLD versions that prevents LLD to generate proper
> > machine code for RISC-V when writing `nop`s.
> > 
> > I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> > on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> > can boot to shell using an archriscv rootfs on QEMU.
> > 
> > I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> > KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> > successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> > image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> > `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> > separate patch further.
> > 
> > [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
> >     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")
> > 
> > Tested-by: Wende Tan <twd2.me@gmail.com>
> > Signed-off-by: Wende Tan <twd2.me@gmail.com>
> 
> Sorry for missing this, the v2 never made it to my inbox.  Not sure exactly
> what happened, but an off-list ping made it through.  I've put this on
> for-next, I don't have any way to test it because I don't have clang setup
> yet.
> 

Did this get dropped by accident? I do not see it in your tree.

Cheers,
Nathan
