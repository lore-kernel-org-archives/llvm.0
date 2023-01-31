Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A428C1C
	for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 16:17:18 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id v17-20020a92ab11000000b00310c6708243so7886627ilh.23
        for <llvm@lists.linux.dev>; Tue, 31 Jan 2023 08:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiAqoUAhSbXRWu7WwqUljNKrMQeqVBW7GAniuAjL2v8=;
        b=Dy6+Ki+rCJp20d4y6ijse5/PNeNoYRHXz38PCshjeCHHskm6Z7l62q6LUmYtdsGgFV
         pJFgbkUpdeG3QBpEzRCRy/P8s2GGwW5e/4xj6dsFlNGFhROAVj0i5XDG/zTijH9gOqk2
         pmJtdE/BALfaBY9AScFRsnBdY6fzXvOwBb8DTRsHTrJq7GW/61O70Vz0mjTUTS0z9+E5
         T9J9cQ9JphVTF85893NeW7+/zser0T92NB0X/XR8CletGyxK0jMZHL7Lu7MZiiPBvAqa
         JZS5RkU23Kthr+9FFUdJzekiagmRiTvuWHOJkgRaiE+YExRHwVWWQWpyl5Nwg5RQQARr
         JYgA==
X-Gm-Message-State: AO0yUKXCCWHFd5g52Ei4/RyYHtKw/A5NDd2Fnx2hFvG3cKAszReojeal
	pXeq/IHxexJMa+x9Q/s9l5FcTOhuMPcNedtMEQf2jjPVxz0W
X-Google-Smtp-Source: AK7set/OHuRu/Wj6tf33O1Z3bSTQrgB1o8gZPL+3utcc+aaXpdr8cyGKqn5K0ftPFAMPNtpPy5ckI+3V6HgyfU38NTkTGcFgjtrJ
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:a418:0:b0:3a9:67b6:18bd with SMTP id
 c24-20020a02a418000000b003a967b618bdmr3800070jal.46.1675181837697; Tue, 31
 Jan 2023 08:17:17 -0800 (PST)
Date: Tue, 31 Jan 2023 08:17:17 -0800
In-Reply-To: <0000000000008be6b405f01164f8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005eca3205f391aade@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: out-of-bounds Read in ntfs_set_ea
From: syzbot <syzbot+8778f030156c6cd16d72@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Oct 10 10:15:33 2022 +0000

    fs/ntfs3: Check fields while reading

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11d9c385480000
start commit:   02bf43c7b7f7 Merge tag 'fs.xattr.simple.rework.rbtree.rwlo..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c59170b68d26a55
dashboard link: https://syzkaller.appspot.com/bug?extid=8778f030156c6cd16d72
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136b8f57880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=175ca3a3880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Check fields while reading

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
