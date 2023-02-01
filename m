Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144AFA38
	for <llvm@lists.linux.dev>; Wed,  1 Feb 2023 08:12:49 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id h4so776296lja.2
        for <llvm@lists.linux.dev>; Wed, 01 Feb 2023 00:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qU6H97cBHYDDiWOXv9FIJjK9ZhqfSabXbV56hNDgUkM=;
        b=FO3joSiwJ15G65yaolk11DKwExcbJYVk+OHkxicW2LpEeUHnQj85UOQxGBXofFteam
         BFdm4p6cOieu4rQ9fLeIkYGd9xVnOt8OUiLfYxbIY0ESzwjujB7NLPGZboC4s0G6PTXw
         DhsZAPvboBoP0gohq/jEP83wk6q0zVfXSHaMZXMXVuu1rSwSaJTJsxZwvE4hvAZVpF0L
         eBxW/YtfsX3WcapBViHxPQ/RG57e9X6q85wtwM+wX7BAv7FEjd8zY4AxHUOZN6i/90OX
         SZKQPTPKVdbjUEZR5e9MmkcoQvc73LoHq4KBtBqgnwxfy26Urf44Yzjb3hvcMy+x/thC
         Td4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qU6H97cBHYDDiWOXv9FIJjK9ZhqfSabXbV56hNDgUkM=;
        b=b8LOMoItlbkAdrD2NvZvicDyXR71CaaN4PN/lw7kTJWSRPzcPmJRbvzNzm7E6wyzW5
         VHXcy51O7GXFQ1KRW8iO/+ynuMx6BZZG5KBjyA5Dzzv1RoXilIk9wxYNvgySz8m0tJgZ
         qZECJJKsNMWOX6KiUBjyLugMt4AhA3mZOHkbIVRZZCUVdnNyysQEFm+ej8D3IShgd2xd
         KS6tqFXarXUCn3p6847bnIwo7orCWD1SJCjAdGTywQXpOLz3+WyLQa8pbvsubGITn/8o
         RlL6o/8x4AjpxnROn8owfBeGqEqjvz5ZuQNdO/hZ6A1fGpdeifT55ZD3QqAIbusrDpkw
         E8Gg==
X-Gm-Message-State: AO0yUKUYNQR48/l5IOa2E60WxQ9yPoZRDRutEiknEEGyWKPM7lML2dDH
	ypbLlvd5bXozHxsm+cob5UGj+dmGIDbg63RhM96NGQ==
X-Google-Smtp-Source: AK7set/7TOyZJsj8rmpwhEYuSjp5B1B9e0Avb97Fk47NdCdy9i8ErxI2tA0pm5PiKRmAoYhEyz7UjowFofra5SwuZRM=
X-Received: by 2002:a05:651c:200a:b0:290:7c00:8cee with SMTP id
 s10-20020a05651c200a00b002907c008ceemr154449ljo.144.1675239167025; Wed, 01
 Feb 2023 00:12:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <00000000000010d44905f01bf8e7@google.com> <0000000000007dd57305f3975d7d@google.com>
In-Reply-To: <0000000000007dd57305f3975d7d@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 1 Feb 2023 09:12:34 +0100
Message-ID: <CACT4Y+Z+u3PwPxyV+Mdbw57CrQFCdEuhmZN2i4_pKGvTCy+12w@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in ntfs_sparse_cluster
To: syzbot <syzbot+deb631beeb93bdb2df4c@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Feb 2023 at 00:05, syzbot
<syzbot+deb631beeb93bdb2df4c@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit c380b52f6c5702cc4bdda5e6d456d6c19a201a0b
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Fri Oct 7 11:02:36 2022 +0000
>
>     fs/ntfs3: Change new sparse cluster processing
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1377b979480000
> start commit:   e2ca6ba6ba01 Merge tag 'mm-stable-2022-12-13' of git://git..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=276eb8ff64eb2c27
> dashboard link: https://syzkaller.appspot.com/bug?extid=deb631beeb93bdb2df4c
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d8601b880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a09c93880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fs/ntfs3: Change new sparse cluster processing
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable, let's close the bug so that syzbot reports similar
bugs in future:

#syz fix: fs/ntfs3: Change new sparse cluster processing
