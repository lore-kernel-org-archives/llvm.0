Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177585;
	b=tB1VqQfzRQSTqK/DoVetaJFsvl4ZaKerEB0NugUJtCsvi5amLVjCnunmZFN9vXELsmNw
	 MXeThxaTuxZlhUlZIHQp/MzoA8+/e5yDlfFE1iXqsTgYjZBg2ZUFr9Aq3k+JAumzehsZw
	 UJbT6gmrleM6Ar7dlvuYy4LR6JOuQr8mMhFXeO9gj3EEQMBZ11w9n4ST/ZROObqbVlVHe
	 WeSyjem7iDaWvz8E3ntd0ezUJ2ihceaxcAiU5Hf8R8YG8juAgSrPEEOPDE0xovtL7sqWG
	 j9zxb7PT1x594+Juz8ChnsJ0dVEdOL5CxF4PggXVt1RZGcPpL1Svtn5IQe5XEsXpZTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
	b=kBTpzl547hpVAtwp7bWuWCZsTg5VG+q4EYnHngQOnjV64IWNAmTpBekg466ZOkcdq9If
	 we3oTaP060XLRxMuexH0C02DehoZ3AlJy072FsZ5Y5kASpJ3dee4JvVnZuoTI6RqNQ929
	 JUd4/reVU5JYiLYES9FdKLe3d+uSRxfpLFuok9bbyF6VXzB0VnJo7hNi6P4XAFiliO6kz
	 6NhT8wpWHQRrVcauUXPIUEgLGorow0HihODKgtlCaRkvTal9g5npBqSdVSoPm05aXRE37
	 RJD3Ln2X5zVHQjpv9O4PSD1XlOEwMPDhhqhrUJ9bx+rdxXHdEDxpKbY4XZ40KIwj4ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPoDPQa0;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42395606D824
	for <llvm@lists.linux.dev>; Sun,  8 Nov 2026 22:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42395606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPoDPQa0
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso767924eec.0
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177584; x=1794782384; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
        b=CPoDPQa0wuL0eNdjELBwZmbVyllrfVfdzCUczJ6XOQ8uadHBJD6VU+YftI9ItrO9ht
         kqpa6U6YBxaE9kcuzfBPhEhE6XOz8TcpTPIlmOdQebkHcRSq6W1BTv3CEwcLC5YJxv4T
         m3drqCoChPFfeRe6RlyjnUJl/HTaGVYGVlyBe8DOMb9DoVSIYb4pZLFLZ3ykAc6yc5rq
         +rBO0BhWM9S24I1dUT7CCGgMuY79+vKQ7oOYFqOJbqh7P7vlAJTHTl/JsNOZ0BWiG1J1
         LOt0szfYRdSZa6Fu5P5vaMZfNtXCUR9ILTDPTr0GgTxdauJqXQ4TBaNfeeH7Fsc0b5vt
         9Z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177584; x=1794782384;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
        b=ow8+CsxOB7LrHP4k6YYsaA7wuEM+8AgwwGLGSNzzzMJzJFNpzOIARZK4kGW88APZ4q
         FP93rYE9PapF9sZ6XzCqeOEkPEMs0yMQBOirRQ0oH8+FPVL3glCUI9eBoijjp8vANA9l
         Q72JEEhIhsWzfp2ZeOWiB8fw3Z1Ypn08x7rTHrXTt2VnuXMwcyUcXvdIS/H2t0kVU73O
         7szb8zvszTU3qM0uJi2A12uTJwlf8icUpwkr+V9hLqdN8+3L0GmDpiy967ESNeKfcYe0
         a+ZY6YUahTA2sGIJeAYxb0Y/L3RGO8Vm700x64OmbqchV+YYf3Ug6JFjADUVprXwgRax
         +d0Q==
X-Forwarded-Encrypted: i=1; AL+hErE42O4+HpLEcjy30G/c7yX/WSiqwyellGQ3Tiu6Xlxlnj8UcE0wIdtOZn4bL7h7peuZH8jK@lists.linux.dev
X-Gm-Message-State: APuU4Z8PW/32TLw5aOnFLRqB+4/OPPmK4JED44KRPomdaID+nQEM2ffD
	KYoTKwwe//1LWWtgPTiIkXJSAMIPJSBXtzWES849ZvrT3TBOp09L8vBs1s6gOweDfOcb3O/GOF0
	jc27IRJU8iw==
X-Received: from dlad1.prod.google.com ([2002:a05:701b:2201:b0:1b2:6421:f4fb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8a:b0:163:bee9:b250
 with SMTP id a92af1059eb24-1b39fedbec2mr3348910c88.22.1794177583902; Sun, 08
 Nov 2026 14:39:43 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:06 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-3-irogers@google.com>
Subject: [PATCH v3 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In add_var(), a struct kobject is dynamically allocated with
kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
However, secvar_ktype does not define a .release callback, which results
in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).

Provide a secvar_release() callback that calls kfree(kobj).

Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 395399bbab2c..f3f6ac25ea78 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_group = {
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 
+static void secvar_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type secvar_ktype = {
+	.release	= secvar_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
 	.default_groups = secvar_attr_groups,
 };
-- 
2.56.0.455.g6c5a503b38-goog

