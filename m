Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E80426D0C
	for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633516; cv=none; b=LLf5FjXVh7Zos8RWwceNsBcKdLXA7HD8pov8XtKVEhnsWA3QiDVDCIvHZYuGXl9eEOMUNYMqtVhUDwXPqPZtqyVWEZD527aX9WND8mbRMOJoUdB9bcFT6lgOA8Iy3/Musl3WQtQYfzMZQqregcHvRxxRG/iYqJcoZAD5F358P5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633516; c=relaxed/simple;
	bh=xzCxCEzUowtsPxWMbDjD1lRzfaA5w83hr58sbAM2xcM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BX+CVR+ZhbwyTSDFFg+9I/FIR33HXUIFKD1v5I9GazZk0vkgeDx+2rVYAX+0H8DiAlqxlwrvmRShegLI+b1psZmmDJtkp1q4V2vslN4IEQ1Pkt7XGcvZGbzkxvyzeNJ3B6x+k0Nlugs6HRXl3xewcuSp9UAVER3a1eJgwpltKrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a49f09233dso540412b6e.2
        for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 01:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633502; x=1790238302;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uBkL6ZMYYdQOBhaz18ohIP2qWIBpLXjs4rOb70E61hY=;
        b=oSLYRc1b8Mmn89D9H2FO1y0XCe6wWbsF85Egtij+H5vKFMGS07QEp20KbzhIUbM76r
         JkdxhyC66/dROlsohOyZBE3D97QHRHzRjFUcgEgfRW4erXiVp1KCDuqLpJTYZH9vJ0SY
         81KYBNeUam2bucNnpiBohHlTfaApzbTQ+CLRvM/WiU7fKecoSbPju5PMZ6tGxFhj3wBE
         tttwE4nd72f4+XoaYlEQCe4v9NIFvm9Q82shl5CWjhcmCIc8dbDhJWP4IR/vT+RKGV/B
         ybzkm28xWM7WV/zBKA87Lzjg8fEOnOG90XCQ9234VcnvR1GUKts/gwR3vIq1yjEr4HSd
         4W6A==
X-Forwarded-Encrypted: i=1; AKwUvBx9IEVBXHyrsBI53WZDtYC2vSh05lGipqtZY3RTf/AMXAKtc/tDE1/Jazz/wxaRW5FMfh4H@lists.linux.dev
X-Gm-Message-State: AFuF++nJ0uPq8jlzUl9vltucWa5YWKlJf/F+Yx7rdci3MSv6LRKyRr5q
	3JeDELkGG8tGihGu125bvrp7MoBgUSHOjscgknWAs5k4tkthTcdE8c1TVLI1d5hHEPG58onYF8e
	1dtOYYsVO4Xay3aJA6G9NYD+LO1libgncphkITTw6+Im+aA/XVMUo1zJc71w=
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1692:b0:4c5:92fb:218d with SMTP id
 5614622812f47-4ca4be66e9dmr5399582b6e.22.1789633502228; Thu, 17 Sep 2026
 01:25:02 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:25:02 -0700
In-Reply-To: <aqubuvR_2XCNav28@gremlin>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaba3de.87c06881.1db2b3.0013.GAE@google.com>
Subject: Re: [syzbot] [kvm?] BUG: sleeping function called from invalid
 context in kvm_mmu_notifier_invalidate_range_start
From: syzbot <syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, bigeasy@linutronix.de, dwmw2@infradead.org, 
	dwmw@amazon.co.uk, kvm@vger.kernel.org, liam.howlett@oracle.com, 
	liam@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, ljs@kernel.org, lkp@intel.com, 
	llvm@lists.linux.dev, lorenzo.stoakes@oracle.com, me@brighamcampbell.com, 
	mhocko@suse.com, nogikh@google.com, oe-kbuild-all@lists.linux.dev, 
	pbonzini@redhat.com, rientjes@google.com, rppt@kernel.org, seanjc@google.com, 
	shaikhkamal2012@gmail.com, shakeel.butt@linux.dev, skhan@linuxfoundation.org, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com
Tested-by: syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com

Tested on:

commit:         f902e69c sched: Allow sleeping spinlocks on PREEMPT_RT..
git tree:       git://git.infradead.org/users/dwmw2/linux.git seb-nonblock-rt-test
console output: https://syzkaller.appspot.com/x/log.txt?x=17d63bf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a263b38e64491d5
dashboard link: https://syzkaller.appspot.com/bug?extid=c3178b6b512446632bac
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
