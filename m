Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380E1262FC0
	for <llvm@lists.linux.dev>; Sat,  6 Sep 2025 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179161; cv=none; b=PMrB6Vn0Bh3nfghUJU12CHyCQS4mQ0tUS7ROGqGZzvIQBJzhLi8FbBSoYfd2waZUlFVycIYRy9rfFkCGcxBHIEoyTGHgD+nLmgJ96wgWQKALUpY3GQ32uBIIyVFArya1Oh9mLKMXUVCIEn+7/vh+M9wQJzCP9x9TZVnnCmolt3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179161; c=relaxed/simple;
	bh=zfguvyDucCS5iks785jztxvM3zN9XRvOYcdvF3L4+sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQPj+mGpwL0TRs/g2HVzwqzPZZEKCd8JsIivDy9N03S6Eza5LEpHYGXt82FbcQFOMmFSddesSDW2Av00tnLfgIWHOwskTL1nILJPBdahqd/ycLX9SK4d0vbXoVO99cvewNuj84yT6hV2rKhP98nlP7lJpeFXiEX1r3NDyMbqv58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z33Y0rff; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z33Y0rff"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso2648878f8f.3
        for <llvm@lists.linux.dev>; Sat, 06 Sep 2025 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179157; x=1757783957; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGQShZZAoC8IOCDe971xjsR3B/73MD2B3WQtZ33juWA=;
        b=Z33Y0rffunCgdKtwFIXZg7cpSjBwL1xDwkSym9M/stb2Kqa67G14ukw7pqht7oZhv4
         DeRMtRHaWBRm6BadHdleLhuo4d8EC/O7eVuJJlmwMCKu5ZsSXAF/ECHcl4uAX3Y/RcpJ
         GE9LhUt95dAPKYBgccH2l14CpxRxB8a5O/wdT283/tQ8h1wLQsNjNYHNjylZrk6DbIBV
         Xo/tlL+4asfOU+BhrSp1GIVzTWZcJ5oKYLRAfvqaQltEoVG2UtWnxzadlJfoQgWFkAxL
         Nawh3fnXanYkK6/UKpAaUQdgbHOtDQsZMf1NHqeNQbVd5wlaYMbJ9QZbNDA2feHg9hXe
         K8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179157; x=1757783957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGQShZZAoC8IOCDe971xjsR3B/73MD2B3WQtZ33juWA=;
        b=JR7GgoUEuDQkh/5wu1AKmhh9MLWpjVC9zKrd+PuYWWr6cYs9TEZgDU26NTlEMa9Tip
         QNbOhtbd9zm4/jIAR+lWo8XUMyiREr1A5IopHrkF5nTYe9phg8lwgYFs4pqwYzp/mFKJ
         Wt+3wrbYOpe/1KUu/Qb8IhlhpinWI2EOu/5v14ITO9++aKRHAGLW68H7sV7PEHdqvqS4
         Keovcga62tM1IX4eHGaixF4I8xhszpeDQVpev+48aEJ7o1T5TVMvd6nn4iycIhKIQZkZ
         BqUH/P4cS48ZheP54fuw8ccxF6ISsSlXI6Aoc/RUEHqeFnCYstFJPNo40HuiTxmTq0ak
         twpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/AdKe/1GSDiFHy3eZQk/Uig6lKZ5Dc5RLtFPge2Rl5LQcRJbRcSStSjlFctoZ7Nz6o5N7@lists.linux.dev
X-Gm-Message-State: AOJu0YzRQoEPQkY4aIw+6H+2JzPyCYeLvkpjBRetF8xzz7f7OTuSwZAi
	vy/47H+5nf+begx4Vt01RmUKE5RoZudsh51vCJz1kx+MqFgTstxjxBuEevPmef38EOKVfjBFTMr
	ckaVg8SnQWkgNkB7CNF+fnOSur3Pxl3c=
X-Gm-Gg: ASbGncsOY4MQoKlrX4gVNm12p+KPmuYN472sMjhDrJTltLz/1sTYPhE4b85p0211FYg
	ByWwzQBEkO0wAQsQ9zBSoiqLDPW/BKZ6cd07jz0QLrnmj2BM8PK0StMBeRSdoRx/ctowSaH4dEc
	L1L9xLGqu+9qsdxZI4pJwynaDPhTgasLm84dSa9stw0GG8ubBsxkfDue3cwNSIgQhE8c3lUP54t
	Mlq4eo3
X-Google-Smtp-Source: AGHT+IErSnjHrUW5RGQUyF/9Wa8QYjwwrc6W5yXTtWs4ElwxGoH13iuYCvVuQSTYFX+HU7KvNalf4Pw/e77ySQjVhmM=
X-Received: by 2002:a05:6000:2312:b0:3d3:494b:4e5d with SMTP id
 ffacd0b85a97d-3e629f1faf0mr1903280f8f.0.1757179157138; Sat, 06 Sep 2025
 10:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:19:06 +0200
X-Gm-Features: AS18NWDxFT4623FCGfz8GntFkBjzjskpR65nPPTaISyQJutWsmUOYJwFObV25h0
Message-ID: <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com>
Subject: Re: [PATCH v5 15/19] kasan: x86: Apply multishot to the inline report handler
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 10:30=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> KASAN by default reports only one tag mismatch and based on other
> command line parameters either keeps going or panics. The multishot
> mechanism - enabled either through a command line parameter or by inline
> enable/disable function calls - lifts that restriction and allows an
> infinite number of tag mismatch reports to be shown.
>
> Inline KASAN uses the INT3 instruction to pass metadata to the report
> handling function. Currently the "recover" field in that metadata is
> broken in the compiler layer and causes every inline tag mismatch to
> panic the kernel.
>
> Check the multishot state in the KASAN hook called inside the INT3
> handling function.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Add this patch to the series.
>
>  arch/x86/mm/kasan_inline.c | 3 +++
>  include/linux/kasan.h      | 3 +++
>  mm/kasan/report.c          | 8 +++++++-
>  3 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/mm/kasan_inline.c b/arch/x86/mm/kasan_inline.c
> index 9f85dfd1c38b..f837caf32e6c 100644
> --- a/arch/x86/mm/kasan_inline.c
> +++ b/arch/x86/mm/kasan_inline.c
> @@ -17,6 +17,9 @@ bool kasan_inline_handler(struct pt_regs *regs)
>         if (!kasan_report((void *)addr, size, write, pc))
>                 return false;
>
> +       if (kasan_multi_shot_enabled())
> +               return true;

It's odd this this is required on x86 but not on arm64, see my comment
on the patch that adds kasan_inline_handler().



> +
>         kasan_inline_recover(recover, "Oops - KASAN", regs, metadata, die=
);
>
>         return true;
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 8691ad870f3b..7a2527794549 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -663,7 +663,10 @@ void kasan_non_canonical_hook(unsigned long addr);
>  static inline void kasan_non_canonical_hook(unsigned long addr) { }
>  #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
>
> +bool kasan_multi_shot_enabled(void);
> +
>  #ifdef CONFIG_KASAN_SW_TAGS
> +
>  /*
>   * The instrumentation allows to control whether we can proceed after
>   * a crash was detected. This is done by passing the -recover flag to
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 50d487a0687a..9e830639e1b2 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -121,6 +121,12 @@ static void report_suppress_stop(void)
>  #endif
>  }
>
> +bool kasan_multi_shot_enabled(void)
> +{
> +       return test_bit(KASAN_BIT_MULTI_SHOT, &kasan_flags);
> +}
> +EXPORT_SYMBOL(kasan_multi_shot_enabled);
> +
>  /*
>   * Used to avoid reporting more than one KASAN bug unless kasan_multi_sh=
ot
>   * is enabled. Note that KASAN tests effectively enable kasan_multi_shot
> @@ -128,7 +134,7 @@ static void report_suppress_stop(void)
>   */
>  static bool report_enabled(void)
>  {
> -       if (test_bit(KASAN_BIT_MULTI_SHOT, &kasan_flags))
> +       if (kasan_multi_shot_enabled())
>                 return true;
>         return !test_and_set_bit(KASAN_BIT_REPORTED, &kasan_flags);
>  }
> --
> 2.50.1
>
