Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6753F17EC
	for <llvm@lists.linux.dev>; Sun,  3 Sep 2023 08:34:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bf1f632b8so75709866b.1
        for <llvm@lists.linux.dev>; Sun, 03 Sep 2023 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693730041; x=1694334841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bRudmkh8iHtCDXikKDGZnGkARDgSd/PV3cdSFjM4RgY=;
        b=UpjQxJRKLqoAENIDuFjbHUcJnCDrWlSvpXKTWgl4+OdflOCrkAtruSOCl7BaG83eue
         x877M9o7Aih2q5t8IAz9uUKL09sNazGuhPAKd8OPVMz5AydlJQsbCdb+eqwBnDf9wDkN
         UhZV/gj4sSriwAGOnX9AD3ju94oo6xJxu66BNnJrVN93luFiO+docJiYE2vlBHy371j3
         gKBk5ovQ3Khd/ADk7HpgbPxRA0bxXHS4VenmKEFwsQCScOti2AdEmLF+D/+m416XYpIZ
         FV5n2mBPxKVr7MIj/iAXeE9zA1Z3eOh/jpuCwSwTC0BinOsw8NR6fSzT1O+8c8Dl75g/
         07Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693730041; x=1694334841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRudmkh8iHtCDXikKDGZnGkARDgSd/PV3cdSFjM4RgY=;
        b=ly6zH7TjYIGMuyO579uOMesTqz6U0wHgCgRHINldTe7zANf612q1MIjC2QW7d1BgyE
         7abzfo5UDkPKUn4eOgAxw7q18WDD7c+o3jo994NHyJTctwenCiDK7/NUFJHeAi468tKa
         +vVqOzw93rIye0SHxrDscIgDv4Re0UXrRRd/zibUjIAq4KWIxkCpyupd9K3U2+z0uEuL
         kWpave+swfwNLUg6ugIL0QeXODoGSQ7LDDMHrovhyA5R6IIlgOF+7Np2I1B8w8zdQyui
         uULoOhsrrAJzcplx+G8ZPpjxF4zMkjOH6Els6KLqm1gY55gscxCojd/+mTkuUfthcGfY
         o9uA==
X-Gm-Message-State: AOJu0YxI5/TBulKdI8GDaXwhJ7eaW0uiuNJbo0G+apcC8zsWX24Xzc9D
	cp9NM2ZLiwSW8Di11BFrPOw=
X-Google-Smtp-Source: AGHT+IFtmzLedMqLCZW5vLdu7ViMHcVf42AWHB002lZzxWPjY7i8+/989qug0MXV+5wiJ8JBGayUjw==
X-Received: by 2002:a17:906:3147:b0:9a5:b876:b1e3 with SMTP id e7-20020a170906314700b009a5b876b1e3mr5300019eje.20.1693730041163;
        Sun, 03 Sep 2023 01:34:01 -0700 (PDT)
Received: from f (cst-prg-30-15.cust.vodafone.cz. [46.135.30.15])
        by smtp.gmail.com with ESMTPSA id i2-20020a1709064ec200b0099bc8db97bcsm4509918ejv.131.2023.09.03.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 01:34:00 -0700 (PDT)
Date: Sun, 3 Sep 2023 10:33:57 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Dave Chinner <david@fromorbit.com>
Cc: syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>,
	brauner@kernel.org, djwong@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org,
	ndesaulniers@google.com, syzkaller-bugs@googlegroups.com,
	trix@redhat.com, viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
Message-ID: <20230903083357.75mq5l43gakuc2z7@f>
References: <000000000000e6432a06046c96a5@google.com>
 <ZPQYyMBFmqrfqafL@dread.disaster.area>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPQYyMBFmqrfqafL@dread.disaster.area>

On Sun, Sep 03, 2023 at 03:25:28PM +1000, Dave Chinner wrote:
> On Sat, Sep 02, 2023 at 09:11:34PM -0700, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    b97d64c72259 Merge tag '6.6-rc-smb3-client-fixes-part1' of..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14136d8fa80000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=958c1fdc38118172
> > dashboard link: https://syzkaller.appspot.com/bug?extid=e245f0516ee625aaa412
> > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> > 
> > Unfortunately, I don't have any reproducer for this issue yet.
> 
> Been happening for months, apparently, yet for some reason it now
> thinks a locking hang in __fdget_pos() is an XFS issue?
> 
> #syz set subsystems: fs
> 

The report does not have info necessary to figure this out -- no
backtrace for whichever thread which holds f_pos_lock. I clicked on a
bunch of other reports and it is the same story.

Can the kernel be configured to dump backtraces from *all* threads?

If there is no feature like that I can hack it up.
