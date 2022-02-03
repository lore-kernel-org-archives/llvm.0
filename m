Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB882F26
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 10:25:12 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id a185-20020a6bcac2000000b00604c268546dso1581566iog.10
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 02:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Rxhq5+VXSIrIwj7a/GsrEywPOO2yQbABshUuuSgeFDs=;
        b=EWr5uUT7TUzhj7RcRwj4/naKNWyapTQUxu4FmZiQit9K1v1adCU95hVH50jb2e4wvO
         +UWAPJe8gsjm45QRcYnkmei6oHDXsDQhD9trYVvyGtxR1/a5xuAnea7WacP9hcWDx6Rz
         xzFQ2UJn2/1PNyIi1JojZjjQQEBaAi8mf9GrzXSpYS8xhhBQnqnzMDrHmwJcGtm8hD3v
         iqb2QZ80OfAqHvV3Ib98FvARJBpvyKEfBYTQQVuv9dsR0Loot59dp0tEmTKTsCBKZvgB
         AyHOtMG1WpnMuW6OE2Pr17wdQCcSCPvHswY0PKYfKTjWCYEZImhyDqlDWw4M7rEGZ2o/
         in+A==
X-Gm-Message-State: AOAM5300OMKWnNsFjFsVN8CNZ4BK+oxbcI+XkjQD8ivlwciQ+u3zep9M
	UP4MdrWNE2zaULECLQv7YW+X/pO+7ZMBTto/r3mLkzC3B8EI
X-Google-Smtp-Source: ABdhPJwciDKQal6Z8tQiBUOtqqjZ9Z10+I25ua2fg40YZSw5o6TjWWvTvcWi43d589ZwucSUE+At081HdhPPiDtRhfgxGm6Iv0ds
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a6b:f218:: with SMTP id q24mr17682264ioh.55.1643883911669;
 Thu, 03 Feb 2022 02:25:11 -0800 (PST)
Date: Thu, 03 Feb 2022 02:25:11 -0800
In-Reply-To: <00000000000079a24b05d714d69f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009b6eaa05d71a8c06@google.com>
Subject: Re: [syzbot] general protection fault in btf_decl_tag_resolve
From: syzbot <syzbot+53619be9444215e785ed@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	clang-built-linux@googlegroups.com, daniel@iogearbox.net, 
	john.fastabend@gmail.com, kafai@fb.com, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, netdev@vger.kernel.org, songliubraving@fb.com, 
	syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit b5ea834dde6b6e7f75e51d5f66dac8cd7c97b5ef
Author: Yonghong Song <yhs@fb.com>
Date:   Tue Sep 14 22:30:15 2021 +0000

    bpf: Support for new btf kind BTF_KIND_TAG

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12183484700000
start commit:   b7892f7d5cb2 tools: Ignore errors from `which' when search..
git tree:       bpf
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11183484700000
console output: https://syzkaller.appspot.com/x/log.txt?x=16183484700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5044676c290190f2
dashboard link: https://syzkaller.appspot.com/bug?extid=53619be9444215e785ed
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16454914700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ceb884700000

Reported-by: syzbot+53619be9444215e785ed@syzkaller.appspotmail.com
Fixes: b5ea834dde6b ("bpf: Support for new btf kind BTF_KIND_TAG")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
