Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABDC7C
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 00:09:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id j17so570514lfr.3
        for <llvm@lists.linux.dev>; Wed, 01 Feb 2023 16:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jsDaysBR1niC6OaKEz7AaDUvECBLeh6C54c1hhKFwM=;
        b=T5hk0D7+dAcKJzJXXqMG0FchLqF6hESH+oq927Sl573AWqS+wySvgyUirSB71L8JyX
         VLguhiifclfi2BbfRunVEF1gaDkz3s7ScrFYEAcH8MEt7pqq8sqiQf13aYsXlTMGitka
         td0REOsrk2GdeZCaFpiTz08P2YwcipjVT4K5pHdNzwmTeuFTUupYynBV1ic/aMzMxFSx
         p52AQiSvbXbaTu6OGbdnHj9yzvzNy1Kf2VMfqa8GHLCYMHLiJFTL68Txlra+OoWUDbXx
         cOrsI119vCQ2ukQbftaWeafX1GwxpX/ubCRaaXrJGDgS/4MNXFfzYw3uB6sy0Vm2A/Xp
         o09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jsDaysBR1niC6OaKEz7AaDUvECBLeh6C54c1hhKFwM=;
        b=4Gx0Ka8h6Oj7tUurrqqol7ohxUTHU/gqsHWS1Xp2YKKocOtCUTEsTJ0vBlvht3+agP
         9USZfYN3QqOJSjbxK7doZrYEZtQKLvJJR1+9dnWM4kptweGh8UAbUkTCW/JOLDlLxRYD
         +VJIkpSUfUuiC9hFBu7lMtlOQDAHLzSna1UkQGrML+pMNhIQ9tnYo4gThPEhU/zo3vd8
         3DqKdg/n7LlS1fxRLzzfdvs/22/IMuZvbnM0FtSJO6WxTxLJkRp61NFarJJLNtucwUmx
         2BWDroHxKZ+sWZdL9rXndyAAAyWSWmYl999rbrODoOQM3e85wR541uZg4YwUwHbHjw+V
         cKPQ==
X-Gm-Message-State: AO0yUKWyli0fstVB8Dv2EnsGUNP7fcQCpxPoowvSGm42ZGscZIEvWh9u
	BsGBq1j70wHlDphn6g1yvRYRfvHEt7SFsAsGFkc=
X-Google-Smtp-Source: AK7set85xy0LMjiOROJyaNi2Zy8ig3WoiMH1nAQY737i7dHELOja1n7eZWHOmPRCzGKX1x1fRcc2UOy7bOrFMcAeK3c=
X-Received: by 2002:ac2:4985:0:b0:4b5:886b:d4af with SMTP id
 f5-20020ac24985000000b004b5886bd4afmr771485lfl.276.1675296539491; Wed, 01 Feb
 2023 16:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUVbv2T7SExVULn6Bh1mB=VpmYGbH-4U63PKrHPyi6uULQ@mail.gmail.com>
 <Y8rTcfB78f0G7C1j@kernel.org>
In-Reply-To: <Y8rTcfB78f0G7C1j@kernel.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 2 Feb 2023 01:08:22 +0100
Message-ID: <CA+icZUVBh6MgXWuXTOW7kUqAmH8RJ93upfnp8g2rfkwLoG+6Xg@mail.gmail.com>
Subject: Re: pahole: New version 1.25 release?
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 20, 2023 at 6:46 PM Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
> Probably next week, I just have to differentiate a file with split dwarf
> to remove a slight hack I have right now.
>

Thanks for pushing "dwarf_loader: Sync with LINUX_ELFNOTE_LTO_INFO
macro from kernel".

I see some updates in pahole.git#next with some Tested.by#s of you.
So, we are very close to a pre-1.25 release :-)?
Planning to test with Linux-v6.2-rc7...

-Sedat-

[1] https://git.kernel.org/pub/scm/devel/pahole/pahole.git/log/?h=next
