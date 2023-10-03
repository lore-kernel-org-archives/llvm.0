Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5312510C
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 17:23:46 +0000 (UTC)
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-3af602b6512so1970513b6e.0
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 10:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696353825; x=1696958625;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Q/jMRNvciL7RWMYPwOstUOUPSkgXKQCTerJtq33CsU=;
        b=TJ+CeOV5GN8/QVjks+dUJQs3iZ/CGvTG1DELfHotNd5UVX7RWL7+ORHeMpjWqeMD7k
         ihBY5Vvr71v3qjFMpre/Bit5nXZIGW7evkbXd4jvdhM3e96dsYqUkh9MiBqN4+1+BaYR
         FWG4DQbQo/VIvKxMe8FEZOJSRBtLnmtVIrB8mCcA9w4rH8fH8I0ULoRx8dBNM2zdlJWy
         dapNVLGqlHUoTp3KqT5msZhKEF2qOixcO40XPbDWsMvtx6OUZlhFUtNfZX+QHxGSwCna
         vCI9e0BBTc3FkTDCksUiy1ZFZ/bWaVJ/IlwRA9E8pFa9sww0qo6mliEQyR/lRq9OEp2f
         YSEQ==
X-Gm-Message-State: AOJu0Yx3Hj4GmWq+PfAA8aZyIN/3/kDef1Mwz3UNf/n68XmHB2Bu/jDJ
	1u9aqn1zAQNd4YAcfUibZnRbcDacu6tNEBk0InR/30LZXTus
X-Google-Smtp-Source: AGHT+IF0UvHcrWu4KqYurdVyxOcYLc/Qu5WttUcFgRgpwnKzZePD29nwpy2bx5yZKHHh5WQ6CsMLWFAoaSGlxvJhsZmvt1ASpYXR
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:200c:b0:3a1:f2a4:3d7 with SMTP id
 q12-20020a056808200c00b003a1f2a403d7mr109423oiw.1.1696353825681; Tue, 03 Oct
 2023 10:23:45 -0700 (PDT)
Date: Tue, 03 Oct 2023 10:23:45 -0700
In-Reply-To: <0000000000005f05820606a0838a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003179510606d327e5@google.com>
Subject: Re: [syzbot] [mm?] WARNING in copy_hugetlb_page_range
From: syzbot <syzbot+ec78016e3d67860eec28@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, mike.kravetz@oracle.com, 
	muchun.song@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c9f2baaa18b5 Add linux-next specific files for 20231003
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=154df992680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3fe9c462fee1649f
dashboard link: https://syzkaller.appspot.com/bug?extid=ec78016e3d67860eec28
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11e4b011680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11772062680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5361e41384fe/disk-c9f2baaa.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7028b209124d/vmlinux-c9f2baaa.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a167dc667ee5/bzImage-c9f2baaa.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ec78016e3d67860eec28@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5054 at include/linux/hugetlb.h:1289 hugetlb_walk include/linux/hugetlb.h:1289 [inline]
WARNING: CPU: 0 PID: 5054 at include/linux/hugetlb.h:1289 copy_hugetlb_page_range+0x675/0x3520 mm/hugetlb.c:4940
Modules linked in:
CPU: 0 PID: 5054 Comm: syz-executor329 Not tainted 6.6.0-rc4-next-20231003-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/06/2023
RIP: 0010:hugetlb_walk include/linux/hugetlb.h:1289 [inline]
RIP: 0010:copy_hugetlb_page_range+0x675/0x3520 mm/hugetlb.c:4940
Code: 00 be ff ff ff ff 48 81 c7 a0 01 00 00 e8 b3 2f 6c 08 31 ff 89 c5 89 c6 e8 68 77 ae ff 85 ed 0f 85 dd fd ff ff e8 eb 7b ae ff <0f> 0b e9 d1 fd ff ff e8 df 7b ae ff 49 89 ec 31 ff 41 81 e4 ff 0f
RSP: 0018:ffffc90003a2f4a0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000020000000 RCX: ffffffff81d9dcf8
RDX: ffff8880675d0000 RSI: ffffffff81d9dd05 RDI: 0000000000000005
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff910df9a8 R12: ffff88807905b900
R13: ffff88801efab500 R14: 0000000020000000 R15: dffffc0000000000
FS:  0000555557543380(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcd71918140 CR3: 000000007b828000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 copy_page_range+0x1dc2/0x3c70 mm/memory.c:1293
 dup_mmap+0x13f3/0x1d80 kernel/fork.c:758
 dup_mm kernel/fork.c:1684 [inline]
 copy_mm kernel/fork.c:1733 [inline]
 copy_process+0x6cc9/0x74b0 kernel/fork.c:2495
 kernel_clone+0xfd/0x920 kernel/fork.c:2900
 __do_sys_clone3+0x1f1/0x260 kernel/fork.c:3201
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:81
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fcd71930ab9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc79f4f9b8 EFLAGS: 00000246 ORIG_RAX: 00000000000001b3
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fcd71930ab9
RDX: 00007ffc79f4f9c0 RSI: 0000000000000058 RDI: 00007ffc79f4f9c0
RBP: 00007fcd719a35f0 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 0000000000000001
R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
