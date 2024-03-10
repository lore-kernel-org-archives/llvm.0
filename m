Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD02F5B
	for <llvm@lists.linux.dev>; Sun, 10 Mar 2024 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710069913; cv=none; b=NA+DUPq7lxnIupwTJjqrDEUzRoKCGB0C+W6mP1IRNiyYyzRsoNF4Ihy8z9lE7PhI+ZDdA/jODp+b0eGuxCHZ5mrVA3QwfdEK2zcqjTmFdHNCyzb8tlSSGgq5MvvHA+AHRlfrKzh5hBsgUeIv1A7yWshT2f+QdDC9BlbHYAt2N+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710069913; c=relaxed/simple;
	bh=VBF7ceh6Wlntn/A4CWCSAEFwD5jlbuVTv/NZRlllrR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QI+DmQOJJF0K+InbHX8KBOMcirigkWYA6uRtBHuIx0sF5JofGkGXMxt7IAIEGjEOYJ0IR7kkj1WTFyeEne6iktutAU7QLDZxYsnQiDihI2D5ZefEiDi/Jzk7ago5OZ/aPVcrkn6KAWkT21esrJyPe7B6rJc82Qo2vE1mc8LTLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBNFu1oE; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBNFu1oE"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so2656962b6e.2
        for <llvm@lists.linux.dev>; Sun, 10 Mar 2024 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710069911; x=1710674711; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avm3XWtxN2Lye/3JBQf5W3p/Z1/Vl4Xh6t59AfJ6d/M=;
        b=gBNFu1oEk1lTf/2j9codyHmdSJSpS6lCvQDIfcLcny9ezhrPRIztKTtotFvwm7Ys48
         zGnS465Qc1KUKCwT7RBnRpmVQ9L8adeIm8PjnE+jqjnATLOd/a7IjF3DyH4IYscvNWR1
         aKvRYn2C3B3fLLjKyqjq8J8n1NRG367QXy0ViHhv9vwgjSesg79ZJZ4D8bDn1Xdr7aYG
         VqiXXmvLGr6oqKbLvJFFRUAqof8ikkgS0JQmISf4rm3qOarDdjD6j67XQn5LxKZCQ4Nw
         nWun/QlO3g9mEfHzxZyClB047UhIkpfr9ziRRRY6vMCIow8B3SbRuhCRmmpi2HVEXUGa
         HF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710069911; x=1710674711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avm3XWtxN2Lye/3JBQf5W3p/Z1/Vl4Xh6t59AfJ6d/M=;
        b=H/LS2T0SuGK5EtpcPhLVXg0Rh7yBZljtBV6ZFnjEka+B0KQxiSBqSxdy5xMzB3Yz0Y
         ss5gE1jYVSqho5fdvIiyb1Z4a+F0hRDL7WUZSnnkHUDKQabCcbpVGjdxldFNnT7EEoWb
         kkIKsqK/asVTp6W3tRZZNM3UVd9xqXDsxMgkY9rIiKag2TubHQsTefE/IY3poeUJARjq
         1LPKJTJ+iG6ykgbRv4jBiDzkRauReY5WjA+BMwzWuf4Nfzscnt3r6/rtUYaug6miC9B3
         cUngNOWZwhneF7kDFH6pp5P1pCEQ+PvT+lgITN3YYldjBpU89x8pyPpXSPa+dlnn5Nf8
         GbGg==
X-Forwarded-Encrypted: i=1; AJvYcCUDpD7s2AH+o28KhIOda3FF4Emtzs2yqgP2WS9R+M6gYtQ5udEGvnHzi0iVMt3faECWTOEZe3QBd3zLdJx94NjhgjUcMg==
X-Gm-Message-State: AOJu0YxHPnBfM1KovBXjywOvccgQN+uBuQ3C2+AXLbnaEt625+I7edHe
	96iFDJW/ej5XL0Jg5HvZFfMmIi+dbG7h0HxUhHgRAyPAmNB+loxVntQlZGvy3220c/yjkje0TG/
	smHmfvCFQmDUeymFEZwn23btUnfQ=
X-Google-Smtp-Source: AGHT+IHRwZqAtW6dN5aHOohpsFvhfbVT3D5XN/0uJW5CX5DEg34V+Etke50PKB8IcZncs9dx0y+ep2z+6siBNnLrohY=
X-Received: by 2002:a05:6808:1188:b0:3c2:31eb:d2c7 with SMTP id
 j8-20020a056808118800b003c231ebd2c7mr5425808oil.20.1710069910963; Sun, 10 Mar
 2024 04:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com> <20240310020509.647319-14-irogers@google.com>
In-Reply-To: <20240310020509.647319-14-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 10 Mar 2024 12:24:58 +0100
Message-ID: <CANiq72=rgXk6oz65wb57ZP+jmSoD-a4SSVzU6s6SZLubV3cvBw@mail.gmail.com>
Subject: Re: [PATCH v1 13/13] tools headers: Rename noinline to __noinline
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Liam Howlett <liam.howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
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

On Sun, Mar 10, 2024 at 3:06=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> [1] https://clang.llvm.org/docs/AttributeReference.html#noinline
> Reported-by: Christopher Di Bella <cjdb@google.com>

Out of curiosity, was this due to the `[[gnu::noinline]]` or similar
in e.g. `src/string/memset_explicit.h`?

> -#define   noinline                      __attribute__((__noinline__))
> +#define   __noinline                      __attribute__((__noinline__))

I guess it does not matter since I don't see it used in `tools/`, but
should the one inside `__fix_address` be updated too? Or is the idea
to keep the diff as minimal as possible?

Cheers,
Miguel
