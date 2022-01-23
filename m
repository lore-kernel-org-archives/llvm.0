Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DB173
	for <llvm@lists.linux.dev>; Sun, 23 Jan 2022 02:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCE1C004E1;
	Sun, 23 Jan 2022 02:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642904269;
	bh=zzMXAo44Z8c43EuJzA2ZeS487x4/98bxLhrEHWXVidc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBE3icVz8iArE0QV0wpjQh5/WmEUEdI1ap8lnrFrpBRkVRqxkzqkAKZUMMimWPBqs
	 PGfK+/AV68lu5m0NvSYthyIJOEUeL46kBwXz7vvAJGHQCOlPxc5yLLFHvdQUhTduiX
	 nZMyzg2zbJnJbr+lG0Tobj/HQJPd/frBzN5gc25urdB5cYYHAz433Opv74PGw2rthD
	 upiZGme+IGJyaONstc8a5UoVFml0Ok3q8Xckr1flrcloQ6T49f9WO83N65Am15jMSM
	 PPmfhv1rCjRpweIPKKtF8UCShcwEEq3tLZz6AgSBxW0vW3CWYFZ4i+utIdUqE+R/5J
	 buAk9KFZlX5nw==
Date: Sat, 22 Jan 2022 19:17:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Mubashar Ahmad <mubashar.ahmad@arm.com>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [Clang][AArch64][ARM]
 Unaligned Access Warning Added
Message-ID: <Yey6yY6hmj+Fb2L0@dev-arch.archlinux-ax161>
References: <1454838115.14607.1642854713913@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454838115.14607.1642854713913@jenkins.jenkins>

On Sat, Jan 22, 2022 at 12:31:52PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [Clang][AArch64][ARM] Unaligned Access Warning Added:
> commit 35737df4dcd28534bd3090157c224c19b501278a
> Author: Mubashar Ahmad <mubashar.ahmad@arm.com>
> 
>     [Clang][AArch64][ARM] Unaligned Access Warning Added
> 
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 20623
> # First few build errors in logs:
> # 00:03:03 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
> # 00:03:03 make[3]: *** [scripts/Makefile.build:277: security/keys/encrypted-keys/encrypted.o] Error 1
> # 00:03:03 make[2]: *** [scripts/Makefile.build:540: security/keys/encrypted-keys] Error 2
> # 00:03:05 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
> # 00:03:05 make[3]: *** [scripts/Makefile.build:277: security/keys/trusted-keys/trusted_core.o] Error 1
> # 00:03:06 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
> # 00:03:06 make[3]: *** [scripts/Makefile.build:277: security/keys/trusted-keys/trusted_tpm1.o] Error 1
> # 00:03:07 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
> # 00:03:07 make[3]: *** [scripts/Makefile.build:277: security/keys/trusted-keys/trusted_tpm2.o] Error 1
> # 00:03:08 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]

Thank you a lot for the report. I have opened an issue on GitHub for us
to track this new warning:

https://github.com/ClangBuiltLinux/linux/issues/1569

Cheers,
Nathan
