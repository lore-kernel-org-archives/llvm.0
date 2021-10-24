Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A62C98
	for <llvm@lists.linux.dev>; Sun, 24 Oct 2021 02:35:14 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e19so2913906edy.0
        for <llvm@lists.linux.dev>; Sat, 23 Oct 2021 19:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=edKpwoRN8Hv/cXIlxyftKTSXyuYnNxa371gif/W+RLM=;
        b=O/1N85sKgzDx0nQyxN3DY0Hc52cwWXTreBthF/7S5+tvdrsKCZTHz7//BuSceD3IQ4
         LN1Auke3eJX31YK6DbuzOOCH9SUdHDU2Fd3d/L4O/tvH4vjknzP++IXXQKZKluDAQ+pi
         T84ZKb4EDWOcX8RlwpmtEgLjRahJku3DD9LdxLuGAMFteWuP9rYSrWXCOQFHaMYYkROJ
         JM5PiuF8jmbB2BxKWnFbRrmVJM8iMbiggQ0yo4xY1ncCzWSQ0e9Nn6ILcXy0Zah63OA2
         Hn4SqrNbs/JElGA005S76kt9BTZ/FlNht9x358Lxr5dzCQkzP0JB8S4u5kclAS7r6yvI
         kNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=edKpwoRN8Hv/cXIlxyftKTSXyuYnNxa371gif/W+RLM=;
        b=bfvyX/zk7S4w8lZwHN9XQanOe5wbV+mH54ag8mznIk6xxD7PjA1ExkXgOF7lZA+EGs
         CFFJrr3CymLzAzx6SJPrak4ynF7eOR/lDgi+loA4DS7ZWL3LxxC5uAZorRGkkuf9x926
         MQDBzp2ZtJRrSiN9AF3F1A1Jl7SqJHBnU9Zrlq0H8w0aTGUnmmP3kUxns6ICzAgCD4RR
         SknQgAekZSRptNwra6wkgvsiSZoQDXDYHAXqB2AwCfb8gMNkKHTIkwRS+FH4Nrxw3iQA
         ey9H9yH5CIa2VNGSRv6NvVk2Cbs5XHAGqSqlLnqzNWb9gZ0BGB0YiiA3SEAkr2SeYcVX
         2WwA==
X-Gm-Message-State: AOAM533PDIjy+YInBBDkUBsTVU9tTRCRDLRgFRGTorSfS0NL0tQ335GV
	VlclQceQ/ojTZ1N3nkT1TCJU2Q/0LNBxvp+KgE9vGA==
X-Google-Smtp-Source: ABdhPJxzqHaAGo0dX869Vvjl97IFV6MXmhNE0qVtiw+aV7FdLcz7mfeAzo6lNi10pUxA0nyue0iP1epJKQMEJ7CwFgM=
X-Received: by 2002:a17:906:c7c1:: with SMTP id dc1mr11789939ejb.6.1635042912321;
 Sat, 23 Oct 2021 19:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 24 Oct 2021 08:05:01 +0530
Message-ID: <CA+G9fYuhRwQhByNkWQ4OLP7y5vBTGoWdW4KrJSzJizVsDzWQSA@mail.gmail.com>
Subject: i386: tinyconfig: perf_event.h:838:21: error: invalid output size for
 constraint '=q'
To: clang-built-linux <clang-built-linux@googlegroups.com>, 
	linux-stable <stable@vger.kernel.org>, llvm@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Following i386 tinyconfig  clang-13 and clang-nightly failed on
stable-rc queue/5.4.

Fail (119 errors) with status message
'failure while building tuxmake target(s): default': ea3681525113
 ("net: enetc: fix ethtool counter name for PM0_TERR")
 i386 (tinyconfig) with clang-nightly
@ https://builds.tuxbuild.com/1zvtvNS4eyYkOMiXtFgR7n1k0Yc/


make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=i386
CROSS_COMPILE=i686-linux-gnu- HOSTCC=clang CC=clang
In file included from /builds/linux/arch/x86/events/amd/core.c:12:
/builds/linux/arch/x86/events/amd/../perf_event.h:838:21: error:
invalid output size for constraint '=q'
        u64 disable_mask = __this_cpu_read(cpu_hw_events.perf_ctr_virt_mask);

build link,
https://builds.tuxbuild.com/1zvtvNS4eyYkOMiXtFgR7n1k0Yc/

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


--
Linaro LKFT
https://lkft.linaro.org                           ^
