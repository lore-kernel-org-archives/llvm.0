Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA72EBB9E;
	Wed,  6 May 2026 05:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046514; cv=none; b=Yr8CY9EUV+e45rlEwV6eJnu0kp3jGiV8vdjBSNiOPjxYM4/RmnaSiwJeRxUD5L8GatS5CG4rHj+uVZmc30rroejBycRxUKRjnTd4WNZMezQ+g4XKeZhC9nxuSa5KcMXViGvsVEZSBJfl/whcUw7WEzi96RhW4yIM3c/AeBrCqhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046514; c=relaxed/simple;
	bh=szuDVviJkDzC/oxHmClbDGurn2MmrK8v6p2Bb/N4oFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwIuammfxBudIANURMvZOnxXpPVQrBnv2VieuZ+dVj2CTRkswccpk7dYazP9AqJffegIaqeCQA8zAMYN0j369dgd3xmTxVWnAF6atReQM/xWXPWJbR618R2QOY9zWGXiQzBSUosKo70TjbQXiTFvl0AH+KnmJK+QiQikcgYtyUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfKLAXqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfKLAXqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C866C2BCB8;
	Wed,  6 May 2026 05:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778046514;
	bh=szuDVviJkDzC/oxHmClbDGurn2MmrK8v6p2Bb/N4oFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfKLAXqiX0aUDCWn8xnZhaPoLKGt3MieK7LbgzEmMoT/P13+U1zLUaTQIrMfmBTON
	 KdFtWnfI+y8hsXnG6GnQKh3ml2hjyNpL4AFpiJTZOfwnqHN79AWWampzHGXVv1nTgG
	 ETLYvVIGClWrodDRM/aVW+tiXw5w8SiWYEAN7F5b+G6A4e2zcS7reA2Ukl+4G4GOQ/
	 Hfzh/RAse7VDn+X2wfXTC4IgGLD9f5L5BVjjwTzPSVAY3ZJByUmBK3d1ZYoLgI4/qP
	 7zoSTemsBsGefB/1PkINEgKuJO54gWQZsVDXspBZJ2dbyUKEjSPQZGfyo6EQsOXJLI
	 9jSm/fMeV8E+Q==
Date: Wed, 6 May 2026 13:48:28 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rosen Penev <rosenp@gmail.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] mm: move phys_mem_access_prot_allowed to header
Message-ID: <20260506054828.GA8550@ax162>
References: <20260505010112.645361-1-rosenp@gmail.com>
 <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
 <CAKxU2N92s06-L0+e=KZ7EbtU50tCpaCk2MYJD2xTFEHEsAhXUg@mail.gmail.com>
 <df3e889d-ac8c-4d11-a5fe-8ed2769953f0@app.fastmail.com>
 <CAKxU2N_moR8bs=NLUcW054a=oHB--4i+M5XKCBNF9LskYcjAhA@mail.gmail.com>
 <add152a5-09bb-4c6b-a17f-da3d817b93e9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <add152a5-09bb-4c6b-a17f-da3d817b93e9@app.fastmail.com>

On Tue, May 05, 2026 at 11:22:13AM +0200, Arnd Bergmann wrote:
> On Tue, May 5, 2026, at 10:54, Rosen Penev wrote:
> > On Tue, May 5, 2026 at 1:29 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> Does this happen with both ld.bfd and ld.lld? Which version of clang
> >> and lld are you using?
> > clang version 22.1.3
> > Target: x86_64-pc-linux-gnu
> > Thread model: posix
> > InstalledDir: /usr/bin
> >
> > lld the same.
> 
> Ok. I've tried to reproduce this with Nathan's llvm-22.1.3 build
> from https://mirrors.edge.kernel.org/pub/tools/llvm/, but don't
> see this problem on mips defconfig. Are you using a particular
> configuration, or do you see this on every build?

This is just the same old integrated assembler vs. recordmcount bug:

  https://github.com/ClangBuiltLinux/linux/issues/981
  https://github.com/ClangBuiltLinux/linux/issues/1830

It requires CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y with ftrace, which
MIPS allmodconfig enables. PowerPC worked around this in commit
f8b2336f15f3 ("powerpc: Avoid dead code/data elimination when using
recordmcount"). Maybe something along the same lines should be done for
MIPS.

Cheers,
Nathan
