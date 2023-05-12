Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7231E53E
	for <llvm@lists.linux.dev>; Fri, 12 May 2023 14:07:20 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-331663d8509so147780105ab.0
        for <llvm@lists.linux.dev>; Fri, 12 May 2023 07:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683900439; x=1686492439;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMsA1OvUqk2tsx55m7tIfaPeJf529B0QdbQS7E31h+k=;
        b=FJN3WFfBZcsXbF4UOWPvpNk8XIlQxeR+ToiO+zM6vSnMPKSVxRkBAWOaiUGX4V+3AR
         3uv0kpAuldTyfDDsFiz15pVtNrYjJVcAcgOh6msQRRrkel2lmbAsAPPVoHrNL0oh19+F
         aItGU2DyFP7bD1NYXBJ7Ph93Jyof3XSo58L2Ia1sWOEe6NyMyN9DJ/RtnzLc4xuX2Nxh
         +f5tuGdQEz8UHP80gRCFzvAq89ASeq7S8ZGh40v8bXl6aBb0vJcra5oOZDf8ujpT3FGg
         inIBskysR3rFROiwbp7HeofecCsOtG3euRcfQx/bQnZ6yBGvoqVzz3joWtxCh1oqC8nw
         X5jQ==
X-Gm-Message-State: AC+VfDwcl/f2cf0txBgBp3v4iwJ8Yzq1ELUEJUX3/KWVABp8TCTrF6te
	B3ZQudhgUS6ZDDUBJzrTfqLwlG9/TCx+pyuk69Wqo4msGxS+
X-Google-Smtp-Source: ACHHUZ78MXlEJPSlarcif/f+n4E+wXrSeNZwdz4IonDEPpF9krYy99Fg2BkvtT1Pz45rvxB1dwiGb1hHl8Vm/hIK24b49hIDwO07
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:860e:0:b0:40f:7382:e4aa with SMTP id
 e14-20020a02860e000000b0040f7382e4aamr6776856jai.2.1683900439423; Fri, 12 May
 2023 07:07:19 -0700 (PDT)
Date: Fri, 12 May 2023 07:07:19 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000877b2c05fb7f9fd4@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in ntfs_listxattr
From: syzbot <syzbot+9fcea5ef6dc4dc72d334@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, 
	clang-built-linux@googlegroups.com, dvyukov@google.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	zengheng4@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1587a32a280000
start commit:   8ed710da2873 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1787a32a280000
console output: https://syzkaller.appspot.com/x/log.txt?x=1387a32a280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b83f3e90d74765ea
dashboard link: https://syzkaller.appspot.com/bug?extid=9fcea5ef6dc4dc72d334
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e7ec29880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11829e23880000

Reported-by: syzbot+9fcea5ef6dc4dc72d334@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
