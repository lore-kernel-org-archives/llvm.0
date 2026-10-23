Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714647;
	b=ZmNnHj0+lfYL2AzCphbuQlRia2cGZcr0X5Cdny3+2AiM/bUnxpbJkl+sqK6WJhuLfXKU
	 UuSOrl7/EglNy0gqw3sdbGb6DgxaCB4172KO1t/aqLbJ47JDl9J1TwAbG1Stp0W+uPYeQ
	 ZQSDiC1p+KDVJR9CQXrWmntITIsPE/n/eefqaAGbN/aD3rcESncy3dureRjumPFxkc9jm
	 MpN6gRdvLVieOZ1Zd6/F4fkZhzAWT8HH/RuL7KbGBJeTAK4SyL0ExUqbbAsFq8jThwF0m
	 FVTTUtomHj2PVLBzo/ImRLdUNPf7as8tV8BfDNFQcA3RyHKb/9KY47ASWveUJJC8CMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
	b=HxbIeG+Biu5RsYGWAKzqWELM2iie8RF2Ym/z/BB93UNBFRUDgEV2aC6PWlhRGb29Yllp
	 UHSojy5mos0lAsvLSwTTwIxNwf0+jdx2QY7we9uvdS9HZ5p0Z2gEuw8PIgMi83XnHbLim
	 BlVeZk4UodBNcOZbzZJfw9Wsj//QZk8DU9Y8i7Pmcacvszw0G5ZDnfhhjcOXX/BOzmXLJ
	 wigWWkEcUMYwuOJWsz2W2Joj2E7fHafaFNBQaaiHRplCsrePbu8jxfc5K9miBl6LptBvz
	 fjPgUsAzOlRSAuS+oQ8x+7PRuvkf0TJqx25mJcdK/lzIptmkSDXgKjNyYMYGZl9khpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kIgwZ1n0;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C351606A31A
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 00:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C351606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kIgwZ1n0
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso743008c88.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 17:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714645; x=1793319445; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
        b=kIgwZ1n02zD0Kz85TQfHf74eqk+KfM9PJzezJvWnWQCrvXkX+zigvGynoHlCMgZjGJ
         ZP8lvurD3RVozfYmKqrOM2Zivrebwu2flLAFGooT8OuC8jQXC9D3uYXBqhNJFRj6CN85
         AEHAKl7oNkA7XGaEJkYDQtb1HMRHBFhSNXS69fBucC0tvAVVPWDKgF4djmeHBbXrcRyl
         EA2yodJO5k+NT7MSCAYuUp0PC12KPXh63U6qji0zD1/FjlSC9FJ9KFoLDNKXaNumKupW
         olZ/t/dHB1PdTXeZ/CyXhCOzkvvh5JdehgV0X3ecxeWzp1n3VGSYS1dIJ2szJbpmwDoh
         Yktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714645; x=1793319445;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
        b=Mkr7W6fANdL912eolD87BxNA2YAY8shvnjVpToLbQFZxRopggYT2A+4Ur3xGRmze4X
         ux7QEEr9uB8aTe66Q9Fe5MvPbAl6tNnkpJ4kldAdxS3JSJ/2UT/Rb/aK+JhZIMEkMRyD
         f6BNhjGkyzmyWdHGKKeuZ8V2bWtag/tgPAVIh41sAq087dY6ruaX0X0NEo8rYk4X/h25
         cTzi3WxnLuXH0WVAyjVIdYLtTNCv314hcCJmKOtgTJtAhJoO0Z6eH+rNPg6kZv40xPa5
         IpBcJg5nut3pXiwoQOYcmtC6aIiwgMrINCELJXM997rY6333NEPVtB8r0KLh9CX/2D6H
         X9Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzEU5Ls03IniOE6F3H0XDPcObJYF6VfBFKBDGlJK0hDoytzhfioYQR7v2ZmRQB1SjilnA5h@lists.linux.dev
X-Gm-Message-State: AFq9FYIlWjYawvyf7RsfZ0CPgwDz9sSX6HINfA2nzRYkXiilXZyJOln9
	R9T22ooy8gBFmuaPv5Y8OjI6H40J3RBuHh9ZCu7Rw8iev8UfWYv6rkNT4ZoRsUIyoYwAU8CbzTp
	DFYVU3JOBNg8Yog==
X-Received: from dlbps4.prod.google.com ([2002:a05:7023:884:b0:191:327b:5758])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4184:b0:16c:ff3a:d72e with SMTP id a92af1059eb24-195c6b29320mr1346079c88.20.1792714645130;
 Thu, 22 Oct 2026 17:17:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:03 -0700
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
Message-ID: <20261023001603.560210-10-wusamuel@google.com>
Subject: [PATCH bpf-next v2 2/6] tools: Copy KALLSYMS_QUERY definitions to linux/fs.h
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

Copy the KALLSYMS_QUERY ioctl definitions from include/uapi/linux/fs.h
to tools/include/uapi/linux/fs.h for libbpf and the proc and bpf
selftests. Only the new definitions are copied; other differences
between the two headers are left alone.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/include/uapi/linux/fs.h | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/include/uapi/linux/fs.h b/tools/include/uapi/linux/fs.h
index f0a26309b6d5..d224516e6d6e 100644
--- a/tools/include/uapi/linux/fs.h
+++ b/tools/include/uapi/linux/fs.h
@@ -567,4 +567,45 @@ struct procmap_query {
 	__u64 build_id_addr;		/* in */
 };
 
+/* /proc/kallsyms ioctl */
+#define KALLSYMS_QUERY	_IOWR(PROCFS_IOCTL_MAGIC, 18, struct kallsyms_query)
+
+/* Exactly one query mode must be set in query_flags. */
+enum kallsyms_query_flags {
+	/*
+	 * Look up a symbol in vmlinux or loaded modules (vmlinux first; BPF
+	 * and ftrace symbols are not searched) by exact NUL-terminated name
+	 * at sym_name_addr and return sym_addr. sym_addr and sym_name_size
+	 * must be 0 on input.
+	 */
+	KALLSYMS_QUERY_BY_SYMBOL = 0x01,
+	/*
+	 * Look up the symbol covering sym_addr and write its NUL-terminated
+	 * name to the sym_name_addr buffer of sym_name_size bytes. The same
+	 * symbols as %pS are searched: vmlinux, loaded modules, BPF JIT
+	 * images, and freed module init functions still tracked by ftrace.
+	 * A buffer of KSYM_NAME_LEN (512 at the time of writing) bytes is
+	 * always enough. On success, sym_name_size is set to the number of
+	 * bytes written (including the terminating NUL).
+	 */
+	KALLSYMS_QUERY_BY_ADDR = 0x02,
+};
+
+/*
+ * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the name maps to
+ * more than one address, -ENAMETOOLONG if the name does not fit in
+ * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size bytes, and
+ * -EPERM if kallsyms addresses are hidden from the opener of /proc/kallsyms
+ * (e.g. kptr_restrict).
+ */
+struct kallsyms_query {
+	__u64 size;		/* in - struct size for compatibility */
+	__u64 query_flags;	/* in - query mode (enum kallsyms_query_flags) */
+	__u64 sym_name_addr;	/* in - address of symbol name buffer */
+	__u64 sym_addr;		/* out (BY_SYMBOL) / in (BY_ADDR) */
+	__u64 sym_name_size;	/* in/out - name buffer size / bytes written */
+};
+
+#define KALLSYMS_QUERY_SIZE_VER0	40 /* sizeof first published struct */
+
 #endif /* _UAPI_LINUX_FS_H */
-- 
2.56.0.257.gf7497c7d27-goog

