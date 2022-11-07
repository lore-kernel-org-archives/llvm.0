Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8AD2F3E
	for <llvm@lists.linux.dev>; Mon,  7 Nov 2022 10:48:19 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id f23-20020a6b5117000000b006dbd4e6a5abso659651iob.17
        for <llvm@lists.linux.dev>; Mon, 07 Nov 2022 02:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HymTYv1Z6I3VvgCZ0iLRhqEFf+ukVe1UdjyszgmAxI=;
        b=tYEG2fX9J/GEE9cqKqYyjQIvZWsmQTvCUiY0LLZpBslWVjutxp+BbbelNDvifxDNwc
         f8Y3arNf8BFMshz9CSSqOcD6BnG/SqA+3xoFZQ/YE4B484h8mcc2mLOlCtZAr8+EV5H9
         txwaZyNiEqxVZQ5S6vRWMQ6L7ZSEkOLc5mSlbW3sVvasLYgMv+BlorwHChzabyVZXo//
         nC7xXtYnllTyra2Zc1oifOXJr8aeeQx+btF4CUDVn+B5mCAKiaHENZhINYVmhw2N0Rb2
         8EmR7OXlrtR73oBzgCXH2ABAh53fbc+Sy7ePC56EVsO9QzqxR3suyIbP/77pnO7ANjXf
         xOUA==
X-Gm-Message-State: ANoB5pm85EhSEAnJPH/Fil1aBHzTFJhmu3a37ZfXsqK7KTyybXony63q
	WLLeN7F5Yv5Se248MYVm6h6P0KZPrFcp38NOgqqnbIXPTb54
X-Google-Smtp-Source: AA0mqf7r1E4MKid00wX0yDhGFAGS6Xo1k+8PsoDNvQMQNAUP6OuSDpJhigPiU3WHs+JavxGKKAry0mzKRG/vb8O76Qox/AZOd5qM
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1565:b0:302:c61:4c38 with SMTP id
 k5-20020a056e02156500b003020c614c38mr4401538ilu.76.1667818098935; Mon, 07 Nov
 2022 02:48:18 -0800 (PST)
Date: Mon, 07 Nov 2022 02:48:18 -0800
In-Reply-To: <000000000000dc81b705a0af279c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000564bd705ecdf291f@google.com>
Subject: Re: [syzbot] WARNING in bpf_check (3)
From: syzbot <syzbot+245129539c27fecf099a@syzkaller.appspotmail.com>
To: andrii@kernel.org, andriin@fb.com, ast@kernel.org, bpf@vger.kernel.org, 
	clang-built-linux@googlegroups.com, daniel@iogearbox.net, davem@davemloft.net, 
	haoluo@google.com, hawk@kernel.org, john.fastabend@gmail.com, 
	jolsa@kernel.org, kafai@fb.com, kpsingh@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, martin.lau@linux.dev, 
	memxor@gmail.com, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, sdf@google.com, shanavas@crystalwater.ae, 
	song@kernel.org, songliubraving@fb.com, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, trix@redhat.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 34dd3bad1a6f1dc7d18ee8dd53f1d31bffd2aee8
Author: Alexei Starovoitov <ast@kernel.org>
Date:   Fri Sep 2 21:10:47 2022 +0000

    bpf: Relax the requirement to use preallocated hash maps in tracing progs.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1232e176880000
start commit:   506357871c18 Merge tag 'spi-fix-v6.0-rc4' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b95a17a5bfb1521
dashboard link: https://syzkaller.appspot.com/bug?extid=245129539c27fecf099a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10940477080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=177e8f43080000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bpf: Relax the requirement to use preallocated hash maps in tracing progs.

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
