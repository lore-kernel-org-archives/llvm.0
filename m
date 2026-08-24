Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0531A01BE
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 12:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574413; cv=none; b=eudJGgdWe3tCd2pQMCD/IIA5erhPIRCZV7vbqn+YWRQ/swx8zvSWp9LIa8qAKHIR/ulvDxyig+hgYQkrIrzAGw+h5LRqJv5rmvlNfm80opwDEsvDnKDgBxjetOg+FXf2DYuM7sJDETBU9xRNp1r8va46JiQEN/FYCPHCYekdgh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574413; c=relaxed/simple;
	bh=hzUjK7CL9pf1gwlU02Sq8tZVe94A5FE5DFeDZhztTd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CequGpiKvryAa1efZGmBLDjmc1paOTS5MSxdK3gonlDXtQspm7pp9c233bmUOOjOAG+aPc/Ry3U0ZeDpSuFxTZgcBip0yfo/4PPA1QDjRiuy1rTHPD07NnyDkGyrCdiU/ACoy8RDfmGeHyLHUoPa0KcWQIYDcit5gdYcM14IBeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfaa014978so1437703e0c.3
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 05:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574410; x=1788179210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99NfZ0WStZf4rq4lKcbEk8ievxJm5E/AaadAduPs2+s=;
        b=dg0PTSJz2Yno4g/tSCC/uOUcCKJybhUiChqkmxuj2iRca1df8z51a7fIpOa3TGeCxQ
         5ZoD3JXywvOhrkV6r6EzTD3OcyALHmElfpmP1WYweS6EeS3uyIVMoNrlMfOmBFM86IYA
         KA6NPv22qV0ZRENTjwkbA+Cof5/H3j9C18LLfpdbL8m9K6hw5KLwQCxcZ5aTxUI869O5
         JQ+s92pIwULh9wguzw0mv8YpNv3AyJ/MBXQrxDQLO59PGJ7g62lbz7ZyA+KASV5fMFKv
         1BiuI0W5a+rpp+82VnssqHljMp8XpaSbvPXbxh+97mFQAwSf/itG301Z8v3+LVpvZub7
         QFlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNJM9hVgu4K9UYPXEfWUAEQAJYKylxAgKqUyk5sdYqXT5PuK//FNU9rmJiAaMlGiYc3srJ@lists.linux.dev
X-Gm-Message-State: AFuF++mgysm9C+/QFkCrNiaHrfCMnjluc0G187xZjKKRuSD0elzuTjMt
	uIRAR13Tin8BAxStpwGpfSVxyhRT6YyiyIc4LpAL2TAD+ROz6uhpeBYlGbKT4cZc
X-Gm-Gg: AR+sD13KQmmv2pO0A6MFIEFNXnE8nRRnmQPBwdy8TI4d95qzZajqlmXhPSY8ShD261s
	cPZCHl1MD069bplrYi5uzQO4P2vvRFCiko+P9ZWMLaeStEX2+K7PNxCmedHSKBZlQ7Bm+PuH4fj
	0j+ebZ2T/9JmQFkuOfgoY9QiOzOOfH1T2AiQDB00htOfTKgMd7p+OhI+ew2gCoZxHa4RHMCHwWA
	Vimw7uAgmH+GGl9znGWJ4gx6SLl1jk930xYMIJ1JG0027tAjDKPDYqKdil20qlwtn+6kVxkvSlc
	EG2atqyc6e4mxMmiK0CLBfb7NcNb1SKH06S/c/dEagxmihm3YtsuZ3M5OoSkwsvWX1FW+f0kvIc
	cw9KkUpZaeHuFZTJlWOwvzH21qatXaewLtkHRW4nxxq23jrK0V4OYk9DoXo8jnHAqJbcePbXSim
	o7WSqQOSbkLpxAT2VxKFie6pFwRYTH6DfJAI090n/kpE0PZTHVGKyEFjazDMLYo/xSoVDx1Wrcb
	F+F14cLH5hLTKVDeSHLX+OUqD0rWw==
X-Received: by 2002:a05:6122:218a:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c5ff82ae58mr9487088e0c.7.1787574410206;
        Mon, 24 Aug 2026 05:26:50 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623eb64b2sm3321813e0c.11.2026.08.24.05.26.49
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:26:49 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1310886e0c.1
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 05:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqkWwUK6gDlAKpDsXnF/S5yEO46OUN5gJVV+gcTx5r7evhWn57ou8N0zKrnN2YHzgNupRUh@lists.linux.dev
X-Received: by 2002:a05:6102:6c1:b0:777:50f1:c202 with SMTP id
 ada2fe7eead31-77a64b67f1fmr9134464137.10.1787574409167; Mon, 24 Aug 2026
 05:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org> <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
In-Reply-To: <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:26:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com>
X-Gm-Features: AcwNN1Uyh2OUI4gHQ2gXUR2MMIqo1XxoBetkGEdz0l1KxOOuYsUn6EHFkvKpS3c
Message-ID: <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kallsyms: add symbol size for kallsyms symbols that
 can change size
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Tue, 28 Jul 2026 at 14:52, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
> Add symbol size for kallsyms symbols that can change size so that sizes
> can be determined easily without having to manually calculate them
> when inspecting the object files (.tmp_vmlinux?.kallsyms.o or
> .tmp_vmlinux?). Without, the assembler records the symbol size as 0.
>
> This is primarily useful as a debugging aid in case of linker errors as
> part of link-vmlinux.sh, and because symbol size doesn't have to align
> with the offset to the next symbol due to padding/alignment.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Thanks for your patch, which is now commit d6bf11a7e8a86135 ("kallsyms:
add symbol size for kallsyms symbols that can change size") upstream.

FTR, this commit has a huge impact on kernel size, according to
bloat-o-meter:

    $ bloat-o-meter vmlinux.{old,}
    add/remove: 4/0 grow/shrink: 0/0 up/down: 440264/0 (440264)
    Function                                     old     new   delta
    kallsyms_names                                 -  324543 +324543
    kallsyms_offsets                               -  114424 +114424
    kallsyms_token_table                           -     849    +849
    kallsyms_markers                               -     448    +448
    Total: Before=3D5085496, After=3D5525760, chg +8.66%

However, this seems to be totally bogus, and thus a false-positive:

    $ size vmlinux.{old,}
       text   data    bss    dec    hex filename
    4520823 1507876 154960 6183659 5e5aeb /tmp/vmlinux.old
    4520823 1507876 154960 6183659 5e5aeb /tmp/vmlinux
    $ ls -l vmlinux.{old,}
    -rwxrwxr-x 1 geert geert 7922796 aug 24 14:18 /tmp/vmlinux.old*
    -rwxrwxr-x 1 geert geert 7922796 aug 24 14:19 /tmp/vmlinux*

I also see no change in memory consumption after boot-up, so everything
is good...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
