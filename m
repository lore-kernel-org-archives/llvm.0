Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A802F34
	for <llvm@lists.linux.dev>; Wed, 18 Jan 2023 23:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B000C433EF;
	Wed, 18 Jan 2023 23:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674085971;
	bh=ujKlKTm3fP5xRRp7Z+RXK1s6Ihb6f47e/fWPuzn2Hmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlFl31uaOTKsV5hlnmlBRpfK2QXaBtGMDZvM2s5ImJaP8oMJjJgWUF0Pop2e+vgNi
	 e7d5upXyKB7fmL7jTdcgUQ9vj/mPzCes9FvxH5/PhjNOhsvVHbohDw4eKIgqGzk6Lm
	 GxpqJ0F+qZKUS6r7fisUIyMSId/DyzWFr9LbjsYDmAmsdae+mfjouwx57rPxPn7ZRG
	 r+SeACVKYBIzHoIOLxGC21BL/Z3i1YjpX5CznIHqPazcu9K3Tt2WRBWJKiAsTmi9xi
	 BeVF/uSvlSfupqKi4iHrQnqbULyd2lDF7nS30cTrNCO0la/ZTVs6O4i2e+l4yZFsEl
	 lYm3WAiHT+Law==
Date: Wed, 18 Jan 2023 16:52:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Yingchi Long <i@lyc.dev>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Failure after working-10379-ge327b52766ed: [C2x]
 reject type definitions in offsetof
Message-ID: <Y8iGUSUkH+DKlyzg@dev-arch.thelio-3990X>
References: <1845462665.226.1674085683293@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1845462665.226.1674085683293@jenkins.jenkins>

On Wed, Jan 18, 2023 at 11:48:02PM +0000, ci_notify@linaro.org wrote:
> Failure after working-10379-ge327b52766ed: [C2x] reject type definitions in offsetof:
> 
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 21439
> # First few build errors in logs:
> # 00:11:10 ./include/trace/events/initcall.h:38:3: error: 'struct (unnamed at ./include/trace/events/initcall.h:27:1)' cannot be defined in '__builtin_offsetof'
> # 00:11:10 ./include/trace/events/initcall.h:38:3: error: initializer element is not a compile-time constant
> # 00:11:10 ./include/trace/events/initcall.h:59:3: error: 'struct (unnamed at ./include/trace/events/initcall.h:48:1)' cannot be defined in '__builtin_offsetof'
> # 00:11:10 ./include/trace/events/initcall.h:60:3: error: 'struct (unnamed at ./include/trace/events/initcall.h:48:1)' cannot be defined in '__builtin_offsetof'
> # 00:11:10 ./include/trace/events/initcall.h:59:3: error: initializer element is not a compile-time constant
> # 00:11:10 ./include/trace/events/power_cpu_migrate.h:23:3: error: 'struct (unnamed at ./include/trace/events/power_cpu_migrate.h:17:1)' cannot be defined in '__builtin_offsetof'
> # 00:11:10 ./include/trace/events/power_cpu_migrate.h:24:3: error: 'struct (unnamed at ./include/trace/events/power_cpu_migrate.h:17:1)' cannot be defined in '__builtin_offsetof'
> # 00:11:10 ./include/trace/events/power_cpu_migrate.h:23:3: error: initializer element is not a compile-time constant
> # 00:11:10 make[2]: *** [scripts/Makefile.build:289: arch/arm/common/bL_switcher.o] Error 1
> # 00:11:10 make[1]: *** [scripts/Makefile.build:289: init/main.o] Error 1

I sent backports to stable for this build failure, which should
hopefully be picked up and released soon.

https://lore.kernel.org/Y8TWrJpb6Vn6E4+v@dev-arch.thelio-3990X/

However, the most recent version of the LLVM change downgrades this
message to a warning under -Wgnu, which the kernel disables so there
should be nothing to do here with an up to date version of LLVM main.

Cheers,
Nathan
