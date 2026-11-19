Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116359;
	b=meQvW32Jcam7oNArFKCIRawh9JV/uesoGKEUPyLbDkxzk6OVnSLSMUA4/enIUuLpip7M
	 FU3dzNEQuMZU4p2eul39YU1HbPwn/3BKxNMN3qhn8XKOh3gSTUiRRGTYIq5TuvrmvzkZr
	 f7hRkpKRrWyjCucysBYx+Awxre9V8H5OGujeVdUDmJrV8rzooSs54BSYrh06VhXdjIZ1A
	 GgX9kJgSainKQgghOeVvkpm4Q2CPtreKLFXIEU7HepxVw/JzlnA6S12lHyXf8tYQtgy3z
	 FaA1MGXxnIh7+vQdCk9hFwmsF5JvDteCXHytIgGYGKAdfYrPt7AVzufSm8NpSZCFo6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
	b=IR1jdw9YHyB3PkJW1SioF/7ikkztC24o28ZT09M9SI9YnzcdDDV1S9UqmHkhSzByLJ7D
	 RoUVGJ75KHBSQJ6DDaF4AMVIVDUDk2cbNr+sB3XsWsUagtFSzF88t1B6RxI54OP67s3T5
	 Dqpzjy+VVEhlY8SFnK1L4tgNSA7w779EyAPNYacSNbaociEdNWqFeYAoZZQD2GOqdSmg1
	 W3fTZ3+Dj9xP0eAMwZiizWOtOv10v1tOqVNquO0z6SCqOWIE0jVXN0wq03EWMcPvhInIz
	 xL9eWg3DcGbZkc6djfs7tTZeP5KBQSuhRbosG/69Zg8oeOIk1MMTsYRdtfhNJMAJsZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NliGLqR3;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC760A262E
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 19:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDC760A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NliGLqR3
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a064f294cbso112241b3a.2
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 11:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116359; x=1795721159; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=NliGLqR3pByLlVP6O2fHa7Esdt5sLj4kLONzeh7NpjW4XDN8iHaY7YyiHv/iiXhcl8
         1vmjzf28LEu7sOrVmVdhAAMOdxmHIrJAniEbaK2Ge4RzC4zsmEQFP78txij4gXkjPAQC
         TzJDgSxtnYJExMaAUoxKDFnheMSLrnAktKlfwa/hook4Yvj4jy9815ZGB0hFOVlTMDk0
         pzGV32R3Udp884DOwyGinuqizr8FipPEg54oOFGKiD4UFFRw7sESp3fygaF1AsL1dihA
         mAN6DojcvDfaQlI6LwWYMwIFyHUuLaDuCecJYivnNtZtFmuBxs1Qi82HyhU8KCcnpF/p
         soTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116359; x=1795721159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=Lov/rzlzBo4A+bAn9FgZUjC88wETgCy8mdXw9hpKuMCYcBiorxQf9d8jFwhANuvgcV
         ZwAOEoKkl3I0MczM32A7iZ5cE3tN/GxG3o0P7FEZ1wmWHcD9MyXCBa3Px7pn85Z+5myF
         mGMqEkyJhcQApb6IJnXup/EWue/7ICZAe/zkPpFnB8SkauNzlyOxbnM12U1Tlm5Hzj68
         yyBF6sq7+JILhFoQemRJvtGbjKC+PFcRNGsBNWZBZMwoygCXc8IsRHJuelgjhzlt/U4s
         nmB8ZkJvh3UoU0PEdTn+fcMiLTnvpBYXuxWNusQHo0xYtwplrVm0ME96LqBrjbhAHLBD
         ixsw==
X-Forwarded-Encrypted: i=1; AL+hErH0UAnhOuyhstLWPQh3zZP/ehi2326LpYmYVKnngoxrSRqNrF5+Q8XkVyEJWGpo0klE6zxe@lists.linux.dev
X-Gm-Message-State: APuU4Z9ey9QUgHlJLUGSTf3F/X8gRF1II9Ba2XBXB+oT4HQskm5VNsoj
	snQA1u1ZGelSN9Po+Zuvn8UdQ1QKjgTW0PqYzcYjpPDBhC+gF1FTbbMZUdkMGkUZc6BZGXBNX0R
	x1cnY+Z/+0g==
X-Received: from pgjk11-n2.prod.google.com ([2002:a05:6a02:81cb:20b0:cd6:1fc4:6199])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9191:b0:3fb:1bfb:ff29
 with SMTP id adf61e73a8af0-4014e74d624mr589862637.69.1795116358583; Thu, 19
 Nov 2026 11:25:58 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:17 -0800
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
Message-ID: <20261119192520.1983406-7-irogers@google.com>
Subject: [PATCH v4 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/xen/sys-hypervisor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index 91923242a5ae..0e8a2cd69fd6 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops = {
 	.store = hyp_sysfs_store,
 };
 
+static void hyp_sysfs_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type hyp_sysfs_kobj_type = {
+	.release = hyp_sysfs_release,
 	.sysfs_ops = &hyp_sysfs_ops,
 };
 
-- 
2.56.1.708.g77570a6a1d-goog

