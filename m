Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16962F25
	for <llvm@lists.linux.dev>; Sat,  5 Feb 2022 22:39:07 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id p65-20020a6bbf44000000b00604c0757591so6282429iof.6
        for <llvm@lists.linux.dev>; Sat, 05 Feb 2022 14:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Up70b3+pLCOVWXRm8xQGxM6soIoNpamDU4Qviu67t6s=;
        b=W+qcKyTsNWdHShAijbiXOJWtJQrB3c2YnhKOLW+UwvYEjQFRHPhDo4kZ6tcGOZBn5i
         Je0hD0cDxYy03f9YAOK5aIG6Za1Ryc+c0Ujh4Kv+juw6xPfCQ9EV59JDQcFTcMIVVzkv
         Nh+ZIJvyBTC/+mLRKbr7z/K141GuGIyulkW0pwtWiNiNfFArx+JYPAIS5trLMsW/9RMt
         U6bBUoAkBSwgtFd8r9T2b+If+80ELRPnTWVJzuRHO32bDb6pK8A15kdx8SxDCIMRCG2b
         eMSbkpryCGQ5Quw+eyvNn4m+y3B2DvA/E/POOhnuvPjiA3F5dRXbaghCSMjJpZkUjY2k
         oJng==
X-Gm-Message-State: AOAM533mW4iaigY+ODaLK8xkZrvMVOD2kSOR2LyyOT0L1Zpt12615FJM
	1TkFN+E4eqquhFUa9KrEj69NKivH9Gw3KtoOuUm1Kcj8XO8g
X-Google-Smtp-Source: ABdhPJwhXVky5srzWBAsfF1q1R4zzGYARXATF9jvvYWrr7M3ptKfEHCqn/PdpC+3ZcIv6FBX3fauuvSw8FwpN57klvVaV++1frpl
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:cda9:: with SMTP id g9mr2419625ild.29.1644100746734;
 Sat, 05 Feb 2022 14:39:06 -0800 (PST)
Date: Sat, 05 Feb 2022 14:39:06 -0800
In-Reply-To: <0000000000001e0ba105d5c2dede@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fbf22d05d74d08fb@google.com>
Subject: Re: [syzbot] general protection fault in ext4_fill_super
From: syzbot <syzbot+138c9e58e3cb22eae3b4@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, cmaiolino@redhat.com, lczerner@redhat.com, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit cebe85d570cf84804e848332d6721bc9e5300e07
Author: Lukas Czerner <lczerner@redhat.com>
Date:   Wed Oct 27 14:18:56 2021 +0000

    ext4: switch to the new mount api

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14902978700000
start commit:   0457e5153e0e Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16902978700000
console output: https://syzkaller.appspot.com/x/log.txt?x=12902978700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd57c0f940a9a1ec
dashboard link: https://syzkaller.appspot.com/bug?extid=138c9e58e3cb22eae3b4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f7004fb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178cf108700000

Reported-by: syzbot+138c9e58e3cb22eae3b4@syzkaller.appspotmail.com
Fixes: cebe85d570cf ("ext4: switch to the new mount api")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
