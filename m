Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A22056854B
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931243; cv=none; b=Iu9mryRPvDFeVPRrtxx5N+cpvkqWZUw+ZeD1yMRf+5e6WMBeWAg8M/KXxHL7a19WBzFig0mVunX27wcKLFLtgcblJqXMIlFUWpUX8HZBSlm0kaL86RWR32yZjdstWnbv+4oKc5BdtWaQXRBcX9+TVMFoYmcUf5YPxsbuyqGEkSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931243; c=relaxed/simple;
	bh=8Gue2D8FQmaltlyoDbMsbnZp55Xg5g8xWwVlxRKB8Ck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZhZ9rccpqQFjqPt/NV3SCzznOF5tFCJcs5E4/cnQ2HWpUALz9vC9mrJDKxceH7Q1YZH+UpIiqxrhwKY2ktWh0mn+b+8Vl+K35pkKa1GvPpPEnJBIW0BN0PtqrbNNYljw7vrC+Yfq8Em4lhP7rDe3MbIoD8PiQgZcIryIKB4rshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CaOE0WZ/; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CaOE0WZ/"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7841103eec.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931234; x=1792536034; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3db36lwsPWQArDIHzP6eqDHTacNJpd6D0FMiQjZlVc=;
        b=CaOE0WZ/Ah/+lCZI41AoNwlAc+eWMOA8ZX+dduGA0r5TzXIfEiLy3im2Cdc3hp3K/N
         V9JOFZq2CYPPGz2A8sNuy1htjQKnH1M43rzsRrS8HSDE0xq1MMHn7eKDqwLVTydoMe+y
         c+lY7NYfilq7HkJPtFMDjn4EkyTBW7aOeJbRLjqAeYC1qFHjNhkWdlyoqQdFhhOhxX0A
         D5gQFBEFgG7xuh+MJJ6Vo2WsD6qXXgntA+x+sHjCPbggb8WAspKOAz20/qR0jmn4lnR4
         TXLFixuoynz9ZcM/dK1PpKsQCAfao7A6+50OQjDLnaUPD12PzMp6VRllmfEundu7GFX9
         fwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931234; x=1792536034;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3db36lwsPWQArDIHzP6eqDHTacNJpd6D0FMiQjZlVc=;
        b=QujUtyBFLFBj/O7nQd4+Yz20iZvOy+J5LgQzXPgyGgiQ150IUqBy7FV3R34BRafxk2
         QLtJRE7SSrydECxpL9c2l/EnMvW3Px0vM10dfKIZpZUmos1qZ/G/pMQL1c6byePTbZGJ
         5C5hQOIT8Fve/niAnvEV0G7pRC7ce0qZA/ts/QTzAwb0MIVZ/R4FpyyCGRjrXvNJ6tP8
         R4u/0l9tQMnKjZwSl0eCn8V1SVmz1cYgq5aJC3LEN7NsqAfT4+u6WmfwAG8ti2VIr6sx
         QSMfXpe0eu6gZ7noksaBbMR+nfby6QVCSnWH9hLknpYu5C+2ATOSeuUtuMGQM4jbgELu
         VNpg==
X-Forwarded-Encrypted: i=1; AKwUvBzHT7lWRBvDpHGTBdEIAxZ3ioca1todVu42iaHQbnROCUc3Rh//6MTjM+jTCFQsoEcbEjI6@lists.linux.dev
X-Gm-Message-State: AFq9FYKK+KCbVzGb1cXN8p+ZL2Uqd8IZ+1Vjp6b77ilETzAo131FK5UM
	abL0iffNzQ+qt6nygVLJN4HQZ4sKaAbTslVT+jNCpKCAdS6D9ubd7IzDZvT5ViYjTkvsVr4LiuX
	OY2uMbUknvw==
X-Received: from dybmd37.prod.google.com ([2002:a05:7301:1825:b0:351:1da6:c2e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:78cb:b0:351:515b:4e85
 with SMTP id 5a478bee46e88-3537e088bd7mr19706222eec.16.1791931230851; Tue, 13
 Oct 2026 15:40:30 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:43 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-9-irogers@google.com>
Subject: [PATCH 08/11] s390/sclp_mem: Allocate struct sclp_mem dynamically and
 add kobject release
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

sclp_init_mem() allocated a single array of struct sclp_mem with
kzalloc_objs() and registered each embedded kobject using a kobj_type
without a .release callback. Allocate each struct sclp_mem individually
with kzalloc_obj() instead and add sclp_mem_release() to free it.

Fixes: ff18dcb19aab ("s390/sclp: Add support for dynamic (de)configuration of memory")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/s390/char/sclp_mem.c | 73 +++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/drivers/s390/char/sclp_mem.c b/drivers/s390/char/sclp_mem.c
index 6df1926d4c62..f7c161e0d836 100644
--- a/drivers/s390/char/sclp_mem.c
+++ b/drivers/s390/char/sclp_mem.c
@@ -49,11 +49,6 @@ struct sclp_mem {
 #endif
 };
 
-struct sclp_mem_arg {
-	struct sclp_mem *sclp_mems;
-	struct kset *kset;
-};
-
 struct assign_storage_sccb {
 	struct sccb_header header;
 	u16 rn;
@@ -304,7 +299,15 @@ static ssize_t sclp_memmap_on_memory_store(struct kobject *kobj, struct kobj_att
 	return rc ? rc : count;
 }
 
+static void sclp_mem_release(struct kobject *kobj)
+{
+	struct sclp_mem *sclp_mem = container_of(kobj, struct sclp_mem, kobj);
+
+	kfree(sclp_mem);
+}
+
 static const struct kobj_type ktype = {
+	.release = sclp_mem_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
@@ -321,36 +324,40 @@ static struct attribute_group sclp_mem_attr_group = {
 	.attrs = sclp_mem_attrs,
 };
 
-static int sclp_create_mem(struct sclp_mem *sclp_mem, struct kset *kset,
-			   unsigned int id, bool config, bool memmap_on_memory)
+static int sclp_create_mem(struct kset *kset, unsigned int id, bool config,
+			   bool memmap_on_memory)
 {
+	struct sclp_mem *sclp_mem;
 	int rc;
 
+	sclp_mem = kzalloc_obj(*sclp_mem);
+	if (!sclp_mem)
+		return -ENOMEM;
 	sclp_mem->memmap_on_memory = memmap_on_memory;
 	sclp_mem->config = config;
 #ifdef CONFIG_KASAN
 	sclp_mem->early_shadow_mapped = config;
 #endif
 	sclp_mem->id = id;
-	kobject_init(&sclp_mem->kobj, &ktype);
-	rc = kobject_add(&sclp_mem->kobj, &kset->kobj, "memory%d", id);
-	if (rc)
+	rc = kobject_init_and_add(&sclp_mem->kobj, &ktype, &kset->kobj,
+				  "memory%d", id);
+	if (rc) {
+		kobject_put(&sclp_mem->kobj);
 		return rc;
-	return sysfs_create_group(&sclp_mem->kobj, &sclp_mem_attr_group);
+	}
+	rc = sysfs_create_group(&sclp_mem->kobj, &sclp_mem_attr_group);
+	if (rc) {
+		kobject_put(&sclp_mem->kobj);
+		return rc;
+	}
+	return 0;
 }
 
 static int sclp_create_configured_mem(struct memory_block *mem, void *argument)
 {
-	struct sclp_mem *sclp_mems;
-	struct sclp_mem_arg *arg;
-	struct kset *kset;
-	unsigned int id;
+	struct kset *kset = argument;
 
-	id = mem->dev.id;
-	arg = (struct sclp_mem_arg *)argument;
-	sclp_mems = arg->sclp_mems;
-	kset = arg->kset;
-	return sclp_create_mem(&sclp_mems[id], kset, id, true, false);
+	return sclp_create_mem(kset, mem->dev.id, true, false);
 }
 
 static void __init align_to_block_size(unsigned long *start,
@@ -368,8 +375,7 @@ static void __init align_to_block_size(unsigned long *start,
 	*size = size_align;
 }
 
-static int __init sclp_create_standby_mems_merged(struct sclp_mem *sclp_mems,
-						  struct kset *kset, u16 rn)
+static int __init sclp_create_standby_mems_merged(struct kset *kset, u16 rn)
 {
 	unsigned long start, size, addr, block_size;
 	static u16 first_rn, num;
@@ -394,7 +400,7 @@ static int __init sclp_create_standby_mems_merged(struct sclp_mem *sclp_mems,
 		goto skip_add;
 	for (addr = start; addr < start + size; addr += block_size) {
 		id = addr / block_size;
-		rc = sclp_create_mem(&sclp_mems[id], kset, id, false,
+		rc = sclp_create_mem(kset, id, false,
 				     mhp_supports_memmap_on_memory());
 		if (rc)
 			break;
@@ -405,45 +411,34 @@ static int __init sclp_create_standby_mems_merged(struct sclp_mem *sclp_mems,
 	return rc;
 }
 
-static int __init sclp_create_standby_mems(struct sclp_mem *sclp_mems, struct kset *kset)
+static int __init sclp_create_standby_mems(struct kset *kset)
 {
 	struct memory_increment *incr;
 	int rc = 0;
 
 	list_for_each_entry(incr, &sclp_mem_list, list) {
 		if (incr->standby)
-			rc = sclp_create_standby_mems_merged(sclp_mems, kset, incr->rn);
+			rc = sclp_create_standby_mems_merged(kset, incr->rn);
 		if (rc)
 			return rc;
 	}
-	return sclp_create_standby_mems_merged(sclp_mems, kset, 0);
+	return sclp_create_standby_mems_merged(kset, 0);
 }
 
 static int __init sclp_init_mem(void)
 {
-	const unsigned long block_size = memory_block_size_bytes();
-	unsigned int max_sclp_mems;
-	struct sclp_mem *sclp_mems;
-	struct sclp_mem_arg arg;
 	struct kset *kset;
 	int rc;
 
-	max_sclp_mems = roundup(sclp.rnmax * sclp.rzm, block_size) / block_size;
-	/* Allocate memory for all blocks ahead of time. */
-	sclp_mems = kzalloc_objs(struct sclp_mem, max_sclp_mems);
-	if (!sclp_mems)
-		return -ENOMEM;
 	kset = kset_create_and_add("memory", NULL, firmware_kobj);
 	if (!kset)
 		return -ENOMEM;
 	/* Initial memory is in the "configured" state already. */
-	arg.sclp_mems = sclp_mems;
-	arg.kset = kset;
-	rc = for_each_memory_block(&arg, sclp_create_configured_mem);
+	rc = for_each_memory_block(kset, sclp_create_configured_mem);
 	if (rc)
 		return rc;
 	/* Standby memory is "deconfigured". */
-	return sclp_create_standby_mems(sclp_mems, kset);
+	return sclp_create_standby_mems(kset);
 }
 
 static void __init insert_increment(u16 rn, int standby, int assigned)
-- 
2.56.0.385.gd3acb90ef8-goog

