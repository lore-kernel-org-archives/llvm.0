Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476434B146
	for <llvm@lists.linux.dev>; Wed,  6 Dec 2023 20:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b8b6e270e6so353930b6e.0
        for <llvm@lists.linux.dev>; Wed, 06 Dec 2023 12:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894967; x=1702499767;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpNbwOXTQE/pK8Y5FKL4XcwMcPxfIP/Q/V7UQfxy6YM=;
        b=bgSm/bvddp+85HQQezmJZBCk03NP/lzyK7wXDgFm49eNbvf05PQKVTXg8rdMjoze90
         zVt1zHgC6d6I8C5U+CO7+Xg0ZgdqZnJQtdM9fhmF5kZ1JaP0oriDvdqBt1L0m41ddGM5
         wwhxX3X2kd9kqKCa5cXVVxWo2g1hiylq3WcQDdkDlDATpqcRbdhstvimmZohE3/mO3tw
         gZEQDm/t1eQoRzRPzJlsf2AL9O95SQ07cPtIfp4pXFw2dHC+A/YL+WhJYPrH5o9NeWAM
         zlE7wFconpwzVR3oTRZTFeHhvFtPcV///1XDe6lV+yQRd5QqIKWKrCpzmnT2vm8YXFnK
         0fHQ==
X-Gm-Message-State: AOJu0YxTAmLktlhazrUSFz1c2TpNc+4WqX++6KDeRSc+qKVEPAl3r4j9
	nl1jmysManWX2/HY6l7OQxWAUQrogCXYkHLO5FODOwOsKBQ+
X-Google-Smtp-Source: AGHT+IEyWCgNr7gxZR5OshHlDIhRJ2iTV2R4/qkUBMTbCdJf0LCUN9ecFLDTPTstODpJIP/y/ivG8obuX/Z8yzu/tAH5w4/8wWla
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a03:b0:3ad:29a4:f54f with SMTP id
 bk3-20020a0568081a0300b003ad29a4f54fmr1315439oib.4.1701894967425; Wed, 06 Dec
 2023 12:36:07 -0800 (PST)
Date: Wed, 06 Dec 2023 12:36:07 -0800
In-Reply-To: <CH0PR10MB5113DA035381743379D344F99584A@CH0PR10MB5113.namprd10.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fa801f060bdd4cef@google.com>
Subject: Re: [syzbot] [fs?] general protection fault in pagemap_scan_hugetlb_entry
From: syzbot <syzbot+6e2ccedb96d1174e6a5f@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, dan.carpenter@linaro.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, mike.kravetz@oracle.com, 
	muchun.song@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	sidhartha.kumar@oracle.com, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+6e2ccedb96d1174e6a5f@syzkaller.appspotmail.com

Tested on:

commit:         41f87dea kexec: select CRYPTO from KEXEC_FILE instead ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-hotfixes-unstable
console output: https://syzkaller.appspot.com/x/log.txt?x=144310d4e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3513b9514190e290
dashboard link: https://syzkaller.appspot.com/bug?extid=6e2ccedb96d1174e6a5f
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
