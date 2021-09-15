Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A54A3FC4
	for <llvm@lists.linux.dev>; Wed, 15 Sep 2021 07:50:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADF2D60FC0;
	Wed, 15 Sep 2021 07:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631692222;
	bh=rOV6VdXOkJfIxOZPAprG0bTwTgNrwNK0GLwnyoOsXsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CosvF/2mEpaBVAjk53vkw4rFZiBvUkNPDmFsfVfB8AfAS5yKMJtJV7Y0n9VW7nXSW
	 UvG1NsbzUEVdWxb/8+mUtvh2ifCubaNGGvEYAUm08wx36HbFK088m8v+2hra9wu2jh
	 sWoZW8Jj4vByrYnQTEiu1EQ1Y2ZR7IR3AbV7vvpaY/iknKCt+E26mYv1aHOG627H5M
	 xjE6Tql5nC5Ewy5IST3yo3/SRyx4pEgwAnAHgk0MW5MD4+50RRRk1RBjEFLW90V2ld
	 ohXEW9BtfzBlPBGqAa2MMXpaaSEYtPTUvU40gQ7po2aPVi681FStvYPDlvnLWk0x/p
	 1TjIrJPBhXsiA==
Date: Wed, 15 Sep 2021 08:50:17 +0100
From: Will Deacon <will@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] hardening: Avoid harmless Clang option under
 CONFIG_INIT_STACK_ALL_ZERO
Message-ID: <20210915075011.GA7321@willie-the-truck>
References: <20210914200203.1667751-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914200203.1667751-1-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Sep 14, 2021 at 01:02:03PM -0700, Kees Cook wrote:
> Currently under Clang, CC_HAS_AUTO_VAR_INIT_ZERO requires an extra
> -enable flag compared to CC_HAS_AUTO_VAR_INIT_PATTERN. GCC does not,
> and will happily ignore the Clang-specific flag. However, its presence
> on the command-line is both cumbersome and confusing. Due to GCC's
> tolerant behavior, though, we can continue to use a single Kconfig
> cc-option test for the feature on both compilers, but then drop the
> Clang-specific option in the Makefile.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: llvm@lists.linux.dev
> Fixes: dcb7c0b9461c ("hardening: Clarify Kconfig text for auto-var-init")
> Suggested-by: Will Deacon <will@kernel.org>
> Link: https://lore.kernel.org/lkml/20210914102837.6172-1-will@kernel.org/
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  Makefile                   | 6 +++---
>  security/Kconfig.hardening | 5 ++++-
>  2 files changed, 7 insertions(+), 4 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Cheers for sorting this out!

Will
