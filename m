Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CA07E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 21:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAECAC34115;
	Thu, 14 Jul 2022 21:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657834206;
	bh=pGm0dsNASTYMf22ud+Wu7McUirHoIf7rEXRhC4vp9qA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IMaYBh8EsSajCKtn5/TqeXYalivBUf6PZbpfG7e0JeKW2C9/2EGF2wGihOgv3byEx
	 6e06ZJCjE8fYREe3JS363dDB98jnUFQK3xqzbfc4pyxDuBY2Nvvip+89OyrgU6D8fB
	 jGuwUzExoDmHyLLtSV1xAkLEHzP/gTCokcOdl6YzTySRvv/CfqOVesKXoNkSg5ocuE
	 +I02B2a+BNiPztvpW62iP0T/+blURoDpWwKm9iyAiezO9XXYnX/rxp09i24ZENhCnn
	 n6x05JW7a00mUXf97nSoM6rnPTpB5GM6a3Nd1BQBpETyQI4hO+HN8WZF0H/aKMWwlF
	 lT9IzoMQ2Tknw==
Date: Thu, 14 Jul 2022 14:30:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Borislav Petkov <bp@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, Nick
 Desaulniers <ndesaulniers@google.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] x86/speculation: Use DECLARE_PER_CPU for
 x86_spec_ctrl_current
Message-ID: <20220714143005.73c71cf8@kernel.org>
In-Reply-To: <20220713152436.2294819-1-nathan@kernel.org>
References: <20220713152436.2294819-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Jul 2022 08:24:37 -0700 Nathan Chancellor wrote:
> Clang warns:
> 
>   arch/x86/kernel/cpu/bugs.c:58:21: error: section attribute is specified on redeclared variable [-Werror,-Wsection]
>   DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
>                       ^
>   arch/x86/include/asm/nospec-branch.h:283:12: note: previous declaration is here
>   extern u64 x86_spec_ctrl_current;
>              ^
>   1 error generated.
> 
> The declaration should be using DECLARE_PER_CPU instead so all
> attributes stay in sync.
> 
> Cc: stable@vger.kernel.org
> Fixes: fc02735b14ff ("KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Hi, sorry to bother, any idea on the ETA for this fix getting into
Linus's tree? I'm trying to figure out if we should wait with 
forwarding the networking trees or this will take a while.
