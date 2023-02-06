Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4916192
	for <llvm@lists.linux.dev>; Mon,  6 Feb 2023 20:31:18 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id i23-20020a056e021d1700b003111192e89aso8866735ila.10
        for <llvm@lists.linux.dev>; Mon, 06 Feb 2023 12:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcUfKfT8kk091mUeNDNyNXV+W/bZwlZUrmiavyzWKVE=;
        b=qQRoeITELaQfQB7UKxj9AsHTMlCOPA8pmHWdgEKN7LFk8gfLJUKs0HOGXiOwgDmorm
         gwKOuphLp8C89vzVe+/BwKKo/N4aaMZTvvm3D0pb5W6wZN/jV5xoHReTkmPNZEK9L/tW
         HyHadIVWxFwl0xsriTScHQXYc1hf0GsiNRpXixb+qao53BJ8QRn34BcK6NdP5/yIa7qG
         BUXamvkYoK5KAOKQ3uW8QoaNu1Ut2idGGxaAWh3aSi9oxnyxGwmbI7FYrG/L2IeOLQHm
         cpR6y3PqSQ5aUVxO65arTReHnGLbepl/N+DPOJPm+HnkUj4O5vpyN43aLhZcgHCJvG8f
         Uy7w==
X-Gm-Message-State: AO0yUKWBeg/tVuRcxe4tM5QPgRmc7WZbYZhWblpY35jb/L+7Q+9jsWHK
	zAhz4u3r7dfYRh65jj0eynf1THCyTtRwMOy6Hng2fm7lycsp
X-Google-Smtp-Source: AK7set/lIX/2jgf1OGRtFFrJw0DWyiffr52+TS2tT4qR8HmxfNuUDQY4i9GdUbMVWehVVSEfF9bkQInUujE4DKrS6Qceu8NmbEmm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:cccb:0:b0:3b1:acaf:d5b2 with SMTP id
 k11-20020a02cccb000000b003b1acafd5b2mr168551jaq.98.1675715477927; Mon, 06 Feb
 2023 12:31:17 -0800 (PST)
Date: Mon, 06 Feb 2023 12:31:17 -0800
In-Reply-To: <000000000000269f9a05f02be9d8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ce7ebf05f40de992@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Write in copy_verifier_state
From: syzbot <syzbot+59af7bf76d795311da8c@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, haoluo@google.com, hawk@kernel.org, 
	john.fastabend@gmail.com, jolsa@kernel.org, keescook@chromium.org, 
	kpsingh@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, martin.lau@linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, netdev@vger.kernel.org, sdf@google.com, 
	song@kernel.org, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	v4bel@theori.io, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 45435d8da71f9f3e6860e6e6ea9667b6ec17ec64
Author: Kees Cook <keescook@chromium.org>
Date:   Fri Dec 23 18:28:44 2022 +0000

    bpf: Always use maximal size for copy_array()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14c62f23480000
start commit:   041fae9c105a Merge tag 'f2fs-for-6.2-rc1' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2f3d9d232a3cac5
dashboard link: https://syzkaller.appspot.com/bug?extid=59af7bf76d795311da8c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1650d477880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1305f993880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bpf: Always use maximal size for copy_array()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
