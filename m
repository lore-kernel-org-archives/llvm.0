Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140759;
	b=4k4ttG/mqmsXh5Ua8XPHRLvaII6/nF/qIm9pSUd3hTKNW3bzNTupt5/VbEYUou0yTofM
	 k02717J4gCyYvi0oXbsrfMWiSUp8wTXownQ0RtdQtseqazt+g57CtxIqLqwJ11BETZbwp
	 MHyPf7uiV1xmfFek9Ij/ARWxWZB2jrfS+MGvdczmudC4Rbgr4QTJEZtH6zn/eECx+KNj7
	 ckWxERH20ePLhH+vhLu8M2+CNsnqS2NyITPkEQebtOMTt64ibejrs1xICYsmmwumCY5Ym
	 I/nS+sGic222fLBjZCk9VIWNtqQY/HKpyIxO4McJutgW7Sb4ChIrYmJYxejOBgsN6sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=beIsynJTUoVVYUibNrHvS9xq2J3rMWzpCblr3XGPomY=;
	b=HZlnkdXRHZ82BIdjQXwGM/PBYVUkuD0mS3XwSlDBZMCMDfMveNsdigSanMdYoJGsgu6y
	 d69rP9e67ZB/sN1Et/qx7GayVaUAXtoEQeP/Mr6qtrIQnrvsWsIWasZFBJtnxejto3/NX
	 5UbXaoPrKYE8o1S6oFTca8fX70J4oTsBgXdy0mvP4FU1E1tPDRzgY4s+6sewckOuLSi1U
	 5kU9VJRyWNwYBU4zMw6x2l5Pql9xvOwK5jT09OhboNtW33yRsUKMJmrtcGBvwVOPiSVM/
	 MX56uVlD6Fw/+bmn69Aab497G3h/8gTkLXhblUCIKo8pghL5RCNDICSmM19nGmNJXtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CEPbCgzd;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E230606A320
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 22:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E230606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CEPbCgzd
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso551605b3a.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140759; x=1793745559; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beIsynJTUoVVYUibNrHvS9xq2J3rMWzpCblr3XGPomY=;
        b=CEPbCgzd+lTjshmnoA51ZLAGxWXXJ0MjiwZ6jMsTpXIlRN0qFbm+61zLAHuollDRrq
         NRZ8ELGdDPIzjKxGmPM89+pSHxM9Mnor8QV6Fi5ySAk1UcWH+mB9f6WYdlH3StFwEMj+
         NcvdQZ+kNvWt2RSyhynvOaD5yWTOAfC+0GaGTatxaCzXiV78V03fg9B1c6tjmWuyHyDj
         qBw31cF8bZD0w6FRALP9XWaecHjAkSkBCOP+mNoT8E51I3rNR01dLYtn2uBI8M/UIv5A
         b50C7QctzF4uZfjjNQQCS8LX+AChP8iBrZvqw6qjdSrxo8IVcCeptCO2N9j7D9iCFwHq
         08wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140759; x=1793745559;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beIsynJTUoVVYUibNrHvS9xq2J3rMWzpCblr3XGPomY=;
        b=gALPlMzLET5S9Ib7xhTXs9X7fI3pccSyhLILjrWZaC21gbAj+GxTTsN2cSWpbZMM5n
         CATazFUDZwbcQctv+EKQeqpyAvYo/B4A5JM94rsD+e4JWj9MkxiggPAxGr3bg3noy2cB
         Mo0jRc10admohKv2SoKNDsicgf+Z/umdrXg/7Ugnm6w1M+4Uk3WoNUgmbxMAr5/Txc2o
         WjNBiBWOG4leZnsTA9MZ9xoUJnyQX4c2zrICSoGsaESs4BXHQlSRxaQRSFxa+dl3XuKH
         kKvHg7Fa2ZJ9Ab0E5DW1fnJd+CMvl81hS4Lh1EykdywkdFo/8sroHkeDhbLrPdnu3iH7
         5Gzw==
X-Forwarded-Encrypted: i=1; AKwUvBxrL0OkJM9UKKx6jghit0e4MIqcL2/bj5N5cCrCBaPUbUhMN0yr68sNe/JWU8uD78EnTRu9@lists.linux.dev
X-Gm-Message-State: AFq9FYKcUlCA7wCArDNX9jkr4auycvJRt6Ls6Jtdw3xEptM5XA3/rgFZ
	hMvkDkew1elEfBF+nF9AneJQ4GLfn9O+FaZvLxzVvgx37i+rBS3+mIbfKswMtOESRUKi2FJOVl/
	HyEGPMBHDEg==
X-Received: from pfbdw21.prod.google.com ([2002:a05:6a00:3695:b0:89f:827e:eb47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4293:b0:876:194e:b8fe
 with SMTP id d2e1a72fcca58-8a6e70e832amr492696b3a.26.1793140758450; Tue, 27
 Oct 2026 15:39:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:38 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-4-irogers@google.com>
Subject: [PATCH v2 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Mundt <lethal@linux-sh.org>
Content-Type: text/plain; charset="UTF-8"

In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
kzalloc_obj() and initialized with ktype_percpu_entry. When
sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
because ktype_percpu_entry lacks a .release callback.

Provide a sq_kobj_release() callback that calls kfree(kobj).

Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/sh/kernel/cpu/sh4/sq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index 908a8e09113b..f33864958487 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -331,7 +331,13 @@ static const struct sysfs_ops sq_sysfs_ops = {
 	.store	= sq_sysfs_store,
 };
 
+static void sq_kobj_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static struct kobj_type ktype_percpu_entry = {
+	.release	= sq_kobj_release,
 	.sysfs_ops	= &sq_sysfs_ops,
 	.default_groups	= sq_sysfs_groups,
 };
-- 
2.56.0.313.g2479322e68-goog

