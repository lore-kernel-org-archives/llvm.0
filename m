Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3BD356A37
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773037589; cv=none; b=bGPnt/owH9DUMS0gR9JTTfd6Z9rtaZ//oewOqtxGfEWkY0HkoPgJlPd88UQkaTjrjLaetOigs+n++HI+f8fgMOe3eAfCUAN3eD/75z/Exy1SCJ80BBa2MNbyP5JrBqmW2Bb41DBnKXpGbRFUgUhbHXSxgMbf4WJPJKA9dVKlssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773037589; c=relaxed/simple;
	bh=Bi+N+w7t7Q74FJvrZRMyyX7srj+v+2myBqOOLUrKp7c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgd2SdSAjVha0w3a5xxAQtAF+Q7kVqbcaEZNvaFyBySdqYW6eAjj8RqWbWfDZtu4UrXi9J3D2IDBOEol8DntmgOLhHmpS4gCUVkEXPeauxzhbyQzuEgnHHq1YW1kM2SMnMrnezHWJstFDDWdFto7WoH1HTUMN8eq68RGEPo4FkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PVGQt1eS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PVGQt1eS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773037585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Bi+N+w7t7Q74FJvrZRMyyX7srj+v+2myBqOOLUrKp7c=;
	b=PVGQt1eScuH5mVtjGf/LPhHtF8A6ZX1n8l7e6PBkP8J6dMj0n0bZw2SHaklYfDfbf413pR
	hXojWQgUmHR5se5DeM5j+/HS5tdrUv9ENRmmokr8HZs71LgyIfKDSbVadDpjmDtL//37Dy
	mg0shrbapRehRzw9wbfL8Z5jpPWURI8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-7ireez6NNimFErZNGvh4PQ-1; Mon, 09 Mar 2026 02:26:24 -0400
X-MC-Unique: 7ireez6NNimFErZNGvh4PQ-1
X-Mimecast-MFC-AGG-ID: 7ireez6NNimFErZNGvh4PQ_1773037583
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-485397788b3so9642235e9.2
        for <llvm@lists.linux.dev>; Sun, 08 Mar 2026 23:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773037583; x=1773642383;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4wvI2K+mUpk9VdyVw79oHtN2sfcbsUCHhbZBCFsNac=;
        b=YEGc+1+FatWAWUDMpJmHsRbxPUALrmwQc3OHgf955nv3mc51bzMyf2cbacyv7kViBJ
         kkkIoZrff022urNP5MTi8pL8z1/e/i0UT1MY5hZywiGeq+PjPHhfWAfrDk2ItSK8sBV6
         ompnjU29GB/tNdps10nnB0HmDmrj5K0qzstDmcekIe816hCJWHkIOPBpJIzQ2i8RvGId
         MikKUVB97bY1Nszsyfllp3CjlHtAtzv55Fwq045ctwzYSSf771HKQMbIqoaXVWkjY7HJ
         h3we6TkLefZqOdJ7B9tIbR3YfZlvGsmT3ocMMYq83iNfWZUSuKgNMvErXCpOmOrjQGVz
         4K6A==
X-Forwarded-Encrypted: i=1; AJvYcCUFRuqIGMh/qJZ/CuiCIo5S4G8LMdUEAvVgR+7G/1wWK/r5jyimoeUBO89P4ev58BVzCjF6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5QAKmzNiF3mY6eM54JHYCkzkUfc+45obVptdMIzUcy6JtFqVx
	UPsXXSmwe9U8VQa1hQbTq3AFQy89y9GpgE4ZoyjyBsaMCMa+9mUBf5zWM+xG1ooTmr9ML75fzgh
	xidllPJ+T085pxRJ2L9QHNcPzjB/zU+/ZonYeZn4q7ybjwB8xJ9jjDEI=
X-Gm-Gg: ATEYQzwsOd1Fh1VjpHiulLs0Z4K3nIUbTpn2+lGA6rzAa/RQHDTmAg7WgR08UtcDsj2
	456LJNADvocHaIPwxo3VrqVyA0SGhf8aDxqDyrcfDzKzE1WdyaT9mj4jRUFm2NI0MgpVDEgtJx2
	S+JR6nzFthyD98yyPrVWuQg49Wrm+WWfq9ZnOSabV/mN7r1VRny/3VGvPIPVRWZp0gevYgbsSpo
	JLrTg+oDjcQeGoHMemi5q1bgRPzi0o/jusiO9OzP0t3lG3GKOTpUTCdvkqaKuLmDIFojyuqy7oc
	KHUZ3XfgRyTS5b1mzONEHbpOSOop+1yaCmRGEzDR77++kLR0415U49prMZanr7E4Uc9qf3x6E+q
	Mt/MgEjiL1RS1naAT8x5SZRXYjmy8weeyo9SgGmqCJ5XCK/J3ReH4VHP1Qh9imbkVpfe9cSjqof
	j1+rWgpNyIWjELhT4=
X-Received: by 2002:a05:600c:358e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-4853ec6e713mr10720075e9.15.1773037583164;
        Sun, 08 Mar 2026 23:26:23 -0700 (PDT)
X-Received: by 2002:a05:600c:358e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-4853ec6e713mr10719305e9.15.1773037582629;
        Sun, 08 Mar 2026 23:26:22 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853f9f82a7sm6141395e9.10.2026.03.08.23.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:26:22 -0700 (PDT)
Message-ID: <9cb773f5209fc21a3842abe9e60a27b6130c7fd4.camel@redhat.com>
Subject: Re: [PATCH v3 26/30] tools: verification: Append extra cflags
From: Gabriele Monaco <gmonaco@redhat.com>
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, James
 Clark <james.clark@linaro.org>,  Kees Cook <kees@kernel.org>, Quentin
 Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,  Nicolas
 Schier	 <nsc@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Alexei Starovoitov	 <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko	
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman	 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh	 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo	
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki"	
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui	
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra	
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland	
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,  Adrian Hunter
 <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray	 <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin
 Xia	 <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, Kent
 Gibson	 <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang	 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui	 <decui@microsoft.com>, Long Li <longli@microsoft.com>, Jonathan
 Cameron	 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Andrew Morton	 <akpm@linux-foundation.org>, Willy
 Tarreau <w@1wt.eu>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=	
 <linux@weissschuh.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore	
 <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, Srinivas Pandruvada	
 <srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet	 <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo
 Min	 <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Steven Rostedt
	 <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>, Jiri Kosina	
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Date: Mon, 09 Mar 2026 07:26:16 +0100
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-26-6477808123b7@arm.com>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
	 <20260308-tools_build_fix_zero_init-v3-26-6477808123b7@arm.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YV_u8CLeQIh0zkBCPs_CHzQbWmTe6ikUzrSrBbFlA34_1773037583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-03-08 at 16:46 +0000, Leo Yan wrote:
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>=20
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Thanks, for the patch, however I don't think this is necessary for RV as
EXTRA_CFLAGS are already appended to CFLAGS elsewhere [1].

Makefile.rv is included after the various Makefile.include, so I presume th=
at's
good to go for the new flags you're appending in this series.
I did a quick check and I see -fzero-init-padding-bits=3Dall by just adding=
 05/30
of this series.

[1] -
https://elixir.bootlin.com/linux/v6.19.3/source/tools/verification/rv/Makef=
ile.rv#L29

> ---
> =C2=A0tools/verification/rv/Makefile | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/tools/verification/rv/Makefile b/tools/verification/rv/Makef=
ile
> index
> 5b898360ba4818b12e8a16c27bd88c75d0076fb9..2882f0e93dca03b31d790b42d2ee3d8=
f73cc
> 5c8b 100644
> --- a/tools/verification/rv/Makefile
> +++ b/tools/verification/rv/Makefile
> @@ -55,6 +55,7 @@ ifeq ($(config),1)
> =C2=A0=C2=A0 include Makefile.config
> =C2=A0endif
> =C2=A0
> +CFLAGS=09=09+=3D $(EXTRA_CFLAGS)
> =C2=A0CFLAGS=09=09+=3D $(INCLUDES) $(LIB_INCLUDES)
> =C2=A0
> =C2=A0export CFLAGS OUTPUT srctree

