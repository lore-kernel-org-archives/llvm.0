Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140768;
	b=phDJsBhkEvFzVvjrAFXxOhleyiNwx44XWIOxsK4cYHfi7jfYGSn+Y9Gq7CxUHwKPwSm2
	 Y1yvJuZxyHl0EEJDIHu5FvZVfkF4tIhxtXk7L3/QYoF8YavsZlfmgum6/NHkOnZcC2b5b
	 UNKDhSh8vvWVdYAv2YhZC313eKvzWq7+QEvg+VqaMX6Kp8wRDaFuHLO2vDKuAiMFhVWd7
	 SwNLpSGERp57q9WwWvaylgZ0kY65I08xGjrkp2Tw6H4sYp//qHb2Cdhit+zr2YASquDQe
	 Vvwa74eYWKcH2OR4mroewix3cOIJl8tcIqAKvUez0x7lyD5kHRE4A1WbrsjT7faUD0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4zou/7CSV4h/YwAlF7A1OL9kEnFb2HIoLHCAQS8LrD8=;
	b=lL6MxCo0gMLA6HNnWzxOQpnfmt3uFikpEO20SNzWTMh81LnqS1Zk4JzGg4JZhKBwRMkn
	 +YUWS3xF5rjH6MtGMlnb5t06Ah11ljcR/vzvG+jn6XBBkppqPQO0QzSXhVNNbdEDZYN9q
	 4LMv2FkZWNbzIqoA8eiMKReu+7QMeVgNNKVB07BkF8p/o6XOXYQQ7F/wXt6NvgeKAmjPe
	 NDbIr9rJWazRsUSptHqE5ZCdG/BW6Phev9KWU7c0Ihp3GsRdJNZOLGg8q/gOuKOp3sWuk
	 ns3G8E1zOsE2HEQBw8ocGrzLb0WA9FKDhWlpmLBkOna4JhqtcITeq3r3DkfQGdMZKzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FUdgB38B;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F06B60A382E
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 22:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F06B60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FUdgB38B
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1025600c88.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140767; x=1793745567; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zou/7CSV4h/YwAlF7A1OL9kEnFb2HIoLHCAQS8LrD8=;
        b=FUdgB38BIOt8V1W765ijEyVAUzNN5JjGfNtnPR1irAvs/uWy/qSKDXK3KNJGLzGYXb
         lStqDta+kKWc6U4dKmtLUjzTVUXaKcQa7K35q9/uKs/JpEgVmSVMLMkr4T/IVlySki+B
         U3TSkv7xyiwWQQwgqNbsKwyCf+0qC63YIQhjW2D9dolgLxVSrdGgyZJDDT8RVH65pm9S
         D1p02DGkSflsNKzlA1ecIKVGRHqA/mFyiaCKalt2A+O2lqP3XU6m64GszgIwrR7D4Wux
         Syq32UNahYJJZ8fgC5/FmT2sOS77AI0Rqq2Fi3eAK8/4o0Z3N13ymPFjwaugIh+NWtdH
         qMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140767; x=1793745567;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zou/7CSV4h/YwAlF7A1OL9kEnFb2HIoLHCAQS8LrD8=;
        b=xrq3u7b9CmTi3ixSQTHV66a64RisG52oDYC+1UUAScgq1dyloECPzECe2kbe3Uyiti
         3tbR6n3/7G1VbKnTsKqNCgLLorwqBXmJ+DHoWHS2NgQc+q8BPtb5msTpWltMW5Lobvs9
         N44Rr/jfP6x3RztCP5zUgViFwUUBdS2V53ckvgLWXc4Hay/bP0Iq6aT8KR4PRZW9boOE
         vs7HqI9n40Ajn29p8+TIR8NBpC4LrvtpRMdnlGUH2QqN8Y4GiVUyxMNaCM3KVRonze/k
         Tp3UfEeuKgzTFZY+6Kp7z+U2Heu4HdhsjIKLxzlCtkAQgo4iuExCffab8TL3mAa6O+DS
         jp7A==
X-Forwarded-Encrypted: i=1; AKwUvBxgsNOikn/ZEX9oskgr/p/50KrzAGBbZ+dwT+PViq9Rs5e6Q1B6FH4/DwAIv4LFtyfVCR2o@lists.linux.dev
X-Gm-Message-State: AFq9FYKmWELmfOv2PtAnJKiLv/mBaM6LOOYzrp7IgO4jDDxCJ2yCArA0
	LIsDcl3d8vxikGZC4gKn4fLZr2gAc/7/xO4U7OnNro+hUiHAPQbLnZsVFU6Erqm1vlNKBZuQxCc
	lZI38srqO3Q==
X-Received: from dlbqq10.prod.google.com ([2002:a05:7022:ed0a:b0:1a0:a0b4:204c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f115:b0:1a3:6040:bf78
 with SMTP id a92af1059eb24-1a6cc34d07bmr917417c88.11.1793140766453; Tue, 27
 Oct 2026 15:39:26 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:41 -0700
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
Message-ID: <20261027223847.652884-7-irogers@google.com>
Subject: [PATCH v2 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
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
2.56.0.313.g2479322e68-goog

