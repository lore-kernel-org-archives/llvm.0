Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE282744F
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgD2mszF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F70C433C7;
	Thu, 19 Oct 2023 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697725256;
	bh=SYQufYvEZp9QNGvUcctMCtYxQ/T4Y0G7ziduh+OoWz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgD2mszFwXbGqZjltRRw8W7Bx7zE5dcFMSEro4HKnBpuRrCYwv4bEWSooANfsPsVM
	 dxnaVVc83hzYSVEWHLiciE9bwVsPDhttdIEZuGvQguCnj+YIT9iFYQtE5yqyHU9j+P
	 ufs9cTOUT07f7ddLgKb9TuF/xoVRRNxqbiy4KZGtMpabk8AftSOj82yqqamIVIkDTH
	 1nHzpeiAZ9alKDeMtfUjhnNy89NOOFeh9DXOqv/hmqZqL2mym64yIHJvjuEfuAFUrw
	 rYWA9mK6OKwjJrdgOQ4qFCQAJFB+LCLV1DTx6R6o0uB03wyt/3k9e4nJqoab2lc4K4
	 LS3UnXH9gIvjA==
Date: Thu, 19 Oct 2023 07:20:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Usama Arif <usama.arif@bytedance.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	muchun.song@linux.dev, songmuchun@bytedance.com,
	fam.zheng@bytedance.com, liangma@liangbit.com,
	punit.agrawal@bytedance.com,
	Konrad Dybcio <konrad.dybcio@linaro.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] mm: hugetlb: Only prep and add allocated folios for
 non-gigantic pages
Message-ID: <20231019142054.GA60597@dev-arch.thelio-3990X>
References: <20231009145605.2150897-1-usama.arif@bytedance.com>
 <20231010012345.GA108129@monkey>
 <20231012000327.GA1855399@dev-arch.thelio-3990X>
 <20231012145318.GA5127@monkey>
 <20231013001203.GA3812@monkey>
 <20231014000450.GA253713@monkey>
 <CAKwvOdm9xKGQzi6_j=gGZCEmKJe6b9o8+jen1oEeAhyjcaSnxQ@mail.gmail.com>
 <20231018222003.GA21776@monkey>
 <20231019043305.GB14965@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019043305.GB14965@google.com>

On Thu, Oct 19, 2023 at 01:33:05PM +0900, Sergey Senozhatsky wrote:
> On (23/10/18 15:20), Mike Kravetz wrote:
> > > I think you need to initialize h, otherwise what value is passed to
> > > prep_and_add_bootmem_folios if the loop is not run because the list is
> > > empty.  The compiler sees `h` is only given a value in the loop, so
> > > the loop must be run.  That's obviously hazardous, but the compiler
> > > assumes there's no UB. At least that's my limited understanding
> > > looking at the IR diff Nathan got me in
> > > https://github.com/ClangBuiltLinux/linux/issues/1946.
> > 
> > Thanks for looking closer at this Nick and Nathan!
> > 
> > I think you are saying the compiler is running the loop because it wants
> > to initialize h before passing the value to another function.  It does
> > this even if the explicit loop entry condition is false.  Is that correct?
> 
> The loop is getting promoted to "infinite" loop, there is no
> &pos->member != (head) condition check in the generated code
> at all (at least on my machine).
> 
> I wish we could at least get the "possibly uninitialized variable"
> warning from the compiler in this case, which we'd translate to
> "hold my beer, I'm going to try one thing".

GCC would warn about this under -Wmaybe-uninitialized but it has been
disabled in a normal build for the past three years, see commit
78a5255ffb6a ("Stop the ad-hoc games with -Wno-maybe-initialized").

  In function 'gather_bootmem_prealloc',
      inlined from 'hugetlb_init' at mm/hugetlb.c:4299:2:
  mm/hugetlb.c:3203:9: warning: 'h' may be used uninitialized [-Wmaybe-uninitialized]
   3203 |         prep_and_add_allocated_folios(h, &folio_list);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  mm/hugetlb.c: In function 'hugetlb_init':
  mm/hugetlb.c:3166:24: note: 'h' was declared here
   3166 |         struct hstate *h, *prev_h = NULL;
        |                        ^

Clang's -Wconditional-uninitialized would have flagged it too but it
suffers from the same problems as -Wmaybe-uninitialized.

  mm/hugetlb.c:3203:32: warning: variable 'h' may be uninitialized when used here [-Wconditional-uninitialized]
   3203 |         prep_and_add_allocated_folios(h, &folio_list);
        |                                       ^
  mm/hugetlb.c:3166:18: note: initialize the variable 'h' to silence this warning
   3166 |         struct hstate *h, *prev_h = NULL;
        |                         ^
        |                          = NULL

I know clang has some handling for loops in -Wsometimes-uninitialized, I
wonder why that does not trigger here...

Cheers,
Nathan
