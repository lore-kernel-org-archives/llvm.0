Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEED2561
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 11:23:05 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id k4so27303750vsc.4
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qymjN3ujIci8QkJahnuWyEwypRWjm8vIMiyD3hCE2XE=;
        b=pCkQOR73NHA5kMDVdKeBPobVfVBQu0yDy9iSHpK0fEZ8eLqg3chkvWhYRneaHGmTYf
         0CdNeRQEp6yUg992g6SPR1oEh9VGflRKlEncZu6JuN7dkzJ16ppVxaOwRGp5r5g8wA7C
         +FSYHFgqzHO0LYtWR+vxPoYRgVfFf8hnv0rROQqqg3KPMdjyKqZx5rq1UUcLsAlDRavB
         GO8/SYJa641nS4nM8cDlFmWl+tUY7JIhLaauvt3oCm1700B9qzocHeLReCcw+hGIMDNQ
         DYkMt8Lf6HHMkFtpd13o5MZKFIC3tjIFZZe6k3Y6cLhv4nZcEcEndufA/evxk97IFayp
         LNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qymjN3ujIci8QkJahnuWyEwypRWjm8vIMiyD3hCE2XE=;
        b=LDBqmQUVdX6DVVSg8nX2fIlPqyaJuZ4f9JhlxOeCbpQVUsfWe0GGmTcS8EIgOkp8Dl
         yfZq20EuF6GlwriJOS3UGHjMYJJPV2QisnMI+4+DY5vhhFeji1kZB5nrLmHiyh2Lz7QA
         4RnYJ4mHrC0L8ZSn+7Qn5bjqCKeqY8xf/9ebcC6OnDfz83ZZd1c8DFBEOPwHU2/PpdJp
         da4EAofZZZ1d3IPUmDJmEZoigWN3DoKZ8KhzolDwcsfWCP5i11atRng+DlbiY2l/upzn
         7U2cJOUbckQ41evIpIRORDSqI+Zb7QrzaYsb00AGrYRwv5fiRTJs74l2EfKNLe+AgQZQ
         l9dA==
X-Gm-Message-State: AFqh2koOC70bxNU/qWBfoSE7SlMIclK36LRQmp2lojGfsss/F8m4wLTP
	TjJXiVtFOqhcPZoAIKhskw5DJQSL+orsVo/zJe9shQ==
X-Google-Smtp-Source: AMrXdXsTmHtB0EK6xoRW7OhHg11NHnMNoEKbDRPiJpULGh0kuIcHf3NOlZjTvLpP7nB99SHwnJDvQDhanyajiENlXMo=
X-Received: by 2002:a67:f642:0:b0:3c4:ec4b:b943 with SMTP id
 u2-20020a67f642000000b003c4ec4bb943mr4847879vso.17.1672744984229; Tue, 03 Jan
 2023 03:23:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000e6c7b005f0e90bf1@google.com> <Y6zN/Q3glUcbty+c@mit.edu>
In-Reply-To: <Y6zN/Q3glUcbty+c@mit.edu>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 3 Jan 2023 12:22:53 +0100
Message-ID: <CANp29Y7yH6LeeHMX-joXgr7duZzs2p3j08qZzS6WGwBJDDq+PA@mail.gmail.com>
Subject: Re: [syzbot] [ext4?] kernel panic: EXT4-fs (device loop0): panic
 forced after error (2)
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: syzbot <syzbot+3c45794f522ad93b0eb6@syzkaller.appspotmail.com>, 
	adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Ted,

Syzkaller already tries to avoid such situations, but in this
particular case, it has corrupted the mount options[1] and did not
recognize the problem. Though, as I understand, this string was
nevertheless valid to the kernel. Otherwise it would have aborted the
mount early (?).

I've sent a PR that should make the syzkaller logic more robust to
such broken options strings:
https://github.com/google/syzkaller/pull/3604

[1] grpjquota=Jnoinit_itable(errors=remount-ro,minixdf,jqfmt=vfsv0,usrjquota=."

--
Aleksandr

On Thu, Dec 29, 2022 at 12:14 AM Theodore Ts'o <tytso@mit.edu> wrote:
>
> So this is a totally bogus Syzbot report.  If you use the mount option
> "errors=panic", and you feed ext4 a corrupted file system, then it
> *will* issue an "Ext4-fs error" message, and if you tell it to panic,
> it will panic.
>
> So *please* let's not have some crazy Red Hat principal engineer try
> to file this as a high severity CVE....
>
> This is Working As Intended.  And it is Not A Bug.
>
>                                         - Ted
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/Y6zN/Q3glUcbty%2Bc%40mit.edu.
