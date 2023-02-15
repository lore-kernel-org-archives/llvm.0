Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92990C5D8
	for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 18:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9C0C4339C
	for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 18:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676487443;
	bh=5sA/GkKB672YgfySlkTvpsgV6jFfW0ewXVzumpKClJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qUP0g1Y3vKUKJX2u/BfxIK1I2EFwOmujk3pcDIOzBlcbomaqFq/0Lr6C+tI9tXloW
	 T22Dyf5Lzdq2jrIS3ujGaHB/oGxv3Ggl3BaAyLn4Nv5JXbC2eMvd66ybaWIkO9ZoHr
	 BawRrDM91wmtng4Zg1nUl6RPp6kQSVmB7xW9dQdoV3vVZpmAZOKu26DxDjtu2DVn3c
	 ZSCXXNraymAkpSZI2+047+OL9mH+qC7Gq+eVhvAT5E9dPcW6FwPo8U80Idig9XzRg9
	 fIBvbtFCYTBi2s/BDO8HMoKuRp/5KabW83GlT655u9WBpYpcaC+KqrXPv3g9pM3PSF
	 DJGdYrjtFKUCA==
Received: by mail-lf1-f42.google.com with SMTP id bp15so28734386lfb.13
        for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 10:57:23 -0800 (PST)
X-Gm-Message-State: AO0yUKWL1sxN2tojaXaF0u22RlF72SYytaBnyvFDj3E44sNdKk3IqlDv
	B6Q5ODa/pGITou03gr03EJTfDIBz6fSU0FBqK/8=
X-Google-Smtp-Source: AK7set8D9UvcPF2NNMQcbWg4CZbyXd3FwtHrjDgfodVpnwH/PgU4hJiVgfzHdeZn0aI103wP3X5ft++Y5Ec496D4TYI=
X-Received: by 2002:ac2:593a:0:b0:4db:4568:6fe9 with SMTP id
 v26-20020ac2593a000000b004db45686fe9mr871517lfi.3.1676487441367; Wed, 15 Feb
 2023 10:57:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230210064243.116335-1-jiapeng.chong@linux.alibaba.com>
 <Y+0MsMomkcDBdjNI@chrisdown.name> <Y+0PzlA0LijhfD8R@dev-arch.thelio-3990X> <Y+0VAr21hlIdrxyp@chrisdown.name>
In-Reply-To: <Y+0VAr21hlIdrxyp@chrisdown.name>
From: Song Liu <song@kernel.org>
Date: Wed, 15 Feb 2023 10:57:09 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5U2qXa_O46_v-hzWqq5L7bRs6bQe5QGGnMOMzX3y4KgA@mail.gmail.com>
Message-ID: <CAPhsuW5U2qXa_O46_v-hzWqq5L7bRs6bQe5QGGnMOMzX3y4KgA@mail.gmail.com>
Subject: Re: [PATCH] module: Remove the unused function within
To: Chris Down <chris@chrisdown.name>, mcgrof@kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	ndesaulniers@google.com, trix@redhat.com, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Wed, Feb 15, 2023 at 9:23 AM Chris Down <chris@chrisdown.name> wrote:
>
> +Cc: Song

Thanks for the CC!

>
> Nathan Chancellor writes:
> >On Wed, Feb 15, 2023 at 04:47:44PM +0000, Chris Down wrote:
> >> Jiapeng Chong writes:
> >> > The function within is defined in the main.c file, but not called
> >> > elsewhere, so remove this unused function.
> >>
> >> Huh? It's used by __module_text_address(), no?
> >
> >Not after commit 2ece476a2346 ("module: replace module_layout with
> >module_memory") in -next. This patch should have a fixes tag, even if
> >the warning is currently hidden behind W=1.
>
> Huh, I thought I had checked out latest -next, but must have not done so
> somehow :-) Mea culpa.
>
> If it's only in -next then no Fixes needed, since there's no stable rev yet.
>
> Jiapeng, in future, please make sure to cc the author of related commits when
> reporting stuff like this :-) It helps people to update their patches.
>
> Song, you probably want to update your patch.

Luis, would you prefer a new patch with everything folded in? Or would
you apply the patches on your end?

Thanks,
Song
