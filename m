Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F649256D
	for <llvm@lists.linux.dev>; Mon, 14 Nov 2022 09:59:23 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id m204so10871475oib.6
        for <llvm@lists.linux.dev>; Mon, 14 Nov 2022 01:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fAUbn1cd7nvIpMehCbcvODwqPqsDdngaN43UPC82ebs=;
        b=H3wZosPZzj1VfAmg44IIbwylidbEuoNBx3ZSbkJHEftIUXjxFI4lIAeeeQfH/AA/mk
         DoImC1qhnnNFU1H4BArc1V2YSu2bzjgOFhzKqNgDVLHGwHSXmjLGmirIoORAKIwXqNJY
         8rbnkuwG3+6G/Z0bLn9I63fn9vemzSi18/1QL6sj+bUG3s6Gfgbfmu1WC+ACpBonDzoJ
         iaw7zvh7dvRHkh5LNUklHpvFM0Xr0DN+CPM0RJmkU8KGYJZmHlqtI+gKQyFhILJyU1tm
         V21f6pGhd/x5b7rl07yTzWjzsuHyIt2aZUQEaXyB1bSzVS/cAQaHWlmak0QQE5wEdVXF
         Rk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAUbn1cd7nvIpMehCbcvODwqPqsDdngaN43UPC82ebs=;
        b=V24UZuIiRg/RmFvGX1W4qme+eJ4DRJBw4tDkXL6PUJDDpyY0g2WFCAlG3hWTlyqxZz
         Ny33VeYY4rWp0RHQ/EYAJNfEkg6EUdezg1kyjo3cmFSP8tUNmCjgL4g4xkTwqwi8n/ck
         bUHv6ayorTimreTVOxtFUTQEZ5Fof0m8y+6nMhwEyEQOQ7XUa1fHZ2ZB81cZIbuW3fnF
         MhZpvDdodZGN0Dam1UgusBO0jqGTYP6T/ZP1i6eSNxOD6lT/gBbERvUgu76ZpN0RaTrf
         Dl3Z1mxDAXPlwUMPGIZyGGZP0k+zXY7Hj8M8BQb52nw+5XER9dCjvpGDjvl3+qDsGAIk
         8fCA==
X-Gm-Message-State: ANoB5pn7tA9AiAy9VYHUO8JUedqyTsGE9s+PaOQVLxP5M95SjkOlwgZZ
	oZx4rlSsXjktmRzuArvzAmTE78AXu2RHwKiQykJX4g==
X-Google-Smtp-Source: AA0mqf46zD7/njam2K6zDWAjSR+U8f1+8URrgDwnGLzzSv1XrdaKhUynr2/wcC8ZNqS2oxdF3xkNjfZpNkWs49RNJWA=
X-Received: by 2002:a05:6808:3011:b0:35a:7e1d:3d72 with SMTP id
 ay17-20020a056808301100b0035a7e1d3d72mr5542661oib.233.1668419961901; Mon, 14
 Nov 2022 01:59:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000009586e205ed4679f4@google.com> <CACT4Y+apC6o7jB+nbsZiUua=P76vAT7wVK4GeCfM-hVtWj=scg@mail.gmail.com>
 <Y3E8ffs8jC7041h4@monkey> <Y3Gm01DB9a5PXLOI@monkey>
In-Reply-To: <Y3Gm01DB9a5PXLOI@monkey>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 14 Nov 2022 10:59:10 +0100
Message-ID: <CACT4Y+Y2axe_Hzd8GWtnGy3bbwoCXZFpPGdh+zgfY-kawn3e2w@mail.gmail.com>
Subject: Re: [syzbot] WARNING: locking bug in hugetlb_no_page
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: syzbot <syzbot+d07c65298d2c15eafcb0@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	songmuchun@bytedance.com, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	Hillf Danton <hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Nov 2022 at 03:24, Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 11/13/22 10:50, Mike Kravetz wrote:
> > On 11/13/22 16:36, Dmitry Vyukov wrote:
> > > On Sat, 12 Nov 2022 at 15:03, syzbot
> > > <syzbot+d07c65298d2c15eafcb0@syzkaller.appspotmail.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > syzbot found the following issue on:
> > > >
> > > > HEAD commit:    1621b6eaebf7 Merge branch 'for-next/fixes' into for-kernelci
> > > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=13bd511e880000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=606e57fd25c5c6cc
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=d07c65298d2c15eafcb0
> > > > compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> > > > userspace arch: arm64
> > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13315856880000
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173614d1880000
> > > >
> > > > Downloadable assets:
> > > > disk image: https://storage.googleapis.com/syzbot-assets/82aa7741098d/disk-1621b6ea.raw.xz
> > > > vmlinux: https://storage.googleapis.com/syzbot-assets/f6be08c4e4c2/vmlinux-1621b6ea.xz
> > > > kernel image: https://storage.googleapis.com/syzbot-assets/296b6946258a/Image-1621b6ea.gz.xz
> > > >
> > > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > > Reported-by: syzbot+d07c65298d2c15eafcb0@syzkaller.appspotmail.com
> > >
> > > This may have the same root cause as:
> > >
> > > possible deadlock in hugetlb_fault
> > > https://lore.kernel.org/all/CACT4Y+ZWNV6ApzEv0UrsF2T8JWmXez_-H-EGMii-S_2JbXv07Q@mail.gmail.com/
> > >
> > > and there is a potential explanation as to what may be the problem.
> >
> > Thanks Dmitry!
> >
> > An issue with this new hugetlb locking was previously reported and I have been
> > working on a solution.  When I look at the reproducer, I see that it is calling
> > madvise(MADV_DONTNEED).  This triggers the other issue and could certainly
> > cause the issue reported here.
> >
> > Proposed patches are here and in next-20221111:
> > https://lore.kernel.org/linux-mm/20221111232628.290160-1-mike.kravetz@oracle.com/
> >
> > I am currently trying to run the reproducer, but it is not reproducing quickly.
> > Since this is a timing issue that as expected.  Interesting that this
> > report is run on arm64 and I am trying to reproduce on x86.  Although, the
> > issue is not architecture specific in any way.
>
> After tweaking my config, I was able to reliably reproduce.
>
> > I'll keep looking, but am fairly confident this is the root cause.
>
> I was also able to verify the series above addresses the issue.

Let's tell syzbot about the fix so that it reports similar issues in future:

#syz fix:
hugetlb: don't delete vma_lock in hugetlb MADV_DONTNEED processing
