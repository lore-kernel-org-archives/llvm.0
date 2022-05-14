Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1EE362
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 00:26:10 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id qe3-20020a17090b4f8300b001dc24e4da73so8824133pjb.1
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y+n1fPZT1zdS+lAHwbtnaHu3tkmXjTbbjBa7vPYlABo=;
        b=O6V92x54nhsbw+iIsi5VHLqlpU/25LrFdzgZySWoN2Jrfjv/G3KftonhcTmUy8+al1
         WFE6Q+tE0l2iBl25sRgpQbo9qhWdx+7LQtZft6V5k/h/7WOZNGlG35S3sPrBgkgQs9hp
         3tvilCQ/lgFTZeOe6BIxP5p34eS2/nfLcGGBAlSpH5WKPoPzQueO4EBtjraJShnZ0Puj
         JNLJIYxMRvMTsSMvBtIVlwZO5+dGqyE0RJY+fJ51cHSBbBgakP4QrXQDkjvt2Ofq5IbP
         6iFY+2AcNfxSZg9S+opPYsWSgCUOx9dixE2DVScTOtJ1u5b9h9LKzZ0w8nUmMAEI9TQQ
         QhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=y+n1fPZT1zdS+lAHwbtnaHu3tkmXjTbbjBa7vPYlABo=;
        b=JT1AsE2WnIqjbT08eh2gj2WruRkUipvIk1taUzW/6NPTFVGNJak/+h/eLQlhXuOX5B
         8Yk7OFsCKQejoDjzWCaeBcWsWHEYRTEN/EphlFGUCsBi3EUbYwELuLbSLKbbHnGFZwog
         o4svfNvVbN9Mpx8wKbarTAx+5Rwf9ShlhAIj4apChbAMv3ZKCOcqm4BE4EwT4qL5gfWl
         Wx/x/a+qqK2QiXVKccXuQ1J5ZEcWveG/puiH0tTkjJExDnCBOhhL+wjv/ro5QJ2jtnI/
         +m9n/WUc1RrafSgFjeMSKkDM449O3GH+62siSokOsqHYTw5dDTn4zpEYB8ZRwOmbO+yh
         09Ew==
X-Gm-Message-State: AOAM531ZljG07CpzpJAidN/BaKvZKxxZ9nBodNcVoLbuLqNfht5NRC12
	Fg/lnjuxqpQqyQ0z9+t95fQ=
X-Google-Smtp-Source: ABdhPJyOeXl2fFGTzg0iG/6FpetLkDcmdjOHsoeI13uUcbQHA6nOkjFHKMo1BhP97JPHpR+hLyq8fg==
X-Received: by 2002:a17:90b:3e8a:b0:1dc:9d7e:1e12 with SMTP id rj10-20020a17090b3e8a00b001dc9d7e1e12mr7400387pjb.58.1652487969532;
        Fri, 13 May 2022 17:26:09 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:1969:9b8a:5056:897b])
        by smtp.gmail.com with ESMTPSA id n16-20020a6563d0000000b003c14af50607sm2160677pgv.31.2022.05.13.17.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:26:09 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date: Fri, 13 May 2022 17:26:07 -0700
From: Minchan Kim <minchan@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	syzbot <syzbot+acf65ca584991f3cc447@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [syzbot] WARNING in follow_hugetlb_page
Message-ID: <Yn73Hz7LkSUv7ycw@google.com>
References: <000000000000ef451a05dee0f2b1@google.com>
 <00000000000077377c05dee75f63@google.com>
 <20220513102617.c464c4f566052838e911a3ec@linux-foundation.org>
 <75f09063-d184-7d44-17a1-ed04be5eb953@oracle.com>
 <a7fd0c3f-921e-19b3-2f67-a231dede28f9@oracle.com>
 <20220513161910.d1b73583cdb2e33562aa86e5@linux-foundation.org>
 <Yn7vnpXwX50J3K+7@google.com>
 <4809b134-a37a-50b8-4c25-44548bc1048f@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4809b134-a37a-50b8-4c25-44548bc1048f@nvidia.com>

On Fri, May 13, 2022 at 05:09:11PM -0700, John Hubbard wrote:
> On 5/13/22 16:54, Minchan Kim wrote:
> > > > I isolated this to Minchan Kim's "mm: fix is_pinnable_page against on cma
> > > > page".  Yes, the fat finger fix is in next-20220513.
> > > > 
> > > > I don't have time to analyze right now, but can confirm that in the
> > > > reproducer is_pinnable_page is returning false after this change when it
> > > > previously returned true.
> > > 
> > > OK, thanks, I dropped mm-fix-is_pinnable_page-against-on-cma-page.patch
> > 
> > Seems like bug of the patch v5 due to change of this
> > 
> >      if (mt & (MIGRATE_CMA | MIGRATE_ISOLATE))
> > 
> > The migration type is not bit type so it shold be
> > 
> > if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)
> > 
> 
> Sorry for leading you astray by recommending the bitwise OR, Minchan.
> I overlooked that point even though it was right in front of me.

No worry, John.

Anything else further can we get insight from the warning?

For example, pin_user_pages going on against a hugetlb page
which are concurrently running alloc_contig_range(it's
exported function so anyone can call randomly) so
alloc_contig_range changes pageblock type as MIGRATE_ISOLATE
under us so the hit at the warning?
