Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C42C9445
	for <llvm@lists.linux.dev>; Sun,  3 Sep 2023 22:47:55 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-571194584e2so578189eaf.3
        for <llvm@lists.linux.dev>; Sun, 03 Sep 2023 15:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693781274; x=1694386074; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jTpRzKKPcflfMotZqn/EuHDpmA3Dpx0bR9KzRWNQ8CA=;
        b=XyiUKuEz0ssz2Ik+rOdb6xB8LHfyvhzRCZanN/zTxDndnk3leYvxxHmUDj73khBvvg
         zseY1/CHeapR30m7pCs5Y4hhCvHXZAA2M/j2hrKEeWINziK47PR8heBGkV4pVSR95Xd+
         lBP0L1S2mIzz0n/5YVkSU52oWq7k/lpWqXEtif60Odah1NCwVJF7Hyl6jEr6vcC2COG0
         lOHYHsQFByQ7dxlbk/BH9rG9uCyitCQcEMbh8SI7QDh3bs6j127Sy9qNPOwunKDTABXz
         c4R2nxw81+acWVNtwcj2yK2a2VdS1VmnGCSngzuhB0b6N+PliBY4nAlZ1s4gNdrk7Drw
         hRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693781274; x=1694386074;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTpRzKKPcflfMotZqn/EuHDpmA3Dpx0bR9KzRWNQ8CA=;
        b=l0UoAOfE4D/HqVpiDo3ajDt2JKADkuy753uXQzR3/FhXCum+saBxr6xddA1Sp1v5LR
         r11UQU/f+o8iMS6AoCunw4bHvtIO/nbdSvTw/iPUqzbGJj62rsqt1ccvCj2P7ISd+HWa
         8x/RoGuWJ9G1lCEJLvOTqNtu9tTKp6NsaiVmQmo0uuAIx0IpwmHmSfdp8xulILFT18lI
         HDb+znP1El8B5ED3Sp0EOAMWoDnRPi7S5lryhbfmY439Uv2kVPTJkbfxbiKa7WjsJUGz
         ETVPtRcjhTfIxRn2VoeU10tvSgqZuBuvC8mFEUEl/fOhFLDDbxLQ0yHGp8SbHkPRRMWc
         waCw==
X-Gm-Message-State: AOJu0YyqYCHq7d3cOp4I0TrMjpIDWUMhLvWzoT+IX5OTLFBjk9ygdRXk
	sKBad1ppsscsPbtchjFOWUNEMbxpd1WVUNMYaMA=
X-Google-Smtp-Source: AGHT+IHTd6MlXrnOCrfi9djKCiTH2QWP90e7G83CiNXHFAlfTnFmDirKNEOi/0fmGWMf/Ypx/Z30DjjRWhA4Zv/VtkI=
X-Received: by 2002:a4a:3410:0:b0:56d:e6:21bf with SMTP id b16-20020a4a3410000000b0056d00e621bfmr6787218ooa.0.1693781274367;
 Sun, 03 Sep 2023 15:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:60c:0:b0:4f0:1250:dd51 with HTTP; Sun, 3 Sep 2023
 15:47:53 -0700 (PDT)
In-Reply-To: <ZPUIQzsCSNlnBFHB@dread.disaster.area>
References: <000000000000e6432a06046c96a5@google.com> <ZPQYyMBFmqrfqafL@dread.disaster.area>
 <20230903083357.75mq5l43gakuc2z7@f> <ZPUIQzsCSNlnBFHB@dread.disaster.area>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 4 Sep 2023 00:47:53 +0200
Message-ID: <CAGudoHE_-2765EttOV_6B9EeSuOxqo1MiRCyFP9y=GbSeCMtZg@mail.gmail.com>
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
To: Dave Chinner <david@fromorbit.com>
Cc: syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>, 
	brauner@kernel.org, djwong@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, llvm@lists.linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

On 9/4/23, Dave Chinner <david@fromorbit.com> wrote:
> On Sun, Sep 03, 2023 at 10:33:57AM +0200, Mateusz Guzik wrote:
>> On Sun, Sep 03, 2023 at 03:25:28PM +1000, Dave Chinner wrote:
>> > On Sat, Sep 02, 2023 at 09:11:34PM -0700, syzbot wrote:
>> > > Hello,
>> > >
>> > > syzbot found the following issue on:
>> > >
>> > > HEAD commit:    b97d64c72259 Merge tag
>> > > '6.6-rc-smb3-client-fixes-part1' of..
>> > > git tree:       upstream
>> > > console output:
>> > > https://syzkaller.appspot.com/x/log.txt?x=14136d8fa80000
>> > > kernel config:
>> > > https://syzkaller.appspot.com/x/.config?x=958c1fdc38118172
>> > > dashboard link:
>> > > https://syzkaller.appspot.com/bug?extid=e245f0516ee625aaa412
>> > > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for
>> > > Debian) 2.40
>> > >
>> > > Unfortunately, I don't have any reproducer for this issue yet.
>> >
>> > Been happening for months, apparently, yet for some reason it now
>> > thinks a locking hang in __fdget_pos() is an XFS issue?
>> >
>> > #syz set subsystems: fs
>> >
>>
>> The report does not have info necessary to figure this out -- no
>> backtrace for whichever thread which holds f_pos_lock. I clicked on a
>> bunch of other reports and it is the same story.
>
> That's true, but there's nothing that points at XFS in *any* of the
> bug reports. Indeed, log from the most recent report doesn't have
> any of the output from the time stuff hung. i.e. the log starts
> at kernel time 669.487771 seconds, and the hung task report is at:
>

I did not mean to imply this is an xfs problem.

You wrote reports have been coming in for months so it is pretty clear
nobody is investigating. I figured I'm going to change that bit.

>> Can the kernel be configured to dump backtraces from *all* threads?
>
> It already is (sysrq-t), but I'm not sure that will help - if it is
> a leaked unlock then nothing will show up at all.
>

See the other part of the thread, I roped in someone from syzkaller
along with the question if they can use sysrq t.

-- 
Mateusz Guzik <mjguzik gmail.com>
