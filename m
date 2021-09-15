Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78C3FFB
	for <llvm@lists.linux.dev>; Wed, 15 Sep 2021 18:28:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7880D61056;
	Wed, 15 Sep 2021 18:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631730517;
	bh=J4irWWTttRLzUa4ZxK6CY3XbXrpwASnT9hjqollFfjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBpX0PF2Pz4oOZ/kc/9eA4iSg0tZcMXk+Bv+ThEi+g0MShepA/AtzWSn6gba1s1TX
	 XdzXYjHtBrJ8JM1T9v4/ELkRW42uWHnZsvZKTecWUb8h5w+h5Fy6n/rGunLrZmvu4b
	 xUjMvABM/C+LqPT7G0wTfHmzOlXgFWuz0nmUFeEyPYPTVAfkD/gQse3hCkVLAvkXQ5
	 W4dDnHXoHyETc/cseIDhAdXZ3F6vgGxso9yhq8JqS8lctZtefctjFVGqZtOJ5GQqHV
	 ULcFbGMRVpQoyRABUNJaiTYvpWFThrYko8mIppW088fi0tC9PHEv5AFdtXnhdIHmH8
	 /JCo2wlwMyXsA==
Date: Wed, 15 Sep 2021 11:28:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: CKI Project <cki-project@redhat.com>
Cc: llvm@lists.linux.dev
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 kernel 5.15.0-rc1 (mainline.kernel.org-clang, 80be5998)
Message-ID: <YUI7UIZvrsfMO716@archlinux-ax161>
References: <cki.F1734A8D11.3SEIGX3SIL@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cki.F1734A8D11.3SEIGX3SIL@redhat.com>

On Wed, Sep 15, 2021 at 06:24:13PM -0000, CKI Project wrote:
> 
> Hello,
> 
> We ran automated tests on a recent commit from this kernel tree:
> 
>        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>             Commit: 80be5998ad63 - tools/bootconfig: Define memblock_free_ptr() to fix build error
> 
> The results of these automated tests are provided below.
> 
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: FAILED
>  Selftests compile: OK
> 
> All kernel binaries, config files, and logs are available for download here:
> 
>   https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?prefix=datawarehouse-public/2021/09/15/371395708
> 
> We attempted to compile the kernel for multiple architectures, but the compile
> failed on one or more architectures:
> 
>             x86_64: FAILED (see build-x86_64.log.xz attachment)

00:25:26 drivers/infiniband/hw/qib/qib_sysfs.c:413:1: error: static_assert expression is not an integral constant expression

We have a pending solution:

https://github.com/ClangBuiltLinux/linux/issues/1452
https://lore.kernel.org/r/0-v1-1b789bd4dbd4+14b16-clang-fix_jgg@nvidia.com/
https://git.kernel.org/rdma/rdma/c/3110b942d36b961858664486d72f815d78c956c3

Cheers,
Nathan
