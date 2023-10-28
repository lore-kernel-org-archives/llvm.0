Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817D168A3
	for <llvm@lists.linux.dev>; Sat, 28 Oct 2023 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1e9e17b3269so3966001fac.3
        for <llvm@lists.linux.dev>; Sat, 28 Oct 2023 10:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698512705; x=1699117505;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTo/MYGjU98OZVhpt1voIWuh+FHLPG7oyJBS1qD9LfQ=;
        b=aCURP6TuwVxkP+uKYQxwmrF+nvkrcpN1h4PZM5ShkVFlG0xMIKHYJU4qEZwGPrfddg
         7iG+PgnGvx9NQCEXgPq+HWH76xTBC8zwegUms2xC3mC1dvQfxCvSN57YH3UEK2suuA+T
         DjPuqU98XLQa64gvpSQZEU+Zf67D09fHiCLSF4740RcaVFpbFfhehDwfjuKHDlNTUp3O
         MF2lPkjMKvFoqKLlqEGDoojHpBZ8eAJYOSmb1vNRms3B/s4gAl/6P2UzyH9akXdOTzLO
         DFscIA+ThIQXmhxgy6iCsz5u/vLzjdNLUcbLuL+X+NHQR9wnCRGJz3bT3tTVqE/V0gbm
         ou/w==
X-Gm-Message-State: AOJu0YzknMUfmgoumwunTap6+JIU3dzmIV2ZJi/c5560ZsPQTZjDXncf
	tRFbbX7S6BJK/4wUN3Vum6jgN1+tlBY6mEafR9TCERKR9sC9
X-Google-Smtp-Source: AGHT+IHDWbVpcRZW17s+E9mZT2p3NLImbd1EcjPq+4ECelqP51WUu/Fg5z00UTleUxVPQ3pE/XOUb6xGMgZ4y7h8sYPMfUlG8x9+
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:30d:b0:1e1:3367:1429 with SMTP id
 m13-20020a056870030d00b001e133671429mr2675836oaf.10.1698512705435; Sat, 28
 Oct 2023 10:05:05 -0700 (PDT)
Date: Sat, 28 Oct 2023 10:05:05 -0700
In-Reply-To: <0000000000003ba9f506013b0aed@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000743d980608c9ce33@google.com>
Subject: Re: [syzbot] [ntfs3?] INFO: task hung in ntfs_read_folio (2)
From: syzbot <syzbot+913093197c71922e8375@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, 
	clang-built-linux@googlegroups.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit bfbe5b31caa74ab97f1784fe9ade5f45e0d3de91
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Jun 30 12:22:53 2023 +0000

    fs/ntfs3: fix deadlock in mark_as_free_ex

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14006f67680000
start commit:   bfa3037d8280 Merge tag 'fuse-update-6.5' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4507c291b5ab5d4
dashboard link: https://syzkaller.appspot.com/bug?extid=913093197c71922e8375
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b8869ea80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149e6072a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: fix deadlock in mark_as_free_ex

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
