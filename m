Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBA2256E
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 23:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4A4C34100;
	Fri, 13 May 2022 23:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1652483951;
	bh=nsqqEsbCAJO9Nx/S0guNnQUIdm8rw5xK6VIXgCLIZKM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UnzcjbtwVrbXBSJ7C2fccqdOzxiXb31wk+hfEkpeaBLXWJdNcx1CpI+LaNUPy6db2
	 tWzlGaW+UfIm8frhuwsYDs5KRRS0ujdqusYynfLuyf0QIbmMluE0z4ZtrjIfpdzuZz
	 voCrn3e+2upCTSDr9UN5f18p+pJf1Mt8qHCM29u4=
Date: Fri, 13 May 2022 16:19:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: syzbot <syzbot+acf65ca584991f3cc447@syzkaller.appspotmail.com>, Minchan
 Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
 syzkaller-bugs@googlegroups.com, trix@redhat.com, Matthew Wilcox
 <willy@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [syzbot] WARNING in follow_hugetlb_page
Message-Id: <20220513161910.d1b73583cdb2e33562aa86e5@linux-foundation.org>
In-Reply-To: <a7fd0c3f-921e-19b3-2f67-a231dede28f9@oracle.com>
References: <000000000000ef451a05dee0f2b1@google.com>
	<00000000000077377c05dee75f63@google.com>
	<20220513102617.c464c4f566052838e911a3ec@linux-foundation.org>
	<75f09063-d184-7d44-17a1-ed04be5eb953@oracle.com>
	<a7fd0c3f-921e-19b3-2f67-a231dede28f9@oracle.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 May 2022 15:48:15 -0700 Mike Kravetz <mike.kravetz@oracle.com> wrote:

> On 5/13/22 11:09, Mike Kravetz wrote:
> > On 5/13/22 10:26, Andrew Morton wrote:
> >> On Fri, 13 May 2022 09:43:24 -0700 syzbot <syzbot+acf65ca584991f3cc447@syzkaller.appspotmail.com> wrote:
> >>
> >>> syzbot has found a reproducer for the following issue on:
> >>
> >> Thanks.
> >>
> >>> HEAD commit:    1e1b28b936ae Add linux-next specific files for 20220513
> >>> git tree:       linux-next
> >>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=174ae715f00000
> >>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e4eb3c0c4b289571
> >>> dashboard link: https://syzkaller.appspot.com/bug?extid=acf65ca584991f3cc447
> >>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> >>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11531766f00000
> >>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ce5a9ef00000
> >>>
> >>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>> Reported-by: syzbot+acf65ca584991f3cc447@syzkaller.appspotmail.com
> >>>
> >>> ------------[ cut here ]------------
> >>> WARNING: CPU: 1 PID: 3611 at mm/hugetlb.c:6250 follow_hugetlb_page+0x1326/0x1c80 mm/hugetlb.c:6250
> >>
> >> The try_grab_folio() added by 822951d84684d ("mm/hugetlb: Use
> >> try_grab_folio() instead of try_grab_compound_head()").  That commit
> >> has been there over a month so I guess it's something else.  Does
> >> someone have the time to bisect?
> > 
> > I can recreate in my 'easy to debug' environment, so I can bisect in
> > parallel with other things I need to do today.
> > 
> 
> I isolated this to Minchan Kim's "mm: fix is_pinnable_page against on cma
> page".  Yes, the fat finger fix is in next-20220513.
> 
> I don't have time to analyze right now, but can confirm that in the
> reproducer is_pinnable_page is returning false after this change when it
> previously returned true.

OK, thanks, I dropped mm-fix-is_pinnable_page-against-on-cma-page.patch
