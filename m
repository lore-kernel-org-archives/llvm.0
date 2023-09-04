Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A827FE
	for <llvm@lists.linux.dev>; Mon,  4 Sep 2023 06:09:06 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-57358a689d2so820848eaf.2
        for <llvm@lists.linux.dev>; Sun, 03 Sep 2023 23:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693807745; x=1694412545; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow7q3YrPUF4rmCouRThEW+Kvbo87wf7uRShpFG7WQ+4=;
        b=o6zX3EORDod2keYavZTNJA+Rm+F//XmlLuvTMauU1ys+6zl9aCCIM3GVqgQzgOcQ6N
         sndWPIFPKTgyy7vzgbkb1y15pufmcDPWNScBzg/AB+myZR1hS4wroOc7ruJ4FHhxaPpz
         s+O8Y4D1xvzh0qstXgVw/YX9tfm68QCQ3vlPK8/uFntZ4NjmSv8EYsxHTmiC3UwlD+he
         jsgFfZOduSycO//O+6jOS7tn5oonUZLCxMmZTFm2CLnz7z6zc1qFmAd+srWZkzJ17mXW
         YOV8ucz9B0t0F5Ly+TlmHM0s4GCFSq1qrxnDYypYavftVczEvK5oIGX2VnaAYnXPEm9z
         Eu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693807745; x=1694412545;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ow7q3YrPUF4rmCouRThEW+Kvbo87wf7uRShpFG7WQ+4=;
        b=Fk+gWaojrHWhN+SxYsgUjlZp2OxzJ4T1HP20eWsuhoWpNvnmNqeuFMoM/11dbIqhNJ
         oTqhuYw9nWcf/Hmm7fh1orEpEHae2jIGeR2o3FTtpSbGjiL+683oaBSU3OxUHCh5KO9H
         px/c/9yzkMOImZ+812hGeWRu/JBLGmxK9UxC85H83B19cXdRYDbYh0imMQG+Ilw/J5/W
         s0Xy1UhSDjAqU9dDJ5RlTynBnSZHeuNt+9Uess3Ab3CPyfL5XJJxxwybX+4eMjJna2bw
         eO6x7Pys6DeueyfshmmxBqelcK7Fsu1VAT4QinSHuPbdps/KIxkWFgNhxgHK+WQ/qAVF
         cKlA==
X-Gm-Message-State: AOJu0Yw1XE8as2zSyMTRf3GVLiYKE9UNSu0P94+tmMKhiOp6XUGnnZTq
	yOL3/jU2VigvvVclk8OHMbxOKbj6xwbkmX9jw3I=
X-Google-Smtp-Source: AGHT+IG3nFFAktlP9gmDSjBy/AiFL1SeCq2TBV9/SIjBnmsOMwtrgoMqg4CTLO3DAnZc3DUpprjq7FXCKzDH/DjnUXw=
X-Received: by 2002:a4a:8089:0:b0:56e:466c:7393 with SMTP id
 z9-20020a4a8089000000b0056e466c7393mr7339052oof.5.1693807745127; Sun, 03 Sep
 2023 23:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:60c:0:b0:4f0:1250:dd51 with HTTP; Sun, 3 Sep 2023
 23:09:04 -0700 (PDT)
In-Reply-To: <20230904032658.GA701295@mit.edu>
References: <000000000000e6432a06046c96a5@google.com> <ZPQYyMBFmqrfqafL@dread.disaster.area>
 <20230903083357.75mq5l43gakuc2z7@f> <ZPUIQzsCSNlnBFHB@dread.disaster.area>
 <20230903231338.GN3390869@ZenIV> <ZPU2n48GoSRMBc7j@dread.disaster.area> <20230904032658.GA701295@mit.edu>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 4 Sep 2023 08:09:04 +0200
Message-ID: <CAGudoHGtPOj-HpA25nAkQFmth0F=6WpMFbaqSuu+b34vd243SQ@mail.gmail.com>
Subject: Re: [syzbot] [xfs?] INFO: task hung in __fdget_pos (4)
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Dave Chinner <david@fromorbit.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	syzbot <syzbot+e245f0516ee625aaa412@syzkaller.appspotmail.com>, brauner@kernel.org, 
	djwong@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, llvm@lists.linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

On 9/4/23, Theodore Ts'o <tytso@mit.edu> wrote:
> On Mon, Sep 04, 2023 at 11:45:03AM +1000, Dave Chinner wrote:
>> Entirely possible - this is syzbot we are talking about here.
>> Especially if reiser or ntfs has been tested back before the logs we
>> have start, as both are known to corrupt memory and/or leak locks
>> when trying to parse corrupt filesystem images that syzbot feeds
>> them.  That's why we largely ignore syzbot reports that involve
>> those filesystems...
>>
>> Unfortunately, the logs from what was being done around when the
>> tasks actually hung are long gone (seems like only the last 20-30s
>> of log activity is reported) so when the hung task timer goes off
>> at 143s, there is nothing left to tell us what might have caused it.
>>
>> IOWs, it's entirely possible that it is a memory corruption that
>> has resulted in a leaked lock somewhere...
>
> ... and this is why I ignore any syzbot report that doesn't have a C
> reproducer.  Life is too short to waste time with what is very likely
> syzbot noise....  And I'd much rather opt out of the gamification of
> syzbot dashboards designed to use dark patterns to guilt developers to
> work on "issues" that very likely have no real impact on real life
> actual user impact, if it might cause developers and maintainers to
> burn out and quit.
>
> Basically, if syzbot won't prioritize things for us, it's encumbent on
> us to prioritize things for our own mental health.  And so syzbot
> issues without a real reproducer are very low on my priority list; I
> have things I can work on that are much more likely to make real world
> impact.  Even ones that have a real reproducer, there are certain
> classes of bugs (e.g., "locking bugs" that require a badly corrupted
> file system, or things that are just denial of service attacks if
> you're too stupid to insert a USB thumb drive found in a parking lock
> --- made worse by GNOME who has decided to default mount any random
> USB thumb drive inserted into a system, even a server system that has
> GNOME installed, thanks to some idiotic decision made by some random
> Red Hat product manager), that I just ignore because I don't have
> infinite amounts of time to coddle stupid Red Hat distro tricks.
>

Hello everyone.

When I first stumbled upon this report I was almost completely
oblivious to syzbot vs fsdevel -- I only knew you guys are not fond of
ntfs reports, which made sense but was not indicating there are much
bigger issues.

Given this and other responses I poked around the history and that
made it apparent there are long-standing non-technical problems going
here, none of which I intend to deal with.

That is to say I'm bailing from this thread.

Cheers and sorry for poking the nest,
-- 
Mateusz Guzik <mjguzik gmail.com>
