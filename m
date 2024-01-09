Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6793BB43
	for <llvm@lists.linux.dev>; Tue,  9 Jan 2024 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7b7fdde8b58so379745139f.1
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 10:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704824227; x=1705429027;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mquk6hN27KMTsR9z/GB7mTDogoqyzMeGHcwgy9O7SRw=;
        b=LSkUPUDpi2fVDTw1OsaPZz6t2DbkX3fXRFuo06Wi6/layXX1my4YFBKRn4NZwmr37h
         ki+Z2sZHtP09ipRPhbngi8KLlOoqwZS2l5mUuaj8RV0riQ+iBgJV9GPyaW3n7vH4OGUd
         C/H7l0C+AABU4NibQVjeL3N9GynMBsI7JF6yfHgij09F6VRPQXDUsAmRSqs/wTB7AejW
         Q4os1QQSJ/Kh4QhkPfgdyhTm9u9SRKz9MlGz3IqWp4vLzT+gqX7lHTHBY9yySieff1UL
         0Qilf+++NaWRlxJtYBy3UN4xXCtJr+gjTtZz9zwvs4lLcU47XK3R6kgj70ixpMEoZ5ZB
         Yodw==
X-Gm-Message-State: AOJu0Yz06cUbfslF59ODT9cFGlqRUeWwQ8RwjcBPzwjmO3zLFfwJ24xw
	cYfpSwRwZfcEuDhQcA+9LJLr4yZutXvL2S1uFBNr8RxBntbT
X-Google-Smtp-Source: AGHT+IEZQnABXCenyNgGnqplvmc4QrkSe9Qt76qn9RD2khoyFBeZdp5kgZLrjhRHQ7ZnnuJDzF1+5aiYVwVGywORFcHcA5BvInCD
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4e06:b0:46e:3b37:fec8 with SMTP id
 ep6-20020a0566384e0600b0046e3b37fec8mr60814jab.6.1704824227588; Tue, 09 Jan
 2024 10:17:07 -0800 (PST)
Date: Tue, 09 Jan 2024 10:17:07 -0800
In-Reply-To: <0000000000006655c10608ddfb6d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007d7565060e8752d6@google.com>
Subject: Re: [syzbot] [mm?] general protection fault in __hugetlb_zap_begin
From: syzbot <syzbot+ec9435c038e451be48ff@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, eadavis@qq.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lizhi.xu@windriver.com, llvm@lists.linux.dev, 
	mike.kravetz@oracle.com, muchun.song@linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, riel@surriel.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 187da0f8250aa94bd96266096aef6f694e0b4cd2
Author: Mike Kravetz <mike.kravetz@oracle.com>
Date:   Tue Nov 14 01:20:33 2023 +0000

    hugetlb: fix null-ptr-deref in hugetlb_vma_lock_write

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17f5054de80000
start commit:   9b6de136b5f0 Merge tag 'loongarch-fixes-6.7-1' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=52c9552def2a0fdd
dashboard link: https://syzkaller.appspot.com/bug?extid=ec9435c038e451be48ff
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=150a257ce80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13481ff0e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: hugetlb: fix null-ptr-deref in hugetlb_vma_lock_write

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
