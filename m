Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760517E
	for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 21:25:16 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id b24-20020a056602219800b006e2bf9902cbso6038988iob.4
        for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 13:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UD6Zy4iu8tJTphAuN9O8d9oBYve9cvkhVc0zvhCPlww=;
        b=CHxNyo+4GcxHSWmJGOJGq0kuqGYMpvbMXsvmEkElGUK7tM1Plp5EI40SYp/1PUVweP
         JzHSdSmBHN5lE2o32KXE2Vyz9g5IUjqELb1oXOep8e0hpmCiFtnTGtjQEmfoK3AFyzOM
         SePlB26hOBTpXI2oC9q+oxFRBXZ3UhCiqrXnKrvVLvpqf3Mt72Dd0wXCOXG0RcctQs10
         fKsb/eUB7tLBJNY9zIpk3piKkKfUxXWQqtsdcUDxIJyKxxJvYGn8f7BthIAVcrJaNfC/
         1IEj9Iqm6j2YCakLvlrxcLUh3PLIMCY5pm8fqDGO4m/ezRU2Uc5MjV3mGsYspP8ABOuL
         fnSg==
X-Gm-Message-State: ANoB5pmLoNfB+AQgWjA5EmIRWq5OO8cetO7PccKg3bG0667Z5oHOzsDv
	z+DCtc32V6B49YBy1ZQ5P4b9C0LdKrzOq46+dwSKQXKnBn5u
X-Google-Smtp-Source: AA0mqf4GYPskeXTHmeqVVKmTdLDyfnwWmHssjiT+rtQaHjlaS49X1/u1dvqiy/J/t6I74y0GZbcSJeNmoUf7WzK7aWO6RDQg0lFB
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:c84d:0:b0:302:eed9:c605 with SMTP id
 b13-20020a92c84d000000b00302eed9c605mr34795062ilq.49.1671571515572; Tue, 20
 Dec 2022 13:25:15 -0800 (PST)
Date: Tue, 20 Dec 2022 13:25:15 -0800
In-Reply-To: <Y6Iipad5vz55tl2A@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000670c3f05f049126c@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Write in copy_array
From: syzbot <syzbot+b1e1f7feb407b56d0355@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, haoluo@google.com, hawk@kernel.org, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+b1e1f7feb407b56d0355@syzkaller.appspotmail.com

Tested on:

commit:         e45fb347 Add linux-next specific files for 20221220
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13c134d7880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9445b3c551452920
dashboard link: https://syzkaller.appspot.com/bug?extid=b1e1f7feb407b56d0355
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=118c1408480000

Note: testing is done by a robot and is best-effort only.
