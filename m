Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E6819BDB;
	Thu, 13 Jul 2023 18:24:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so1866490e87.0;
        Thu, 13 Jul 2023 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689272658; x=1691864658;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZM9IKkzNQVcX/YPOWYv1qyHnYAChxmvUSggSWR8eOo=;
        b=XEWifCyJZdiO8NJzQJHJBV8lj/qKPWni5Z48P740idijiZM9UzUBmXI6x8lhHyBmcS
         YW7R86YG4trdvBLSuN21heQVvNet/wwz3pqdyvSxxJzXB247EkNvORqObe8PSHu9/Lh3
         eMj5dIhhg3QLwvjsAtkqTBfxZj8A7okc4cymthM6W4+10Ydfu+v90DNvKlMCbCkn4mS4
         xCGCRqz1hXeIA+3nZD2X/OQX3VxqBlmyjlFr51enTpz0iRRCOufb+rySC+LD4dfl8fe4
         JlHr1AuGHGOfTwyj89W3k3ciuHvy2nwt5TrX9DxA8Bglqu6yDwop2aG3VZcn08Vos3jB
         +8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689272658; x=1691864658;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ZM9IKkzNQVcX/YPOWYv1qyHnYAChxmvUSggSWR8eOo=;
        b=iWV4X+HkVykWUOD6DWEZndkvzYzvNWuKbXRzLZOzEcXv4Poh28lNZV1JdauqHQM1JJ
         MkCWrhKfwS7s8DLd5XAV2oTjiMKyl9LOKC7l8OlmgI0QZTmZ+tlnJVdz1LO0bN8Ehoh/
         g9eOsEFpxjQhdG0T6UoRboEq3Ja6NjBePJlbNJB/OlXegJ04eE3wDXO5Ye1kF+S2WM+Y
         mmKrcF3byQAB0eLRxCQtn3W7MO6nfOW1BlQ83P97jXuY7G0u9Cnr4SyKG7e2bM98cicG
         tPxPw3nhhKRmhybaht7IhhbFvOHF7gB1laFvEZ6eQPDtTdfm3/poIfUwQLaMgFtyNmNu
         dzNg==
X-Gm-Message-State: ABy/qLaUIdY3bKQlUUagVy1lwLJILy4y/exPR2t2gkJvjyDka49Z9VJy
	LExCn5SIxfE2KsURuqEyozQ=
X-Google-Smtp-Source: APBJJlHo/B6rAzHN6EqtIhLt/a16/7UQ9pxFGEg/OM/8DXSHia5tlo8/0c3GJF1QtZA6VUQKKDH6EQ==
X-Received: by 2002:a05:6512:3d1a:b0:4f8:58ae:8ea8 with SMTP id d26-20020a0565123d1a00b004f858ae8ea8mr2007147lfv.58.1689272658182;
        Thu, 13 Jul 2023 11:24:18 -0700 (PDT)
Received: from ?IPV6:2a00:1370:8180:6b00:a1a8:4887:1af4:637a? ([2a00:1370:8180:6b00:a1a8:4887:1af4:637a])
        by smtp.gmail.com with ESMTPSA id v22-20020ac25596000000b004fb745fd21esm1193749lfg.122.2023.07.13.11.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 11:24:17 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------p02ftcxQI3q46laEXz8xbUKm"
Message-ID: <b85911af-b7e1-0ef4-b102-1bc9c602a936@gmail.com>
Date: Thu, 13 Jul 2023 21:24:16 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [syzbot] [ntfs3?] KASAN: use-after-free Read in bcmp
Content-Language: en-US
To: syzbot <syzbot+53ce40c8c0322c06aea5@syzkaller.appspotmail.com>,
 almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org,
 ndesaulniers@google.com, ntfs3@lists.linux.dev,
 syzkaller-bugs@googlegroups.com, trix@redhat.com
References: <0000000000009467500600449f6c@google.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <0000000000009467500600449f6c@google.com>

This is a multi-part message in MIME format.
--------------p02ftcxQI3q46laEXz8xbUKm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Syzbot,

Syzbot <syzbot+53ce40c8c0322c06aea5@syzkaller.appspotmail.com> says:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8689f4f2ea56 Merge tag 'mmc-v6.5-2' of git://git.kernel.or..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1658af44a80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=15873d91ff37a949
> dashboard link: https://syzkaller.appspot.com/bug?extid=53ce40c8c0322c06aea5
> compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12f82688a80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12d54a78a80000
> 

#syz test 
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master





With regards,
Pavel Skripkin
--------------p02ftcxQI3q46laEXz8xbUKm
Content-Type: text/plain; charset=UTF-8; name="ph"
Content-Disposition: attachment; filename="ph"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2ZzL250ZnMzL3N1cGVyLmMgYi9mcy9udGZzMy9zdXBlci5jCmluZGV4
IDFhMDIwNzJiNmIwZS4uZTA0ZTg5YjczMzVlIDEwMDY0NAotLS0gYS9mcy9udGZzMy9zdXBl
ci5jCisrKyBiL2ZzL250ZnMzL3N1cGVyLmMKQEAgLTg1NSw2ICs4NTUsMTEgQEAgc3RhdGlj
IGludCBudGZzX2luaXRfZnJvbV9ib290KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHUzMiBz
ZWN0b3Jfc2l6ZSwKIAogY2hlY2tfYm9vdDoKIAllcnIgPSAtRUlOVkFMOworCisJLyogQ29y
cnVwdGVkIGltYWdlOyBkbyBub3QgcmVhZCBPT0IgKi8KKwlpZiAoYmgtPmJfc2l6ZSAtIHNp
emVvZigqYm9vdCkgPCBib290X29mZikKKwkJZ290byBvdXQ7CisKIAlib290ID0gKHN0cnVj
dCBOVEZTX0JPT1QgKilBZGQyUHRyKGJoLT5iX2RhdGEsIGJvb3Rfb2ZmKTsKIAogCWlmICht
ZW1jbXAoYm9vdC0+c3lzdGVtX2lkLCAiTlRGUyAgICAiLCBzaXplb2YoIk5URlMgICAgIikg
LSAxKSkgewo=

--------------p02ftcxQI3q46laEXz8xbUKm--
