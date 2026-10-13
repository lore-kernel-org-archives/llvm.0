Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB253563FD0
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931224; cv=none; b=mJTJ2LBH7rLFiLryQCSaCXm8wuqHquPh72QmJhpS83gLgf6CAPEDajKx0EC6OUQpaENhfYLl0Wh93Gu/klg3mkSOpXDWog7TAixrKIR5G6G4rjV8mw+OJ9it1XVRjp+aUpdOBygnboapAS+R+Sn1HKaF/4b9LLrcIagn/x2yKe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931224; c=relaxed/simple;
	bh=uNMrTEMgpiVDbGIrdW7hNuAL0UJnSkmxUybVeT9BNfA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GiRxri17sVz73ia9bzSv3pFoEviPbxPPTLcQE5puBJaZ5Tv82en8eoo46T/Bczj1kFnsSGOWKkjT/CAME1XETGjvCfN76NNEfKPdUmIjDvPuJSnUi/0TuGILRL0VKSSnzoCrNd6IGBDRkgayk8Djm7NNS+owRgddJQ3QTOpE0+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SMf3jnEy; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SMf3jnEy"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so1454365eec.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931220; x=1792536020; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4r3hXDLd6Bqk9XmcFR/JS5uHIdkPs2TN+2FSnsngXIE=;
        b=SMf3jnEy2DRKyi6y2QqLOlPij9KNgPecJW1Nyf0nCkWp0Z6Yx7wlVuEtv0JWEyiR7q
         ZS0PFm7sOBHr1iNgEdZyOe3sv550T5nICUkAOEqD0RUbjFs5qB7XhdV7MZuy5QWD5YUN
         xRSaz6INgVnVLhvKeXkPyIEXESHPpfFVgQp1E2xRph+R+Do6NO8GutOJXNfuchCi/nDM
         1v2QIUwlTHOox1uMHdogUVmHmYYBc/G3w8RokrTCsptNG+lKWMzRie+wTlElATsTjEPV
         1v1/Y1Lbm3sG8zp59/DkALQ1Z/1oGXMiQfxHYoTjFL106GVX2pD459tjYsj0fYObZyIm
         RB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931220; x=1792536020;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r3hXDLd6Bqk9XmcFR/JS5uHIdkPs2TN+2FSnsngXIE=;
        b=RReNf58tbLG2NX3HuRZHU2sbJumr76cCodC/N4CBMQx8t/mnJ4SRg/toJbBMKQy31d
         ueZYTRQ4Kh25sU2Qb9RgkqGb6gLXPEctirgzM+Tr5dn7u73A8z7WuYRGR5r/X/RS8Zjb
         qcjuJ4ORHZgBM58Nnj7AOwuabhmTKMX3xkqVnHPVYSi+7x9O9TMIGE+HPc7cegOLfnHH
         pQadIcUBFy0HdmpLu65kpmmmoRBQlZ4gI/NOM1y9JgqunHuxLlV90OP3bHvou1Wt2gM0
         XFPENUCTDmTh1LhiePMn2GAzXA/UGzXzLygqhpWP7qFPMKf+IJ8ptXz6dfHwmKsSTKtQ
         uUZw==
X-Forwarded-Encrypted: i=1; AKwUvBxSPx6kNbtGANlGiUgRw9oFbLe8ismGcxpd4RG3YKYO3QFtcTzkkUOR4FZlTAzkWNmKHCdN@lists.linux.dev
X-Gm-Message-State: AFq9FYKzZks+QiTqJIFz1feT4PCb094kU1uVcCv10D9IkGVrlgx0AqEb
	LNUe+VhrlVBHm+V5D9q266YSJXUaM4AyAyjNjfXT2sxt5y5g2/BYXU4Ow0+BnyYLPEz+ILMZqCD
	ig1/9PA5vgA==
X-Received: from dyu6.prod.google.com ([2002:a05:693c:8106:b0:352:94e:a8c9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:71a8:b0:358:f717:ff61
 with SMTP id 5a478bee46e88-358f717ff90mr13337962eec.6.1791931219210; Tue, 13
 Oct 2026 15:40:19 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:38 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-4-irogers@google.com>
Subject: [PATCH 03/11] sh: sq: Add missing kobject release callback to ktype_percpu_entry
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

In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
kzalloc_obj() and initialized with ktype_percpu_entry. When
sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
because ktype_percpu_entry lacks a .release callback.

Provide a sq_kobj_release() callback that calls kfree(kobj).

Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog

