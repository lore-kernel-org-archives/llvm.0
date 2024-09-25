Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3274644E
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727282719; cv=none; b=Ax++ce/B/oySvRIQ5nNSLv1xLmd2gmeRbkO20AHZYA7/jjTlQI3BXMIL+eDgIyWm0jJGJDy6tDHBdjWtc7k2knWycQrNGHNcwlGIrGmI+U/di1fcl3nwbdo1SvEeN4dYZp4O0kdbABUvK8imneP4dXGqecuGPIuVIf9/PIe3HJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727282719; c=relaxed/simple;
	bh=qgOwvX93MJaNEr7OQzS/TNQMPiUPOBpt0ph4xzwCx1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AziAgYNVvwboynEcgkaYY5LVkkFiI1lr6p5Is101RhyjKuqts3xxLYLa41S01kO6fJ8mdW0Xa0Ug7aF9dOnBIfnBuW81mtuCeJm3X9MMEK748Bm6A2R2Z+qA8AKIp3mKu6FzMX4dpftl5EnHXQVMo0cz3ITpUsjkoeuoXy+AMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onMHF/g0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onMHF/g0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53AFC4CEC9
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 16:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727282718;
	bh=qgOwvX93MJaNEr7OQzS/TNQMPiUPOBpt0ph4xzwCx1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=onMHF/g0D43HW6aMXQhcIu1A27RFbkhoDeVTu1IsE3Dr45prf9Gt/b9XTbLxkLRdc
	 tp+sKb+2tVL2RKsH7zt7pedqKxbxASz7T6hHTvkigsDpqXaREORqbOHeHr1WNosC80
	 8oqjuX47b/9IC6c9ciSn6WciiPIOmDd4sLFsDQ49EcS7F2y6hlJlFootPDIZyx6tV1
	 nZWbOIv6XsJEj83cV3qJkPJFVqvvPhr7TNk6o6VoBEYUa0GNLZHRv55RTy27voXKfL
	 S1kfkqExZO+yREPbbJkOthV308A1sBbwWyv5+7Rufb9Ltpojr4m1MeoarzGHGNAwS0
	 hJW9ST3pclReg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f759688444so246131fa.1
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 09:45:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/wFoVlChF35Z6rfkN+mecYh7RwNybhstkxtOycLeLusO5I5xnYI7aFLKZxLe4Fum6IkBY@lists.linux.dev
X-Gm-Message-State: AOJu0YxE71THnys0wI2m+cDzziY1LyC1Ws+KC5vCwEgkfYKM+u+fdJ21
	gna/K3o5gmzdj3/7WRnyczTltbAHPNJZSB8yiAbp2eyN7q0m7Lhf0GFA17ji6F0Iqd3p31zCjPY
	N6dO36u0Qt2gtcFtYdn4j3IKRrwM=
X-Google-Smtp-Source: AGHT+IHztXYzAiMagygAhzDxKwnY8wOFDul9cLbEROanbEnmGDGU1AJFUfvHaHhmJ6jyIhgnmNtdOygZ3lKoSkpCLq0=
X-Received: by 2002:a2e:702:0:b0:2ef:20ae:d113 with SMTP id
 38308e7fff4ca-2f91ca64507mr16954501fa.40.1727282716715; Wed, 25 Sep 2024
 09:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-44-ardb+git@google.com> <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
In-Reply-To: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 Sep 2024 18:45:05 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH1xqYwhG16XxoBpoedTkBvt72xBjO259174jHirdf47A@mail.gmail.com>
Message-ID: <CAMj1kXH1xqYwhG16XxoBpoedTkBvt72xBjO259174jHirdf47A@mail.gmail.com>
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 18:39, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 25 Sept 2024 at 08:16, Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > Instead of pushing an immediate absolute address, which is incompatible
> > with PIE codegen or linking, use a LEA instruction to take the address
> > into a register.
>
> I don't think you can do this - it corrupts %rdi.
>
> Yes, the code uses  %rdi later, but that's inside the SAVE_REGS_STRING
> / RESTORE_REGS_STRING area.
>

Oops, I missed that.

> And we do have special calling conventions that aren't the regular
> ones, so %rdi might actually be used elsewhere. For example,
> __get_user_X and __put_user_X all have magical calling conventions:
> they don't actually use %rdi, but part of the calling convention is
> that the unused registers aren't modified.
>
> Of course, I'm not actually sure you can probe those and trigger this
> issue, but it all makes me think it's broken.
>
> And it's entirely possible that I'm wrong for some reason, but this
> just _looks_ very very wrong to me.
>
> I think you can do this with a "pushq mem" instead, and put the
> relocation into the memory location.
>

I'll change this into

  pushq arch_rethook_trampoline@GOTPCREL(%rip)

which I had originally. I was trying to avoid the load from memory,
but that obviously only works if the register is not live.
