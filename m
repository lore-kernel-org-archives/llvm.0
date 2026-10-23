Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714659;
	b=tjiAR1gmQf27cYFE6WPm821tq7aXLSfM+SpyEhbWw4Ij4EQDotOtO2gLf4B+WOBLWrOq
	 vZIGqfX4mZ5cgEXliSb0uK9XQ7tDyc/WxkG3f8THUevw7TwT0x60velCeZS+/cPFraXjm
	 QDyYnf3LkGq65d2Wv5xzD7qJx39Uus8Aw4pgxvn5LNbe6W8DNprHfACcO5tIjyfpiypHW
	 qkwayp695Z8m/OYeSAGbn+C2Sme1m3UJJUAJZg76ztCAB8lakIcIKdYDblpGgwrEiM5/T
	 nM0fykm7MxGuRU8pX45398QYwUkn+zQgxnzgtnKPU1R4+w+bX8k2enpVZgCqQj3mv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
	b=YBeVMU+9W96+Hgqfxcxqfr46BX3Qv8zllEQjIMH1sVtpY1LB4X0zf9xPkkmizQ7KTXzJ
	 nktV3DXVWz+9hUX6K3o/jNJIs7tOQuVt5k+uoOED9m2WrKwZi/FTuPAgbrYB0yU1Zz1yc
	 sufLH6e51Kg/WmzjH6rxc79mDvwnGPAEEvEOQgx4BuYVnw9f53ZUM7A/miTVo5Q7jRcC/
	 +QU7p3H75RJ2v97v+td3Cr4JfDBVRe7l1r2oak8jpOb5hrRz3D8lsRVYIXMc4pa9DJlal
	 lBHAi0Um21BUedt+3UDCzJ7E/r6Xkx2fC1Y70PGVHVVc9lG0ewSBIPqY3qrZd8kYlKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XlKYV0qK;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F653606A31B
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 00:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F653606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XlKYV0qK
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so808279eec.1
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 17:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714651; x=1793319451; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
        b=XlKYV0qKQNdzO2uc9MyVl/yUuFsETdzBt88cyW0HYNuYXAvPk4I5iNR3hjV8RJllsM
         xdd5E9+BiZmBEZ2567VVoZJf2OzDeUQZ6S1DCJOuEEFsc2fsdT6Q3j90CyVw6gNAKL0u
         SEBqGV7o/1dZ2R+ibXOLza4a0WpkyBkAekJF1nNf1Z1LSu3o7+HgvXnt+IupNfqzsczu
         5zpOfKO0x+ll8FBQN2qK4yvSp+2wka9gfZG5I4zQwuQFcbmcFptLZFhN6XYbCxGaoKN2
         nqGyr3n8Q1uaboU/FpDPgcAjTPnRH5CWLnWpDmU5SIYOkM1m/AX4oYx6mWfgpIju8ssN
         gPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714651; x=1793319451;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
        b=0qRW8qX0+/210NvjIyLv3zF5DOHJTFv+lhJd//Lhz5+mpH4B6pdGucO8JygYuYgGd9
         KxvoMpKR68//fry/mC0V9Yb666J//zATvOlFbAl9bElFon+neAA1pYKE5AKnMVjhP7Bs
         0R+Smgod0ZFVIZXLl2g1EpvR/102aTetkudlDyuPAJUPnPh31tiXXEZHvjX5NjpuBHtK
         okgHbWvu458vxqKOBggWj3/G9gLYvesKOVcoiQZ4LS/e8z2Gw0LT9KI2owSpo0/nn7qO
         3lqVIS+OC/BqDGIkxKC8kKdqcT+gnYRIkV1T3ZESJmg+8ztj/9nTENzt/0UKzbj2oR8J
         aX9Q==
X-Forwarded-Encrypted: i=1; AKwUvByxYxWKdkdx/HwgSVU5whVm6u6YQfeIyMjxWHsIc+0n4/yFZs1hozDcu//ZVyUCGvMKW5Vm@lists.linux.dev
X-Gm-Message-State: AFq9FYJgkRId7HcfoiaiOzVIabIiw8GWNbBzI+fFPqD57M9DEn1eK5vK
	7VJ4C5iCJGaKbZh2PA+PkhGiQvtHVnws+7uRw7R/l1UgEbvTkepeyDMcOKuOYLdb2hthtwUE3KF
	HXPJqmoFxdKMG0g==
X-Received: from dycuf12.prod.google.com ([2002:a05:7300:10c:b0:35a:6ed3:3ee9])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:83c3:10b0:367:185e:867a with SMTP id 5a478bee46e88-369d98e5b8cmr933601eec.38.1792714650260;
 Thu, 22 Oct 2026 17:17:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:04 -0700
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
Message-ID: <20261023001603.560210-11-wusamuel@google.com>
Subject: [PATCH bpf-next v2 3/6] docs/procfs: Document KALLSYMS_QUERY ioctl on /proc/kallsyms
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

Document the existence of the KALLSYMS_QUERY ioctl() in the section
describing the /proc/kallsyms file. Refer the user to the UAPI header
for low-level details of this programmatic interface. Add a "kallsyms"
row to the /proc file table.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/filesystems/proc.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index c102b62023cd..a0e2fe14a01a 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -761,6 +761,7 @@ files are there, and which are missing.
  ioports      I/O port usage
  irq 	      Masks for irq to cpu affinity			(2.4)(smp?)
  isapnp       ISA PnP (Plug&Play) Info				(2.4)
+ kallsyms     Kernel symbol table with dynamic queries (see text)
  kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
  kmsg         Kernel messages
  ksyms        Kernel symbol table
@@ -1368,6 +1369,20 @@ Provides counts of softirq handlers serviced since boot time, for each CPU.
     HRTIMER:         0          0          0          0
 	RCU:      1678       1769       2178       2250
 
+
+kallsyms
+~~~~~~~~
+
+The /proc/kallsyms file lists all symbols in vmlinux and loaded modules.
+
+In addition to sequential text reading, /proc/kallsyms provides an ioctl()-based
+API (`KALLSYMS_QUERY`) for querying specific symbols and addresses. This
+interface is binary and is meant for efficient extraction of data without
+parsing the entire text file. `struct kallsyms_query`, defined in the
+linux/fs.h UAPI header, serves as the input/output argument to the
+`KALLSYMS_QUERY` ioctl() command. See comments in the linux/fs.h UAPI header
+for details on query semantics, supported flags, and return values.
+
 1.3 Networking info in /proc/net
 --------------------------------
 
-- 
2.56.0.257.gf7497c7d27-goog

