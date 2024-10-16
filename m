Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A339F1531CC
	for <llvm@lists.linux.dev>; Wed, 16 Oct 2024 02:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729046068; cv=none; b=q7ryQSj5jHaL4PMKRpXVJPnvlsrT9niNvcHX3LtLRl7+xFHUv3F7OHHlTBvxudoYMjTb88/e/K1rELrgo7AhA3gev29SX+Qnx6kr4gW4fjagxRldyUZE3V6uKaoP9+S5Qo1R+THaFlZMqHDGzrTTqMyFae50c2OrzzuFPSj76vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729046068; c=relaxed/simple;
	bh=yJGBVUpZrAxCkVWAv7xnyqTDoabYgqFnkJBcr1NBFCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+mDcpEm8uHV8ZaPoMMFoMPy3FvqDfEAuySzd07Bfetut7tvj3n/XNnDwO8ghII6bSxBP7vLw34LYQdyMUcQl3MBwMRDgQbQQPoFLL5mMrrBS6qv8LDdUhO9mABL7E0TjqDYeZArmvErb4q5n/otK/zpikatFwryb7X+441QlNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ud+WjJV1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ud+WjJV1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2366C4CEC6;
	Wed, 16 Oct 2024 02:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729046068;
	bh=yJGBVUpZrAxCkVWAv7xnyqTDoabYgqFnkJBcr1NBFCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ud+WjJV1m+xFKjOYVbvqUl6STV1zc95Wdj1bHS1wkBcWtf3yrZzaaAW4Lk2eJqG6b
	 JfdIwR5Bn7ouaWvD677GWGVOsP/PyVfD8ajd+F3dr5n5i+gF2MmnVRNBt6VQMcGmAH
	 WpnvylmYq4hG/sXAlMX9AUj4zeiTamBPMjl1EUACwMxymzN97th67DCBcMhI68dV8/
	 JtlD0yD0JUiOwsCCMve61ULwPREeIxoXTfeQ1Y5A9Eqoc+sOgzgX9Hz0L8cBn5Vv7I
	 drb00aeYcIk1OXpGAR8PAdIUDxsty7qCU8BMygxNy+eymi23RE7iXQIoMovWWUV5mG
	 DPk061J7nebIw==
Date: Tue, 15 Oct 2024 19:34:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: linux-um@lists.infradead.org, Benjamin Berg <benjamin.berg@intel.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v9 02/10] um: use execveat to create userspace MMs
Message-ID: <20241016023426.GA1115452@thelio-3990X>
References: <20240919124511.282088-1-benjamin@sipsolutions.net>
 <20240919124511.282088-3-benjamin@sipsolutions.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919124511.282088-3-benjamin@sipsolutions.net>

Hi Benjamin,

On Thu, Sep 19, 2024 at 02:45:03PM +0200, Benjamin Berg wrote:
...
> diff --git a/arch/um/kernel/skas/Makefile b/arch/um/kernel/skas/Makefile
> index 6f86d53e3d69..fbb61968055f 100644
> --- a/arch/um/kernel/skas/Makefile
> +++ b/arch/um/kernel/skas/Makefile
> @@ -3,14 +3,43 @@
>  # Copyright (C) 2002 - 2007 Jeff Dike (jdike@{addtoit,linux.intel}.com)
>  #
>  
> -obj-y := stub.o mmu.o process.o syscall.o uaccess.o
> +obj-y := stub.o mmu.o process.o syscall.o uaccess.o \
> +	 stub_exe_embed.o
> +
> +# Stub executable
> +
> +stub_exe_objs-y := stub_exe.o
> +
> +stub_exe_objs := $(foreach F,$(stub_exe_objs-y),$(obj)/$F)
> +
> +# Object file containing the ELF executable
> +$(obj)/stub_exe_embed.o: $(src)/stub_exe_embed.S $(obj)/stub_exe
> +
> +$(obj)/stub_exe.dbg: $(stub_exe_objs) FORCE
> +	$(call if_changed,stub_exe)
> +
> +$(obj)/stub_exe: OBJCOPYFLAGS := -S
> +$(obj)/stub_exe: $(obj)/stub_exe.dbg FORCE
> +	$(call if_changed,objcopy)
> +
> +quiet_cmd_stub_exe = STUB_EXE $@
> +      cmd_stub_exe = $(CC) -nostdlib -o $@ \
> +			   $(KBUILD_CFLAGS) $(STUB_EXE_LDFLAGS) \
> +			   $(filter %.o,$^)
> +
> +STUB_EXE_LDFLAGS = -n -static

After this change in -next as commit 32e8eaf263d9 ("um: use execveat to
create userspace MMs"), I am seeing an error when building ARCH=um
defconfig with clang.

  $ make -skj"$(nproc)" ARCH=um LLVM=1 mrproper defconfig linux
  clang: error: unknown argument: '-n'
  make[7]: *** [arch/um/kernel/skas/Makefile:19: arch/um/kernel/skas/stub_exe.dbg] Error 1
  ...

I have looked through the GCC manual and options index but I do not see
what '-n' is. Was this intended to be passed to the linker like -Wl,-n
or was there some other option that this should be? If I try dropping
it, I end up running into another issue, which could be entirely
unrelated.

  $ make -skj"$(nproc)" ARCH=um LLVM=1 mrproper defconfig arch/um/kernel/skas/
  /usr/bin/ld: arch/um/kernel/skas/stub_exe.o: in function `_start':
  arch/um/kernel/skas/stub_exe.c:83:(.ltext+0x15): undefined reference to `memset'
  clang: error: linker command failed with exit code 1 (use -v to see invocation)
  make[7]: *** [arch/um/kernel/skas/Makefile:19: arch/um/kernel/skas/stub_exe.dbg] Error 1

Cheers,
Nathan

> +targets += stub_exe.dbg stub_exe $(stub_exe_objs-y)
> +
> +# end
>  
>  # stub.o is in the stub, so it can't be built with profiling
>  # GCC hardened also auto-enables -fpic, but we need %ebx so it can't work ->
>  # disable it
>  
>  CFLAGS_stub.o := $(CFLAGS_NO_HARDENING)
> -UNPROFILE_OBJS := stub.o
> +CFLAGS_stub_exe.o := $(CFLAGS_NO_HARDENING)
> +UNPROFILE_OBJS := stub.o stub_exe.o
>  KCOV_INSTRUMENT := n
>  
>  include $(srctree)/arch/um/scripts/Makefile.rules
