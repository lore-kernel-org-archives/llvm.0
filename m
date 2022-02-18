Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7BC4A8C
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645201855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MlHUFHX+ZHcQFW+lyQMNcMO6c5EeDKK8SX4zE6inQZ8=;
	b=DglViB730+2aFiyZUF019ND+rSscf79HEUBmGHJZbAQaTgW0TiFs5e6+56FRXYlIiNgrmx
	kZgudhQ3CNncWKcl/EyaG5e3HD1EE2cFergTQEXqi5BbguuuV492tfMDoB/EP7HpsYsKdZ
	U1kqf30OWGLjwIZTau/MXjD67J3nz/Q=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-H4mvT_2PNbeZ4LbWHrSJBQ-1; Fri, 18 Feb 2022 11:30:53 -0500
X-MC-Unique: H4mvT_2PNbeZ4LbWHrSJBQ-1
Received: by mail-qv1-f69.google.com with SMTP id kl13-20020a056214518d00b0042cb237f86bso9462141qvb.0
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 08:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MlHUFHX+ZHcQFW+lyQMNcMO6c5EeDKK8SX4zE6inQZ8=;
        b=SX6sReN5Y/98EZkO1CvOjgnRj3rAfeI4hBHimXJYdZWeGpiSlEvYUqECVl0S+vPzEm
         IRUM6jdFRsAJqTaRPqb3q0x42mp+d6HIBL0YpZx+LTJOSkYBUUVlIJ30TsQWL4jmJaZI
         yPhwDRsnorcoV2Pr9AMte+Q9oxtHfaxd4NaNBgzGBtbjqVFLpo6uZ0UYQB3WvWBIVPMj
         7aUZZ0nf85FnU/XdDSU9z7ICyyscWnUH/oPYXt4QhqD+e/S9I52EnwoYn2V7vTB/S1iy
         Wv/jxTEmPxGmagnKEpvjT0vaAuFtXrRdSYyzRAwUzFcH4KK80cQjQgoQa6GEWXNKvpYu
         bsPg==
X-Gm-Message-State: AOAM5319uspiQcf8CLWt5wUz16zjwmQo5m1qk95o5GT3bXxHU9PKl6nM
	BeCJbLMpK7Mfmp0Wnfzk5haBvf5u3+mR/T2zQfj72azmO7JcxCsfw5EUeDbSILCGiEbWDuDGdAJ
	+AstMVug5xi86Mg==
X-Received: by 2002:a05:6214:2269:b0:42c:37d8:a1aa with SMTP id gs9-20020a056214226900b0042c37d8a1aamr6473783qvb.92.1645201853448;
        Fri, 18 Feb 2022 08:30:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4vFhU7HKS9yRqHe0sY1K1K2BAfoqEYhz5pP7+ki2kTzk8Y/F1C67XvLcFUXAjFfYcBr/Uhw==
X-Received: by 2002:a05:6214:2269:b0:42c:37d8:a1aa with SMTP id gs9-20020a056214226900b0042c37d8a1aamr6473751qvb.92.1645201853164;
        Fri, 18 Feb 2022 08:30:53 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id c2sm18024043qkp.0.2022.02.18.08.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 08:30:52 -0800 (PST)
From: trix@redhat.com
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	cjhuang@codeaurora.org,
	briannorris@chromium.org,
	kuabhs@chromium.org
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] nl80211: check return of nla_parse_nested
Date: Fri, 18 Feb 2022 08:30:45 -0800
Message-Id: <20220218163045.3370662-1-trix@redhat.com>
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

Clang static analysis reports this representative problem
nl80211.c:15426:6: warning: Branch condition evaluates
  to a garbage value
  if (!tb[NL80211_SAR_ATTR_TYPE] ||
       ^~~~~~~~~~~~~~~~~~~~~~~~~~

tb is set when nla_parse_nested() is successful.
So check.

Fixes: 6bdb68cef7bf ("nl80211: add common API to configure SAR power limitations")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 net/wireless/nl80211.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 7543c73a3f1d..c1532c8eb657 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -15419,9 +15419,11 @@ static int nl80211_set_sar_specs(struct sk_buff *skb, struct genl_info *info)
 	if (!info->attrs[NL80211_ATTR_SAR_SPEC])
 		return -EINVAL;
 
-	nla_parse_nested(tb, NL80211_SAR_ATTR_MAX,
-			 info->attrs[NL80211_ATTR_SAR_SPEC],
-			 NULL, NULL);
+	err = nla_parse_nested(tb, NL80211_SAR_ATTR_MAX,
+			       info->attrs[NL80211_ATTR_SAR_SPEC],
+			       NULL, NULL);
+	if (err)
+		return err;
 
 	if (!tb[NL80211_SAR_ATTR_TYPE] || !tb[NL80211_SAR_ATTR_SPECS])
 		return -EINVAL;
@@ -15444,8 +15446,10 @@ static int nl80211_set_sar_specs(struct sk_buff *skb, struct genl_info *info)
 	sar_spec->type = type;
 	specs = 0;
 	nla_for_each_nested(spec_list, tb[NL80211_SAR_ATTR_SPECS], rem) {
-		nla_parse_nested(spec, NL80211_SAR_ATTR_SPECS_MAX,
-				 spec_list, NULL, NULL);
+		err = nla_parse_nested(spec, NL80211_SAR_ATTR_SPECS_MAX,
+				       spec_list, NULL, NULL);
+		if (err)
+			goto error;
 
 		switch (type) {
 		case NL80211_SAR_TYPE_POWER:
-- 
2.26.3

