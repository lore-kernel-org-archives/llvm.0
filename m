Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A4B29B78D
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694115; cv=none; b=tyXquygsf3rrv2ylAXhjon4WfhhJ2DiCjj2pwS5zqJ5Ok+Vhu5Nj2gdQ7rvOnRglKk5qvEklboHqWHilCphSr79riNRkTAs9wt60L1C5k5RasQLMJrGM1eJEoEjM80I+AefRPuWjS9KZJAUfzXJYd04KbKX0ZvWp/G1e0PUhEYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694115; c=relaxed/simple;
	bh=ar0UnT2Yf6ATEdREMKjiTXw0uYwcU8nFbttA+DCRms4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lbTc4k2qbm+VZhQGyf78ZkXQHm1rEyinTOlOyiEsAgsZm4suxrA7jyBRaIbwQx6EBTfdRaii2s0mt+KlmWjtkyTg2QpzEoOGO9i9aeV5pRWla1b5Qmp4ZkcYYWtZ+lMQLM5VJ2xAHUnoW1VR/mf5YGKTfwV53FpIV1MnYvSbUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOBXfkzZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOBXfkzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDE21F00A3A
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783694112;
	bh=y78wDCYJYHTyo10Yy/U/nktUgeRNnanvtBS21tUkdTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MOBXfkzZdKgmWOj42u9RPbnuyDtiReSnFFcnuEX55QtvGAai1UJFo9Cg+LcJrQv5Y
	 wPN276E8qU1Y9TA4ERpBVDx66DyQ11sBNyt8IvBI9CVKIn8zC3sGQA+vMlmPEh9gn3
	 dy+H6u6qa0hQ5d3rs9yYQ1NXoksz2ujtwiYuaG1uEvj9vGhcD+JrW0sPssNL15CZ0V
	 VB7LtsWTYvumN1WSaZT3wS5U/KCdH2nvl+fHE3ouyonK22kUbD/6+rSxEhl/KtpwOj
	 BOuRlyH0oyAolWmCODWpZEqU7pL4fuJ96dNvRBOQdlQLekGCIBLyRhf7PL3xCctQLx
	 Z7TsXm6mJg97A==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15d5468673so136192266b.0
        for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 07:35:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrVN2Xw6YLFTjlZTzFBzqLTARAbhq9IRq4u8PmYpSCM1E2rIXQ6MvxTGJoxI6DeIXxubtSn@lists.linux.dev
X-Gm-Message-State: AOJu0YxQwvYoFXjxcLOpm2z8c30YAiOeynkUYbU6shdylS5F6PSO3y7l
	S/Jl62VVIZaTcbNSwN4rT7+aNC9eJgO5Mh9gQyVfhw/E885wBgr/dVX7c6yCCVic8oMRFp26hWV
	vTF4ekU89VClFwaN+KxIzchKBYy0DNEw=
X-Received: by 2002:a17:906:c78a:b0:c0d:43b2:e8e7 with SMTP id
 a640c23a62f3a-c15ce0c69f3mr393931266b.35.1783694111017; Fri, 10 Jul 2026
 07:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAhV-H4cr9xBkM-SEUHXm9t0yQ=r3B9pkNdmUDftP00hvVsZrQ@mail.gmail.com>
 <20260709132103.16433-1-dongtai.guo@linux.dev>
In-Reply-To: <20260709132103.16433-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 10 Jul 2026 22:34:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6x2ue4Qwp88vp56SxD0eBQYgKnAwTNqcdx1z1C-GsUdQ@mail.gmail.com>
X-Gm-Features: AUfX_mx8tTDe4LesZfwZ69LWwKsSAGhBal5UU-EtfpHWy7HKWheIGy_BC162Eo0
Message-ID: <CAAhV-H6x2ue4Qwp88vp56SxD0eBQYgKnAwTNqcdx1z1C-GsUdQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] LoongArch: Add livepatch build (KLP) support
To: George Guo <dongtai.guo@linux.dev>
Cc: jpoimboe@kernel.org, joe.lawrence@redhat.com, wangyuli@aosc.io, 
	peterz@infradead.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	kernel@xen0n.name, rostedt@goodmis.org, ardb@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, yangtiezhu@loongson.cn, 
	jiaxun.yang@flygoat.com, liukexin@kylinos.cn, guodongtai@kylinos.cn, 
	xry111@xry111.site, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 9:21=E2=80=AFPM George Guo <dongtai.guo@linux.dev> w=
rote:
>
> Hi Huacai,
>
> Thank you for raising this -- I take the concern seriously, and I'd like
> to lay out the full history so everyone is working from the same facts.
>
> > 2. ... Wang Yuli had already alerted you in your v1. At that point, you
> > had two options: a) abandon your own patches ... or b) thank Wang Yuli
> > for the reminder and assistance, then seek to collaborate on
> > development. However, you did neither
>
> I did take option (b). Wang Yuli's v1 messages were code review, and I
> thanked him on-list and folded every point into v2:
>
>   https://lore.kernel.org/all/20260608103302.340456-1-dongtai.guo@linux.d=
ev/
>
>   "Thanks for the review -- all three points are addressed in v2. ...
>    You were right that this had not been properly exercised before ..."
>
> His "awM is dangerous, see how x86 did" comment in particular led
> directly to the ANNOTATE_DATA_SPECIAL rework that is in the series now.
> The review made these patches better and I'm grateful for it.
There is no "Co-developed-by: Yuli Wang" in v2 and v3, right?

>
> > 1. Wang Yuli released his version first; re-releasing it without any
> > prior communication is simply rude.
>
> On priority: this series is not a fork of Wang Yuli's. I have been
> carrying LoongArch livepatch tooling since kpatch, which is klp-build's
> predecessor (same maintainer, later folded into the kernel). My kpatch
> LoongArch support was posted on 2024-12-05 and merged 2026-01-12:
Whether it is a fork is not important, the most important thing is
that his klp-build patches appeared in the maillist first.

>
>   https://github.com/dynup/kpatch/pull/1427
>
> developed over several review rounds with Joe Lawrence. When Josh
> announced the kpatch -> klp-build transition, he listed the LoongArch
> port as coming from me:
>
>   https://github.com/dynup/kpatch/issues/1498
>   ("loongarch ... shared by @georgejguo below, coming soon")
>
> So this klp-build series is the continuation of my own earlier work,
> not a takeover of someone else's.
>
> On scope: Wang Yuli's own suggestion in v1 was to use his patch to
> replace "these two patches" -- i.e. the basic arch-enablement piece.
> This series is the objtool/klp-diff and build-tooling integration
> (12 patches), including four fixes Joe found by running the full
> klp-build flow end to end. The overlap is just the arch-enablement part.
>
> > does that mean Wang Yuli can now throw yours in the trash when he
> > releases his v2?
>
> I don't see this as anyone's to throw away -- it's shared work toward
> the same goal, and I'd much rather converge than duplicate. Concretely:
> I'm happy to fold the overlapping arch-enablement patch in with Wang
> Yuli as author (or Co-developed-by), and to work with him on the rest.
>
> Wang Yuli, if you're up for it, let's coordinate -- I can take the
> objtool/klp-diff pieces and we land one clean series together.
That's great, later is better than never. I hope the final version is
a complete and elegant one, and reflects both of your efforts.

Huacai

>
> Thanks,
> George
>
