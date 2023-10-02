Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16707171A7
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 13:08:29 +0000 (UTC)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1dc580ed1e4so33828551fac.1
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 06:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696252109; x=1696856909;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rorPIP5j5NnvLe/VG3SBvJuviukORjr0ptic0PGw4zI=;
        b=BZpiw9bOiFMMRO9if0j6pQK8yv+GD0JBmaSaxfh0gCzqHO53B7R+h0yDIpIC3nz9Im
         Zfxn55mfIg821ur7ExtfG67FaDJqjGU7sMclKu6ePTGYAXNq1/4txNTqFzlV8o1iLdiq
         P6BkjzxFC19ncUsJoXs6Yxqh6irUcasLVbeupC9yQHZ8TmHUupoujKjWksD3Ba0tDkiQ
         A9D7Tdh21EFbBhjSljevlqqF8XqkBoavnnfkZdKgTC26maY3Odz1RTJWxvWMKllW1l2M
         mn6myYjSfFmtifQ5Jm+Kjp7XkcMA3SO8CQsoiqxNxiTjAYmlLb6Zfw8CokkxJZg1Qtxd
         Q1TA==
X-Gm-Message-State: AOJu0YxYiNt9nRE7qsDhlzXLL1HvV0AEqigNcTaOOX42NPmlOpb9lrfS
	36HhOPNkzLJfxxVrqNmVwgMMDtWdF3WESl6arwZKgGhPkVqw
X-Google-Smtp-Source: AGHT+IH15olfXP89zOaUgPnZ+A3LWHTnmJnCU4ut1cZEZzpYg/G4sHkoNl3GWJ2A8/7WTnzttgIAQ3N4O8oSXKkeG9zcRAHK4fyE
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:5aad:b0:1c0:e7d3:3b2d with SMTP id
 dt45-20020a0568705aad00b001c0e7d33b2dmr4872328oab.7.1696252109232; Mon, 02
 Oct 2023 06:08:29 -0700 (PDT)
Date: Mon, 02 Oct 2023 06:08:29 -0700
In-Reply-To: <000000000000c4c9d405f2643e01@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006ba21a0606bb78f9@google.com>
Subject: Re: [syzbot] [bridge?] possible deadlock in br_multicast_rcv (3)
From: syzbot <syzbot+d7b7f1412c02134efa6d@syzkaller.appspotmail.com>
To: amcohen@nvidia.com, axboe@fb.com, bridge@lists.linux-foundation.org, 
	davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, hch@lst.de, 
	hdanton@sina.com, idosch@nvidia.com, ivecera@redhat.com, jiri@resnulli.us, 
	kbusch@kernel.org, kuba@kernel.org, lengchao@huawei.com, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, razor@blackwall.org, 
	roopa@nvidia.com, sagi@grimberg.me, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 0ae3eb7b4611207e140e9772398b9f88b72d6839
Author: Amit Cohen <amcohen@nvidia.com>
Date:   Mon Feb 1 19:47:49 2021 +0000

    netdevsim: fib: Perform the route programming in a non-atomic context

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13afdae6680000
start commit:   2faac9a98f01 Merge tag 'keys-fixes-20230321' of git://git...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=106fdae6680000
console output: https://syzkaller.appspot.com/x/log.txt?x=17afdae6680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aaa4b45720ca0519
dashboard link: https://syzkaller.appspot.com/bug?extid=d7b7f1412c02134efa6d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14aea34ec80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13001e91c80000

Reported-by: syzbot+d7b7f1412c02134efa6d@syzkaller.appspotmail.com
Fixes: 0ae3eb7b4611 ("netdevsim: fib: Perform the route programming in a non-atomic context")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
