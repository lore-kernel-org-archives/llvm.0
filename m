Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743F1CAB9
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 18:36:27 +0000 (UTC)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5733fc73957so6712964eaf.1
        for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 11:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695062187; x=1695666987;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zL7t4GHuNYKyFje4T0iRFTpqFYTS+UOIKhf9ZmTQit4=;
        b=Z3CLOMps8Z++Gqr4e73sGH6aG9LGH7gBZPIlhHUqpXs97TWHiRV9yNPxMP1eVtxylv
         ZCSwmQ8Jqu0ZiRT7ZiNmZ9PluQENn6vCLHslXj8y5wOkqDFEZG5jhBwcbdOLv9HWphbA
         QYevKaTPD5AhBWu6k3uCroUDQGQ4V2iRZobsuuFLpyHEJqvO0YB5hpYE6Tz4tDugYmTa
         hKPykbmbIKbEKQBS/K6Vjyrmmp3YHKxlC0EfIGSyPuVnx9L2jxsSQ8a1c7GiXY5DGSj4
         MgsjrGIHebVk0vSlOF9CpSsu/AgoCwhBU8YPhhty0ruJ8+JoIGEJD5G+NOHG9q54DHW9
         HacQ==
X-Gm-Message-State: AOJu0YxX+EyeHWI/fow8ThpjFu7u8pbTowvQWlhVnp1/Up0swAzr4u6U
	N4EmuqSeACVm9ocYFx0C6qB63EpaBZXMQdzLI80LUfPvIeoN
X-Google-Smtp-Source: AGHT+IHKojlF3DrjzfacrM8ON0QKndS3TFyKBRjiZYO1OODXGZpL+wOYt0U6a2mzN7TiYu16z4GdSgQOZJVCPNaBlJoYXEf1UR65
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a4a:4151:0:b0:573:52fc:4901 with SMTP id
 x78-20020a4a4151000000b0057352fc4901mr3179529ooa.0.1695062187261; Mon, 18 Sep
 2023 11:36:27 -0700 (PDT)
Date: Mon, 18 Sep 2023 11:36:27 -0700
In-Reply-To: <d576d53b-bce4-21d3-fddd-0e26e9b44f89@oracle.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008b455e0605a66b2d@google.com>
Subject: Re: [syzbot] [fs?] [mm?] WARNING in page_copy_sane
From: syzbot <syzbot+c225dea486da4d5592bd@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	mike.kravetz@oracle.com, muchun.song@linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, sidhartha.kumar@oracle.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+c225dea486da4d5592bd@syzkaller.appspotmail.com

Tested on:

commit:         7fc7222d Add linux-next specific files for 20230918
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17fddb62680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79253779bcbe3130
dashboard link: https://syzkaller.appspot.com/bug?extid=c225dea486da4d5592bd
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=137cae54680000

Note: testing is done by a robot and is best-effort only.
