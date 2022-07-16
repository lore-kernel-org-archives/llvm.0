Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAE936D
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 20:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658003971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mhSFEuZeknUQVfzPSwX5MfJdkj3OYdP96/1A6PpGU/U=;
	b=OFyp8fQMJUU7+kj/3utgBQPTSuf5aViodOWsSlFaFIgrSNkfCk0NzlorCRwa5nsTYGRYE8
	jU7Qwfqjr04vJt5Lp8VrlZs9ZnXXgPhQOCdy0Pd67UAEN2sGswIVlCu5afWZ/Xcaeth5Hq
	5XbxDWpssAj/MkvWyNYfsjNSk5nxYv0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-8VRExlWENp-iHnbqkFrVkg-1; Sat, 16 Jul 2022 16:39:30 -0400
X-MC-Unique: 8VRExlWENp-iHnbqkFrVkg-1
Received: by mail-qk1-f197.google.com with SMTP id t203-20020a3746d4000000b006af1d3e8068so6179100qka.0
        for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 13:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mhSFEuZeknUQVfzPSwX5MfJdkj3OYdP96/1A6PpGU/U=;
        b=KBujc4RQuSL6N3aFtBZHJp4kRNOUaWSRTOO6y4YjYX87wJvkMN9DSC20tdClNApRQl
         0iUQGyMOBec91WEaEiXRDWbS7TPKLjbWX3vPJbvnN0nHS7XmNMxaRx8ENUz3ewVeqcX2
         q/owqh70fLNODY+9xTftojZ06IX9V/r6xh+va4WOXQIZs6SHG9PtC17QTc5bQfmfrngo
         fe8LnJrTUkHU+xZMjf6Jd00Qs1AngrsTlTWQLl5nOS57rGMo3rY0tjlVc3tMGnAUJeiA
         yJEY2MGWEdrey8em+m5U08GtXbgh9M8+Z/uVnzKZnO60bcKwQPUwBx52p4Gddm/epgGU
         8F8Q==
X-Gm-Message-State: AJIora9jdNkRoUcF/nuEjud5xja/q0paJcL5PWUElMiXZYCwQRlK6SWZ
	kxrd707V2VjNqHtagrol1bnTuy6D1e4KF/i46jj+HVivk01QSBWbRK8ooIo1mcuKFT2LIcbzS7M
	Ac3Pdycmf2Y1hag==
X-Received: by 2002:a05:620a:2a10:b0:6b5:e07b:427f with SMTP id o16-20020a05620a2a1000b006b5e07b427fmr1674265qkp.398.1658003969673;
        Sat, 16 Jul 2022 13:39:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sB76mCLZRt/21ZXI6v1fh8xyd739UV3uY6W+wFcWGPj9yOrUUwer2A0FmdnFEZjO2sE337kQ==
X-Received: by 2002:a05:620a:2a10:b0:6b5:e07b:427f with SMTP id o16-20020a05620a2a1000b006b5e07b427fmr1674258qkp.398.1658003969432;
        Sat, 16 Jul 2022 13:39:29 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i10-20020a05620a404a00b006b2849cdd37sm7716477qko.113.2022.07.16.13.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 13:39:29 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	sagi@grimberg.me,
	hare@suse.de
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] nvme-auth: fix input checking
Date: Sat, 16 Jul 2022 16:39:24 -0400
Message-Id: <20220716203924.2248841-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang build fails with this representative error
drivers/nvme/common/auth.c:59:31: error: address of array 'dhgroup_map[dhgroup_id].name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
            !dhgroup_map[dhgroup_id].name ||
            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~

Input is checked with this pattern
  if (i > ARRAY_SIZE(a))
    fail
  return a[i].x

This is an off-by-one bug.  Change to
  if (i < ARRAY_SIZE(a)
    return a[i].x
  return fail

By specifying the 'name' element of the nvme_auth_dhgroup_map struct as
a constant, pre sized array, it will be never be NULL.  So this and similar
pointer checks are not needed.

By inspection, none of the strings are zero length.  So the strlen() check
is also not needed.

The array dhgroup_map[] is unchanging so it should have a const type
qualifier.

The hash_map[] array has an additional problem.  The zeroth element of the
array is not explicitly initialized so it is implicitly zero initialized.
The pointer will be valid but be empty strings.  Instead of calling strlen(),
check for the zeroth element.

Fixes: a476416bb57b ("nvme: implement In-Band authentication")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/nvme/common/auth.c | 54 +++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 33 deletions(-)

diff --git a/drivers/nvme/common/auth.c b/drivers/nvme/common/auth.c
index 0c86ebce59d2..b7f7ab37786c 100644
--- a/drivers/nvme/common/auth.c
+++ b/drivers/nvme/common/auth.c
@@ -35,7 +35,7 @@ u32 nvme_auth_get_seqnum(void)
 }
 EXPORT_SYMBOL_GPL(nvme_auth_get_seqnum);
 
-static struct nvme_auth_dhgroup_map {
+static const struct nvme_auth_dhgroup_map {
 	const char name[16];
 	const char kpp[16];
 } dhgroup_map[] = {
@@ -55,21 +55,17 @@ static struct nvme_auth_dhgroup_map {
 
 const char *nvme_auth_dhgroup_name(u8 dhgroup_id)
 {
-	if ((dhgroup_id > ARRAY_SIZE(dhgroup_map)) ||
-	    !dhgroup_map[dhgroup_id].name ||
-	    !strlen(dhgroup_map[dhgroup_id].name))
-		return NULL;
-	return dhgroup_map[dhgroup_id].name;
+	if (dhgroup_id < ARRAY_SIZE(dhgroup_map))
+		return dhgroup_map[dhgroup_id].name;
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(nvme_auth_dhgroup_name);
 
 const char *nvme_auth_dhgroup_kpp(u8 dhgroup_id)
 {
-	if ((dhgroup_id > ARRAY_SIZE(dhgroup_map)) ||
-	    !dhgroup_map[dhgroup_id].kpp ||
-	    !strlen(dhgroup_map[dhgroup_id].kpp))
-		return NULL;
-	return dhgroup_map[dhgroup_id].kpp;
+	if (dhgroup_id < ARRAY_SIZE(dhgroup_map))
+		return dhgroup_map[dhgroup_id].kpp;
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(nvme_auth_dhgroup_kpp);
 
@@ -78,9 +74,6 @@ u8 nvme_auth_dhgroup_id(const char *dhgroup_name)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(dhgroup_map); i++) {
-		if (!dhgroup_map[i].name ||
-		    !strlen(dhgroup_map[i].name))
-			continue;
 		if (!strncmp(dhgroup_map[i].name, dhgroup_name,
 			     strlen(dhgroup_map[i].name)))
 			return i;
@@ -89,7 +82,7 @@ u8 nvme_auth_dhgroup_id(const char *dhgroup_name)
 }
 EXPORT_SYMBOL_GPL(nvme_auth_dhgroup_id);
 
-static struct nvme_dhchap_hash_map {
+static const struct nvme_dhchap_hash_map {
 	int len;
 	const char hmac[15];
 	const char digest[8];
@@ -113,21 +106,19 @@ static struct nvme_dhchap_hash_map {
 
 const char *nvme_auth_hmac_name(u8 hmac_id)
 {
-	if ((hmac_id > ARRAY_SIZE(hash_map)) ||
-	    !hash_map[hmac_id].hmac ||
-	    !strlen(hash_map[hmac_id].hmac))
-		return NULL;
-	return hash_map[hmac_id].hmac;
+	if ((hmac_id > 0) &&
+	    (hmac_id < ARRAY_SIZE(hash_map)))
+		return hash_map[hmac_id].hmac;
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(nvme_auth_hmac_name);
 
 const char *nvme_auth_digest_name(u8 hmac_id)
 {
-	if ((hmac_id > ARRAY_SIZE(hash_map)) ||
-	    !hash_map[hmac_id].digest ||
-	    !strlen(hash_map[hmac_id].digest))
-		return NULL;
-	return hash_map[hmac_id].digest;
+	if ((hmac_id > 0) &&
+	    (hmac_id < ARRAY_SIZE(hash_map)))
+		return hash_map[hmac_id].digest;
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(nvme_auth_digest_name);
 
@@ -135,9 +126,7 @@ u8 nvme_auth_hmac_id(const char *hmac_name)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(hash_map); i++) {
-		if (!hash_map[i].hmac || !strlen(hash_map[i].hmac))
-			continue;
+	for (i = 1; i < ARRAY_SIZE(hash_map); i++) {
 		if (!strncmp(hash_map[i].hmac, hmac_name,
 			     strlen(hash_map[i].hmac)))
 			return i;
@@ -148,11 +137,10 @@ EXPORT_SYMBOL_GPL(nvme_auth_hmac_id);
 
 size_t nvme_auth_hmac_hash_len(u8 hmac_id)
 {
-	if ((hmac_id > ARRAY_SIZE(hash_map)) ||
-	    !hash_map[hmac_id].hmac ||
-	    !strlen(hash_map[hmac_id].hmac))
-		return 0;
-	return hash_map[hmac_id].len;
+	if ((hmac_id > 0) &&
+	    (hmac_id < ARRAY_SIZE(hash_map)))
+		return hash_map[hmac_id].len;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(nvme_auth_hmac_hash_len);
 
-- 
2.27.0

