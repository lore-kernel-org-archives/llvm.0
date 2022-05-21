Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C32F5E
	for <llvm@lists.linux.dev>; Sat, 21 May 2022 15:24:03 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id t28so2477874pga.6
        for <llvm@lists.linux.dev>; Sat, 21 May 2022 08:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8YvF0KYGyvLD152mJvK3OUAMYa/Ocvv7YJlQJIs4ik8=;
        b=af9MHzJRzmze6ujHO9brZL+H2NvNqfPjqLGqWgliNVyc/E9oPF/5W9kG/ljuSr6yn/
         8l5qEuhbR5QE2k0HzmVYryCqIel/mV+KgizRZyjM2C1LULQ/YI+mUAEFsDf1UIghLb8i
         GhTUpatcUxKWeDvzzrYwNutQ+ewV2LdOdwe/UgOwTMmlWCOWnh+G0NOgNo7FNc4WLJLQ
         2Sb1O+kOFV0vfADqaU31XJFRSwa5tUdR7gDEvzdDU0t1hJjBWrB0Xjr5wCLr6c5iRusW
         1aY79RK3M7UCPBf9CP3Iak9CF37XFO3guCH5mjVbxN22cqkgVCSj+PZr22JGeiZGd7wZ
         arsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=8YvF0KYGyvLD152mJvK3OUAMYa/Ocvv7YJlQJIs4ik8=;
        b=iYjVx+g8JFUx7MVoQLoDQscYc9RBkxiNj6+H7E7Md9ZceQg8kWRP42BSrJS2z24bOm
         9WazlcPefa6KyYKjFDVAIpZO5Zd6C9idMPrCbu/1F+IPk5uErRCgreE2aOReyvrMNgs1
         HcU2v/ZLGsyrBhC5tYPw8Qy1YhxqCLhbed+rXfQ9dg2x6wphU/eoCXascnKm6rxM8FNJ
         qtNaYHDKzWKHap4kpLtWuMMZHdKtcQdNiB45b8q3E4JtBV72lwJGJ17WyNDcMNCFr2fZ
         OGrlpSVLaoLp4XQMoWKKCSMnXJy8nvP1dFw41nm96QrqsJgKAsPwOqkRJ5fa/wxsSFEo
         NR/w==
X-Gm-Message-State: AOAM530d3HCvvlounfE7l7HcHqxSlN+ncIrGO2jEI/vzYDyI45RJ8Ds+
	r04th9cLyb365jUTPTPrcCg=
X-Google-Smtp-Source: ABdhPJw6PqHysQWzfQL5PnhngJIzNIKSlfaYQM0thj7WAe4NVqMIp1iKtNDDFJ6EAOIlKv169VylHQ==
X-Received: by 2002:a63:600c:0:b0:3f9:f4c8:e862 with SMTP id u12-20020a63600c000000b003f9f4c8e862mr2324765pgb.131.1653146642845;
        Sat, 21 May 2022 08:24:02 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:ef57:ac0e:cc3e:9974])
        by smtp.gmail.com with ESMTPSA id t4-20020a654084000000b003f6ba49bc57sm1675852pgp.71.2022.05.21.08.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:24:02 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date: Sat, 21 May 2022 08:24:00 -0700
From: Minchan Kim <minchan@kernel.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	syzbot <syzbot+acf65ca584991f3cc447@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [syzbot] WARNING in follow_hugetlb_page
Message-ID: <YokEEAemXTwTSZh5@google.com>
References: <Yn7vnpXwX50J3K+7@google.com>
 <4809b134-a37a-50b8-4c25-44548bc1048f@nvidia.com>
 <Yn73Hz7LkSUv7ycw@google.com>
 <d97d8a00-e9e0-278f-0c3f-71162afa48b1@nvidia.com>
 <6d281052-485c-5e17-4f1c-ef5689831450@oracle.com>
 <YogT9AwVclxAnyvs@google.com>
 <0be9132d-a928-9ebe-a9cf-6d140b907d59@nvidia.com>
 <a455c6b1-b9ef-39ab-879e-80e13fd13c10@oracle.com>
 <YognlSdHAKgnkPPY@google.com>
 <b36a728c-03a1-0e07-b6d2-9515e647416f@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b36a728c-03a1-0e07-b6d2-9515e647416f@oracle.com>

On Fri, May 20, 2022 at 05:04:22PM -0700, Mike Kravetz wrote:
> On 5/20/22 16:43, Minchan Kim wrote:
> > On Fri, May 20, 2022 at 04:31:31PM -0700, Mike Kravetz wrote:
> >> On 5/20/22 15:56, John Hubbard wrote:
> >>> On 5/20/22 15:19, Minchan Kim wrote:
> >>>> The memory offline would be an issue so we shouldn't allow pinning of any
> >>>> pages in *movable zone*.
> >>>>
> >>>> Isn't alloc_contig_range just best effort? Then, it wouldn't be a big
> >>>> problem to allow pinning on those area. The matter is what target range
> >>>> on alloc_contig_range is backed by CMA or movable zone and usecases.
> >>>>
> >>>> IOW, movable zone should be never allowed. But CMA case, if pages
> >>>> are used by normal process memory instead of hugeTLB, we shouldn't
> >>>> allow longterm pinning since someone can claim those memory suddenly.
> >>>> However, we are fine to allow longterm pinning if the CMA memory
> >>>> already claimed and mapped at userspace(hugeTLB case IIUC).
> >>>>
> >>>
> >>> From Mike's comments and yours, plus a rather quick reading of some
> >>> CMA-related code in mm/hugetlb.c (free_gigantic_page(), alloc_gigantic_pages()), the following seems true:
> >>>
> >>> a) hugetlbfs can allocate pages *from* CMA, via cma_alloc()
> >>>
> >>> b) while hugetlbfs is using those CMA-allocated pages, it is debatable
> >>> whether those pages should be allowed to be long term pinned. That's
> >>> because there are two cases:
> >>>
> >>>     Case 1: pages are longterm pinned, then released, all while
> >>>             owned by hugetlbfs. No problem.
> >>>
> >>>     Case 2: pages are longterm pinned, but then hugetlbfs releases the
> >>>             pages entirely (via unmounting hugetlbfs, I presume). In
> >>>             this case, we now have CMA page that are long-term pinned,
> >>>             and that's the state we want to avoid.
> >>
> >> I do not think case 2 can happen.  A hugetlb page can only be changed back
> >> to 'normal' (buddy) pages when ref count goes to zero.
> >>
> >> It should also be noted that hugetlb code sets up the CMA area from which
> >> hugetlb pages can be allocated.  This area is never unreserved/freed.
> >>
> >> I do not think there is a reason to disallow long term pinning of hugetlb
> >> pages allocated from THE hugetlb CMA area.
> >>
> >> But, I wonder if it is possible for hugetlb pages to be allocated from
> >> another (non-hugetlb) area.  For example if someone sets up a huge CMA area
> >> and hugetlb allocations spill over into that area.  If this is possible
> >> (still need to research), then we would not want to long term pin such
> >> hugetlb pages.  We can check this in the hugetlb code to determine if
> >> long term pinning is allowed.  
> > 
> > I don't think it's possible because cma_alloc needs "struct cma" just
> > like handle and VM doesn't maintain any fallback list of cma chains
> > so unless someone could steal the handle somehow, there is no way to
> > claim memory others reserved for the CMA purpose.
> 
> I was thinking about the case where a hugetlb page is allocated via
> __alloc_pages().  Not sure if that can fall back to a CMA area that
> someone else might have created/reserved.
> 
> Unless I do not understand, normal movable memory allocations can fall
> back to CMA areas?

In the case, Yes, it would be fallback if gfp_flag was __GFP_MOVABLE.

If HugeTLB support it(I think so), pin_user_pages with FOLL_LONGTERM
will migrate the page out of movable/CMA before the longterm pinning
so IMHO, we shouldn't have the problem.

__gup_longterm_locked
    __get_user_pages_locked
    check_and_migrate_movable_pages

> -- 
> Mike Kravetz
