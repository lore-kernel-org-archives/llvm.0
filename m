Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714663;
	b=NellT04PCHW04EKXOk9K63Hv+BzcHOUfZBK2SSKAnRha4THwNQ8gK/kGN6wq1vf8pI4J
	 sX9pCzbCOXEK2QnbbFvF1pIUFuq7gyF3Ba8ylrHOQD6IS+dQt2VNSk5xptTTVA+RhQdFB
	 NDKTE4LpHoyIrbROrJuiLJRhevADDTacdTt/g1+2HuxEKebMYJ0bdM6z/btyt9XEKII8c
	 OQPWrc1SEY5MoW+84yl1DeoAEMQ894TadTq5oVbLXF3dFhHkiyc0STy9oy9pmLX9nYbo+
	 INWkdVQiDFgxTBzNPzp6i/gCaWtZ13m1Qz0xiflkMzK6DhjlxNG1DA7HGVg/xQOG8Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DqleeFdjbt6KHN7sXzWbOq4/x+wnYCrVXyGZTqdZ4EU=;
	b=sJGgETCwydXcyI6WoryiPMmrQaCRsJPiM0zCID/UdwbD3qVJubB1jdzchRnacVboTtbX
	 UtKS32yFuT1QzTVdsN81oNPGSJv+yKES7hFUoOkm0zWCcf08RaEiAGqIyZYrGetlmUhjv
	 GfJjOtmAXAtJWSZf+4BW+S8wfMkdBeIarA7fKIBOypjKwvn29A3paAGZxkz46pMpJQE6Z
	 VWU90J7JSPdjMeetHohvQgSdNlyMv9Q99VRIJt/dZLrQ/D6I9NUY4B+Rh7PXkFP3Hlp4T
	 syIGSmtlOzTfeiFUEYGN7OXdDSSpzfgXC+Q5MuY8QfBf5LxaHvzoLHU8unw2UoCuOgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=i5IQ0xdq;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FB0606A331
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 00:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FB0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=i5IQ0xdq
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso563660eec.1
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 17:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714662; x=1793319462; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqleeFdjbt6KHN7sXzWbOq4/x+wnYCrVXyGZTqdZ4EU=;
        b=i5IQ0xdqbqP71SkyrUeA/bj68tvKtLZ/0Uk/NUBzZqX/q6LP9d/IMYCwHRFJxHyqgg
         T6/W9hYfP/PSm4Z9GokwEyOt891k4zatPuSKkwL0zgl2eSbNrbN643cWpAH/jjXKPShL
         O5zXdlv4E8LA3f2jQWzBGV2vZMPZxm12RhSnaC4vv+0S30krkaCPATw2NrcBXLQwEuYL
         FsyF3zVJ0pkvANDQrSPuI3uWvke0b/Svce2y6+Q9ylzBcMf366tZkxWusDIIANlKw3z3
         +4AwBy7bdyL97L7xuO3rOZYe4I/plaUWpsAR2o5rzcgi84aYSjGz3P2rMmu5ucc57fGg
         i4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714662; x=1793319462;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqleeFdjbt6KHN7sXzWbOq4/x+wnYCrVXyGZTqdZ4EU=;
        b=yqembxF2xeQ190lJa75e52M2qA2kfjkNuMKETgllLR/9sOGIELSdSKnririfshFZUp
         GiAlkMpZqELtxfOIqEcr0bKWamM1T2KVhiX9qba0d8zahT04zhsDCd5wQ0Dg/QmxKMeS
         5AveFrAd8E8MIABm3BNmY4dgEI5TtHAz7NFHUItgG2DI+WzKxxg3bIQn2uEoGLut2ngc
         cmLNL2tv+CCSV0mG4e2PJwdjqGvVY1psYf/Q53KeO8OOHQ3A0QRwjDXDUdrEaT+22o+C
         7qeTE63ZDuwBvTyg3PRU6sC7dUoowYgIEPlF+5AA5uMWXtt4hwAWXXbk4OxWc2FGxBVB
         xFkg==
X-Forwarded-Encrypted: i=1; AKwUvBxYTZ7nGRcwUYyXHy7eaeyprWmlQZwIo1COAXQfgd8xRNJXk56SzEZPuHZFqsKhN8YjUYYQ@lists.linux.dev
X-Gm-Message-State: AFq9FYIuXTdjI4P9fSyycEC0h782TJ/0RyH6KPGeIkx9o9hAYLffoujR
	4G05tcRR2xux1ujJ+n4W0lF5rp1wBZUE3RJ9YSXJyPMEfr4IPM+1uK7e5lTEbG0vjQxR25XZpb5
	nXcLJBJqmjE8dnQ==
X-Received: from dycam14.prod.google.com ([2002:a05:7300:fc0e:b0:369:739:9a00])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1c93:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-369d9731914mr883157eec.7.1792714661530;
 Thu, 22 Oct 2026 17:17:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:06 -0700
In-Reply-To: <20261023001603.560210-8-wusamuel@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-13-wusamuel@google.com>
Subject: [PATCH bpf-next v2 5/6] selftests/bpf: Test typeless module ksym resolution
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Typeless module ksyms are resolved through kallsyms, but the existing
module ksym tests (ksyms_module, ksym_race) only use typed ksyms, which
are resolved through BTF. With KALLSYMS_QUERY, libbpf resolves module
symbols through the module lookup path of the ioctl.

Add a weak typeless extern for bpf_testmod_ksym_percpu to the ksyms test
and check that its address matches /proc/kallsyms when bpf_testmod is
loaded.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/testing/selftests/bpf/prog_tests/ksyms.c | 7 +++++++
 tools/testing/selftests/bpf/progs/test_ksyms.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/ksyms.c b/tools/testing/selftests/bpf/prog_tests/ksyms.c
index dc7aab532fb1..62760284f746 100644
--- a/tools/testing/selftests/bpf/prog_tests/ksyms.c
+++ b/tools/testing/selftests/bpf/prog_tests/ksyms.c
@@ -11,6 +11,7 @@ void test_ksyms(void)
 	struct test_ksyms *skel;
 	struct test_ksyms__data *data;
 	__u64 link_fops_addr, per_cpu_start_addr;
+	__u64 testmod_ksym_addr;
 	struct stat st;
 	__u64 btf_size;
 	int err;
@@ -48,6 +49,12 @@ void test_ksyms(void)
 	ASSERT_EQ(data->out__btf_size, btf_size, "btf_size");
 	ASSERT_EQ(data->out__per_cpu_start, per_cpu_start_addr, "__per_cpu_start");
 
+	if (env.has_testmod &&
+	    ASSERT_OK(kallsyms_find("bpf_testmod_ksym_percpu", &testmod_ksym_addr),
+		      "bpf_testmod_ksym_percpu: kallsyms_find"))
+		ASSERT_EQ(data->out__bpf_testmod_ksym, testmod_ksym_addr,
+			  "bpf_testmod_ksym_percpu");
+
 cleanup:
 	test_ksyms__destroy(skel);
 }
diff --git a/tools/testing/selftests/bpf/progs/test_ksyms.c b/tools/testing/selftests/bpf/progs/test_ksyms.c
index 6c9cbb5a3bdf..69309f2a2d0a 100644
--- a/tools/testing/selftests/bpf/progs/test_ksyms.c
+++ b/tools/testing/selftests/bpf/progs/test_ksyms.c
@@ -9,6 +9,7 @@ __u64 out__bpf_link_fops = -1;
 __u64 out__bpf_link_fops1 = -1;
 __u64 out__btf_size = -1;
 __u64 out__per_cpu_start = -1;
+__u64 out__bpf_testmod_ksym = -1;
 
 extern const void bpf_link_fops __ksym;
 extern const void __start_BTF __ksym;
@@ -16,6 +17,7 @@ extern const void __stop_BTF __ksym;
 extern const void __per_cpu_start __ksym;
 /* non-existing symbol, weak, default to zero */
 extern const void bpf_link_fops1 __ksym __weak;
+extern const void bpf_testmod_ksym_percpu __ksym __weak;
 
 SEC("raw_tp/sys_enter")
 int handler(const void *ctx)
@@ -25,6 +27,7 @@ int handler(const void *ctx)
 	out__per_cpu_start = (__u64)&__per_cpu_start;
 
 	out__bpf_link_fops1 = (__u64)&bpf_link_fops1;
+	out__bpf_testmod_ksym = (__u64)&bpf_testmod_ksym_percpu;
 
 	return 0;
 }
-- 
2.56.0.257.gf7497c7d27-goog

