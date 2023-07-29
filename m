Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2136238A
	for <llvm@lists.linux.dev>; Sat, 29 Jul 2023 06:45:40 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6bb0ba9fc81so5388259a34.2
        for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 23:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690613140; x=1691217940;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGOhGAeloc0ER8DTdip8+6IYfd63nwLytJCLHZfTBZM=;
        b=Ep17Mrbu6vHWB3ivAWIVUYxe6axiXdH4wsqQLNbH2AcCMv5O2Yi2bN+rsb5/dMY0gl
         vRr8U8iqTkY2RYBOgK/yyl7IzFsVvgLAZ5WBIMcVaBwbXKQK6zUd4NLMyUTNUQy1Q8lo
         Z4cEe830AkqQWHijsW56VFTEHzdD6JYtQJcevLuE2i47Wmo/HpLrEYh8yjxiT1ciKDbJ
         R6VSnDdQGkEKzaBOaNTRjFQxUuJmYNmM81blwVV4MlJ/xVtBEPsYI4R3tMx0S77r1yks
         ykZCFDeG1M4yAILTV8xusEdek7jQd5Z+JpvpFv/p+Vd3xE1R+InBCCeKNAX17LkoiqrZ
         M5TQ==
X-Gm-Message-State: ABy/qLapbTwZvGqEfqQzgInr2rSZDIC4Rrd9mauB5IzQR2N2pspwR5Hx
	ifwDbK7NISFJ36om5B4bP7Q4JbhxxODOyV/Yex9KLWJHRKc6
X-Google-Smtp-Source: APBJJlHwLTxpTJNSenB84vLVZ9OaJaEUnFnE9thy0ErKec7kAFIgkLUe1lyCMQodE27Qm2+Jj+oY4fu1hQc9HW4pI0ZXAEmepcYX
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bd1:b0:3a3:df1d:4369 with SMTP id
 o17-20020a0568080bd100b003a3df1d4369mr8654851oik.7.1690613140148; Fri, 28 Jul
 2023 23:45:40 -0700 (PDT)
Date: Fri, 28 Jul 2023 23:45:40 -0700
In-Reply-To: <0000000000003ba9f506013b0aed@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000abd72906019a8b04@google.com>
Subject: Re: [syzbot] [ntfs3?] INFO: task hung in ntfs_read_folio (2)
From: syzbot <syzbot+913093197c71922e8375@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, 
	clang-built-linux@googlegroups.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17a1cbd9a80000
start commit:   bfa3037d8280 Merge tag 'fuse-update-6.5' of git://git.kern..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1461cbd9a80000
console output: https://syzkaller.appspot.com/x/log.txt?x=1061cbd9a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4507c291b5ab5d4
dashboard link: https://syzkaller.appspot.com/bug?extid=913093197c71922e8375
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b8869ea80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149e6072a80000

Reported-by: syzbot+913093197c71922e8375@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
