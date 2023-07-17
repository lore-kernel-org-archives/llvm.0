Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE686AD28
	for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 13:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1806C433C8;
	Mon, 17 Jul 2023 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689600268;
	bh=buEyDtOD+tAaVWRktB28z7fW6D13J5yAHEKQhMLZQu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L61XKSSxsznWwcDppB67UBRbXxw5UM0mEsoBltz2n5auT1pzJoo8sPFXI80yNg8eQ
	 w0UlFS0z4UQNQNSUlF3vFWKacZp8xkn30u2kOlQ/xnGN1hf6z7Y8hvURby/TGNnhwP
	 XP5sgBvpBukoqJoJphBnmewpOnhOW4zY8mlOT27EfRvVHOVXT8esXI4fiu/ky/67hY
	 LJvAUReEu1iMKiggSpZxoWsTmkbHecl63tQBNF9QOyVfHOCIg5njyJSrzvX203jmOz
	 2gxwXoFfwfGxaKx6wcZlDnE8q9rqQ4cPkB0HAg1qpr4+wcqejc0vTOtJ2tmOoBp5KF
	 wyHeyFIieC5tg==
Date: Mon, 17 Jul 2023 06:24:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-stable <stable@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: stable-rc 6.1: x86: clang build failed -
 block/blk-cgroup.c:1237:6: error: variable 'ret' is used uninitialized
 whenever 'if' condition is true
Message-ID: <20230717132426.GA2561862@dev-arch.thelio-3990X>
References: <CA+G9fYs5n6aobE04YZy3Qy1ZMhAvH6-uQRqidgFmSoei91iW8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs5n6aobE04YZy3Qy1ZMhAvH6-uQRqidgFmSoei91iW8g@mail.gmail.com>

On Mon, Jul 17, 2023 at 12:55:42AM +0530, Naresh Kamboju wrote:
> Linux stable-rc 6.1 build failed x86 and i386 with clang.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> -----------
> block/blk-cgroup.c:1237:6: error: variable 'ret' is used uninitialized
> whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>         if (init_blkcg_llists(blkcg))
>             ^~~~~~~~~~~~~~~~~~~~~~~~
> block/blk-cgroup.c:1287:9: note: uninitialized use occurs here
>         return ret;
>                ^~~
> block/blk-cgroup.c:1237:2: note: remove the 'if' if its condition is
> always false
>         if (init_blkcg_llists(blkcg))
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> block/blk-cgroup.c:1222:33: note: initialize the variable 'ret' to
> silence this warning
>         struct cgroup_subsys_state *ret;
>                                        ^
>                                         = NULL
> 1 error generated.
> 
> Links,
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y-sanity/build/v6.1.38-599-g5071846d06ef/testrun/18327562/suite/build/test/clang-lkftconfig/history/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2SfFoWj9NmKWHRijR0hcoXGjLhr/
> 
>  tuxmake \
>  --runtime podman --target-arch x86_64 \
>  --toolchain clang-16 \
>  --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2SfFoWj9NmKWHRijR0hcoXGjLhr/config
> \
>  LLVM=1 LLVM_IAS=1
> 

It looks like 6.1 needs commit b5a9adcbd5dc ("blk-cgroup: Return -ENOMEM
directly in blkcg_css_alloc() error path") if it wants to take commit
3b8cc6298724 ("blk-cgroup: Optimize blkcg_rstat_flush()").

Cheers,
Nathan
