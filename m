Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1EAD30
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 23:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680130997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dvCH/Q/mYXYnFPxo1Zw9BF/bBxj1AhUZU0zHEiex0ss=;
	b=ZkEO4aUFx5tIASh+hrH1yVeyWVMLerejs1OERxkhBQ5rRVu483C3a3meBbMCpCTMSHYVEB
	uxkbZ6TCEQxIu8JUswt34Xf8NhSTyMGQTVy8ueWdUR0JwI6Ay7S8Uol1lJn6IwN8kteTHE
	itckxo0f/KnXUaU75tHkDxc5A/LyE6I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-6n6xurl_PH6fv8PYXduxaw-1; Wed, 29 Mar 2023 19:03:15 -0400
X-MC-Unique: 6n6xurl_PH6fv8PYXduxaw-1
Received: by mail-qv1-f72.google.com with SMTP id pe26-20020a056214495a00b005df3eac4c0bso4269868qvb.1
        for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 16:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680130995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvCH/Q/mYXYnFPxo1Zw9BF/bBxj1AhUZU0zHEiex0ss=;
        b=xQRz0k7cQP40fGXu0Uga2gmHynQCCFVOwtE6EPwstIV4o5xt51Ivne929gM6SwNQcP
         gyJ2mM6DwubikLI+emg2UYdJWmGJOLJ2ZutnV4izoYi+As2/QIWHG2cxxDoiafaoQcRZ
         fUfCn4A78F/LiUZPm7e3A19wtFCxpXPTZyqDJHU9c2I5tnvlQDuCyAD+fhyxmbLYCXWF
         F55rHYMNPJ9cnGKXD8AjnD1PUezylkGPOxpfVJo3DJUSf2UOwk7NoZu6Zbdffmp1tCIs
         gqIoarEoEhsuk0uVcLbMH7uYxloPBeGct8IWsvmtPrr2vPVdLBxUG2pxKaZ6nVN4ZsRM
         jx+g==
X-Gm-Message-State: AO0yUKXcmJL6d1KXOUAiLQhMlQDdXwLUXr3oKqyO4Sc9lCUicQbsYvkG
	geoQxrNiASoai6abLVsBJmbI6EhcBaok7pyrk8wmU1CniKwBl1eIEUPWhJwcFDumoaG2qwIh7Wr
	kOdMeB7RpXecDcw==
X-Received: by 2002:ac8:5ad1:0:b0:3bd:140c:91f7 with SMTP id d17-20020ac85ad1000000b003bd140c91f7mr35157020qtd.40.1680130995198;
        Wed, 29 Mar 2023 16:03:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z8o7ID5Y2qg2JO2AE3/F9MkoBdJxNI1wNK4jnkhkFlSdNW84WEhZHG+3IOdDu05fJRwkkzYw==
X-Received: by 2002:ac8:5ad1:0:b0:3bd:140c:91f7 with SMTP id d17-20020ac85ad1000000b003bd140c91f7mr35156994qtd.40.1680130994961;
        Wed, 29 Mar 2023 16:03:14 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 12-20020a370b0c000000b0074680682acdsm14392346qkl.76.2023.03.29.16.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 16:03:14 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: hdegoede@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] fs: vboxsf: remove unused out_len variable
Date: Wed, 29 Mar 2023 19:03:10 -0400
Message-Id: <20230329230310.1816101-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
fs/vboxsf/utils.c:442:9: error: variable
  'out_len' set but not used [-Werror,-Wunused-but-set-variable]
        size_t out_len;
               ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/vboxsf/utils.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/vboxsf/utils.c b/fs/vboxsf/utils.c
index dd0ae1188e87..ab0c9b01a0c2 100644
--- a/fs/vboxsf/utils.c
+++ b/fs/vboxsf/utils.c
@@ -439,7 +439,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
 {
 	const char *in;
 	char *out;
-	size_t out_len;
 	size_t out_bound_len;
 	size_t in_bound_len;
 
@@ -447,7 +446,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
 	in_bound_len = utf8_len;
 
 	out = name;
-	out_len = 0;
 	/* Reserve space for terminating 0 */
 	out_bound_len = name_bound_len - 1;
 
@@ -468,7 +466,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
 
 		out += nb;
 		out_bound_len -= nb;
-		out_len += nb;
 	}
 
 	*out = 0;
-- 
2.27.0

