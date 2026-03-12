Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A5221F0C
	for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 00:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773275398; cv=pass; b=C2qIVkLOsWdkdRPTzwvBLccv+PIWAq9Ys3d9jY6KGrwMq/eEJAsnAAiVeXgLTHxYOnjJBX3G02zgxfELUCl9Hl+FUVvuJnE1KZMjAfvmkLhBRWhaNtDV/kkWKi2Z56OxzdhgUZTDsuN0P3Yu2veDm4WWJWDZktG2YLG068xebh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773275398; c=relaxed/simple;
	bh=YcypzZhNU7pNSG3Co3XkiZS4WRLodx1GYdn6Od+L76g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdtse+GbpG2KWsjipITkiKQPAYH6VcK/MwXrBYJjz8g/zqw3al0Vpaj5SWFHIiNKUFP260bX7XRhLTLS4XT9lm/GnHnz3qszT7MYt2+Khf/p7dm6Pfy20ufwdR9/JsFnT22td+Nr2VR8gCmoE1RnCM8cFLEtCrs1Ri8XeNB8JqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xAVxXkpa; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xAVxXkpa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae49120e97so37695ad.0
        for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 17:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773275396; cv=none;
        d=google.com; s=arc-20240605;
        b=HaltSoS7qge3HE0CyaEnQAXkP4p9FCDqoBesvzO+ji3YJliTOszkUixTcKLx2J3iJh
         MdqIXJIoVRTciXMHpq0eTnoTPHhvHoR6JchtPVN17Ko5NvjfgPIPTLm+p5ujvgQ1lWL0
         MYAyymdpL+u6slwEM2045do+Fo5PK7Tyx5RVGRSP5LASg3iTXpEE2e2Gc9pY7ujv+0k7
         MieT+Ev6ftCyvQMNCSmcq+r8prLf9Hq9kIvfO7d5rZQOlJEiERkuhoOL5qs63yK5KlAD
         ptVSSj/Xb5CClWZcLzubzaVvWPQK7eixqjla0AFKTrz/Mch95AUHS8865yYiHH+yMP5K
         dGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1PC+/wr2syCqvxGBoZe6+L+D9Kxcq5YGZvRoBAu0gk4=;
        fh=a4MJ3YUF5J6caGPn2Mreuo5ZuH+7uyGR1lU+Ds+CfJU=;
        b=XgyjkYR6Vt0XmqPa/zSLv36g376hF8SlQQbDusyxwAwM8x5y21OwyNLWBk84PFtdXn
         kBRKIVqwO0w4Sj3doAG+sbGy5+DqEKji7D2JyD2Y2jli4U1OwugYxADrt7XndJcuuXMr
         2tZuHgtFtQZrMXN0c/gNQifJ57kmV3l0FNj3FcCSTp8BYR/6kRTi/PUIjz8wtSweXoQB
         quvYPe60HegvFGGccrwc0bfzPX1D5hnu9bE17zweoNsz/3LBG3tImGCCZw8//kznguRH
         sC4szmBv8ywOOJ5M3BaMQE2Kfrk1qvxrAVxVYB88b7OT4i9JV2yxLtavsntz4TFqpHEQ
         syjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773275396; x=1773880196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PC+/wr2syCqvxGBoZe6+L+D9Kxcq5YGZvRoBAu0gk4=;
        b=xAVxXkpaQAjr1T/Yl3Kd1IF8RPK62tuW9mUr3BmGeNV2iSlFmeG2nhQWmHjeLo8LL0
         f+uQjp9XuVKhm9dEgm87To6UUwYB6O1r56q7oJJUvB1wsj/Li89m6UNngROuZkbMyYwd
         3DelA4mBSIJeG/Luoikc6WwZ7hpru1dljKfwNXo84IpP6i/P4cnblAaYRwCL1uGLCp4g
         ngv04HPldqBReOTm4Krntcpb26QNmVBqMN5drUNX3cbCEI7xbmcBFkXaepklyiVLjr7+
         bd+MEsbcPyqdSEhb9JvaTbh/ZzjM32OQn+vPBhbMk2EyFOGZdFlfmvBOpj0oNrMYrtMF
         TpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773275396; x=1773880196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PC+/wr2syCqvxGBoZe6+L+D9Kxcq5YGZvRoBAu0gk4=;
        b=tFCSlD6HEWiq5x7Jrnj+q1QJPzYEQfd1DcJ1tV2EAJz52iOmUM7aNSY7MQI80xVC+1
         U7fsuyq7cp6qrdY8/qpbyL/rajbsgqjfCT5SE5mEtfnfNjXgnj6NGUCWgr/f7UsgMTGt
         wbTRvS1MkQ+/HD3PqlR7EyvFn6JvkQL6SNVHznpPcf1euvbL98R86Q0K2M/GyfqE1yTB
         wRKa0PrvWGbvNBhW3s/vTGt43FU7iUT79oJWKU+M3skyGUlN1YexKaRIdlAW2Dhwetkp
         OwEs4lIUKQZ1EwJmx8lER7IC341jk7WSEaBYV5Ni1YZXVG9JrJqe880BCKtM62y2qWyf
         1/vA==
X-Forwarded-Encrypted: i=1; AJvYcCULmTjPtvT58Es549mnMHWrU+XRL0VPFQgraw8/08hpaC2pqkO4hvxfWR0Wk+VWpQ4/UBEX@lists.linux.dev
X-Gm-Message-State: AOJu0YxWxNMy7gJnLkRgCUb3Db1E+mbCWjEOMrRhYDHlgEb+fK8k2eNX
	SUjPakxuemJRAy66db8ltfSy9GoGPnJqIKHdrdnjqs6V8qDkFNc7lBLoMTP6vHIcguO7+ONJQo/
	ka3kbyn7PU1epe/+IfIx0GCXejAlJnY477BY6rVki
X-Gm-Gg: ATEYQzyfhVU2z0YeETShKy1GlSqt1IBtekb/+fWQckq8vJx0rvHOFKqqthXBun730SM
	TqHu4bfoRR8ujSl8oMP+L1S6C9glYMIzg3MyRJF8dgBAwjkmXkfgq1jOydPD8Fp+U4hoj6GJt5h
	IVAHjoqPqrMDFog5YDgKjQkfgQwhiPhFGtmi8+HWqAe1LL1JjjeH5gbg0pBRRdX61xPotixVKWk
	wfKI7isajalIiR4CRJtjjlZHJl5s820Siq65UvfQSr+LyNlEI8w4A5wXYeo//Q3u2dtl8n+V5dQ
	BmgBkOBAV50ry2B5TeUqDJHSMevetBWpZf0IzoWucpHNJW4=
X-Received: by 2002:a17:903:3c67:b0:2ae:80a3:98a9 with SMTP id
 d9443c01a7336-2aebd197d2bmr962485ad.11.1773275395866; Wed, 11 Mar 2026
 17:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com> <20260311-tools_build_fix_zero_init-v4-12-9e35bdb99cb3@arm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-12-9e35bdb99cb3@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 11 Mar 2026 17:29:44 -0700
X-Gm-Features: AaiRm51j9bOAiNXwV4INuHof8fl1AJbNKlxnNgZFr0pcoAP2BOsfzP0vifju5JA
Message-ID: <CAP-5=fUsOzjCAOEyJF1cwDbfjSHi=TKjWd1kL6tWWvLu19CFkA@mail.gmail.com>
Subject: Re: [PATCH v4 12/30] tools build: Append extra host cflags
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

On Wed, Mar 11, 2026 at 1:31=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append HOST_EXTRACFLAGS to HOSTCFLAGS so that additional flags can be
> applied to the host compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/build/Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/build/Makefile b/tools/build/Makefile
> index 3a5a3808ab2a1dedd40f35ea322913e8a0788130..a86ce3d99e2bb1c005942d9c3=
2191e6eaa55cf50 100644
> --- a/tools/build/Makefile
> +++ b/tools/build/Makefile
> @@ -40,14 +40,16 @@ endif
>  FIXDEP         :=3D $(OUTPUT)fixdep
>  FIXDEP_IN      :=3D $(OUTPUT)fixdep-in.o
>
> +HOSTCFLAGS     :=3D $(HOST_EXTRACFLAGS) $(KBUILD_HOSTCFLAGS)


Hi Leo, should HOST_EXTRACFLAGS appear after KBUILD_HOSTCFLAGS here?
This allows the extra flags to override the build system's flags.

Thanks,
Ian

>
> +
>  # To track fixdep's dependencies properly, fixdep needs to run on itself=
.
>  # Build it twice the first time.
>  $(FIXDEP_IN): FORCE
>         $(Q)if [ ! -f $(FIXDEP) ]; then                                  =
       \
> -               $(MAKE) $(build)=3Dfixdep HOSTCFLAGS=3D"$(KBUILD_HOSTCFLA=
GS)";      \
> +               $(MAKE) $(build)=3Dfixdep HOSTCFLAGS=3D"$(HOSTCFLAGS)";  =
           \
>                 rm -f $(FIXDEP).o;                                       =
       \
>         fi
> -       $(Q)$(MAKE) $(build)=3Dfixdep HOSTCFLAGS=3D"$(KBUILD_HOSTCFLAGS)"
> +       $(Q)$(MAKE) $(build)=3Dfixdep HOSTCFLAGS=3D"$(HOSTCFLAGS)"
>
>
>  $(FIXDEP): $(FIXDEP_IN)
>
> --
> 2.34.1
>
