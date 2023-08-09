Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F019BB4;
	Wed,  9 Aug 2023 15:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4347CC433C7;
	Wed,  9 Aug 2023 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691595767;
	bh=tPmCD3hLfEfuWygG5x8Az6XzX5lGDP9qkbyRMrIY9mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEzcSNNGnjgubucOpEHZfT0qtx6wcxq6bPjiSSPTFYhvT+GY4ORnpgg+BC/vLX1u5
	 KQEH6K+CzpitQiFM54CHLCkurgJI4W/BN/2biVuRJaMIYVQQD98TXkDu83jPAwooC4
	 znMjKysEhOO5FcTKLY08NQzWYNaKvO5qscfqohp1Y6fPsNgCa66QuDvkygKVsN1x9+
	 rZGX+ZYxx6UvmGfh6p1DatA8F4GmP2u0r5/qTbFamOMqBB9X2fzTpO0hUqv4AdcyWO
	 AOPiIigMlXIIW7myvelKpsZ5JUPafCs9CmgXtBEhK5afBAXFK3hQUNLYwLii/lPwx2
	 BY0v9jubrNsFw==
Date: Wed, 9 Aug 2023 08:42:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2] Makefile.extrawarn: enable
 -Wmissing-variable-declarations for W=1
Message-ID: <20230809154245.GB832145@dev-arch.thelio-3990X>
References: <20230807-missing_proto-v2-1-3ae2e188bb0c@google.com>
 <202308081508.EI3CRzQo-lkp@intel.com>
 <CAKwvOdnDEaZt-mD2PvMDmCY1WyaqtrH+oM3M5JgZaiOOWA_0YQ@mail.gmail.com>
 <20230808161707.GA2171444@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808161707.GA2171444@dev-arch.thelio-3990X>

On Tue, Aug 08, 2023 at 09:17:07AM -0700, Nathan Chancellor wrote:
> I think the register storage issue should be resolved in at least clang
> before this patch is accepted, as that seems to be where the majority of
> warnings are coming from so far. Like we talked about, I'll take a shot
> at fixing that. Once that is fixed, I'll build mainline with
> -Wmissing-variable-declarations to see how many instances there are and
> if there are any other interesting edge cases that should be fixed in
> the compiler. After that, I think this should be good to go in. Does
> that sound reasonable?

I don't think there are any other edge cases from the brief glance I
gave my build logs but my matrix counts 700+ unique instances of this
(give or take some, due to interleaving issues). Quite a few but I see
several in certain files so it might not actually be too bad.

Cheers,
Nathan
