Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD44437A
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171209; cv=none; b=QCkPZMyaE9KPlxrZym/A/nZGQX6eZRFUWpxWaUvLdJCOIiOeIVw07STix58C+2EVeNKqHzvMjxm+VQ4JWDzEvHp1ctZeiw7EJwo9073oc+dKdotlABPHHv9hLqKeHBWHc3myu9cILtx5mxUNtum8agpZzNzDa12Crc93b1xHBEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171209; c=relaxed/simple;
	bh=BgmEJ3rVgpfdYftpb1oT1hFKBsa+dHuEMI7KFS3YKKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fybh6qJ3ethfKNW7mUPhERF2gCSZ2AnK2kBwsRANCv5VhRPuaDhvKCjqcgAHuyX5jjfaqu5raz9knugyfOTIg3733zkrYwN8obYk4JVQsf31368wNZ/eU4oVLBjigwKTU1t9WxGI6O9PUO/ZSmv8NzEh2wC9BuL8w54lpoqkG8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CxuJm6kz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CxuJm6kz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33e94de1f34so743588f8f.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710171205; x=1710776005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgmEJ3rVgpfdYftpb1oT1hFKBsa+dHuEMI7KFS3YKKE=;
        b=CxuJm6kz4S4sSTvMWwj6DQ+1CgAe7iocd+zMY2of5r99tuTb7xKBs/VGqeEPUI9h+g
         HXlj3RB0249ev89uf5iaYu4pT2Thf0ABYpYLrBvOj4lGWHXaA8gR9rzAaVIf2UPiUtYy
         S0uXpjEnPjAigVSXPJLhvW6jkdCeSt1nDr3Z8AIAwZ26ta0GrmqUAcYnZFh3uOOTE7BU
         ykXW3/qNrFbrxKGUO8PPj/B67RJXrAhS2fIoVlGEW37DvWFQz0V7Pk9pqvUh1htmn4Rv
         EGBfkITSayIrZh0nSe+dhNdm/wGj/tDaHwCFbjxHqgc18lUmxvcImQ+DxEfeblegWW1W
         i6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171205; x=1710776005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgmEJ3rVgpfdYftpb1oT1hFKBsa+dHuEMI7KFS3YKKE=;
        b=YE/K8LTrs6r5bE53GwIwPyZibRjmE8L1sjLkYpTfSxw3K7IY1/Nr4pvRWb3U3itrD3
         +qrm3cIU2FLUMunxvtEpetJbpVhjuYylXEs0CchsNKI9L8bXT0FxrZYLSIBmJPHiigkP
         lvE0YiJYE2TBKAGa/GW+YlJZZcqP1QZ4Wx3GmmzanmWlfNSIw6RM6MucyzdwHOwoDTcc
         02+8eBXZpQqUYdTM3VhOdYVPABm6dIQ1UrXC1xqjDv5KMIHt0PcAOwmFLwe+NoOKKcPW
         sqNHwNnj2kwukogU+VKEfmYUfGkxXckhbv12C0Pr66O0TfZhIHGDYTU7X58xuIx4+Atn
         2b3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe6MLD26MfRzCstOlGe5k/OBcvrwB8Bx9bZWbKwFXhlBDcFszxwgoz7XYaiNugN4UPulZ91RXOTLX1NbJOThvw6SzMRw==
X-Gm-Message-State: AOJu0Yw/u/UWKa0x4rjWxhgBvOK8fXgn97xUHazt8QSRe8UTZzf/39l8
	qgLuRJhrUawEL6YZh8qGrKFQ0AA1jkjyAs9sf1Az7GQjtwVAcXhNcmqoFMEU0WOrBx9/wUaTQKP
	7mah+/f88IvSPaDiJ9TNn8Odkb+L93zQKe+IV
X-Google-Smtp-Source: AGHT+IE/th4Pg/GBs04QnTLC4gySgD/Ced3Hwsh9xlJGW37qnBqN80Ztb15KeaRy40uSPOSKwYSAYx2WXmVslFbnrPM=
X-Received: by 2002:a5d:6751:0:b0:33e:1f2b:8cc5 with SMTP id
 l17-20020a5d6751000000b0033e1f2b8cc5mr6816452wrw.0.1710171205375; Mon, 11 Mar
 2024 08:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com> <20240310020509.647319-14-irogers@google.com>
 <CANiq72=rgXk6oz65wb57ZP+jmSoD-a4SSVzU6s6SZLubV3cvBw@mail.gmail.com>
In-Reply-To: <CANiq72=rgXk6oz65wb57ZP+jmSoD-a4SSVzU6s6SZLubV3cvBw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Mar 2024 08:33:10 -0700
Message-ID: <CAKwvOdkMYnYO2hyJEFj-M_iur6BneEZjPHvsodZAGw=b7PmmzA@mail.gmail.com>
Subject: Re: [PATCH v1 13/13] tools headers: Rename noinline to __noinline
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ian Rogers <irogers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Liam Howlett <liam.howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	David Laight <David.Laight@aculab.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shunsuke Mie <mie@igel.co.jp>, 
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>, 
	James Clark <james.clark@arm.com>, Nick Forrington <nick.forrington@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, German Gomez <german.gomez@arm.com>, Rob Herring <robh@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Fuad Tabba <tabba@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Peter Xu <peterx@redhat.com>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Christopher Di Bella <cjdb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2024 at 4:25=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Mar 10, 2024 at 3:06=E2=80=AFAM Ian Rogers <irogers@google.com> w=
rote:
> >
> > [1] https://clang.llvm.org/docs/AttributeReference.html#noinline
> > Reported-by: Christopher Di Bella <cjdb@google.com>
>
> Out of curiosity, was this due to the `[[gnu::noinline]]` or similar
> in e.g. `src/string/memset_explicit.h`?

Yes, and in src/__support/threads/linux/thread.cpp's definition of
start_thread().

Thanks for the patch!

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

--=20
Thanks,
~Nick Desaulniers
