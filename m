Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19018AD5C
	for <llvm@lists.linux.dev>; Sun,  3 Sep 2023 22:27:19 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-570a432468bso183210a12.0
        for <llvm@lists.linux.dev>; Sun, 03 Sep 2023 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693780039; x=1694384839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uey9X37TsXxaxDDta+GmGK9zdrWEFlBTA4HM9sllgko=;
        b=W7HHBGwTftRD+Lp/sczpJuNCrExkX8ZOhJLfrEyTuaSbORL5w5tJa6UJGmCl2ECRRh
         lknqVHp2dsQuFcjjq4HzyLPtAWfCaottO8JZdz7FpzJW7hCJoSiFoiJSHXNwHpNae9Nb
         CXsRpfPNJBtqdPFBje7ROyxL8SiUGZOVuqaD2KhnFWWG8rIk5Eci9Dr/ErSAK2TFuYN2
         HHCJK+J6ChqD78KamXpDUN2aAv3OpBpElEn/eZHZuGhjKUVMzkbcji70Tt6DfOZvNGSL
         0MVOpvOuL0lGlRrdc324su+MQj3Y9WFb3y3vmSxoVx1cUI50mMvAAWaWkjE64LZup8Xn
         8fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693780039; x=1694384839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uey9X37TsXxaxDDta+GmGK9zdrWEFlBTA4HM9sllgko=;
        b=YwGFD5JViRE0tqZLQeWtw4qa5meYQxZH3gSTzZEZGNgYetgnSSK+Hjdo273I1USnKK
         eZQ2wsrdaviM8i3vcMcMpidp2g+7pCsn6azNXk41ByanGxkntWZ5coW3IQZJcwAGE+rV
         g3F6tbNtgyGxHHEagmD00y7ZdP0KlOO5dQi2xywOr83MMoeUXRbdRT2qrEZmCMB9wY1+
         xMKSZ8CJU/xHERsUlbquJfMXfW12XBCuAV9kVs4HyW/l8wt3M1jQebZlcYtHpJ8MeZ0F
         XM9gsQZwsaO3fq/SZSFkonA5/UpFWhTgKpm1h+EVFb6/42dMsB+MltbT4Gn06jt4/qiM
         SpwA==
X-Gm-Message-State: AOJu0Yy8FhHLNaL4jFoXQjQRIeLzkzS1sLayCm05cFTScC108TY/bnto
	JDhhUHGL1xyrYOKzWNH4g6O7IQ==
X-Google-Smtp-Source: AGHT+IGeAVpJ32MwLia9j7b+fincRrOYrEYNNZjKkEpbapJ86ueujIl+j6DWTleN+nP733gdLcwaIQ==
X-Received: by 2002:a17:90b:d94:b0:267:f8f4:73ab with SMTP id bg20-20020a17090b0d9400b00267f8f473abmr11150197pjb.16.1693780039113;
        Sun, 03 Sep 2023 15:27:19 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id gb16-20020a17090b061000b00263f446d432sm7845229pjb.43.2023.09.03.15.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 15:27:18 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qcvYp-00ASAZ-2e;
	Mon, 04 Sep 2023 08:27:15 +1000
Date: Mon, 4 Sep 2023 08:27:15 +1000
From: Dave Chinner <david@fromorbit.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>,
	brauner@kernel.org, djwong@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org,
	ndesaulniers@google.com, syzkaller-bugs@googlegroups.com,
	trix@redhat.com, viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
Message-ID: <ZPUIQzsCSNlnBFHB@dread.disaster.area>
References: <000000000000e6432a06046c96a5@google.com>
 <ZPQYyMBFmqrfqafL@dread.disaster.area>
 <20230903083357.75mq5l43gakuc2z7@f>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903083357.75mq5l43gakuc2z7@f>

On Sun, Sep 03, 2023 at 10:33:57AM +0200, Mateusz Guzik wrote:
> On Sun, Sep 03, 2023 at 03:25:28PM +1000, Dave Chinner wrote:
> > On Sat, Sep 02, 2023 at 09:11:34PM -0700, syzbot wrote:
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    b97d64c72259 Merge tag '6.6-rc-smb3-client-fixes-part1' of..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=14136d8fa80000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=958c1fdc38118172
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=e245f0516ee625aaa412
> > > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> > > 
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > 
> > Been happening for months, apparently, yet for some reason it now
> > thinks a locking hang in __fdget_pos() is an XFS issue?
> > 
> > #syz set subsystems: fs
> > 
> 
> The report does not have info necessary to figure this out -- no
> backtrace for whichever thread which holds f_pos_lock. I clicked on a
> bunch of other reports and it is the same story.

That's true, but there's nothing that points at XFS in *any* of the
bug reports. Indeed, log from the most recent report doesn't have
any of the output from the time stuff hung. i.e. the log starts
at kernel time 669.487771 seconds, and the hung task report is at:

684.588608][   T28] INFO: task syz-executor.0:19830 blocked for more than 143 seconds

About 25 seconds later. So the hung tasks were running at about
540s, and that's just not in the logs.

Every report has a different combination of filesystems being
exercised, and a couple of them didn't even have XFS in them.

So at this point, there is no single filesystem that the reports
actually indicate is the cause, the reports don't contain the actual
operations that hung, and there's basically nothing to go on so far.
Hence putting it in the "fs" bucket (which encompasses all things
filesystems!) is the rigth thing to do.

The only commonality I kinda see is that secondary processes that
are hung seem mostly to be in directory operations waiting on inode
locks - either lookup or readdir, so it's entirely possible that a
filesystem has screwed up ->iterate_shared locking in some way...

> Can the kernel be configured to dump backtraces from *all* threads?

It already is (sysrq-t), but I'm not sure that will help - if it is
a leaked unlock then nothing will show up at all.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
