Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116366;
	b=OkMf316eBT0WKTmN69b7VDlAQMfPxCETqaXhk8xksta3v7cjHEADTH6QDu8cqU0+dMr4
	 FHyeNe542VwyPQYK/Pvqr8DKl6PXG4eA6qT+AA/mX/ot03lpKzLyQotyhLZggaR2Hueye
	 eSdC52S+8ZkLkjyG7EZHmv6tK24/xDis/7BW6qRDI6pM9NZM2FK+GZ+SROMq05STdxiJn
	 ZQ+wH2L3rShrgyLzinMamaRM9hn+fqVet7bEjmDkA1TiqDuxrV/GPYAwuNfoOBwda7wiv
	 J8Vwggju5jyrBEv2VapYYc+m2SpBu7zJtaIO7i8pOHuzrbeWlb2XFhwHKCEhRdAHKLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CSDEU43/2Gwf+VbjlCClZWJ4rTvHhhRb4YqVFYZr7ik=;
	b=R9zsiaK71jdY1Jz1dKdPvmvC5xIwWHtuDGthsucDlK4EaO20jjWFr2InG3TA08LIL6Gy
	 EAyN8OJuF6D1tO6XGwgo/T4/3sgICJnbCqYthK/3wWxyPQL4z8d4ROZerCoEREIg+UUCG
	 kWZpZf/+VexNGN8uC2vCWqhHP/GaS0VL1qKl3m8Z4MuCddIJ8c/J0BCQsH+BD/dBHQnRR
	 ey9rUrdoYTdHQYm4FYF8kNND8Oc44puDioLs2g3yliU95WTebAP9wSOdRkMmjcMcFxsnF
	 Zo+PXv66gZNk7iX+pbhu5GFARBQ2gjxb8EWg/ZHpLYGLEWZJP92eRDnfCicBYRC+6Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gY86kYgS;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C9060A2601
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 19:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C9060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gY86kYgS
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso171858a91.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 11:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116365; x=1795721165; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSDEU43/2Gwf+VbjlCClZWJ4rTvHhhRb4YqVFYZr7ik=;
        b=gY86kYgS2PkhFb/9Gs6/XUd8easSHPNYgpphvmK3mh/weZRUrK4LQ8v8v8IJfHfz7k
         mzjBM3yzmST/vyNX7fQZL0deO/r3r8qv/lyh7HZ/EWG1TEuG/GXidYkHaurdjwx1ZF7O
         q24X8wwMC/Cz+/UcOOjaPYSKHWGJ8pRSS/cSLH5i9RSJqJZSgkboRdbvfZ0alcywoIy1
         KIS/IazRrTSq7XBUXQWqa5X2KBp2IPjbXMylIRj8oUKyKvFE8r8S97RtLkpmhEcJ3rOf
         2fR3xzSTsiPy5w4OeCfvhLqH/5iutUoDoYFQ9fSX+w7JNefxA5P1dJbcNFICjwP4ovW3
         KvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116365; x=1795721165;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSDEU43/2Gwf+VbjlCClZWJ4rTvHhhRb4YqVFYZr7ik=;
        b=jIl3kpHdtALsIJeL/nTHiJE1LhwWBcfh8AgSJNu58Rw+cOfrAe8L9fF3XUReDri9ds
         KAhJ8BqOmkSHXf2+NiE8iVt9m45KDIRQBxGsE1DU3anO6uM0GYvh3Uw2A6FklTMu6URn
         f4OdYR+IlUdXY4nX4RfbNhxhYhTbtNRS2lgXMEAJEFOVh0rWE0z0O+lpixVJ/EOckGTR
         SZMcqLOG/LvHy19jJTnYtUmXI4wIU0I/AK0dj9CookiFkMKxSnsUhXQyIHUXHhdqN9hV
         V24OAHk31rkOVGuSSye//jHnYzqWIQi2zEdMa0zYUS5GrbKAg7pdhNDfIo9GYzLuuQrd
         CXFQ==
X-Forwarded-Encrypted: i=1; AL+hErEUnspNQ86Q6QrbYfu5nuNCdHpGtERTqTaa76VgUcAquGFjDCljIiK40MeGqfzqRSPYlMDK@lists.linux.dev
X-Gm-Message-State: APuU4Z825AY+cl5qF6pNAGjWWhQ5Of8BHSn4VdnnaSSlAquDfbEg0f0c
	4gIQ4DXPvujrOGL2KW9q57nLVlcK0x9geDifsC5L0IRL4Gs6qqYtSAerunKwpPD3lyzo1BB2Sqs
	NJ87A7LFT3Q==
X-Received: from pjbsk16.prod.google.com ([2002:a17:90b:2dd0:b0:3b3:ada0:c008])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c03:b0:3b4:1bf1:988f
 with SMTP id 98e67ed59e1d1-3b41cb138f0mr288962a91.54.1795116364835; Thu, 19
 Nov 2026 11:26:04 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:18 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-8-irogers@google.com>
Subject: [PATCH v4 7/9] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
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

ubifs_kset was a static struct kset using a custom ubifs_ktype that
had no default_groups and no .release callback. With
CONFIG_DEBUG_KOBJECT_RELEASE=y, unloading the ubifs module while delayed
kobject release is pending causes a use-after-free on the static kset.

Replace the static ubifs_kset and empty ubifs_ktype with a dynamically
allocated kset via kset_create_and_add().

Fixes: 2e3cbf425804 ("ubifs: Export filesystem error counters")
Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/ubifs/sysfs.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index dbf967dcf26e..e20931e3a62f 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -80,13 +80,7 @@ static const struct kobj_type ubifs_sb_ktype = {
 	.release	= ubifs_sb_release,
 };
 
-static const struct kobj_type ubifs_ktype = {
-	.sysfs_ops	= &ubifs_attr_ops,
-};
-
-static struct kset ubifs_kset = {
-	.kobj	= {.ktype = &ubifs_ktype},
-};
+static struct kset *ubifs_kset;
 
 int ubifs_sysfs_register(struct ubifs_info *c)
 {
@@ -107,7 +101,7 @@ int ubifs_sysfs_register(struct ubifs_info *c)
 		goto out_free;
 	}
 
-	c->kobj.kset = &ubifs_kset;
+	c->kobj.kset = ubifs_kset;
 	init_completion(&c->kobj_unregister);
 
 	ret = kobject_init_and_add(&c->kobj, &ubifs_sb_ktype, NULL,
@@ -139,18 +133,14 @@ void ubifs_sysfs_unregister(struct ubifs_info *c)
 
 int __init ubifs_sysfs_init(void)
 {
-	int ret;
+	ubifs_kset = kset_create_and_add("ubifs", NULL, fs_kobj);
+	if (!ubifs_kset)
+		return -ENOMEM;
 
-	kobject_set_name(&ubifs_kset.kobj, "ubifs");
-	ubifs_kset.kobj.parent = fs_kobj;
-	ret = kset_register(&ubifs_kset);
-	if (ret)
-		kset_put(&ubifs_kset);
-
-	return ret;
+	return 0;
 }
 
 void ubifs_sysfs_exit(void)
 {
-	kset_unregister(&ubifs_kset);
+	kset_unregister(ubifs_kset);
 }
-- 
2.56.1.708.g77570a6a1d-goog

