Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925741774E
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 19:01:30 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a9e0f4e17fso3719508b6e.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 12:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694804489; x=1695409289;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jIsxNI68mB9Kq0lc2JZJzazFfrMrZvjV6QtMhALsulY=;
        b=tBeZ4Bcc5JVljH0jLkPN72Nb/XIWiE4yJdZNbEAL/ffbeBYq2dUG/vjkb7rVdaULT9
         5xQExiRjoy+iYQw6+YDxB+7XxjvUqzd047vbVcJT5iKleZ8dGzTd/hP+oZMCj02GB9d0
         zCowNeqEbL7ZFlAjxTRZ7Lz7m881Wqe4LffCVXXJC7aKHbbUy9Sl4m9VMLk5LpRNmcCH
         4UQ9EgOV1WukleFq3kHHenarBSRWU0aQncMyQmzXwZOpXj10QonNosPLiSu91xvla3qC
         NSaqiZWUkpvk7Qcxfe4ehjqJXy37cmxYry/rr04H7gka6l4babYdNt6jg0bfrU56adVL
         2YkQ==
X-Gm-Message-State: AOJu0Yw1T5wcSBLfUL+N075J5G0EwRG0DuB0YbNvi/JKB49eMvuvVM5Q
	QrOqZJXSCiGkWLmGP1UAfDAW8P2csnTA4ll3JDTfdvYwAFq4
X-Google-Smtp-Source: AGHT+IEdW28QExD1CG+iyseqF14sfY7RwaCtlPwhqEcqryljdpqrzAKD69SsLJPnECJiegiA/z1xDUUpJu2RDnGpl364+DDKioM6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1589:b0:3ad:aeed:7ed9 with SMTP id
 t9-20020a056808158900b003adaeed7ed9mr1009026oiw.2.1694804489679; Fri, 15 Sep
 2023 12:01:29 -0700 (PDT)
Date: Fri, 15 Sep 2023 12:01:29 -0700
In-Reply-To: <0000000000005c2d1f05e8945724@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000925bf206056a6b69@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in __d_instantiate
From: syzbot <syzbot+29dc75ed37be943c610e@syzkaller.appspotmail.com>
To: adilger@dilger.ca, almaz.alexandrovich@paragon-software.com, 
	edward.lo@ambergroup.io, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 54e45702b648b7c0000e90b3e9b890e367e16ea8
Author: Edward Lo <edward.lo@ambergroup.io>
Date:   Thu Sep 22 16:50:23 2022 +0000

    fs/ntfs3: Validate resident attribute name

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12403c74680000
start commit:   f9ff5644bcc0 Merge tag 'hsi-for-6.2' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c163713cf9186fe7
dashboard link: https://syzkaller.appspot.com/bug?extid=29dc75ed37be943c610e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1077def7880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10175baf880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Validate resident attribute name

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
