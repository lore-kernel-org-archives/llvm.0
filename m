Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F7AD3A
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 23:06:30 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id q3-20020a5edb03000000b00725625524e5so2021955iop.2
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 15:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yS69ZluBz1g0tjn3hzPqjYm4xHf7bwIwQjBQ4SRSpG8=;
        b=S0+X3LLys1xxM/rjGMI0lIYvIBbow1rRK0n+qmLU0kO5NwtQCI7CtApmEqYpiXdSpl
         Capj0t5Iatovj+T4xHaKvpYZON5TKMv9WwsxNVO26RUisYOGydgSxCWua3K+HVNkh00C
         tO6I7z95k4PhUGaT5cBuzSDQz39QzQbVscGUvPJxA+mFeNN21KzDZ+HKfMPXMUCDAp0M
         D0rqhOqldjse/BGXLql7H3NfcBlKN52x3QuoBi5ImqdMw7BrxCyxy7GbgYvBcJKzWBTo
         ZE+7l8MV1mdpEAX/m1cUCkyLsFcHIw/MX7MOOHUw0gQc6Dj/glBw7vpD1+G8CnHgeYaJ
         mqoA==
X-Gm-Message-State: AO0yUKUXuCnJJlBeposgw4kD/cadGEKh/uBGX/Xra9PfMg9LLXJhOcFm
	WRNa/88neMvrwU1o8Ak4T8zrRN2ZtiMVonyckImZVOD2ljzk
X-Google-Smtp-Source: AK7set/HcUh7jDIQP0/0+CxSz0TVrJgoNJNITN0WYAXolAanigKsaQ9gbYXZTh75VDzDWKeu3urX9D13aaYGsWIqDI3gZMUp3DGK
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:22cf:b0:704:8263:b926 with SMTP id
 e15-20020a05660222cf00b007048263b926mr1835233ioe.53.1675379189876; Thu, 02
 Feb 2023 15:06:29 -0800 (PST)
Date: Thu, 02 Feb 2023 15:06:29 -0800
In-Reply-To: <0000000000009da4c705dcb87735@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007a0f9905f3bf9d9d@google.com>
Subject: Re: [syzbot] WARNING in check_map_prog_compatibility
From: syzbot <syzbot+e3f8d4df1e1981a97abb@syzkaller.appspotmail.com>
To: andrii.nakryiko@gmail.com, andrii@kernel.org, ast@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, davem@davemloft.net, 
	haoluo@google.com, hawk@kernel.org, john.fastabend@gmail.com, 
	jolsa@kernel.org, kafai@fb.com, kpsingh@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, martin.lau@linux.dev, 
	memxor@gmail.com, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, sdf@google.com, song@kernel.org, 
	songliubraving@fb.com, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
bpf: Relax the requirement to use preallocated hash maps in

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=e3f8d4df1e1981a97abb

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 10 trees can be found at
https://syzkaller.appspot.com/upstream/repos
