Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58297C
	for <llvm@lists.linux.dev>; Sun, 13 Feb 2022 21:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644787956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/I6i6PhENZxx4r+JP2+zfrQVFZUTWDwnQ0+wWoj72BQ=;
	b=Dm0myDofvP/0Qw+jcCiX/MSHSoGGE7hLupea/dTBDU6iYlAtuZh3fD6fwFfoVCcrdevIWq
	TMeMAFt/PHdMjzthSuyKX9Oo50JxNPWInFjr5N+7r6ibeWNL92n9Yy4/oSck+uP3a7LevP
	a8aGbMyJaHKIBNGxPds7teD8w33x2LQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-sAJvyykkPyKY98zeRJ1cVQ-1; Sun, 13 Feb 2022 16:32:35 -0500
X-MC-Unique: sAJvyykkPyKY98zeRJ1cVQ-1
Received: by mail-ot1-f71.google.com with SMTP id w25-20020a9d70d9000000b0059fa6c78406so9164541otj.22
        for <llvm@lists.linux.dev>; Sun, 13 Feb 2022 13:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/I6i6PhENZxx4r+JP2+zfrQVFZUTWDwnQ0+wWoj72BQ=;
        b=oisbnK/Zpq6hWHly/G8RMPfrVns1J6WIDEaOHREjH0oshK6jWvtm2icbChejbeoHkd
         Ve5s5hgn6CTJ2VjFFieJ+sRQe5wAH0MCQfcxyAewd6fjN2aErwJP8b7JC8dpCC1dowaA
         h56UolmtV6Urul/5/s3T+mm0UJq8zul7iEyJOjsmrzR3CeSML8U1+6iYIFo/3Era1yX7
         Xxn35dTcg8We0YFXE7S/EtQgu9yHSr/w6CVWv8gPL2IXomNRO/DCaY4aYNOEQSNOcoUU
         GdHS0OHRiDn9afTtMQ+eLZ/abNavHJBf7LRHmJnxv997ml73nsBLSA8UH0pB5JFSGTIc
         jMLA==
X-Gm-Message-State: AOAM5326lRJXIhIxwvWEKw3mFMxavpEe5u3rnuwJKIcNd5yZ6XWMtJCJ
	tXygjE49H1By4O+4+gvZlEWaYco7yHY8YJp9ZuAPoCl5M432QRGF1/IMYmDN5u4ci5Rl8b/PGNb
	Ad9I2JCjGsbbmJQ==
X-Received: by 2002:a05:6870:9513:: with SMTP id u19mr3117035oal.306.1644787954651;
        Sun, 13 Feb 2022 13:32:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf8m3PM0Q+IByx9JRSjUHD8ba4ddxKwsH+XNREuYDXRmRjodxeXKoo+nFYHjXqi6suXy/d4w==
X-Received: by 2002:a05:6870:9513:: with SMTP id u19mr3117030oal.306.1644787954514;
        Sun, 13 Feb 2022 13:32:34 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q4sm11650306otk.39.2022.02.13.13.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 13:32:34 -0800 (PST)
From: trix@redhat.com
To: john.johansen@canonical.com,
	jmorris@namei.org,
	serge@hallyn.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] apparmor: fix aa_label_asxprint return check
Date: Sun, 13 Feb 2022 13:32:28 -0800
Message-Id: <20220213213228.2806682-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this issue
label.c:1802:3: warning: 2nd function call argument
  is an uninitialized value
  pr_info("%s", str);
  ^~~~~~~~~~~~~~~~~~

str is set from a successful call to aa_label_asxprint(&str, ...)
On failure a negative value is returned, not a -1.  So change
the check.

Fixes: f1bd904175e8 ("apparmor: add the base fns() for domain labels")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 security/apparmor/label.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index 9eb9a9237926..a658b67c784c 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -1744,7 +1744,7 @@ void aa_label_xaudit(struct audit_buffer *ab, struct aa_ns *ns,
 	if (!use_label_hname(ns, label, flags) ||
 	    display_mode(ns, label, flags)) {
 		len  = aa_label_asxprint(&name, ns, label, flags, gfp);
-		if (len == -1) {
+		if (len < 0) {
 			AA_DEBUG("label print error");
 			return;
 		}
@@ -1772,7 +1772,7 @@ void aa_label_seq_xprint(struct seq_file *f, struct aa_ns *ns,
 		int len;
 
 		len = aa_label_asxprint(&str, ns, label, flags, gfp);
-		if (len == -1) {
+		if (len < 0) {
 			AA_DEBUG("label print error");
 			return;
 		}
@@ -1795,7 +1795,7 @@ void aa_label_xprintk(struct aa_ns *ns, struct aa_label *label, int flags,
 		int len;
 
 		len = aa_label_asxprint(&str, ns, label, flags, gfp);
-		if (len == -1) {
+		if (len < 0) {
 			AA_DEBUG("label print error");
 			return;
 		}
-- 
2.26.3

