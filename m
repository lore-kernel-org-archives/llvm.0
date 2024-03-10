Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413EE538D
	for <llvm@lists.linux.dev>; Sun, 10 Mar 2024 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710036339; cv=none; b=AN2iUiSNqcwOvAYFXtbP+nMPrVbRxnxGA/XxQJqBsS+M2hUJj1TlPbeswgqADz8rKhhCk/bRaGwURY+gSXlNU4zkiHlo4ahK/TZdnOdUTbclKobfYI6VPlHsl4YCJyPZ7+7tPl4H61FBfVYKEyLuOBJfFayc5p6De3U1kUOvVA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710036339; c=relaxed/simple;
	bh=D2uX+Mnk+6vztSUZd5hP00XWtGAz0CoTxvXAkzGNj1I=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=kAJ+vBJXxIkC9AtljqsX5vcI15/yVrPb8W6L3sK8jMSb/Xsn83lAo7mKo4Wyz+UuA7+QgcwF/glSUTzrazL2v+RTMjWy8AusJ32Lz4yM8nSK3LFJq8qwpzGRfE0wduIC8QrNIaStlkfldTRz2676R+cLi1gMNVsQp/sgUCUDnsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HEaCa8Wp; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HEaCa8Wp"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-609ff3206c3so40642507b3.2
        for <llvm@lists.linux.dev>; Sat, 09 Mar 2024 18:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710036336; x=1710641136; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7XIYLAkcLSrj5FLrGjKI8q+UW4mZzYyudvGuQ4/TZo=;
        b=HEaCa8WpKp4Qe9fN/gB9UG2p/FWCWYfhlZhgAeHBL/TIer89JiBLbGteZPEiGZxPJE
         wi1DCJWpuQ3K6eZ241oOE1osA9vWNB89LaO6U6CmZluNSsUbwW+Xde6hErFuAZ1oMZo/
         J+Kian/ClUrZ5B9W7Uhvud220OyVMNpSf/4gTws08wBTUdj7PXUo23+3N5DrTMcZszlE
         0jADJT0MhVQN+GrAVtjX8nKaMXLDyqk2imIJsv7JQY7ZzfinwYSz72tgVxFz2HHuRYsJ
         52w6fLOD8KbcKSvoLvG+k52JGDe8QFB/mmeCUM0x3eaphA1yhXuSvkRXpIYBBtM9PCXD
         yr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710036336; x=1710641136;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7XIYLAkcLSrj5FLrGjKI8q+UW4mZzYyudvGuQ4/TZo=;
        b=PvXRDjP+brmN3/TRnwuc4rixHYg/Fb3J3AILaCN3fDSmhqlJZGzsDa0ve1r7YcQ1my
         cIWvYNShEOH7U6GvGcdzZic2CkEy3crG1+GQEK3Gk9OR8c2H2oT+SuucV8pOBXtwLQj2
         bgOCDpFqwv6wZ7lCVwuUGu8VDIH9+PnBYUN4brZxESoDjOgtMVm60m/kDVdvEcjCFneF
         Gx06gl4aYwDV3rWjgpHZvIuU8+/DYo3UGFlHovNwCnyeKtYj+DNwuf1kGmiqeUm7euFz
         tljUrjCLFVwly+awDRbughaUk7UVlphbzBNgJOxqZLWDLZ1Gr5OsG8wp9hIpNIZp6tuo
         lbwg==
X-Forwarded-Encrypted: i=1; AJvYcCUxnP9SUXlQCSfNHiFsxFSdpM9Dya3rEDPgP3GSCEMuXOo2E7PSgxeQexE4lUC1cF8HfyyYSHy3OMkVcfp4oZHv637+ww==
X-Gm-Message-State: AOJu0YwKzPXK1xEQIdckTugGmmqnjNrx7jQNlHpi9YRV805rpmDmuw0+
	LeRVlnQmh370tvBDLAF27Bn5IsC/05GDnblrn/nUL80ttU6La4GeQJqFHlbp1YRr4CRMGsZotZt
	MvcgAUg==
X-Google-Smtp-Source: AGHT+IHgDNWM+Z4QXgFMm7GizvEhHToqcLHuZHJtXyYeO1MzHp7huAG4ihDQbMUHqCDQpOBGjLQSGQDO0YZe
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a63d:1b65:e810:3ad3])
 (user=irogers job=sendgmr) by 2002:a0d:d7cd:0:b0:608:72fe:b8a1 with SMTP id
 z196-20020a0dd7cd000000b0060872feb8a1mr953360ywd.4.1710036336387; Sat, 09 Mar
 2024 18:05:36 -0800 (PST)
Date: Sat,  9 Mar 2024 18:04:57 -0800
In-Reply-To: <20240310020509.647319-1-irogers@google.com>
Message-Id: <20240310020509.647319-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Subject: [PATCH v1 02/13] libbpf: Make __printf define conditional
From: Ian Rogers <irogers@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Liam Howlett <liam.howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	David Laight <David.Laight@ACULAB.COM>, "Michael S. Tsirkin" <mst@redhat.com>, Shunsuke Mie <mie@igel.co.jp>, 
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
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

libbpf depends upon linux/err.h which has a linux/compiler.h
dependency. In the kernel includes, as opposed to the tools version,
linux/compiler.h includes linux/compiler_attributes.h which defines
__printf. As the libbpf.c __printf definition isn't guarded by an
ifndef, this leads to a duplicate definition compilation error when
trying to update the tools/include/linux/compiler.h. Fix this by
adding the missing ifndef.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/bpf/libbpf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index afd09571c482..2152360b4b18 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -66,7 +66,9 @@
  */
 #pragma GCC diagnostic ignored "-Wformat-nonliteral"
 
-#define __printf(a, b)	__attribute__((format(printf, a, b)))
+#ifndef __printf
+# define __printf(a, b)	__attribute__((format(printf, a, b)))
+#endif
 
 static struct bpf_map *bpf_object__add_map(struct bpf_object *obj);
 static bool prog_is_subprog(const struct bpf_object *obj, const struct bpf_program *prog);
-- 
2.44.0.278.ge034bb2e1d-goog

