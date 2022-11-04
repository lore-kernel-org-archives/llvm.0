Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B512F3C
	for <llvm@lists.linux.dev>; Fri,  4 Nov 2022 22:50:23 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id a14-20020a921a0e000000b003016bfa7e50so1338654ila.16
        for <llvm@lists.linux.dev>; Fri, 04 Nov 2022 15:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQUV465XYKy6BEOy3Swc3M1CyT3Q1DkqUbMYNjsBM7w=;
        b=Dh2u5ocJm6AyXavnK+tdD54YtYrotmt7vSR/SatXW4LxjBQebeb49HzdTlr10j6bbn
         Imlxp8Bjb8I85Q9ZoBg5iT8oY55Of01gIhh5saHeGfYd3IQNQQLgwSmXQMyCmWHAbioj
         EdoSkwRySESWUqKQeNNWofquHnjmI7iBERlCbXpW0QqDVWI0YfI/L8qNHwz1u8Iv+phq
         BBE1+Z9UCH88OkS3Q96x5zP/w9Br9y6KNkO28AcZfq/U+bNuLbxmiZ1bNArCILGK64TM
         z5LWxw99SVG5SO/v3q/Y/t75yXFiBXZuMLWdbjjVxkHXl+DeZyLKpbu54ZfgD5XPRTJO
         g7uQ==
X-Gm-Message-State: ACrzQf2b7o6BNh3yVO90IPdjjIoG8+Y5aksIKyykf+U0LCOrH/KDh95Q
	coPKJP0xdVCk9nUlT08UR73+5aLZrNK6wCKPwDT2BZRddaT5
X-Google-Smtp-Source: AMsMyM5nTnIogJYJ095mPEs92Yep38gpfi+2iOs4VSUyK/pRUwAakFTI8laAK2zkHMNKd64/tVLlrFqFcjq22AiZc4BVcdLyhALO
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2107:b0:375:ddb:54c0 with SMTP id
 n7-20020a056638210700b003750ddb54c0mr21194896jaj.244.1667602223078; Fri, 04
 Nov 2022 15:50:23 -0700 (PDT)
Date: Fri, 04 Nov 2022 15:50:23 -0700
In-Reply-To: <0000000000009da4c705dcb87735@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002227cf05ecace68c@google.com>
Subject: Re: [syzbot] WARNING in check_map_prog_compatibility
From: syzbot <syzbot+e3f8d4df1e1981a97abb@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, haoluo@google.com, hawk@kernel.org, 
	john.fastabend@gmail.com, jolsa@kernel.org, kafai@fb.com, kpsingh@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, memxor@gmail.com, nathan@kernel.org, 
	ndesaulniers@google.com, netdev@vger.kernel.org, sdf@google.com, 
	song@kernel.org, songliubraving@fb.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 34dd3bad1a6f1dc7d18ee8dd53f1d31bffd2aee8
Author: Alexei Starovoitov <ast@kernel.org>
Date:   Fri Sep 2 21:10:47 2022 +0000

    bpf: Relax the requirement to use preallocated hash maps in tracing progs.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1599d319880000
start commit:   200e340f2196 Merge tag 'pull-work.dcache' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b664fba5e66c4bf
dashboard link: https://syzkaller.appspot.com/bug?extid=e3f8d4df1e1981a97abb
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165415a7080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1716f705080000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bpf: Relax the requirement to use preallocated hash maps in tracing progs.

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
