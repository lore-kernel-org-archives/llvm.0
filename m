Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608068;
	b=VUnE/SIH3IAyjEnVj5y9TGOvnBfqdHNalZ450AsLV4PBHDNy6QnHXfaszsn7S2PGhBFo
	 +tDhiwaS7u0zI6sDC92D4r7NWpSOy9vK70fVrcP3jfWYOOiOPhn6L4cyvl4cWl6HzUDGH
	 Y06GcLfXCItdAeEDXdv5pnEi/7C7Czpl+2QCI863p9u1R/pgKT3nWXdqB0Ubfqa9a5G4S
	 sSiH8EDWHo7Cb1GwqRnmaz3CvSUYH6sZ7Ch3g0bf6WZz8P3jdbYQMqlY9TcHFrpqB9aEY
	 3blB30PMPWZY9ZwB70BI87MkpwxD59GZmOGBA9C0vmaVUzfnzkM0JrMHSLnHtd6Li1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
	b=wQy4Y/t95Tm/1hh2jC8T9af99Z2tmNbDLLBDzeDqCcTnHosA1LRKfVvnGW8ulWjEoq8p
	 dkkrUwc/t3GNKJ7WAX4kSaVheqOZcC8bQHjVk3YVLSLcTj+S2UvBSkroyk3rqXnsrBT3K
	 PtG5LR/MrXim8KWaOx8eFrwd0wb97rhnsS9E6OTkZ449CIPhvo3w9cXsseoNTf1uNKUlx
	 /6VAMNoChXEqSgTMevTIIOfHplhXrm3vfl0lPOkfC2fw5JVJkVVbhGgZ/oLeFu1sz8cEr
	 5SrX4+tRD5ur1IA9L+azveQM7Dh5DLKbZnxGDMOxLcumjZFkUelCEPQBSgI7fofybKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VfRtGJnu;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7EC606A899
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 22:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7EC606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VfRtGJnu
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5641cd2cc13so1893617b6e.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608064; x=1795212864; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
        b=VfRtGJnuFrJ1TBc3ObARHqeriYPcWp88Ckj/HQa/pttimR+ktnONjtr4zVwuU8D81Z
         Oodx728IUe7K2olipdJc48BynmVeDbx+34Sr1Z5cXC0idX51jvz4RSWRvCl2kY4OiRIo
         JZ3QtU2IxBExo5cq109mX2xHnmoKo0EkjJr5giBLwCXZbyyV+d/9oKZOvsi8UjSmD/qw
         FO/I7Jl4BM1hyGeLJfObDdoe0KGScGLFlNuFYJXwsQbuS3CHNkhLWd37DJq+pWugOVHs
         U3hMqYDeCPuI8c39xtsn0PxQ7391rPKug19Ifa/zdFachWDnMONzDv1q6JhEPR+CLvIY
         UMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608064; x=1795212864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
        b=vLXkETMhoeuFaMf/Iaara0TI3pbC+O+5cotc+9UDmyzn3Gofz0Uj9BYDFFcqe2CY8d
         SRtehFRea1dtdkPPcAp7zKodiC2lBcbvnNqDGzI4WzqwoF854FhsQegekJZ7QbFyLbfN
         FESoHsrCox0IYNyDc7moyDbA87EZUNDyuGBmgGlewJf/q0iOVW4XVRwpz3clRZw5kKBk
         NNAWXS5XtFR54GNxmVEJf5txc5O2xdqs9YMHUOBhoGwHF4+yh9J9peSCJITyhY9AJMH5
         WOY/H9xJadWvWS9J6eEiiqI3ewFCHBvWcZcdfQQ62fd7res36WZx4N167YhekICDmj3F
         h9Tw==
X-Forwarded-Encrypted: i=1; AL+hErHmnP4bXTmNoM694zdPYTl6gz+JyLlgVsPtyIFwqOMUFRj8jx623btRs+GLUEC7OEKJvmUH@lists.linux.dev
X-Gm-Message-State: APuU4Z8e1WIy3x4NS5sWj3QGsULIYXuZvuwNFm8JJA9EZAZdt1vUFxum
	wE620dJ00mveC4Qo7TFarrdEmK/3dEF1BE/O/3eNYwnWoMnQ10S4JzSNyRB+JhFaNibcQFZsLI0
	UnFq1InZLTvxf4Q==
X-Received: from ilbec7.prod.google.com ([2002:a05:6e02:4707:b0:53c:f2dd:1e17])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3505:b0:536:611a:7fd9 with SMTP id 5614622812f47-56e6015e8cfmr3125630b6e.7.1794608064235;
 Fri, 13 Nov 2026 14:14:24 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:50 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-16-wusamuel@google.com>
Subject: [PATCH bpf-next v3 5/9] docs/procfs: Document KALLSYMS_QUERY_* ioctls
 on /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add kallsyms to the /proc file table, and a short section that refers to
the KALLSYMS_QUERY_* definitions in include/uapi/linux/fs.h.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/filesystems/proc.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index fa7a468e8edf..442aae9ebd9e 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -761,6 +761,7 @@ files are there, and which are missing.
  ioports      I/O port usage
  irq 	      Masks for irq to cpu affinity			(2.4)(smp?)
  isapnp       ISA PnP (Plug&Play) Info				(2.4)
+ kallsyms     All kernel symbols (see text)
  kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
  kmsg         Kernel messages
  ksyms        Kernel symbol table
@@ -1368,6 +1369,14 @@ Provides counts of softirq handlers serviced since boot time, for each CPU.
     HRTIMER:         0          0          0          0
 	RCU:      1678       1769       2178       2250
 
+kallsyms
+~~~~~~~~
+
+Lists the kernel symbols of vmlinux, loaded modules, and dynamic sources such
+as BPF JIT images. The ``KALLSYMS_QUERY_BY_NAME`` and ``KALLSYMS_QUERY_BY_ADDR``
+ioctls find one symbol by name or by address without parsing the text. See
+``include/uapi/linux/fs.h`` for their structs and errors.
+
 1.3 Networking info in /proc/net
 --------------------------------
 
-- 
2.56.0.679.gc527c65306-goog

