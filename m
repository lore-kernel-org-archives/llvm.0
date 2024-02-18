Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E743A42052
	for <llvm@lists.linux.dev>; Sun, 18 Feb 2024 11:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708257185; cv=none; b=pztpBRspdqTVeGqUsLVR9oXKjlHTGIYw3SdrGcJjxsF0kb0ZGVdzEmDxyqo/NSNZy5o4HpAgjEOfXIUtJkNq8nMtO+CyZYU6SSSkHryT7KJQIvMy9xjGhBAvXPGnTX6ngHjvmzR/2AIYbKa6TaxIwlVUaLglJ4Cu1cv4rkn86co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708257185; c=relaxed/simple;
	bh=6+hmd+W4BV+dvIrq+c8lyx1zUvi2WhOlm4Y9/3qs7UE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sSSUlIfVDZx5CAtsQJdx2+dxGvqDw2df/g3PWutxv4Wq9zjaADEOFmBWS29QkaESfpv5IJ/vIzZpzCQ88FVz4J31BeHxSYz0uM+g0Q/8/mLwzRZZ+/6qPaXSyZPQMmYDCxgtOpdq/DMvOyBACGM1SZJ3SyUGlNL2nT8rlVC1We4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c72d53aa6cso56856539f.1
        for <llvm@lists.linux.dev>; Sun, 18 Feb 2024 03:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708257183; x=1708861983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWsbO4aSSs4DO+xVFIe6sZD6wCzyO5IWX6HRTcWueSM=;
        b=Q5kPkU1Hm3AzYJd5N+fFRYMfi41MfZHRXnJ6NQtgQBk6XnrodcPmtMT4yvFX0geLlN
         c2Gao9lEcxWyuwFjks97IniFjKqYwpo/J6Cwd5YhH2rAUhryxwdhbR4t2KM73PrnHEfI
         aV4N40WfCwXRlSJVV5yOGhJrPJdN2gxAsUbHcjcWXlHMlx5Q+lFleBnTjqZTvUDa9Xoc
         juGbrhhxrC427tLq75ORJTMi0N+r2VX7YWh+rv0zoHp19Qk8mUrioirZSfvrK0Qrz6BZ
         18SjJHv5SXX6Ly5CmQpxJE2kfrenUA2+BaMik75OLhT38gM83h9yVpSAcgaR6MFBIjcp
         kbTw==
X-Forwarded-Encrypted: i=1; AJvYcCWCNQKb2GHOZnqz7ZBFw1YqxBJJ0owS2NRJDftuCsp5QCps9q+To2aOpxFuqAJhvT3byHmnN/2DCDEryr/WpOnHRL2IlQ==
X-Gm-Message-State: AOJu0YxGwO0a9Qplme2NLE0GJ6hJQa3Y0F3TuRHNFC5q/boSSr/SADfK
	6GFkJQZ+OKfZI3Vi9hn1uIkESTJt5nYRSJ+GwVtoaE2dkY1elnlAwTg2Xt78qhVqStuWYmetJfP
	Nnph4xaO1kyZsnEWxpIIEYJ2CPoLHp5nFo2mVwrp06zyyw4Cl9qW6qLU=
X-Google-Smtp-Source: AGHT+IFIXT3OhUsCbMVjYYsUWl3l9wpox5NiVMHC1HP2UXvlCL7fbuxvKuCnoQpKXDGz68p2pMLDaqBASQ70HUFhk4Qbd0wtQ812
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:c568:0:b0:363:8b04:6df7 with SMTP id
 b8-20020a92c568000000b003638b046df7mr783797ilj.0.1708257183250; Sun, 18 Feb
 2024 03:53:03 -0800 (PST)
Date: Sun, 18 Feb 2024 03:53:03 -0800
In-Reply-To: <0000000000004b7b3a05f0bc25f8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000097c4480611a69ec8@google.com>
Subject: Re: [syzbot] [ntfs3?] kernel panic: stack is corrupted in
 __lock_acquire (5)
From: syzbot <syzbot+0bc4c0668351ce1cab8f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	brauner@kernel.org, hdanton@sina.com, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1301e1d0180000
start commit:   ce9ecca0238b Linux 6.6-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4ca82a1bedd37e4
dashboard link: https://syzkaller.appspot.com/bug?extid=0bc4c0668351ce1cab8f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11814954680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=103bc138680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
