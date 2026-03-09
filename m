Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECE3ED131
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079337; cv=pass; b=TkJAt42EGJ1Afv8DmOdRqZKmmbO58ud4WNyQ0R6+SWOITp5Zpq3jYyecOirI9ixVdOIwD3bP8wCM5yFvWrJH2hvupjXjbBcuSK71FCQck+ioQIThtZJF09qaoos6r3Y2ZRy0k2+Zq6Y1WdsRgYplP5kIlNji9A9Jx3Uupv7Wzus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079337; c=relaxed/simple;
	bh=sXd2n3r58atsTHalU8kH+eYu9sbWGdifgWknmudkZ24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JW2JsuMG0RuKL3u+ts35wF/UhU4F+TDCzEvN4ceGljTNpSl/VGOcmoeGpbVAKkc4tMg2T389i2rq4upeJjsrIP0U/ayrCdksKIVBCIQmXLs4Etjz5gubbtj0uT9/ihr1d2ZGSVc8mewCopR3/yx/GFVJjmTnm4aKroC0VhkSOnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BiK32XXe; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BiK32XXe"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae523d54d2so14965ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 11:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079335; cv=none;
        d=google.com; s=arc-20240605;
        b=bMQHmq25zqAvxO0Mn/gCmsQKtOms+0QoDFT2nrgjxYt7CywmfbGQVOF250/DBKH2R1
         qJFY/Ncs47TXg3EJGuZM51GVZ8v+pALz4DLMwa+uzIcnJ1YL9p3QP9vR+dlzUEXFN8r4
         KaF+DhYozAYq2a6szHJhSqlDhK6mOSC3OyR3yEFBPlCvH8pn2q78RoqL9yfKRMY782kZ
         ZL2Sdp2/WQfbX1nAqaoYGs+7AK7vnnZk4yAKoDm59PMzAdsMj6xPV/77BZLE5kJTELLX
         wEek7wDRsmv7tu+di0gBNxBBOEIoh40yik/DJ5G0R+4gFG21EGZydWj3VYPTJT8xjwRn
         GcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LJscPu/LCmEc0GMnCIHYIEIVJSUttXk0NscrVDqh4U=;
        fh=t8kqghyS8u+LkGIs+SaVEw8ysB2VCx89sz560i1SHvs=;
        b=iwB8PHtSgqQb07xDK9x08cHDQ5HOWmM0BFlhjQb7UflVI9F15nYnqmB5PlBLkHS2CY
         2S+TkDNjQx0zAXHURYhIEMjZa1nJmGYa0A2r8IFKMUXm0D2+BFS+Sn4bjdCXLiFN3KqC
         9Hbjo0grWQd7xxSNTAOSvRhCCfI1Q+R71EWTPGDaPdHuWPdkjdMJPl6BXd3qQSOM962+
         EbxdMaMXXP5PpLfkiRcB9kMbs15FYMhM7dt8Rm52Gpp5j6hHeJuMEVVy696GlPy984K/
         OHyaCyDakC7JWMo8RR3ZkgilDlcNsJs+j6KRpCyt678r8sK8wi9kLhQsJyJxFFnkLCLP
         59Ow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079335; x=1773684135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LJscPu/LCmEc0GMnCIHYIEIVJSUttXk0NscrVDqh4U=;
        b=BiK32XXex92AMPhCFrxsBTOJLHz8mSSgnt0jlwIU0DYEIuuGn7vEt2WSBEAU0370Ml
         2S92VnX0THKoo4Xg6bL0KoL+HObaDVNFBVfXctW70Rz7jrSDFfULUfhZTQPaIf0Zukiu
         qCSDOaJdrxtUGDJOJwBdZgDQGiuXSqV+syelkr6s0m74S/Zr/9H1pc7aDyKEVplCQELp
         Pp2/3QOmQTLy0h4FZPyv2cvLJkZaDry2obtynPccCr5wpVZNX/TMv6QVJP4GFG4QFNXU
         H2Kqt2gEOKaarZG2ibxiE5hatYHe9bJ5irQBIpsxOLXf7FB3YpGLLsnYPsYGjYmZVScd
         veVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079335; x=1773684135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LJscPu/LCmEc0GMnCIHYIEIVJSUttXk0NscrVDqh4U=;
        b=BnKhoiZxE1WjKHzttxfiTvtl7EXQAeOWntpDBIXj7E9VF3FICTZZPu3c7cY2d7y3/5
         VrgxGu7HELw7t50/O0VXkbclvAlOjcIK1TipNguY2OgWG19SgjZKNx7WUOXgptyWqqlU
         qzMk2cKY/du5iWFOiyijfN7DL/HlFM83TJEGK93ri6OFaYLzwGP50cO7sQ9TNIc6C7ow
         gOomWjXLGHzvxQT21vbCnMtaAdlpUNtb+H4QVeWdbuNk/oJOFvlNo3BPtzGyCPL85ohz
         bGH2h1/j+PvRaIYG1RnyC0gPGLv2vO9XfRhF/HAxBWraaqWgnaOw1tzIoLl64hSG5itA
         4Qbg==
X-Forwarded-Encrypted: i=1; AJvYcCXrQJ6nQEqVVobohh1jSs7ht+vhzH2hQ378zB0T66u7KYO9apppHoPyjhvcScVMbK6eC6DK@lists.linux.dev
X-Gm-Message-State: AOJu0YxTFka8Tw64zLkl1eF8cTnKEOGWF0K9kls/u+BM3wJlxc6zr7y1
	BlU7Qf9orBgYuYaj7bfo4Cb0tKnbjyoF481zkMT50fDS5g6E+0es99cQdUbR2RrOTjyBhT7LOtd
	mZJaROMJFeMlYx+dI38gRpasJLtqTownucWoCJT8f
X-Gm-Gg: ATEYQzzK7VkfzBf+FCuDwZ6Bl1KyIRkBDoyT0occBxm/RZdfERvlGYlQqTx3gAFPUa4
	S+ZI6ReIhSly6KQVD7OVwF1aKbN/cW6s1kfHCo7VlKbZFcW5pal98fUXu+eBWwlGNk7g81+N4xS
	o1C/60kQ7V4aJHaBILA+j2efc+AVvCq53u9GOQ4XlC6SnACxhcTqazQpqjsUOjeGle7lbYJ8q3M
	VJklWnnKVatuxxKKWumti1CdZFqMrdF/o4LBqGjXnpdeLZBq6JW/2LU3GPUlCDAGKz2DruueDox
	fazcn72YZHe6l1Kgwce32f06CEtXL5UpiI0/B1E345uf2w==
X-Received: by 2002:a17:903:18d:b0:2a8:fe50:2933 with SMTP id
 d9443c01a7336-2aea2f2bc3amr316945ad.0.1773079334115; Mon, 09 Mar 2026
 11:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-21-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-21-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:02:03 -0700
X-Gm-Features: AaiRm53eNfFq2R6M6Fsx3M04tNIq8R1bV70kYSKB5eTnuoUy08rbJqrR2yINWgQ
Message-ID: <CAP-5=fUkk6vDQQYJoRbGaA2zc9pZds9xHtoFOvQvO8q_D8ahAg@mail.gmail.com>
Subject: Re: [PATCH v3 21/30] tools: power: x86/intel-speed-select: Append
 extra cflags
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
>  tools/power/x86/intel-speed-select/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x8=
6/intel-speed-select/Makefile
> index 6b299aae2ded89c3a70a3649996e258b98001ee7..61d6e81f3cf1d6427addb4f31=
c1369ac663ba3d6 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -19,6 +19,7 @@ ifeq ($(NL3_CFLAGS),)
>  NL3_CFLAGS =3D -I/usr/include/libnl3
>  endif
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include $(NL3=
_CFLAGS)

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  override LDFLAGS +=3D -lnl-genl-3 -lnl-3
>
>
> --
> 2.34.1
>
