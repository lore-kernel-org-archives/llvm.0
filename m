Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177593;
	b=eTph7tKWlrEjjprWrw6PGodOhJ5juabYRRlA3sGCj5wnQsPRBV2fObyE51bf9b60XW6z
	 NRShQxth9Mgom6WmxR5w23TbzOeubwL/uhMmN9RWybUcalRhltOr9odSRfnUFkTlmnm5r
	 aLSXXAnei8LuD5F36Dr69XTdKJQrtZp9xvoGT9CLYV/gM1KasB/zDnLliYc5cGXxTt17+
	 uo3EyguanvZpLgPat5Ow6vmwRssiTR7UgyoD2vPsxSISls9eTZkbSszxViSyo36BWmp9p
	 VfN4b8FCytW+T0pz2r73DmG1HogrX7TnWBvTackH7bKRke5cU0b6pG/QCqWyDrUhiqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=noN8ey05POi7MkRY5IldCk9pju5ZMENfN/kneqqJ3/c=;
	b=ff9pDh1WNokZiusuIhzjpsZOUSWHxK3Dh/YAE5tJyj3NkDVBwE/JguEc2m+S476yizDY
	 73Y2/BCb1VOFQRzNAQ8/g4HyOKgvFPG5o1bQn+x96B7pwYvHe8ZXWijEqCs/AZ/NMOGA2
	 HbpGlWIsYIaxY//obq3kfQzw3dmoiAHxeaYTL30Goup3qD02V3v41ohUe/VWhSv4CCkfP
	 BW7Way21UkkYiCPT5teIce44oInhJWspHB0yBefJaUf+SQn2ng7Dkl+81d1tC3ngqosox
	 QCxtx79VZwsuCEO2FyfBG8lfq/g0ajBQXeT5XpIaQ/xc+QUgOvEsovBgTLHCsWyODjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oRwpm0Ae;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E9606D836
	for <llvm@lists.linux.dev>; Sun,  8 Nov 2026 22:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9E9606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oRwpm0Ae
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso849398eec.1
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 14:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177593; x=1794782393; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noN8ey05POi7MkRY5IldCk9pju5ZMENfN/kneqqJ3/c=;
        b=oRwpm0AeMBeuz+uwk/SScXYdUV9FjfHSkaA+8EymCFnKPpZ+8uBypl9pX7mf1XQMyJ
         x27Js4Yde77wTsomG4sUPRnlcsAvIiwdHvJ+Bn47KtEz2SeyuOq81ujcpJdauWUbVDcP
         ex20Sn93Q0DYhXIPHUa/Z1KzEPiiBP6sOuCXFRq8PIb2NbG9h/4aicL+k7EMSHsPhwrk
         JKJRXF9Kdm3iFAXs121DCGjYsyCtJDEL6ThzN0RyPXZyEPzwCDw8qz6Z5WCGRHsUBw83
         DQoRJwyE7usHhHQqGQFr5zu4BDx92KcdfxS3YYxMNav1zOQAW230wXhXo7YiB7kYZ7UK
         3Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177593; x=1794782393;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noN8ey05POi7MkRY5IldCk9pju5ZMENfN/kneqqJ3/c=;
        b=ZFeB5YfGhZ4NJHpAk1J4SRkD/psFSBMstzNoTeD6pVQJD/H+oXulOrxajKCIe1V956
         1MZsoSyzA2vc+L8esOoUTOzXJzs26cgV6/97zYrbVH1qn9QESMDv2OjfUL0PFmsw2aFE
         lca8jrJfxTPcP+LiVlS+jETdRa/t+MiqBH89N78yNi0EGfAQqn9iIr7tuydMFNWHKuw7
         PechvvC4YWnfOnN48sZOZpVrBJWVqEHxbkd7OWcXOIMHwtj4i/raMOOvgNYNJ2zEF+Vk
         ly6UUS7OtRDk4h10UOR6NdCxJuZA6mrSKHOAHzxRGqTuE9PAwEOSimH90ABq/9j5tFLd
         RP2Q==
X-Forwarded-Encrypted: i=1; AL+hErF2TMiqNMZlccueDnRvRCYeLhD6e1HyotRovWsPedNyx8xBowdWMPGOARtMbtbH0wbdYTnq@lists.linux.dev
X-Gm-Message-State: APuU4Z8yB4jbCqfI56+kNuNNaE7D192sjWJ3DVPbQjQ5u9/ZulSY22/e
	CyYW5AANBTmEXXhu43oPHctK/555iGWO+TPK8ET3AwPFFK8j5ZC9Mkk6hJHf6mx8+iq8kd63vul
	RGqcROH/gwQ==
X-Received: from dlam9-n1.prod.google.com ([2002:a05:701b:2089:10b0:195:beb6:14cc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:28b:10b0:1b0:430d:d81c
 with SMTP id a92af1059eb24-1b39feab6a4mr3897188c88.25.1794177592505; Sun, 08
 Nov 2026 14:39:52 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:10 -0800
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
Message-ID: <20261108223913.3624571-7-irogers@google.com>
Subject: [PATCH v3 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
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
2.56.0.455.g6c5a503b38-goog

