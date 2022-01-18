Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9667173
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642513280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OjmFL8JLFpwgH42MBB6gml2GfGQI5Vtp3QaY21Donc4=;
	b=ZOYFFxMrD6CWd9GTOjVy3lllLwB0cISkqWizM90O7bDNcXbv6PbalNfh3zcpiGGyetKI2u
	pZceLCJuAU1qmzzipZA3Zo9cwBhFsRBkGSAILaqxV3Itdiswu+wr/aqpstufBvXUPLYG3U
	AOJvS94QEZgDQ5cZmWXFhckS09Hs5LQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-iIO4o05sOpOtJCjG63OYpw-1; Tue, 18 Jan 2022 08:41:19 -0500
X-MC-Unique: iIO4o05sOpOtJCjG63OYpw-1
Received: by mail-ot1-f69.google.com with SMTP id w8-20020a9d3608000000b0058f5caabe0dso7929092otb.21
        for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 05:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OjmFL8JLFpwgH42MBB6gml2GfGQI5Vtp3QaY21Donc4=;
        b=ls9/ptQpBEbvevUYmnroplYcmVVcV6s4B2vyEuIYMh3bkQzscw9uYQH+XYlfnlsvP2
         GZS2Vkahx3JDdey2M72DBO1H0eN7kvTnHrzmGosxeSc1npuKOueCnr20HAGD3yYhgkQn
         yHJYTZm9ht7a62SUXxfrgY4T9hjKs5EPwB+L7OFPKLuYFKIV/h6BTQdbFSj8wK88wQ+I
         mu7aAS9yRBxlW8w/Q7Wh3G3oE5GkeYRBhNbREM/1PaUNK6blYFhdAOj1MY/PiV0Te9Lg
         SlNSVC5IKhf0uu++R67QqWFk49dwp3nhkbfHAMj+GcFvJmS2sVXTTF2kg06aw8uaDqub
         jMmA==
X-Gm-Message-State: AOAM533rR3ZxrjEjNyHbglig/017vnPi9OSVGgc0UxVqAwoxOWBPENMt
	r3ECRlLO2vGAFGqX6JwIXJoSt+Mgky9MzUY9gFfEhg7QGAD0zzcN5rBVfgaSulH1f68gzOeLUX9
	bFFyv3l5rGOu1yg==
X-Received: by 2002:aca:1e0b:: with SMTP id m11mr1660647oic.79.1642513278684;
        Tue, 18 Jan 2022 05:41:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyghdC0ZhlAJPquJYviwFxMn7EFulClxi3MtgxmaXSfPu6GBNwy6CxT09cDO6MXpBK5Xk0YBw==
X-Received: by 2002:aca:1e0b:: with SMTP id m11mr1660614oic.79.1642513278337;
        Tue, 18 Jan 2022 05:41:18 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id f12sm6883770ote.75.2022.01.18.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 05:41:17 -0800 (PST)
From: trix@redhat.com
To: vladimir.oltean@nxp.com,
	claudiu.manoil@nxp.com,
	alexandre.belloni@bootlin.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	xiaoliang.yang_1@nxp.com
Cc: UNGLinuxDriver@microchip.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: mscc: ocelot: fix using match before it is set
Date: Tue, 18 Jan 2022 05:41:10 -0800
Message-Id: <20220118134110.591613-1-trix@redhat.com>
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
ocelot_flower.c:563:8: warning: 1st function call argument
  is an uninitialized value
    !is_zero_ether_addr(match.mask->dst)) {
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The variable match is used before it is set.  So move the
block.

Fixes: 75944fda1dfe ("net: mscc: ocelot: offload ingress skbedit and vlan actions to VCAP IS1")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/mscc/ocelot_flower.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_flower.c b/drivers/net/ethernet/mscc/ocelot_flower.c
index 4a0fda22d3436..949858891973d 100644
--- a/drivers/net/ethernet/mscc/ocelot_flower.c
+++ b/drivers/net/ethernet/mscc/ocelot_flower.c
@@ -559,13 +559,6 @@ ocelot_flower_parse_key(struct ocelot *ocelot, int port, bool ingress,
 			return -EOPNOTSUPP;
 		}
 
-		if (filter->block_id == VCAP_IS1 &&
-		    !is_zero_ether_addr(match.mask->dst)) {
-			NL_SET_ERR_MSG_MOD(extack,
-					   "Key type S1_NORMAL cannot match on destination MAC");
-			return -EOPNOTSUPP;
-		}
-
 		/* The hw support mac matches only for MAC_ETYPE key,
 		 * therefore if other matches(port, tcp flags, etc) are added
 		 * then just bail out
@@ -580,6 +573,14 @@ ocelot_flower_parse_key(struct ocelot *ocelot, int port, bool ingress,
 			return -EOPNOTSUPP;
 
 		flow_rule_match_eth_addrs(rule, &match);
+
+		if (filter->block_id == VCAP_IS1 &&
+		    !is_zero_ether_addr(match.mask->dst)) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Key type S1_NORMAL cannot match on destination MAC");
+			return -EOPNOTSUPP;
+		}
+
 		filter->key_type = OCELOT_VCAP_KEY_ETYPE;
 		ether_addr_copy(filter->key.etype.dmac.value,
 				match.key->dst);
-- 
2.26.3

