Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F132C0294;
	Wed, 22 Apr 2026 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837024; cv=none; b=Et7U9dCE+NCHA1Mz7EeyoCJbyf5dJqbPaG7vmPftgZVTIkXIfQz810yBMlY5lY1rs3Nrrk2Dz5dMpQfF09HwxnRk0sUblVfJ2qtgGEQ+erTFza++K0oRfO12BE8R0qFVbRhhgSSyXhSlIQT62P+m0B3uqX1NWxS0lRAa3ErqfH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837024; c=relaxed/simple;
	bh=wCxI24RoSFR+H8hKXe+TeVNkx+LYrpHCkxRLGXxULEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShqP+NMZ4k9CedV6dplhZLy2IM0Eiv3jGt5n0lMOusCrfTjiFg9sRTtLaK26O5dL1aRVZKA7H+Mqj1bgNFDirt5pBzaxgRED1LBEzDGTJikP5lBVrtKiRvnid+o7HAqxWMSYuBFea0Q29aqSMwPdYmevQ8MG/5cjPw2uVc5sQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNrb9q55; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNrb9q55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF314C19425;
	Wed, 22 Apr 2026 05:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776837024;
	bh=wCxI24RoSFR+H8hKXe+TeVNkx+LYrpHCkxRLGXxULEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nNrb9q55pTf1YmadbHp5PGpo/+nA0eFCK+P6VwVJNiWColCN4tj87lRyl5FLQ3Xfb
	 OUTrYexVWZNz5IvVGhzA+/9S9VD4+7jma/B5hFU8IQye0J7ymSzxdPaR5Zy1pR5TyJ
	 //sREpWQPd6IwTvhrV2jGBUbWzC4S5yvrEmqq4u6O0WV6z5/swJa++PcY+9XhTWYNK
	 Ix1DiazH7dnaDVue2QZ6gFFy1IBahMs4trbrXapCUoq3i/lPZpjJ24UAkxg2TE2KWC
	 IO34nhlq35kHyQer4diptgpCL44eJmHMTjxOP21QPo+StkGl3s+dqp7nYk0Jp+JFLe
	 qHscMMMvwDHcQ==
Date: Tue, 21 Apr 2026 22:50:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
Message-ID: <20260422055020.GA3392234@ax162>
References: <20260421190351.1976329-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421190351.1976329-1-elver@google.com>

On Tue, Apr 21, 2026 at 09:03:47PM +0200, Marco Elver wrote:
> Add support for the `__access__` attribute, which is supported since gcc
> >= 11 but not currently supported by clang.
> 
> The attribute allows specifying how a function accesses memory passed
> via a pointer argument (read_only, write_only, read_write, none) and
> optionally the size of the access. Per [1] these annotations only affect
> diagnostics, and should not affect code generation:
> 
> 	"The access attribute enables the detection of invalid or unsafe
> 	 accesses by functions or their callers, as well as write-only
> 	 accesses to objects that are never read from. Such accesses may
> 	 be diagnosed by warnings such as -Wstringop-overflow,
> 	 -Wuninitialized, -Wunused, and others."
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
> 
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  include/linux/compiler_attributes.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index c16d4199bf92..ef4e279e9872 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -20,6 +20,18 @@
>   * Provide links to the documentation of each supported compiler, if it exists.
>   */
>  
> +/*
> + * Optional: only supported since gcc >= 11
> + * Optional: not supported by clang
> + *
> + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
> + */
> +#if __has_attribute(__access__)
> +# define __access(x, ...)		__attribute__((__access__(x, ## __VA_ARGS__)))
> +#else
> +# define __access(x, ...)
> +#endif
> +
>  /*
>   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-alias-function-attribute
>   */
> -- 
> 2.54.0.rc2.533.g4f5dca5207-goog
> 
