Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C745663
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 05:16:34 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6c4f91d2f55so2128169a34.0
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 22:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696396593; x=1697001393;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xsl5iHyLS4qMdG5lx1KkFmQgiDnWMJRcCrl39PiOj5A=;
        b=xMDVmOkvFF81glSEbtMkuq4Vp9vjCw92WEQookz33PmTAGBLT2W0+47iMNmiIDLv4h
         Ka1rW1fz/FP/eucUWT+KemzyZBoFc7/pfnLZMlsYvoud1pN7vUijqymU1IkDLElL9tk3
         PZF+5psxKBSDoedwG8/Ql0/9cHkDxEDZVnord9d61cSlY6iYH7sp1kY6zn8onAJ+iTpI
         a2fwaY3lFUqNr+YXDMGA7MCVsbmEdySk30dljuM4Jq8Msegv2UQRR2Kqr+O4fKttDzlo
         JjQr/Mkz1nexmTZv7yTtur+GhlvbI4nKkL451y2YWqAhik/Zy1rOOAIhZR1vxWuBLd6k
         8QVQ==
X-Gm-Message-State: AOJu0YzN5lo7TaOH+hBi6DOEBvKnUDODkEPLy/wb2gBe4kZeGiOWWJwz
	Hf7PgC0Rhz6fd+fQN1mPfSV97P2VF6imLOyJkDYLx/Gp9vHG
X-Google-Smtp-Source: AGHT+IEKE85r/QEez3XukduZdd3MAgJKkU9MpperzIgUDEZvttkFcTjPSnSs4p4EZHI6RoodSszwHEXjUKhOqgbh5Qh/4uyth7px
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6830:1154:b0:6bd:58f:d8c1 with SMTP id
 x20-20020a056830115400b006bd058fd8c1mr370654otq.1.1696396593664; Tue, 03 Oct
 2023 22:16:33 -0700 (PDT)
Date: Tue, 03 Oct 2023 22:16:33 -0700
In-Reply-To: <0000000000005f05820606a0838a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005d185b0606dd1cbf@google.com>
Subject: Re: [syzbot] [mm?] WARNING in copy_hugetlb_page_range
From: syzbot <syzbot+ec78016e3d67860eec28@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, hdanton@sina.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, mike.kravetz@oracle.com, 
	muchun.song@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	riel@surriel.com, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 446503572dc452fc544d6898113feb0f3801477b
Author: Rik van Riel <riel@surriel.com>
Date:   Sun Oct 1 00:55:50 2023 +0000

    hugetlbfs: replace hugetlb_vma_lock with invalidate_lock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=146c879e680000
start commit:   c9f2baaa18b5 Add linux-next specific files for 20231003
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=166c879e680000
console output: https://syzkaller.appspot.com/x/log.txt?x=126c879e680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3fe9c462fee1649f
dashboard link: https://syzkaller.appspot.com/bug?extid=ec78016e3d67860eec28
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11e4b011680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11772062680000

Reported-by: syzbot+ec78016e3d67860eec28@syzkaller.appspotmail.com
Fixes: 446503572dc4 ("hugetlbfs: replace hugetlb_vma_lock with invalidate_lock")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
