Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEA0627
	for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 23:05:18 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id n64-20020a6b8b43000000b00719e397eac0so4913814iod.14
        for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 15:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4iyyOrc6238HvaMcaieQzTGBVMZ/RTQVCphLPtOjNc=;
        b=y5/j5WlE4hRyDlIw5xd9Aes5S7FSH4QSxcQD3k18pSccqttFEtICibVrZkNtmUNfW4
         +EjCKxRhQxW6hssRSbuPUv+UK0ALCSZiFrRExt5T+qWYey4phZdgZ6RYPjK1f7uzwdaV
         D7Z+4HlnsRd3LVp2g8ABVZ/ULzhEKNpllruoouP88h/JKepDnr9kJQT06R5MCdEzKAhC
         XRx5hWgkd8MaDt5q98ChX+foSS8Zw1fnwimwvWswozOQywXXTt0vabxC6+fXOknpPPWi
         VYNDnzpaaHvpj2SH1JzmSHpSHiET0Umxa0PMTNU0OgVepVuPK/gaGNlcoUI4W7pLmk5g
         L9RA==
X-Gm-Message-State: AO0yUKWEqNuOxfSTNdJ6RFShak2DkTe1ulx3xgEjUiKSzipP6TUSwFNZ
	BWP9VeR/A9YGqrHvxHTOVqBe/0txJ0C2aL3Rpp5dPWlf3XJR
X-Google-Smtp-Source: AK7set+xfaVn822GQwLvNUzcEtvC3HGMC+oo8z7EbMNQNTmnEoZst/FpfJ9IhQkBtyJiDdL0yd/or5pNXLdpAGKb8zNtzhHh62Kk
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:f08:b0:3af:cb24:3f85 with SMTP id
 h8-20020a0566380f0800b003afcb243f85mr2387710jas.104.1675206317689; Tue, 31
 Jan 2023 15:05:17 -0800 (PST)
Date: Tue, 31 Jan 2023 15:05:17 -0800
In-Reply-To: <00000000000010d44905f01bf8e7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007dd57305f3975d7d@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in ntfs_sparse_cluster
From: syzbot <syzbot+deb631beeb93bdb2df4c@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit c380b52f6c5702cc4bdda5e6d456d6c19a201a0b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Oct 7 11:02:36 2022 +0000

    fs/ntfs3: Change new sparse cluster processing

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1377b979480000
start commit:   e2ca6ba6ba01 Merge tag 'mm-stable-2022-12-13' of git://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=276eb8ff64eb2c27
dashboard link: https://syzkaller.appspot.com/bug?extid=deb631beeb93bdb2df4c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d8601b880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a09c93880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Change new sparse cluster processing

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
