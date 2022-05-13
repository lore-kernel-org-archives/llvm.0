Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC0A256E
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 23:54:10 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id c1-20020a17090a558100b001dca2694f23so9133899pji.3
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 16:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YqXCGyPsp5ArB5dqL4pL5ev2vTjEI3622aS8uMXTUU8=;
        b=DwM4B8SfDuhyFXUnZbAL/ZY/DcRWWDHSvQn+FjKOPeOJaj4vRugCoD4Q6EyH8ejoNp
         c5GkcuheJ6uVTHxI1r/k46H944JxYU2cO8FvvYHaov0k/7zKxkRLm2uii1ka82lbkE8y
         kkXQkFIqfcn7EHZE9r+UQEnd7O8o/kzC45WvCZlcvIZwJlt2aFz0IOCOkx/EStnddHfo
         YbwZRpt1F/PeXQg5dgEPIDUOlrpBwRxdVdVZ9YtmBNphMaKKFfk/yqyGyQCTBbmZ69gL
         awkai/OcYtvaBdC4OJtVvUdk/yevN6l6nrdMuf+6SZD+pFqf3pm9Fq6lnjFqIUKmiTlx
         L6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=YqXCGyPsp5ArB5dqL4pL5ev2vTjEI3622aS8uMXTUU8=;
        b=Fjo6OBNn+aFIonc0pZ3M5XUAWqApcGpZOVJcKnd30yF4YUSuZisGjvQWKACfMP8j35
         ld70YpSP/x9QbUlRxpYmYzRtP6P1TshKj8W1fPY2rfky6sgTRJdAZo2k6MTtJUpuOlzI
         MSDnw6hI3vv1vRtP9Sw8EUtUJEsx2TDtxDMJTMmxqMitme3Ad60heBNi9u3lrT2ejCm1
         1a6f9WoqY/hO//TYF4ePufqL+aXqx2kvxh0YprszvLow76n386ZdJf1ni/+3f5yIq3wP
         JITXTcsn1muSLfxv5ABgp+alJRqs6WsdrGA2G+txhmkwfS6IcKkVgpDwU36Fh/dq7uEH
         6iWw==
X-Gm-Message-State: AOAM531ksLhDiYAFkzCxSlahUK/r7f4D3BiLLBM/1zzgymoLbS1C4sli
	OEMJrxHYz+0a8ZD7E7Wsu+Q=
X-Google-Smtp-Source: ABdhPJz+2AgJW+UNcOEnQyMmoDiDLnajAAFPWMpiflOrjAp91f9dxcR/08AkhNhPCCw2na7Tk8dLFQ==
X-Received: by 2002:a17:903:246:b0:153:87f0:a93e with SMTP id j6-20020a170903024600b0015387f0a93emr7165067plh.171.1652486048731;
        Fri, 13 May 2022 16:54:08 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:1969:9b8a:5056:897b])
        by smtp.gmail.com with ESMTPSA id z25-20020a62d119000000b0050dc762816fsm2326286pfg.73.2022.05.13.16.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 16:54:08 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date: Fri, 13 May 2022 16:54:06 -0700
From: Minchan Kim <minchan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>,
	syzbot <syzbot+acf65ca584991f3cc447@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	John Hubbard <jhubbard@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [syzbot] WARNING in follow_hugetlb_page
Message-ID: <Yn7vnpXwX50J3K+7@google.com>
References: <000000000000ef451a05dee0f2b1@google.com>
 <00000000000077377c05dee75f63@google.com>
 <20220513102617.c464c4f566052838e911a3ec@linux-foundation.org>
 <75f09063-d184-7d44-17a1-ed04be5eb953@oracle.com>
 <a7fd0c3f-921e-19b3-2f67-a231dede28f9@oracle.com>
 <20220513161910.d1b73583cdb2e33562aa86e5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513161910.d1b73583cdb2e33562aa86e5@linux-foundation.org>

On Fri, May 13, 2022 at 04:19:10PM -0700, Andrew Morton wrote:
> On Fri, 13 May 2022 15:48:15 -0700 Mike Kravetz <mike.kravetz@oracle.com> wrote:
> 
> > On 5/13/22 11:09, Mike Kravetz wrote:
> > > On 5/13/22 10:26, Andrew Morton wrote:
> > >> On Fri, 13 May 2022 09:43:24 -0700 syzbot <syzbot+acf65ca584991f3cc447@syzkaller.appspotmail.com> wrote:
> > >>
> > >>> syzbot has found a reproducer for the following issue on:
> > >>
> > >> Thanks.
> > >>
> > >>> HEAD commit:    1e1b28b936ae Add linux-next specific files for 20220513
> > >>> git tree:       linux-next
> > >>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=174ae715f00000
> > >>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e4eb3c0c4b289571
> > >>> dashboard link: https://syzkaller.appspot.com/bug?extid=acf65ca584991f3cc447
> > >>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > >>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11531766f00000
> > >>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ce5a9ef00000
> > >>>
> > >>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > >>> Reported-by: syzbot+acf65ca584991f3cc447@syzkaller.appspotmail.com
> > >>>
> > >>> ------------[ cut here ]------------
> > >>> WARNING: CPU: 1 PID: 3611 at mm/hugetlb.c:6250 follow_hugetlb_page+0x1326/0x1c80 mm/hugetlb.c:6250
> > >>
> > >> The try_grab_folio() added by 822951d84684d ("mm/hugetlb: Use
> > >> try_grab_folio() instead of try_grab_compound_head()").  That commit
> > >> has been there over a month so I guess it's something else.  Does
> > >> someone have the time to bisect?
> > > 
> > > I can recreate in my 'easy to debug' environment, so I can bisect in
> > > parallel with other things I need to do today.
> > > 
> > 
> > I isolated this to Minchan Kim's "mm: fix is_pinnable_page against on cma
> > page".  Yes, the fat finger fix is in next-20220513.
> > 
> > I don't have time to analyze right now, but can confirm that in the
> > reproducer is_pinnable_page is returning false after this change when it
> > previously returned true.
> 
> OK, thanks, I dropped mm-fix-is_pinnable_page-against-on-cma-page.patch

Seems like bug of the patch v5 due to change of this

    if (mt & (MIGRATE_CMA | MIGRATE_ISOLATE))

The migration type is not bit type so it shold be 

if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)

Ccing just in case if I miss other thing for HugeTLB
