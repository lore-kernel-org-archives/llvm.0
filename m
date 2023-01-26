Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B53A1FA1
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 08:13:17 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id o10-20020a056e02102a00b003006328df7bso783659ilj.17
        for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 00:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEfpfP62XIqchPRHLndjuTCyLWg79Hv36f/NXAdlpAs=;
        b=wSMNOr65qIskbcxSIpP1zMwOtvAcxUv7Gz1bSnHUcVJxEJcgE9I/nbFZaGzyRStSH9
         RqY1VXubZEi2apFYUCC2YGwWdTVIF2U5xfxqYZs/CD0QQ4IN9lh0Rz4q3QoZn5yy4xKq
         RUJur2Ot5vnjFh93LJiq1EfwY78NlKrmeMnCpedBqRhBbwCeH/UUGWL4If97PwMGHdIr
         Jy9I8ziz0/yrk1iCrSXmhpobiQhnuPIf8FlnQEapgFn5aA0aC1BRfumUhdCtrRHs/Fnp
         8JhuRcb3gOocjAjg/zoAH4OSqyxphZiplITkTO7A3cPe5siE+y5epyBXRTUawvl8T+0v
         4aFA==
X-Gm-Message-State: AFqh2krXFnG6y/sQ3KsjQeIYmK3idCgeyV6Lfdq3Hf8Gzfk28evbTVl3
	qxsNEPCapPv/U9H8KdQosWaeUjGzCuB5GPsfu0y8ID4COU3v
X-Google-Smtp-Source: AMrXdXsQG5JQdoaLSZYANWYd/5p96G8xroKqzn7EOH/B///qz3B0WtGEa/YaV/oAUEqZ9dapP40iNAIaLjwH/eN2pWh/x7CIJWVN
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a6b:e019:0:b0:6df:5aa3:393c with SMTP id
 z25-20020a6be019000000b006df5aa3393cmr3225578iog.81.1674720796499; Thu, 26
 Jan 2023 00:13:16 -0800 (PST)
Date: Thu, 26 Jan 2023 00:13:16 -0800
In-Reply-To: <0000000000005af92105e80510f2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002c692505f3265254@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_get_ea
From: syzbot <syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dan.carpenter@oracle.com, 
	eadaivs@sina.com, eadavis@sina.com, eadvis@sina.com, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, lkp@intel.com, llvm@lists.linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	pjwatson999@gmail.com, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Oct 10 10:15:33 2022 +0000

    fs/ntfs3: Check fields while reading

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15cc6199480000
start commit:   fef7fd48922d Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7341d0f941b3356
dashboard link: https://syzkaller.appspot.com/bug?extid=c4d950787fd5553287b7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133d4479880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f05e71880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Check fields while reading

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
