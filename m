Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547347E
	for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 20:30:26 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id f23-20020a5d8157000000b006dfb209094fso6047360ioo.18
        for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 12:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lO+onbVv6bZVIEl7Kh8E9HbEaMf0DW2YgnQtYSE8Pw=;
        b=dtDCKHWvZifsMCBuScZbnxvc7zTmgv6eC13H0DdJU2sb9tRXQaNko/IGUqm0tuLMBD
         1qUy+4hVhmYilW3TU4UAt4pcHlVKknUAcIg0c4GIkhOu6BrP1TUfVNhB24y3JOUdz/uA
         u8v9vj7BEkh7W2ULWuJXH0uRVJTsA0DBgfxsy5cBSAKAcmdG34ezGtn8lSqo5dKmVXVe
         O53lAXNb1aVEERKa4S+19D9E2U6zjsNliQGAP9jZgtzlulXet3a88HqnXXS+ENfP5opM
         pj6eaeQ7GnF5H/nEUN64PhtKJDG93y/D8Fpe8AwuHJ7PgIEGUMFLY2FMmb9ahPxAMi5q
         dDoA==
X-Gm-Message-State: ANoB5plTC/wxr1iTqywdlK6CPGpXDok6NHM760YxrhUbt2gQ4CKgxn51
	6lWFiBQhCWPOprYqulU5GvlMRkbs/s4YC/GcLbDbdlA8JnUt
X-Google-Smtp-Source: AA0mqf6oL6u1g0efHMd1fRNYolfsD82ctmu3LGNm613o4B0KDZY2tz7ouwZSsZtmP4f8F01iKWsLk1o6RVRsGcZKn06LeI7DITCC
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4d2:b0:304:d061:6cb9 with SMTP id
 f18-20020a056e0204d200b00304d0616cb9mr2099951ils.168.1671568225461; Tue, 20
 Dec 2022 12:30:25 -0800 (PST)
Date: Tue, 20 Dec 2022 12:30:25 -0800
In-Reply-To: <Y6ITpE770+kZ63vp@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004bee2205f0484e1d@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Write in copy_verifier_state
From: syzbot <syzbot+59af7bf76d795311da8c@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, haoluo@google.com, hawk@kernel.org, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+59af7bf76d795311da8c@syzkaller.appspotmail.com

Tested on:

commit:         041fae9c Merge tag 'f2fs-for-6.2-rc1' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15fc914f880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2f3d9d232a3cac5
dashboard link: https://syzkaller.appspot.com/bug?extid=59af7bf76d795311da8c
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10cacf77880000

Note: testing is done by a robot and is best-effort only.
