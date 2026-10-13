Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C78568FB9
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931251; cv=none; b=f4WeL1vfNJwTm1Ix0tQSC+OSTmMi/YkW7OgDVCbMNhuKfvgmRU0vjqbQ+uTWUGJj1Z1txx7ID3RFSfzoqelH+ewlOWpEE9Xwa+1mxSqnEkKIqvTJLrENH+pQpK+S1MZqtI8gBZaLSmbfbV1uId2dtUCUjOZnU8Gsy94eybQjzPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931251; c=relaxed/simple;
	bh=M3UPDkw20opO7U5j3HMFplWu3giCXTRo4JKyj8Xm00I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nDtQYppOch6+/Q3vn+EooAucQfFepzbkoyEymRMImcwzt+UqHcmKmJ79tI1IJBVrI7/UWleBMe1HGhTv5k4EBR4NvdPkV2qF8tQP4iRLeL3KYEt2dwq4l4hG4kGgyiBcJ+6X/l6u6G0vYXKFHYC3XYIPbFPpT0f1Hz0ZvTloWzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e4G+tQ4z; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e4G+tQ4z"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so4838023c88.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931238; x=1792536038; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gurzTkqqRagMZrBgJFBCVz7i93uSa3r8+lp0iuHqO9A=;
        b=e4G+tQ4z/72Xw9hdJOBgcksisszNEtZvtcLg0afPm3P+lxYO1CowiIX0DeDjSKgQPD
         CVLbCv0WZKURNO1yi/VSsZW/Yqp8oa2UBuB0BK06BC9u/Avmo2W5JNUuoXNlitkzPPbX
         RNNjOd8EkgUUzs9u2hEso0ie0wr+V13vfUTgxOL8/A4jyjVte43P8l5DpEHqGUdVJfHj
         LbTG5wUVhMtd524xTFo76EhnHxTgMBVmp24wu4hQRFNpvk+xDm2hxsdX7uLFwKq69+yP
         +YWXrXitvK5dDtbWohTwNUEzYc66W5fvi/vDvPxeSfWCa6PylItjAQq9ruB1YRYjRc3I
         jSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931238; x=1792536038;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gurzTkqqRagMZrBgJFBCVz7i93uSa3r8+lp0iuHqO9A=;
        b=FFCNGOjbwALHq+Sevuz4ifdCDoUJ573IG4UdN2hSpVaQKAjpwIC7c5WuZKcDXbPrqj
         QomdTgCk6DU190E99vcj1w0ZTeQOUC5uWehEtK5XBnb0lHTiz7UyUNY6oj1QZT+QsBjs
         jaolMEp09SAGvhJrSkjbIOEqViHD7MZBVqKLSf2RlUcGi1mEfBISk75RP5zQXj84cBav
         NC3Lj/Mxi8Z+uU05pQTXXFseJPapSz+Ityf5CQ8yqKFmUjXCGK9ROB58UbTk7zQcAdKO
         mMUi/mI/yilA9Xzjx7c/JCcOhBKsArkRPS1bZY2+VioQNCOihBfvl16BPK2wTXDJ+CtO
         fGyg==
X-Forwarded-Encrypted: i=1; AKwUvBxokcQwZODKgmUCVD1q2Ii+zAPaMKSiGMle3uezuYnig61gso9CkSfqepajUKKafo5rBCOL@lists.linux.dev
X-Gm-Message-State: AFq9FYKw1cDr/vdWvtaW2DlswBxyv6/EQHhPbKmqo8TNYPP9MhQNjUOg
	OPDd813k352c2pTGtzVllAtyPaNjleLfGABPcoj5t+ianUG7pCLDz00zc8i8dEo1H6tqFsjL2QY
	JeduSCg3SQA==
X-Received: from dleg6-n1.prod.google.com ([2002:a05:701b:4306:10b0:160:bb23:390d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4586:20b0:169:b1b1:1445
 with SMTP id a92af1059eb24-16a5dbfe73dmr17947821c88.31.1791931232672; Tue, 13
 Oct 2026 15:40:32 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:44 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-10-irogers@google.com>
Subject: [PATCH 09/11] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
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

ubifs_kset was a static struct kset using a custom ubifs_ktype that
had no default_groups and no .release callback. With
CONFIG_DEBUG_KOBJECT_RELEASE=y, unloading the ubifs module while delayed
kobject release is pending causes a use-after-free on the static kset.

Replace the static ubifs_kset and empty ubifs_ktype with a dynamically
allocated kset via kset_create_and_add().

Fixes: 203a55f04f66 ("ubifs: Fix memory leak in ubifs_sysfs_init()")
Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog

