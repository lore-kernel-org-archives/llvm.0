Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62B2564
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 08:13:38 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-32b532ee15bso88002895ab.1
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 01:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681892017; x=1684484017;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=JimFShg4q1Xc87o6bdlaBPVwnDDbVZhVn7sGbtUyYPwoSGaByJDXUAehLs5yPvZnq2
         xj2a2LJsXLFQVU3X02+mTQfNpC+a3TyERluK+4f9VP3ZCAT7hrKcVUFz/KrRTzjm/N8k
         xzynBcvy/BCG5L++7AB9pfa9tbr7hl8wJFvzaF9PxhfaX7c0UvKEqDm/+XE4mQtc9YAO
         lZPirFlsQ3p4C1UdOQ3cc3JAxwtAENqcKModGip+dz1kO0k9zX6+zs2e1AsLEuB2WlUP
         iF3urNo9rxoXE1Uw3sCvvSFHk7v/izXDDALXYWQl5WdXJs64QFS0bqHKaMlmMKpDFK8u
         urDQ==
X-Gm-Message-State: AAQBX9eSDl2nxLB0TkruSiaX8wLGJStfeb2RuKp6fG1lOv7Ljk9ZLa3Y
	dpvHZFcWNZJf6E1t7TSTBOmNeJvfJQxGffmv1oWZcllxBrlg
X-Google-Smtp-Source: AKy350ZxM+Xb9GNBN83504bkL3uq/X7S37Mg6zCrCUERbs9vz+Iu5OHFeTeyO3L39/R+jUYeAVh6qHLpNsIhMXAdoXULMXlBIadJ
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a6b:cd4c:0:b0:760:ea29:2594 with SMTP id
 d73-20020a6bcd4c000000b00760ea292594mr1190040iog.0.1681892017330; Wed, 19 Apr
 2023 01:13:37 -0700 (PDT)
Date: Wed, 19 Apr 2023 01:13:37 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003e62ab05f9ac0071@google.com>
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
