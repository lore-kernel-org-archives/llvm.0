Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25B72F3A
	for <llvm@lists.linux.dev>; Tue,  8 Nov 2022 22:53:45 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id p8-20020a056830130800b0066bb73cf3bcso9194789otq.11
        for <llvm@lists.linux.dev>; Tue, 08 Nov 2022 14:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=knuha/0L3whh8nT50lR2ItuT1EONyZVV+ouqJ68QHZA=;
        b=i4I18xsZKajr58O29V/LVujDoAOrDQYT3U7wdkvIrXpZbp9Ca5Qiz8midqU94kQUvG
         gK76lIwmEix693nERMwMD6nG3KorWFLH/s/CHOQz//303Bvnm/tfoXivbxi1i0o4jXIW
         2PpsEz25qapySiXRBuCGz0aZYcfaU3D4FmlWh/TFh79GWt/Qdepu0al2QH59vWvwGs4c
         Z7YlYsstqw5pFYtTap3ya3+HLSnjPu9tsI7N6wdqLiA9XSmiUJ1OcG7JqNjiT75YOeFf
         XAd96YEsw7RXoFHQ25QlPlf9bi+lKbkUfmFPwU1ozWFnU1kt5PEaDyFAGAt5ZwuaAyTD
         Hzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knuha/0L3whh8nT50lR2ItuT1EONyZVV+ouqJ68QHZA=;
        b=yU07HSwTxMA+jxgPnNorvRlcH615ZkKv5MGVCVpuve9cuOzi/lClQYXwrKFcKgzK5p
         rHKepKPis/bxl9KUoToNHjwyjwe5CP32bjXlRNgG7xXaIe2qYIr2XQhMZ3P1SDXk5mE4
         mZgj6q3iw+ZsgRLpsPn8H2jLmqRiLgFEfmGdw8oqhoZiUbG13O1bdCkybcHH+HjR/Zal
         mocPg6g8l5rAvIWNTQcJFw1iuh5HbjCTeOCpe6NZYmFI3yign+uYPL8nc5K8uG/AC0UR
         N2JXC6OJxhMW0fuW2ObjWm9Le+pTrtovJcRhZQn8qU0cKzcznwOnW/EaOBvpS7NKzi+o
         LlxA==
X-Gm-Message-State: ACrzQf2HmN+9Q98GB/XxCgtuq46vJlHyQ5mI2IYRX8ztdYH+wRvg4jMU
	j+dFhiURaZEpJpbqclWj2Rui78QsW1omoTVB/HoZIw==
X-Google-Smtp-Source: AMsMyM6sbyW4Z90a1WvOaiYwAlYDgogLA5zn3UR3LNLstqEXoVzvOwGScU2a4MAsLERATJ/u37KNdb+1huwgmhmZXno=
X-Received: by 2002:a9d:62d8:0:b0:66c:4f88:78ff with SMTP id
 z24-20020a9d62d8000000b0066c4f8878ffmr23580029otk.269.1667948024724; Tue, 08
 Nov 2022 14:53:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000dc81b705a0af279c@google.com> <000000000000564bd705ecdf291f@google.com>
In-Reply-To: <000000000000564bd705ecdf291f@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 8 Nov 2022 14:53:34 -0800
Message-ID: <CACT4Y+bnN7oZp2WJf+Jcx8+de1roOdLB=f_Zu+0H4UHEkfcO8A@mail.gmail.com>
Subject: Re: [syzbot] WARNING in bpf_check (3)
To: syzbot <syzbot+245129539c27fecf099a@syzkaller.appspotmail.com>
Cc: andrii@kernel.org, andriin@fb.com, ast@kernel.org, bpf@vger.kernel.org, 
	clang-built-linux@googlegroups.com, daniel@iogearbox.net, davem@davemloft.net, 
	haoluo@google.com, hawk@kernel.org, john.fastabend@gmail.com, 
	jolsa@kernel.org, kafai@fb.com, kpsingh@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, martin.lau@linux.dev, 
	memxor@gmail.com, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, sdf@google.com, shanavas@crystalwater.ae, 
	song@kernel.org, songliubraving@fb.com, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, trix@redhat.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Nov 2022 at 02:48, syzbot
<syzbot+245129539c27fecf099a@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 34dd3bad1a6f1dc7d18ee8dd53f1d31bffd2aee8
> Author: Alexei Starovoitov <ast@kernel.org>
> Date:   Fri Sep 2 21:10:47 2022 +0000
>
>     bpf: Relax the requirement to use preallocated hash maps in tracing progs.
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1232e176880000
> start commit:   506357871c18 Merge tag 'spi-fix-v6.0-rc4' of git://git.ker..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1b95a17a5bfb1521
> dashboard link: https://syzkaller.appspot.com/bug?extid=245129539c27fecf099a
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10940477080000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=177e8f43080000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: bpf: Relax the requirement to use preallocated hash maps in tracing progs.
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable based on the subsystem and the patch:

#syz fix:
bpf: Relax the requirement to use preallocated hash maps in tracing progs.
