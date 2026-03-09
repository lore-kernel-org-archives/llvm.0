Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A23C3BE1
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079412; cv=pass; b=Eg6j2fg6t1jPHnZ2QYkUAztvw85uXg/xol86b4W3b1In71nmSuTR/Iq0kDNo2M8TUn2wQfJvxINWozRa/SLqXz0+0KcOT2Jj/wmdzrAieLtFxpKgZ0K2RVtHVisrAHv7h4lkByFYHaaA9LiSEPCCEjyUWU+9it5zY2FzfE1d0/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079412; c=relaxed/simple;
	bh=Jmh6F1HA1/DHwO4+8wWz0TgE1rMuRLMuCBybYeE2lhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpEu9VDEngzHWpJJ44K+8kWAw5CZv3MvjttHbbEtBc8KeR3jjoa8mTYaLxgOhike3Tl7imODV4PQDzO9NkKzSznaQ1uh9ydA/ZT6JdEGEUJ5aXvbMtQRfRR3bEG3TW6UUTRKMBQEnIzScr30hiQO6Qgb2GklKnY2YEWqjW9rZew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HP3P2Zk6; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HP3P2Zk6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae523d54d2so15355ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 11:03:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079411; cv=none;
        d=google.com; s=arc-20240605;
        b=gU5lDwn0Z15I9yXiz5Fty0MqaRo7f5t1aeSjacFHzZbersqh2GJG4J/5OsaYqCbrGP
         z9bltnm/39T34dCv3wZd7Mc/3MzZD1bB5gpqF2cqxEgsrg0S/0R9GR25bO3/ZeLVhtN+
         S5RJNZb35Wo+vs+yVtecqA89RcNev6BP4b8KiAhm+eIXLDJR78WKvM3q3pRkNDdF36vS
         WQcJGz2+GFeV1LPW2iNPKdifLEAg7nFfBLwnlaT92rVScaqT1izQlZh2TakHQtHJLTuI
         b+0iSnHy3ZoVYcFxJBpIwkiKmx8qfjpeeo492dH6zbGjnYWj9MbHS+CL5CKOml+dBH2z
         HwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/2Fq8jDmUYvdwrz/G2ys/Pt5cbewWsQscS8yZEetyac=;
        fh=0COhpELFrKEEqkm6ol4GINRw0tD5BTqz/lHjOyerw6Y=;
        b=EhFLM+6bUPUEXERLrMg99MSsZy45uc+7t+aVidJv1+z10N17kTh5jeqw5u6F6/LiO2
         iVEtpZJXvxkDUIG4luv68rPGyGCEwcsZU1JwnJiyGPidxngVb9mzSBQsrLQuzRhSCkyw
         NzhPkluWTU+d/6Bp/Xsz7P/nQX0s78u2wRYwpIcWpPPYbd8vExPcmdF/j1aVZ/pRd/LO
         PXktbwHachcEMc+2wiB8oqI10+rjiFRgh3sbqcKG7TuiduNUzzEug92TWlrLHBB0VfVz
         16cjdquwu3D8fe7HwLn2TNOHC3CggBXzCO+A7LdyHV2rvoYDUNzufyutR8J1fAP0Y/MO
         SJKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079411; x=1773684211; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2Fq8jDmUYvdwrz/G2ys/Pt5cbewWsQscS8yZEetyac=;
        b=HP3P2Zk6KNE3FfPJhMoZvFdZXvYz4ibnz7ql/s01GE467buEDf8KXiQlHOznUMse6L
         rSUkAJJpRaPaPtMvHZXNYG5IAFMkvD7D0JVypCf0OnHHq5V+0G28+Kil1+cwXk9/R70w
         cLs+coLszFAGqViMOWDHXmX16Lj96fErBA94a+GEFaQSyGgNd8AzM5t/YDd39H5QCutd
         Sb9HB4fUEq34IuesMmQGpoXB5xIA5zY5EUYWlBVoZRkrho46/mFbOSLo0xPxomM2GDlR
         0vNjTwN/HlHjHPkiqiNvwpJVrdpe1AKMoyuca71v8VwLbnec1Ftty9GKt7/Jt5/Fpwv9
         kKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079411; x=1773684211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2Fq8jDmUYvdwrz/G2ys/Pt5cbewWsQscS8yZEetyac=;
        b=DkSGymhtNO71wf+Ix5g7WSqQIXJSNBXIQUXILuKUnDdFN0IQdjb/DRHPUR5cuQI2J6
         YrdixCTaWohxuqDY5SItF3NjwQ/A3Yp+0RPucZ/xmueXoXNPKLHg/6g4PnYKmCl2vGQH
         sCN8PGwNnJtq/ExwwX/JMsJbHMIFUjN9Ri3r1J5lvlNj7Wl/ul3IjWO8E6c5AEaG/EpY
         KRwu89+S7TxRJh6HgXnNSfxnp0QFpGCc1//E6dElT9xxOJrtp+iguluOBwX0p/LqJYue
         9beyhK02nl+C6T+q+2xSA9yTpjet/2cxpbtMsJeZ9mIJW7wv/RqruQ/dgXh0Yiqm6O8s
         6JWg==
X-Forwarded-Encrypted: i=1; AJvYcCUXdzVirYRCfTSYcLTDANR7Aqagac3zNGXHxjG0jr8gYW0KF2rLrDcp5NVykn4SiHma1bCt@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn5gslqkCVIFB273vFEMQaQMsqSmPn1QBiXjVYT7TVmx0B8hG7
	4ibrWM4UMnxaIC0Pe6eT7K9jQs/n6qB5UgQDiuouoqdzUzeLCGyW6C8Sppy6sm8Qi/uhrxsttWK
	3Wzk9u3qYhkgxAdoMLArOvhj7rMjdmQvRtvhAty9a
X-Gm-Gg: ATEYQzzmmZRb2YFxKNWtM2dg4wevalYKQiBhhXXECbLS5ws1bTQtXVIbFpggJYUmYOx
	BP/d/T0xGBpeXsL0dLel14B6pA1SO2K/VjxFw3mD8R4N/4QL+kEHayXft0EJ0y7Qdr8X4znF/Ul
	y9XjGPyROXHA3hZf4iJ3/EwCCIPCyQ+kRBxovrzuRCRW0ESNjPMsy6NajFH9F32qbx+bWjoJECY
	dyJgH7+vQnaL0u5XhF9f05bar3bTEP1bAlBOOtvm+oNsSTOzrMqr+80kZD+5IR2cOxC2VgQnOsa
	wfb8JnVLw1Cb+1/1QjmVNEEKyly3rV7QTcQ=
X-Received: by 2002:a17:902:f546:b0:2ae:575f:3755 with SMTP id
 d9443c01a7336-2aea30d24bamr264685ad.20.1773079410195; Mon, 09 Mar 2026
 11:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-23-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-23-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:03:18 -0700
X-Gm-Features: AaiRm51m4nYl0m8tFtQlOB_PU4q1W2JI6UKS4mgMHQi7Hrouc_6G7mzkDrAVHLM
Message-ID: <CAP-5=fWzFtZbXK4DrUOCFBtD9e2_e3BG3Em8O84C=Zhfjyf5nA@mail.gmail.com>
Subject: Re: [PATCH v3 23/30] tools: spi: Append extra cflags
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Len Brown <lenb@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 9:49=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/spi/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/spi/Makefile b/tools/spi/Makefile
> index 7fccd245a53515ab019529c8e5e91a044eaaa68b..1e3b3f91634cc2561c434c02f=
812942fa881685f 100644
> --- a/tools/spi/Makefile
> +++ b/tools/spi/Makefile
> @@ -12,6 +12,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  ALL_TARGETS :=3D spidev_test spidev_fdx
>
> --
> 2.34.1
>
