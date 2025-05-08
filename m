Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A1521D3C9
	for <llvm@lists.linux.dev>; Thu,  8 May 2025 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688385; cv=none; b=Fd7kDmLQHR1pe39oIK41wOWRsojj768/nbn5KDEKB5q8Fw5VpesAWDY0wOpeZo/UwcSZSrc6wJQVcBSPPorvXGqKwwpU8EXzmHTZbiWPN04cItsWrbDUym4Yf6B9fYcr5ITLh4LTuVQV7Pmlk3rBqkveU3LPDIYSHyujVn+NYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688385; c=relaxed/simple;
	bh=wzd2oN78a5f/c5RFfKUvSeNBcAm+s56MJoEcP0uJOJ8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qxuQpx5wwURqk3C8tX7ERahiltXxbztb5BphzOThZS7R16F95srw+uBNdu6Iro+J51qtl7YIPbt7US6K9WbUL4jxLP8/dvCUKMkD/eJ6cjGtEqNJJIThGf5P0xbQabN/h89sRx9NkAHtPnuu0Q8tlveIezudsN+tILYw9dA05ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d91a0d3e15so7532375ab.2
        for <llvm@lists.linux.dev>; Thu, 08 May 2025 00:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688383; x=1747293183;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aG8nEEjrmEeVt+FMIpArijkqqoSXM+l5mTr89aXDaco=;
        b=WOgY98ra21ku2/0nZ5jUBcTohXNTHGXZarUNJt5UkKkV/jQO8DizS7fsfxwXjDcR/J
         Gx+EmIZyTi8lONfD9N+oWCWNSeUJrYbFpixHIEkPjTmIlgXvsV4qbTK7X7ELrXhGdXzD
         VH/T02SkuGMhmcrhPQ4xp0CSizHPhj2HUyQ6VEZP5+8EPKkDW0JvkB3h34Valot2/XfE
         0DLfbI8RyboAQhNGjGKN70zu99uqrKop7gRcvBVZZ2erP3lZMimjtDq5VXkaeB0Kg1ei
         nfQdtHRX0fPkIA2JYdyuia/aWF6BWEyfLtKrnuNL+pd/6P+azRMK6l1FaNh3OkLGJknZ
         WM8g==
X-Forwarded-Encrypted: i=1; AJvYcCX+hLn49aT8kYCNIW2YPfEeFRqgpuXK5u9Rxd1lyBptzaP7oAT87+G8rUsRxqnpuVW+HfM7@lists.linux.dev
X-Gm-Message-State: AOJu0Yw14Ys2dYT4ngsCenxUD7zt39a8MuZGd3A6XnmDbX/9AiOeKvin
	s/f3RKkDy/3eX2NRpfGthZLsQI7IlJENRKgeMJUr6LVWVwLd1XvIaBmP8RxxOxoG1BL1G9v89N9
	Ny/9dtoVt6p466v14AA7EwR76i92hAveUrrcTOLQO6J/gL7s0FYsdq+Y=
X-Google-Smtp-Source: AGHT+IGwtuBYqtqyXs7WRh4r9OmvUUEzOExCVcEqx0h1T1Y13Uv2G2YCBtq+f/KGXA4sXFhBQN7tN/Kda77poO16j+d/OJj+D8XX
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a67:b0:3d9:36a8:3da0 with SMTP id
 e9e14a558f8ab-3da7854d64emr31349925ab.2.1746688383016; Thu, 08 May 2025
 00:13:03 -0700 (PDT)
Date: Thu, 08 May 2025 00:13:03 -0700
In-Reply-To: <000000000000adb08b061413919e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681c597f.050a0220.a19a9.00bd.GAE@google.com>
Subject: Re: [syzbot] [bpf?] possible deadlock in trie_delete_elem
From: syzbot <syzbot+9d95beb2a3c260622518@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, elic@nvidia.com, haoluo@google.com, 
	hdanton@sina.com, jasowang@redhat.com, john.fastabend@gmail.com, 
	jolsa@kernel.org, kafai@fb.com, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	lkp@intel.com, llvm@lists.linux.dev, martin.lau@linux.dev, 
	mathieu.desnoyers@efficios.com, memxor@gmail.com, mhiramat@kernel.org, 
	michal.kukowski@infogain.com, michal.switala@infogain.com, mst@redhat.com, 
	netdev@vger.kernel.org, norbert.kaminski@igglobal.com, 
	norbert.kaminski@infogain.com, norkam41@gmail.com, 
	oe-kbuild-all@lists.linux.dev, parav@nvidia.com, rostedt@goodmis.org, 
	sdf@fomichev.me, sdf@google.com, song@kernel.org, songliubraving@fb.com, 
	syzkaller-bugs@googlegroups.com, wojciech.gladysz@infogain.com, yhs@fb.com, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 47979314c0fe245ed54306e2f91b3f819c7c0f9f
Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date:   Sun Mar 16 04:05:37 2025 +0000

    bpf: Convert lpm_trie.c to rqspinlock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=140598f4580000
start commit:   c2933b2befe2 Merge tag 'net-6.14-rc1' of git://git.kernel...
git tree:       net-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=9d95beb2a3c260622518
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108e1724580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=177035f8580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bpf: Convert lpm_trie.c to rqspinlock

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
