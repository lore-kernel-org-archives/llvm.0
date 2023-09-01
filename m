Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FE0AD41
	for <llvm@lists.linux.dev>; Fri,  1 Sep 2023 14:16:34 +0000 (UTC)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1c09c1fd0abso22969085ad.2
        for <llvm@lists.linux.dev>; Fri, 01 Sep 2023 07:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693577794; x=1694182594;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcvgDbvbUw5Qcf0anbgZcfJ9WNarMzjdamecOvB7IYI=;
        b=NhliJc9afzewt8JC0vLf+CrvQc3buaOMVTWIlyWEFQF1fNiJ0TuZ146OWYV8dBborS
         Lx1y8FHEE9ZAjvG4K2w2rOucY85Anqu1wxIuJ1a9kOTNAfm8fzX0SNi0NDejPQuAiMDn
         QJAkV75sBPcL4uSZY4XhO6i9Pr2+30W/H1/WNt1yqTiqC4VwbDwotuvD4p62OLa+LEZi
         /wElaNzF4zEW5tdlirkihLqs7uGJy5cgDb9wpQ9/R/oMxOieu5I29SpI/fkjIxjSRJeW
         A5CIfJ4zrnjvJd7P1a2/NXvHSpIaDhqm4Kd+Oj39KLnamPVoz6XL6wO0SlF5XwObb6PV
         FC9A==
X-Gm-Message-State: AOJu0YypSs2TLeo8l4bYCS9Ghy6NWJuiRBnLF9ksLyex36XZM0pt9Cp4
	PVb91kypj2mUFf46GQUSSYAS2negWGw5Kx4dMtoWbwECVk4K
X-Google-Smtp-Source: AGHT+IFc7YjlSjHvDvP7cirzcdCjKk2D/fDe+yk6UxvIvAemHVScjMtitmUI/slD7b32dT0fMgTPgbdH3RXPR+jluBVxNY9SvuDQ
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:902:dacb:b0:1b8:929f:1990 with SMTP id
 q11-20020a170902dacb00b001b8929f1990mr922243plx.6.1693577794354; Fri, 01 Sep
 2023 07:16:34 -0700 (PDT)
Date: Fri, 01 Sep 2023 07:16:34 -0700
In-Reply-To: <0000000000001f4d4806037fc7b8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d5052e06044cced1@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in free_unref_page_prepare
From: syzbot <syzbot+7423f066b632d9ff23d5@syzkaller.appspotmail.com>
To: 42.hyeyoo@gmail.com, akpm@linux-foundation.org, bhe@redhat.com, 
	dyoung@redhat.com, hughd@google.com, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	lrh2000@pku.edu.cn, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, pcc@google.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, vgoyal@redhat.com, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 3a77b282e256d880791a4c5aa10ede13d6417425
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Wed Aug 16 15:11:58 2023 +0000

    mm: free up a word in the first tail page

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13297387a80000
start commit:   7271b2a53042 Add linux-next specific files for 20230818
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10a97387a80000
console output: https://syzkaller.appspot.com/x/log.txt?x=17297387a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1936af09cdef7dd6
dashboard link: https://syzkaller.appspot.com/bug?extid=7423f066b632d9ff23d5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=112386f3a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15044717a80000

Reported-by: syzbot+7423f066b632d9ff23d5@syzkaller.appspotmail.com
Fixes: 3a77b282e256 ("mm: free up a word in the first tail page")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
