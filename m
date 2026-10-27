Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140773;
	b=GYpRnn5vLMAl5NbypKSpqeGt/oaoTRmU2uSJL+wT4lewCYWIPKPRUrt+PuUOAnrGXRTG
	 HUdrVbFezIiXcleqOxrwc5/2pKcSkqbjYhqa/tUrcB/WnuPhCYuXJ+VKXFWlesJscVTxN
	 BgR3pC9Hx83VcDtCHVo/T5sg0mB/Agw14zmeQybhuxTRNP9HgWzMb2fA2VuinxccLhsFd
	 aGqFjoDVGPfBRG0/DALMkWQfbD75FCUEoDeNM6J5bdZAfz2U0oHJD2c+Ffz3ckOUfhqHM
	 Cshy5q7zYCdRjJg55JEgK97M/HnuRZWidoTTLxYeBjE8hVu2Hq0KraMrmrEXFT0mgzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MTMJFM/nqHoym7HFBiG90k6OXEIlh5WHZZg+1coUz9A=;
	b=Izx5BpzIxRQmByXi/ZphSHYz69CXhqKa1DofHRwyN35/pOlJTPqcsMROXg7Jka/gSXJ8
	 9O/OIB0fGxcpUzxzCkFhzcFZXXC7TKkTDigpimZFEV6b987/QosFCsXPVE0AK9z7iTz/b
	 DXJTXujf902/nrE16pxtp66jdhbDmbxwPoUgxJ56viMK5cxd5PY8m9ih5agbE1SiAcuwz
	 EZWfibB60gzeKYV7aVlObiUQPO2+WXKEpUQ8LA6xJXa9StY9Bqtjh9x576dZMgL6srVjL
	 rry+Ds9bcByCIQOWAFvvlMwF25kkjn3UUqXOV6jvVqJN+sEAVg1v14LDBbedPCiwXtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QmVA3Hs+;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502CA60A6F54
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 22:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502CA60A6F54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QmVA3Hs+
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-19dbbe4b1d8so296855c88.1
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140772; x=1793745572; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTMJFM/nqHoym7HFBiG90k6OXEIlh5WHZZg+1coUz9A=;
        b=QmVA3Hs+8jog+rCMoc+3HlUChJWSFAiyL+Ks3y3YFTNjfJ62ox29Qtz/iIru7tiIo2
         H52EuCbvyCkbut4MWkGsVRKCkk6bMM35lK8Y4WeTXb1j2PvGQV/JrvrAfsrCnSRLAWR7
         LKZhKVIToNlM180PetREe2048OsYhzRWw4sEc/6gHCDSvehPL5vOXq7qk8bNkT4eeSt+
         C13gY0OcePqDuFY7qm17u05hke74pmOY3fj7oUM6491EN5/t5OuUSRpppZplSPa9dflq
         WxNF0OwK7umkXtmNLuKqhUqJeV8b8+L8+IWGy3V9HEHTo/HC9uUm1VMZsJMCkmyNhmiF
         sHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140772; x=1793745572;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTMJFM/nqHoym7HFBiG90k6OXEIlh5WHZZg+1coUz9A=;
        b=fi6mJIdcqBsdQ3EdyBz7/TtbWovOA2Ykx48SnP/hpOUUiyJV+4/lKdWCvkoJkOGjNw
         N1f+Loq1/tKIC4CPm96RNWLIGU4yZl9I7j7o/Iw3xE1bFTk7oSPycK6ceJoges906UqU
         SFSJdRR8cr8CZmNQJiThtVANmP4ne+GFzlovnKNPhdeP5rRpSU85+zja3d6QIZV77TLF
         Fop9evrz5qNjid63adIupg7NIXb4Qnz3G/hA4AqAzveV6XhIq7f1krwjCmbzpdx4uojX
         MpHXmY6iOPTG9An5b4IYp4rNAHfdVgfPpIE3oiK42+y2rh1w0ZX15E3z4NrxET49NfTG
         OTwg==
X-Forwarded-Encrypted: i=1; AKwUvBw9jrZ4g/Beex8AxGtY3XfJ2zGvFdmOYq1yai8Q7M7sGsayuCi5KoLPF4UpEuvhsJS20Cfe@lists.linux.dev
X-Gm-Message-State: AFq9FYJ82qEaP0TsieD95O05QvkVp9E1MO2es/1sP8YQ/q9x1d0Vi0Yr
	ZNq480O1kOA0pZDTyyWEBZ1f1cQVhBt5vJWHMTF2tw8sPYfkA3o4PedKPB+2eh7D+bJ83dR0FJI
	nFohBjKFjNA==
X-Received: from dlea12-n1.prod.google.com ([2002:a05:701b:420c:10b0:1a4:c892:b166])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2813:b0:143:6525:f9f6
 with SMTP id a92af1059eb24-1a6cd3a1575mr630918c88.13.1793140772067; Tue, 27
 Oct 2026 15:39:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:43 -0700
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
Message-ID: <20261027223847.652884-9-irogers@google.com>
Subject: [PATCH v2 8/9] drm/amdkfd: Free queue in procfs_queue_type kobject
 release callback
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
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Amber Lin <Amber.Lin@amd.com>
Content-Type: text/plain; charset="UTF-8"

struct queue embeds a struct kobject (q->kobj) for procfs entries, but
procfs_queue_type had no .release callback and uninit_queue() freed q
immediately after kfd_procfs_del_queue() called kobject_put(&q->kobj).
With CONFIG_DEBUG_KOBJECT_RELEASE=y, this causes a use-after-free.

Add kfd_procfs_queue_release() to free struct queue from the kobject
release callback, change kfd_procfs_del_queue() to only remove the
kobject from sysfs via kobject_del(), and drop the final reference in
uninit_queue() via kobject_put(). Check q->kobj.state_in_sysfs before
calling kobject_del() in kfd_procfs_del_queue() to avoid warnings if
sysfs creation previously failed.

Fixes: 6d220a7e7971 ("drm/amdkfd: Add queue information to sysfs")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 12 +++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c   |  5 ++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 226f52626e84..8e6136d52a50 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -512,7 +512,15 @@ static const struct sysfs_ops procfs_queue_ops = {
 	.show = kfd_procfs_queue_show,
 };
 
+static void kfd_procfs_queue_release(struct kobject *kobj)
+{
+	struct queue *q = container_of(kobj, struct queue, kobj);
+
+	kfree(q);
+}
+
 static const struct kobj_type procfs_queue_type = {
+	.release = kfd_procfs_queue_release,
 	.sysfs_ops = &procfs_queue_ops,
 	.default_groups = procfs_queue_groups,
 };
@@ -552,7 +560,6 @@ int kfd_procfs_add_queue(struct queue *q)
 	if (ret < 0) {
 		pr_warn("Creating proc/<pid>/queues/%u failed",
 			q->properties.queue_id);
-		kobject_put(&q->kobj);
 		return ret;
 	}
 
@@ -697,11 +704,10 @@ static void kfd_procfs_add_sysfs_files(struct kfd_process *p)
 
 void kfd_procfs_del_queue(struct queue *q)
 {
-	if (!q || !q->process->kobj)
+	if (!q || !q->process || !q->process->kobj || !q->kobj.state_in_sysfs)
 		return;
 
 	kobject_del(&q->kobj);
-	kobject_put(&q->kobj);
 }
 
 int kfd_process_create_wq(void)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
index ae3e7c54014a..4666110aebe0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
@@ -83,7 +83,10 @@ int init_queue(struct queue **q, const struct queue_properties *properties)
 
 void uninit_queue(struct queue *q)
 {
-	kfree(q);
+	if (q && q->kobj.state_initialized)
+		kobject_put(&q->kobj);
+	else
+		kfree(q);
 }
 
 #if IS_ENABLED(CONFIG_HSA_AMD_SVM)
-- 
2.56.0.313.g2479322e68-goog

