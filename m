Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62F7D07D
	for <llvm@lists.linux.dev>; Wed, 10 Sep 2025 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757520959; cv=none; b=iWdkSOCitLY23zpBDn8VMwV0+si2RyixWU94C8jm0eK5MeSEtzRsa3jj47iM3pOXOxEIkPJzQLxDijGYHslVJ/olz3xhbQo4odVUQXqhPBX5FUpKkL8WO/MDMNCKGJUENcsVADMDp0zfI7+i0XUeKSJL37dX2rtSYj+9CPVFTAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757520959; c=relaxed/simple;
	bh=L2DsCL2RrhRc/ol4rKQ7Zg2pyk90yAfTPMOHS388Zzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYL85ECEFh7W2ATzDjB5ueQaIF/y3H/kUgbh81ogb7w/csxUpoz+48EjzVjVj9Cw0pxfyFleEcJAPKQLaGbaj9+Hqe1hihr9TK7CizZXgRMvcTWFI3/GIrKbyu8VAtTkdUX1kwZWu6E/Iqc88RVs96w89oPKLQQcuANA0eSwlDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfq6L2Ti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wfq6L2Ti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BF6C4CEEB;
	Wed, 10 Sep 2025 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757520958;
	bh=L2DsCL2RrhRc/ol4rKQ7Zg2pyk90yAfTPMOHS388Zzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wfq6L2TiQXTJtVrp/gL3XXXS5azuEfUihMN2zYhezsskCxLsOYUAG6bGPtixKZdo0
	 1gxxxDHPy1jXUvUQ3OXloVH7lSqy/yf7s1ghu6F0bju39P6B5YVan7/zE36XtSNS5p
	 /6uHjuGIz7kOenTlFPKmH1YU6zDJbGmyDqLncXtn6Qt/Hj00bkiYcdpBlbzmPMslrz
	 Syv2/zfVf4VU456T8jefMxDOIZ+n7kxe4qcci+QoC45aQ91unRu2Ndwkc+ShHJahDw
	 SY/wjvYn//3VnUhCO+IDRYwLCC1AsEqZpqUNjcdksT14Zql1Q3vPujZsR34eSjIZE+
	 Gu2FLZwNUEjDA==
Date: Wed, 10 Sep 2025 09:15:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-22-init-6898-gdf430c33a71f: Failure on
 aarch64
Message-ID: <20250910161555.GA1958434@ax162>
References: <1155652020.15599.1757481829520@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1155652020.15599.1757481829520@jenkins.jenkins>

On Wed, Sep 10, 2025 at 05:23:47AM +0000, ci_notify@linaro.org wrote:
> In tcwg_kernel/llvm-master-aarch64-stable-allyesconfig, after:
>   | commit llvmorg-22-init-6898-gdf430c33a71f
>   | Author: Nathan Chancellor <nathan@kernel.org>
>   | Date:   Mon Sep 8 11:33:57 2025 -0700
>   | 
>   |     [Frontend] Define __SANITIZE__ macros for kernel address variants (#156543)
>   |     
>   |     GCC defines these macros for both userspace and kernel address
>   |     sanitizers:
>   |     
>   | ... 29 lines of the commit log omitted.
> 
> Produces Failure:
>   | Results changed to
>   | # reset_artifacts:
>   | -10
>   | # build_abe binutils:
>   | -9
>   | # build_kernel_llvm:
>   | -5
>   | # build_abe qemu:
>   | -2
>   | # linux_n_obj:
>   | 316
>   | # First few build errors in logs:
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]
>   | # 00:08:01 ./include/linux/compiler-clang.h:28:9: error: '__SANITIZE_ADDRESS__' macro redefined [-Werror,-Wmacro-redefined]

Thanks for the report. The kernel side fix for this has been picked up
in a maintainer's tree [1] so it should be in Linus's tree soon then
into stable shortly after that. This was already a problem in certain
trees with CONFIG_KCSAN and __SANITIZE_THREAD__, I just made it a little
worse ;)

[1]: https://git.kernel.org/akpm/mm/c/3fac212fe489aa0dbe8d80a42a7809840ca7b0f9

Cheers,
Nathan
