Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116348;
	b=qmhlPywxvCeI/zqyDYUzv0h+9IHRzisphWqGTpLJVGS9Nw/CxysmnBZxd+7gs3XN18uT
	 T/+Q80HWVlwwJLux1uZXMBGe95x6Y22vCUK2VWZwAeQC53Fw/Ihjme2/Sx8bIn1ZPcpth
	 pvE/I0CE0ah4bkshnBF6Z+G8mJ1QVTpfvUgVEabNKxe6dn+x4etEkVJwts+I5ciu37qqu
	 V/o9jeSttBGrxS48cl+RP2ZU1oj8F4qHIYZlUhhX047JoknpQJV1PFwQjCTHJmBu9ipV7
	 pybz0lpHc0bxhSoUXg39mGDdNHYZ2Wbngqdv9KkgtbB2fBctR5C9O+N8ttxlpLUqsxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kkWfFph3Jhdo1iVdBmUApUet/72n0u945LBk/dYhnBA=;
	b=gVrT+yL7FXeGezUqQUiiSdKZjaKVA62LM+7CLBj25IUG4ICfwMyr0uu3QJCvJDsHrof2
	 KKvx8zG5+2/5tAFq13wbh94/aom6l5xKwbI7/axDrKwKFy6ZAmquUoSt3hAo3s5TeC9lV
	 mam/Yn9hb9IECQdh5i+yZaGqzuqGuMx461RvNU6EM8V6SjZgtXvocSCpFXczBikyOA8Nu
	 KxDJCFRVXwyEUFXL+BxpmwiHuzH85yaYrqPg5TCRr+/7y2ZkvtPJA7viEubbqVFcOkrFp
	 RGXD6G+8vfje8sQmGtPfD5VHlWVU2xbBYYq3LObcDkl4QQF8X2ul4uhrHjYTzva9loQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jSftEyG0;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB91D60A2604
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 19:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB91D60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jSftEyG0
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so72491eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116347; x=1795721147; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkWfFph3Jhdo1iVdBmUApUet/72n0u945LBk/dYhnBA=;
        b=jSftEyG0m5nPeJykd27y20yPbtL1hCaH4gUwPPOSr3iJmsU3ipgpMzQ8sTT1E7Xvrp
         0xklGZIeIkYtps1Y/5AFhnSmkdpseruT7Npp2YkRo0AFRM8J31WZylZzJCy4CqTv8CXq
         X4cyqeRbDK8gUS8v3NmYf5dtosTEFsCYk9x0lFp7anFntS9QqK9KOLtsEpC8acJctUkd
         4XSwNERO2JVLzqg2cFwm3VzOCdlRfmw7miRIs7eKhePXmNBS5vbYigf/XgQlBXJZRyyY
         nG/VG07tSv7tA7cW30NmgsRzSAi9wB8p/8ll0HxUCxkVs+pMYOMl6lwxLbJHjTyW6fc/
         ikbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116347; x=1795721147;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkWfFph3Jhdo1iVdBmUApUet/72n0u945LBk/dYhnBA=;
        b=eDv0cgEqxs2E0Ts26ga3fVfxBtloykQH76ax/h/OiD+ZRzDQoPy/l5eJtJoUnXW6Wr
         JSmmSAtZqqUzouUidMmpBc/MtS8psSlBfXqTkD+UpcBGdNxpGsLi7sHE5a7VVE05eK1S
         mMjfFV6EhRqqM/m4n+C8rA13jNXk+xOK5ToL+mAVdwakXkAboAER7b8s3j9SBV7gy7gw
         ucpQV3Rz03dc40Lbi9f/AQLuMwqh//n0gbNxBXPN6ZZ3P+KYgj1RJG7gI9gHcwBWiC58
         5vqLhjJ0D/doqsC24e3tiiReIUF1nxcDGpOWeaZYnSvkdBRM7CLvG0/wTvMzbTQ0pD9v
         j2bg==
X-Forwarded-Encrypted: i=1; AL+hErHKGFY8x2KQZVxxrm4yZ54T9tz7cv7BPyY5bDLkXBtidHvtWy8nD8PL0CBMRdTxdMtf0YhP@lists.linux.dev
X-Gm-Message-State: APuU4Z8j50W/KmjF1VEGO7OkkqmUoJ8Tb8ENd6b0XwoxvDVvSZMbHMAq
	a5Q8naOQht7zTlC8bmcVaiUA0TIUaRnR5dorBFxH11y9WM0wkX2fVAXyLbWISR41naWEhdMaOk9
	BBe6Zat7Y5Q==
X-Received: from dyvo18-n1.prod.google.com ([2002:a05:693c:41d2:10b0:370:f640:2508])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:820d:b0:36d:394d:e690
 with SMTP id 5a478bee46e88-38570b34f2fmr260461eec.40.1795116346621; Thu, 19
 Nov 2026 11:25:46 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:15 -0800
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
Message-ID: <20261119192520.1983406-5-irogers@google.com>
Subject: [PATCH v4 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
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

Export cpufreq_dbs_data_release() and initialize .kobj_type.release
statically in the ondemand and conservative governors instead of
assigning it at runtime in cpufreq_dbs_governor_init().

This prepares for annotating struct kobj_type::release with
__must_init.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # cpufreq
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
 drivers/cpufreq/cpufreq_governor.c     | 4 ++--
 drivers/cpufreq/cpufreq_governor.h     | 1 +
 drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 02bfd46543e9..146a2353b1a2 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *policy)
 
 static struct dbs_governor cs_governor = {
 	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
-	.kobj_type = { .default_groups = cs_groups },
+	.kobj_type = {
+		.release = cpufreq_dbs_data_release,
+		.default_groups = cs_groups,
+	},
 	.gov_dbs_update = cs_dbs_update,
 	.alloc = cs_alloc,
 	.free = cs_free,
diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
index f3bd3dbe7c41..f8b5aca09b6b 100644
--- a/drivers/cpufreq/cpufreq_governor.c
+++ b/drivers/cpufreq/cpufreq_governor.c
@@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
 	gov->free(policy_dbs);
 }
 
-static void cpufreq_dbs_data_release(struct kobject *kobj)
+void cpufreq_dbs_data_release(struct kobject *kobj)
 {
 	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
 	struct dbs_governor *gov = dbs_data->gov;
@@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
 	gov->exit(dbs_data);
 	kfree(dbs_data);
 }
+EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
 
 int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
 {
@@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
 	policy->governor_data = policy_dbs;
 
 	gov->kobj_type.sysfs_ops = &governor_sysfs_ops;
-	gov->kobj_type.release = cpufreq_dbs_data_release;
 	ret = kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->kobj_type,
 				   get_governor_parent_kobj(policy),
 				   "%s", gov->gov.name);
diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
index 806d8fb4dff1..1026712bb79b 100644
--- a/drivers/cpufreq/cpufreq_governor.h
+++ b/drivers/cpufreq/cpufreq_governor.h
@@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
 }
 
 /* Governor callback routines */
+void cpufreq_dbs_data_release(struct kobject *kobj);
 int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
 void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
 int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index 9942dbb38dae..7386d043c665 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -374,7 +374,10 @@ static struct od_ops od_ops = {
 
 static struct dbs_governor od_dbs_gov = {
 	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
-	.kobj_type = { .default_groups = od_groups },
+	.kobj_type = {
+		.release = cpufreq_dbs_data_release,
+		.default_groups = od_groups,
+	},
 	.gov_dbs_update = od_dbs_update,
 	.alloc = od_alloc,
 	.free = od_free,
-- 
2.56.1.708.g77570a6a1d-goog

