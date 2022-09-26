Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530973D70
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0BBC433C1;
	Mon, 26 Sep 2022 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664206322;
	bh=fVpJ0tKka/X50CQqrIluJILL3jFpF6MMz02mbNH4ogQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhzkGcDr9i5UxHlXHk47JgNo2kffV5nt5eVq+eRs9o/9EJOid05Z1OUiCVgZf0PIV
	 W7Q3cGp/eKCJj8IAJS0AwGNT1yMs2c/2sAlyoH6YrwkEWa2t6F2xv0zHHhGxYVoDQf
	 BupFWCG5argoBf8OkZ6zOfdUOBDUBfTmvKfYBxZv1kFmUa/w6aYm1Z23ulekDFRJrz
	 qX64W7lgHBuP+VGx4Mbc3B3vYJpg8ftWK/6ihVWBudygnz4KIe+iieLgxsQc797R/W
	 0fs//tBtKcOOocfeqa+i1btHWkOGgIYQdJVs0D93ffDFFMCwqKZvwvdMAJcVoVQuU/
	 I4KSvxePISc7Q==
Date: Mon, 26 Sep 2022 08:32:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Jun Zhang <jun@junz.org>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Failure after llvmorg-16-init-5673-ge07ead85a368:
 [Clang] Warn when trying to dereference void pointers in C
Message-ID: <YzHF8Hd+QgfEKGCW@dev-arch.thelio-3990X>
References: <209856189.2185.1664153838005@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <209856189.2185.1664153838005@jenkins.jenkins>

On Mon, Sep 26, 2022 at 12:57:17AM +0000, ci_notify@linaro.org wrote:
> Failure after llvmorg-16-init-5673-ge07ead85a368: [Clang] Warn when trying to dereference void pointers in C:
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
> 36
> # First few build errors in logs:
> # 00:00:50 ./include/linux/fortify-string.h:159:10: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
> # 00:00:50 ./include/linux/fortify-string.h:232:10: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
> # 00:00:50 ./include/linux/fortify-string.h:470:9: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
> # 00:00:50 ./include/linux/string.h:315:15: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
> # 00:00:50 make[1]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1
> # 00:00:52 make: *** [Makefile:1203: prepare0] Error 2
> 
> from
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 22763

I have added some commentary to the upstream review around this:

https://reviews.llvm.org/D134461#3815298

It is also being tracked on GitHub:

https://github.com/ClangBuiltLinux/linux/issues/1720

Cheers,
Nathan
