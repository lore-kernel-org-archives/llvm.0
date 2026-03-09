Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEB019C566
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079376; cv=pass; b=ptMvqBLNWBN0Hu9/NQEfxQna0g+fGYwEbh3rRc7JPSaYNrRawltCUAk5QWgJpom3TP8+Dx7WqZHg+kU2eJzK5ruvtibL7Mp0x6KHiUNWzJ8xP6JSYI+fht8zuL5KrgE9GQP4VHHPK+My6CvzUWr7UBSd8ExnK+SUwPOUDjalux4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079376; c=relaxed/simple;
	bh=enJJBtiy6q9G9zGlhNtJO7VBcncRme179U9y2TQsR+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGlhJPY8ZOyRGWkjyyk+2Ts7wOVZ8gB/bsE3Eb/WUrRytu0/WXD7rpRPB4BBjApfP6gGsg8pj4BeOMHZf8mJrG7Q6/VUbrTSoba5Ae/oHpYA1FSKECc2bK2IXSDcuYQNwBZwPV1ddB36toNwOS75aiy8J2YDMIuwoAXoBUw1j8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qy9Vd8Du; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qy9Vd8Du"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ae3f822163so13835ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 11:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079374; cv=none;
        d=google.com; s=arc-20240605;
        b=SzjWWoJ1CUfFkEn4dpEFjm8oO0vfk3u3zy5s4TeqU1xOL49nLrJnb3FSvzGF0yLspK
         dGqczqDbWc14Lk6Kdk7XP0wVqZrS430mTFqAowB0K2kci5kx2rktc++hS5JCbIN9AQox
         EDeSn/TuDL6ZBvKrrdI3gnR4zQ20lXeR8uSnCK/SLXDieD8iVYwJJZ2AXMZ/Ke30eqoU
         1XuY3H4BNcKS3BXp1mUJqUw2/NOPbiQt1l3KfCJxprl0jSjxwBg9mgL0TEuC2hYJCnA1
         ydnC2q1Z6joofmgNFdhtH8oAO6L/iaqoVdsrEa4KKaoq8w+yQRIprYDiYmR8IpGauB52
         j/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0DTQx0tSE71UMF6lY+qr4IIE8EQg8d4wRW0tM3/p9E4=;
        fh=Bh6Wv9vLRc+J4QmWbfYue/J5JgPMBSK/jlkCDFEAQBU=;
        b=j2SbbCeDDu84hPMsGaC7oZU0ir0wtyuHuiPisIDU1RgEF18QNGdLxtYFzxgWfIU+WC
         ZjEsYNg9RdJEhvlxLdjUDzIsFGF/sK+amTkHsLipfBFSHisUbo58a+AYGB2YLR7zj2S/
         lYKhQDjyw0MP+YoNuwm/c1OqxI15cpYM1lEsF3Ck4RRuT6r2AhtXc54iTclbOmDH8zx5
         ITc4qTovvhSfcFvc3dUQwb1HKNV3i73TGWSbrY+s50qqsZzRVg1GB61RC3t4S8KhxpTl
         8U7VwxxnGQlbq1Nqp6FO7C7iw4OHdOJTQ1hd07k72lVzG5+x2vOiblLbTjAH6xB+aLB/
         TzYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079374; x=1773684174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DTQx0tSE71UMF6lY+qr4IIE8EQg8d4wRW0tM3/p9E4=;
        b=qy9Vd8DuH9Ff8hBI2QFVOQ/v9msaEcT9QrsL+cyVjeARrLtMlTvB3enb1YRn2W0MOk
         vWueXvDYIEPfAeCR9TReLHJN/9SymcAsovJ0l+oGr7DurtjOYJpailSTYxpHNDUUyDEy
         EHpDkoFw7rVqMfkGVqpu+ROHvLXiwriv9Gh0w2EbGaqLoUkuNCLHJGfC7DGnNF/03ufl
         aC/UHzFprtw6JtmzNPCnqU3d2NEIN3UKZV+ukw1RWxlRySvttqsNYegQbnZbb85YuBNh
         sfjmYGCW/nHtDrM1cjU2wuuispIv4EoUz8tQ8eETA4+r1NGn65RpAy7OnHKWhv/s4/Ua
         w5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079374; x=1773684174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DTQx0tSE71UMF6lY+qr4IIE8EQg8d4wRW0tM3/p9E4=;
        b=D4dn5arKtbQVFXwgIP4TH/ajE+mv1rPs+adyDdeO1TFQd+xOI0tEtL68dzPeJfW6UQ
         ytrMYnRiJqE7goQMpKW5YIKikl+sgR9+puAdEnvygTYdHU3hj0wIlKCav9AWT/XmPUaA
         gbLw1Uaw6WW3+6v8JCAdwSx3tIDdpjzrKSTGOlrJ07RDcPgb3skvHWrK2dN/E8C2dhdk
         iVDC07qsfiwdh9BdErtAfG3wxiZiJYNfXT6BA4+/4OeZDUfk0MG9ZKlNob/Ly6vH8/5U
         u4t6gvSZ3iKZaB0ad6A4eDYOfTy2UEf6Wc2OLiV9HcE2LNdxWh1VTXvmxA1R4Gt8vrbs
         nTpg==
X-Forwarded-Encrypted: i=1; AJvYcCXpRxZkfRPOUZYNToBpNfkcqySS4L8zu910ISe6m9/G6lhrPgQu1pyGolnrAQSyNujOTx6s@lists.linux.dev
X-Gm-Message-State: AOJu0YzddXa+Cj4tBPBMSkGKquYCZsGQULFv6W0c2zn/N3w9l59JUoNb
	cr8hRKfDmKSK+4tiwDjvjG+TZlQfAydjz5KX5tusmA2Z7t6TKyRaxq935ctT8yt4BOgppikNd4H
	nTH4bdudU05xHryp5bvTwWruoLuTUBdGc7cvsqIjU
X-Gm-Gg: ATEYQzxHhW0jXsemP4oRwgYNxyF4SvRjUj0p72iDyvRn/hSotGZs/Vvuiz0/O2Va7r2
	JoLaBRaBzGNgEwKcy8ZS26OPMRmuHrHDbQIVcl7CM5MBrXE3UmxqmEJiqp7Z751OBklZExctI6w
	zEvRZUigaQid/RdzMrBjmcTRqYrTB17j1v/amux95EWWvjU9huR3hqJ+ODH2LgDRLQe1UkLkwVQ
	maW4UT/NYhSXbR6Ci4gCjWq6gclkbW19E7LrpT92v40aq0b1hk8TQavSiixlEiFIt6FSc5Y2ZoX
	FC8vFHbXvrOU9+BbkMeIs9L2zkA173dA1Uy5HnKOOb4W6g==
X-Received: by 2002:a17:902:ecc4:b0:2a7:d266:d84a with SMTP id
 d9443c01a7336-2aea325870fmr266715ad.17.1773079373978; Mon, 09 Mar 2026
 11:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-30-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-30-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:02:40 -0700
X-Gm-Features: AaiRm53fepCChw8O6Lh_i9zc0Lx_aXs0tJ85eByc_82LQ2DVnvOinKgsctHPHWQ
Message-ID: <CAP-5=fW+8BXLMXKyZ6GLUq2it1VTVpCg61qCqpfSMDjHeOJfXw@mail.gmail.com>
Subject: Re: [PATCH v3 30/30] selftests/sched_ext: Append extra cflags
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

On Sun, Mar 8, 2026 at 9:50=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/testing/selftests/sched_ext/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/s=
elftests/sched_ext/Makefile
> index 006300ac6dff88a48104977398d8517753e7e385..81d8f4a184245d8c330cf45b7=
5bd868b2a7aa7dc 100644
> --- a/tools/testing/selftests/sched_ext/Makefile
> +++ b/tools/testing/selftests/sched_ext/Makefile
> @@ -53,6 +53,7 @@ ifneq ($(wildcard $(GENHDR)),)
>    GENFLAGS :=3D -DHAVE_GENHDR
>  endif
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -g -O2 -rdynamic -pthread -Wall -Werror $(GENFLAGS)         =
         \
>           -I$(INCLUDE_DIR) -I$(GENDIR) -I$(LIBDIR)                       =
       \
>           -I$(TOOLSINCDIR) -I$(APIDIR) -I$(CURDIR)/include -I$(SCXTOOLSIN=
CDIR)

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

> --
> 2.34.1
>
