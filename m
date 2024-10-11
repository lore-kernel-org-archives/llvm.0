Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2848208981
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 06:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628202; cv=none; b=QL5Zo9AZHUsXOHXr2rRjMEQfmOQ6PFvCih8SvJeNVbaxtRCRiKCD+PnGRshXWODeTwixyYg7XlXJLGtnpr95vSfCMNRvHqh/YHeXl+VMPyooaUpyw66Lbh3kv6/hbC9KjhrWV+SvtmwOs4I44YxAxKoaDqtaYSNzK2J2ib/Mz10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628202; c=relaxed/simple;
	bh=1+jRHAMhuFEwDHlfamyg0oImfJH11bbQwBV/sR2tnCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5Oh20FDP+UaKlo8nWDee3vLzn6fEvUSzHrGdRlQWD1Sci1niRz/RmX2DHJEM9SuZXqHRINWrP62n5eN46NriB0NBaE0cvIR92UapErCNtfEEE1rBmiooYUmAmfAHca0Le0YGsDHoJpMO87gKtvxJdiGE0687rJ1lBFET4ckBSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEPo9ppS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEPo9ppS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A99CC4CED1
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 06:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728628201;
	bh=1+jRHAMhuFEwDHlfamyg0oImfJH11bbQwBV/sR2tnCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hEPo9ppSRxbrRDSoUY97QUCN0ZGUjNTAYP2v28R7Szc2J18IqKw4ZciglF41zLrv/
	 oPszIgjjYNya0PSEATYiasmLIY1AVSTitVUkxDZ5oS1R3/DnM27HcJutKcaXREsrXl
	 DPGns+a3OJURd2Cgnc1lzYZp/0a/wmoNPQbvnmb7BKl1OHOjH9YINJ+FlKd++nxsaT
	 VkfGuCmjPnhv3A3szIaKovC2csg8HPSr3c/CHOGXfSe2VuzVwo8gkYAgeac5kafbVt
	 iXih7rTdu9c0EOvLZZzIuJdNOphl2/4UfvVoDfaNeFYpYBxiKAYO7AUZIWephTZlrd
	 CoBYC3p5QeTqA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facf40737eso17972141fa.0
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 23:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfFV28H5m96l6bMnT2pSdqErWDMsiHJkbsPF6o2do370wT5jlElEa6O/59zMrIoZu8zQAT@lists.linux.dev
X-Gm-Message-State: AOJu0YxlcGTj1jl4lyCVNHsdKj39ZZV4Qqu3upPHiGdZM5IDfmnRRJAH
	eLPqxMNB/X+p/h98l0XxptFDYuVCzf1OmbTSHbdI5VkMQZhpS49S0soYR8ygjqWIogBhytQ9NSq
	UjpKLimOrFZKp8gek9nCAtRUPVHo=
X-Google-Smtp-Source: AGHT+IFVLNPwccmdXb9lh4G0SyE8QhkHS8sTushEJ6wB8iiTTBjD+JGzICNar8wDdIC25RzdIhKdoY8TiVXr5tyFGVo=
X-Received: by 2002:a05:6512:3d17:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-539da3c4903mr741471e87.14.1728628199940; Thu, 10 Oct 2024
 23:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010122801.1321976-7-ardb+git@google.com> <20241010122801.1321976-10-ardb+git@google.com>
 <20241010201530.6kfvlcdplqhrqjbj@treble>
In-Reply-To: <20241010201530.6kfvlcdplqhrqjbj@treble>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 11 Oct 2024 08:29:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG1K2ka+ygUbRNwGvwFFMuOSXxawpHfCPmZjYSY2weDpA@mail.gmail.com>
Message-ID: <CAMj1kXG1K2ka+ygUbRNwGvwFFMuOSXxawpHfCPmZjYSY2weDpA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] objtool: Add support for annotated jump tables
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	keescook@chromium.org, linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 22:15, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Thu, Oct 10, 2024 at 02:28:05PM +0200, Ard Biesheuvel wrote:
> > +++ b/tools/objtool/arch/x86/special.c
> > @@ -115,30 +115,51 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
> >       struct reloc  *text_reloc, *rodata_reloc;
> >       struct section *table_sec;
> >       unsigned long table_offset;
> > +     struct symbol *sym;
> >
> >       /* look for a relocation which references .rodata */
> >       text_reloc = find_reloc_by_dest_range(file->elf, insn->sec,
> >                                             insn->offset, insn->len);
>
> Hm, we can probably put insn_reloc() in check.h and use that here to
> take advantage of its caching for the no_reloc case.
>

insn_reloc() filters out R_*_NONE relocations, for the reasons pointed
out in the commit log.
