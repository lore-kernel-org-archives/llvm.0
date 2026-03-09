Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD983ED11D
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079034; cv=pass; b=lI+Vs+8oBRMcjOeSWNRN/yCdqQGFPW4zLnOQ9o4NjrGx0dmj5zuWizu/XR9env/ixR6j7xBueT+qpHvBj3qR0nF3L7sgMGgBIqK1YIkZWV+YWhiANfNw+PpZxCiUx+ZPo5ksHGvkZAkoZpi3vokK/DBoV+HKBy3T7K5EDkPFkFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079034; c=relaxed/simple;
	bh=e7l4SmZBUR6r5igqEW+38ztoAKGAhS0X/5S8zKQD+s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPK2IqLfZOfbwbTsy81Frf/OLY9C+uH8eKikum3HICnwNE0/jvfQrJErWh5SK3Babr/cfgG/57dqRvOpYRACI5la3yQKOVmmwm3jymG1uAGQBTuMoN/LPrDvcC18hkITPnuWKPSA5g9P+/wf2v2ElIUlKyJye+ieWGy1iYAKCEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vg0KBBFp; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vg0KBBFp"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae4b40999bso14305ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079030; cv=none;
        d=google.com; s=arc-20240605;
        b=cFAS7F3AcvMitJENgncz4lhX9rs9yGgmAh6T8eJRUkGSM2GsE5/snZvCFIwdl9xZQY
         WPCDPtNweJLBOgkAHtAzg52c6VMgZPBcgrrhQsEjNMJhRHYRQkgbaJ0n9HeB3ahhSboQ
         FtTMG4rMYOgxd4+DrGjb6SgN95J0zJ6wjWZvv43Q26ADwfnBn2T307ji5QDnhIln4LmW
         4fDz+CtOsz4PoP97FLv3WknzY3amaWraoX506Zfr4sTND4Nl4X1136s8O9SsSRyyqKT/
         OJt5kmHEd1A3fQMbAwxZGPQ9WT94kC9Wq/3L9y5M72xA3jOFH6yfvEcd5NuJmNJHb4UF
         yTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YgaFfLtD6LpB7+GDppuc9zjZm5c30kugkl39n1WKFb8=;
        fh=5pFYB3Mzk4kNgML+qkKLr5GqXbCMAkKgyRToM/yyWV0=;
        b=Q1W1eCbPYAR6NQQKIjllhJLQ/fFsQEzaKvJXx2cWrMArYe+PdIDKLCgCCkrTQLpY5y
         6DT5/SLmdqlGKZ/4aTSw0Xm7trKyJr5n8mSStCuRpoOdNiQVgf/UUlDzI/S55quXEYBW
         oUlvu/t4S3/a2GzCkKXa0J0h2zEP6JyM8X7fq+A2T7yMfufzwAVIRRk2OepKMkHg1csp
         XoaLCFTELUxodrSEeC7WVQdEm8F3dOqVQxizwfFCzQefAP+Q5PnkS42ncj3o9v8FqElv
         xFJ7rrinlA241AAXqAIzMvMLGCVhjkVSYdEpQJS53vZc5Zp07VegmoWEagCsQ7kt39zl
         EUDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079030; x=1773683830; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgaFfLtD6LpB7+GDppuc9zjZm5c30kugkl39n1WKFb8=;
        b=vg0KBBFpOhQ18o/CFr2yovi7s7u9KjOl4W493OJG/GoZVINgM0whNljzmlG5sTo3mq
         QhzET7XxAp4k4ZgAqQqbAIQ1bmpUHdwHLBEudX69etgOu9jgug68Z2sRgA/0W7Kwy+ZR
         w1+Ala2ms8YWDdh2y8FEhUQzonsCL0DiEl3G088QkEEjpaLyoL/ejz8zx6jjDCaRp/Ek
         BLwiF79IXWwjgpDDJn8DwJv3UFYZEDRt3rj4ugSNLnb8MfkiAB71zBcLZEULlRAdJU5Q
         4xBtq1bggAEReiyIOp8khw+VEwd7NhE7HrrFy2ldx6SltOhAEFPtMtwdsvVjWSl53v09
         bIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079030; x=1773683830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgaFfLtD6LpB7+GDppuc9zjZm5c30kugkl39n1WKFb8=;
        b=eG8vylAbvSFrZxFU84MuvZOIwaT7kWnM494mRXV9X0x1F+ms+XpsplBsyP6p1kpoqn
         OF4iDwfaa2vM+Ww69qwoz8H/5r7xgvOoh5IayhCyYYVSXXUiTX7yh1F+7RLqLyaj0F23
         DZMDgYeio5t1Jr4Gm7eXsL6JSaO8SExvU/YkydLxZOm4IHMlXJD89eKHayKeUr/KWf0s
         SKCigRaEszp0tqVkSf6Z5HsPtKhcH2oOVFUyajczq7+lLCJMVsReFYMwWJkkYz80/sZT
         Rh+yWds3c3hg0DM+gZ6GXwlSnK9T83eK8iq7bz9YDDomcAU8NcJ7SjLYmcUuQpokNK2D
         o0ag==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5pqdn51JheBh90iwLMw5qdTvt2vgla5JENKM9oPvLYl2I3khN3Ow7P6AeZGbru+1Svgn@lists.linux.dev
X-Gm-Message-State: AOJu0Yydg01QpYEYqithncFOH7/wPYYmXLYTSlCKJnmFS47ocWM5ltij
	y+3r73lypYyUqSpjfV879fEq44xsElio00OFB9Rd3G0AD7jB/jrImFSjFeWzV36fsbF08Zu5vmP
	7p7wbwR9OEdOCVjrCG5DS54V68GZ8wX5MeeNYBXj+
X-Gm-Gg: ATEYQzxT3uqKT5RtjkVppPfBQzil5dGQz0THxWNhpm4sJ2GyQyAiSiVNT1jf9gQY3eY
	Vzgjm5dITcu2MwZkT0QQc43Ft5BSfeE4DZL8477qByjPW1nvT5iLXhE7Kj7s2MftgPQruSKxgPR
	8cMh6sAuWIPsP2WgxP+v/Kfp92V0tGgvQw92kGOqEnL/Jgo/wZpqhlNZRU2A7Yg4DQqxmAr5uUR
	agvjeJzzVphz19JNx9lN7vMCjELSkHfq9sRSUMf/IDa8BYdyF3Znn/UShjUPYE26vqopDhhCR4A
	JdJHOvlbuKqIqADxGP8nSTV95eRt/aIsLw0=
X-Received: by 2002:a17:902:f68c:b0:2a7:6fd3:c11e with SMTP id
 d9443c01a7336-2aea30c63dbmr244475ad.18.1773079029518; Mon, 09 Mar 2026
 10:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-13-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-13-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:56:57 -0700
X-Gm-Features: AaiRm513FrreYhP9xkA-LN0GZhrOTdf4osjECxyH4jBzskTrYRD5OF8a_TvuwzA
Message-ID: <CAP-5=fWkVHaa417c=1kzq7s=qrsHHDyKn9K1G+BbX7TrzaXZLw@mail.gmail.com>
Subject: Re: [PATCH v3 13/30] tools: dma: Append extra cflags
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

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/dma/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/dma/Makefile b/tools/dma/Makefile
> index e4abf37bf020ca613b6dca340299198cb887126a..bdca05c69a8a12a4f9419eed8=
c1df71adac4f26d 100644
> --- a/tools/dma/Makefile
> +++ b/tools/dma/Makefile
> @@ -16,6 +16,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  ALL_TARGETS :=3D dma_map_benchmark
>
> --
> 2.34.1
>
