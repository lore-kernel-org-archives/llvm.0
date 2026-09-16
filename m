Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5049340BCB6
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586693; cv=none; b=gtF58CkVmVOQ0OiHMyuVNWi5mA9YcfHGIl2jM5HSBf4vWXET02ESBGIlBzhIzTIGmrQsdiV7A7+hC70zcCThpBByJ93eQulsCJr2cPeOl5u4laAyCZVmDiY6whYPrAlGwjA6NyyOp7Bgh/8C5X4B5FmMznyeQbkiOYDYHQG4e/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586693; c=relaxed/simple;
	bh=T8e4qFcoWW/dNathKMvtjSc8MmQ0SvJgeeAGEMDyUMQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UWBvIju2ds/VE9Ld+BNTrHuMZN+RiybbFvyWCkAhlYEuryuFsCdW6NZkqCAE7Olmd3KXxp6tHroQl7Z9mIag5taCeAqXOoaW3CmrOSjXenLwQNB46MJhrcCy5wEt3BXWo4J/njcV18ptNAsIu43iCpGILdcTUjLaIml2jJBR1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso134269b6e.2
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 12:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586646; x=1790191446;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gGav+E6NmhUVSh9XUjVdcV/Auw85chnTv3eOmsCDzNk=;
        b=pMjbdkJf4CFYTo/uqDURELlsl/GU001vpy1pkzgjLvXRH9Oxukro7iCcz3TpTaJN+0
         j0jKtdvKoeTyHwVcVD8zq22oIOrmCZ5b592Az3y4G6zD92SKiDGbktYlSZc+IlPbFCMt
         vTkuxelg4K1UV/R4vCUDfLV5Xj/L8HVzsgFGKrXLwXC7e5XxFWa/oDf1DsnjddHJGTXZ
         WX4XBJUXqh+GBsPZGKo3hqQ2ZjnPn1VcGlpM3Y6DLVYT6IelLr1Ou4nPJWtzhfYGA31E
         lz8Szc8M4JfvMpUUCv5yl1n8cyzFu2/dlHlTK7+04IKK/VRUT+jzxkmWWcQEKS+PPsxx
         L7mA==
X-Forwarded-Encrypted: i=1; AKwUvBzQetQ+xRsKspJzO9K2PxmJthXQzZc3iVMDnzJmrqyA156XDkBtz37RCNiRqzBsqdLHd3y3@lists.linux.dev
X-Gm-Message-State: AFuF++mlVrIEOhsE6q7VVhv8kPFAeoZAwMnDiCkkQ4vgewRfn5mQZB2x
	ELz9KFzEP4XeiQfJl9dGD/T1FuG7ZtSzZsEO6kiOkjOlact2OByn9ZkplZuYJ6U7l2/SGWBzMna
	RdRqYTDVtwVIceLZ8b7xdu89wYGeEU+RscIgRfAq4GxAIXOX6Sn/VQCCZkSs=
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a24:b0:4c3:7695:d30 with SMTP id
 5614622812f47-4ca4a1dc406mr4599160b6e.14.1789586646123; Wed, 16 Sep 2026
 12:24:06 -0700 (PDT)
Date: Wed, 16 Sep 2026 12:24:06 -0700
In-Reply-To: <aqrZMReaQPG0M9oV@gremlin>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaaecd6.4e05fbd6.392abc.0003.GAE@google.com>
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

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 7



Tested on:

commit:         9b87fdc9 Merge tag 'sched_ext-for-7.3-rc3-fixes' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=c3178b6b512446632bac
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a16bf9580000

