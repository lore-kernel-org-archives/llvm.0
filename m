Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8764CD31E
	for <llvm@lists.linux.dev>; Wed,  8 Mar 2023 08:11:40 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id v14-20020a92c80e000000b0031faea6493cso4887908iln.11
        for <llvm@lists.linux.dev>; Wed, 08 Mar 2023 00:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678263099;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=F+RS2OOmtRRVDInqN9nOxao3fAACkOTheW/ujmUDDBFxV8/bmbtvPyjIbEADGL/GU1
         BeyjVNrW7x0OyXwhu/7WtVRDiGLrd8MLJkufyTuSXIPmFmytBb27kzsZ63Y79SwNGP83
         JbeAaaOj/Cecq262SXU2egHkuXdGOL67FtY606ndl+5dWs5s+9YkTbkRfeeYbYiMr4Og
         y+c1smv5k9wpx9QmLLRMyVHZsUeNK16bd12352l+cLsIqJAyPGvm6scWffET61NF8ozz
         ujKlYgcKv2ooUU8NbRTowsKIx2dX5FgJhLd31tvVY5Ung+CmzisOHea1L5q/4haFsENG
         SU/w==
X-Gm-Message-State: AO0yUKV+tRjM4l+ZxoKLk+WNlqVid7lIZOcOEt8CWSI6fobsoKR1yJnm
	HVOkXqCDYxLuejFED5jS7DBjM6tk/6CsKYqShbHtfeSjbDLT
X-Google-Smtp-Source: AK7set8ohvqpuNRL/JIS3vEqOiqVUfpwiOin574uHv80eNG3CnFwykdH8snjl4FxakBYbcLg+wDx8C0yoczKJ+W5O7OoK+osDiqq
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13f4:b0:313:fa72:d9aa with SMTP id
 w20-20020a056e0213f400b00313fa72d9aamr8342532ilj.0.1678263099703; Wed, 08 Mar
 2023 00:11:39 -0800 (PST)
Date: Wed, 08 Mar 2023 00:11:39 -0800
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e5c94a05f65f130d@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_listxattr
From: syzbot <syzbot+9fcea5ef6dc4dc72d334@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dvyukov@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, zengheng4@huawei.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
ntfs: fix panic about slab-out-of-bounds caused by ntfs_listxattr()

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=9fcea5ef6dc4dc72d334

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 10 trees can be found at
https://syzkaller.appspot.com/upstream/repos
