Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3E7A
	for <llvm@lists.linux.dev>; Sat,  5 Mar 2022 18:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646504038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TQ/PmDy/wAuYSRhPMWBzjgjzADBCIpXP0+QPOpZXWOA=;
	b=F76ZlNQegdt/DNEg5Wm1FEG6uS34AZSsWe6kSu0jJCSyzoKyP3wE0SLOhlHy1ixFt3Bm3P
	ort0jiGdRYESL1Zuiw+ncQSMFoM0CEWBzafe5+HzwJEb+IDL535JqGbrQNVgaqsxjhl+Hj
	u0MTo6noQgkAeH9ldCy5IxWIeNNNRBg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-_4du_7a1PsKb5baXU9pzgg-1; Sat, 05 Mar 2022 13:13:57 -0500
X-MC-Unique: _4du_7a1PsKb5baXU9pzgg-1
Received: by mail-qt1-f197.google.com with SMTP id t14-20020ac8760e000000b002e049ff9638so5408181qtq.10
        for <llvm@lists.linux.dev>; Sat, 05 Mar 2022 10:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQ/PmDy/wAuYSRhPMWBzjgjzADBCIpXP0+QPOpZXWOA=;
        b=reZZGuu7k8qL4eJoXmzQ6VC88zC0rAw5F8QWJsumivBGIzT6FoyB2hTZHrh8k0+lZ8
         FIEbGqDO0rg1JypDTHJ6Uo7dwRdrtNNDLT+dcz98cMInXIxHfMIkOlf+tEokeH4wb+DB
         JBT6jZCbrJVzmSK3C6IiJU5KNu+Gs+cMCyKcxTOjwT9t1gDyVCU+gx1v6YAWEpi7GKVr
         JupAvlljSPm3wk1vRAUzSgysWWZIg0CNQfW7fTQjS5oV3wAWzNVXrr3NkBGR1ICJYEdG
         OqlDzeRJqmRLkUuu4qW//O9nbLZixwQNPyI3fgzi2o52Sr6FmkGo+5gvPwdR79RbJoE3
         kUjQ==
X-Gm-Message-State: AOAM531eMt1UtrsR7hmC0Fa564aIB2b6s3I9WE3fJD3HhoUT65jD20Bn
	l5Ujq4/EYIInXkDdcjraTQH712FLAW0BNmVMpym+3jfJJ2lLScnYlK3eLa2cXLn5HytGXuQuEeY
	9e3OzM3//hyo9EQ==
X-Received: by 2002:a37:55c2:0:b0:479:8293:d7d0 with SMTP id j185-20020a3755c2000000b004798293d7d0mr2560804qkb.182.1646504036864;
        Sat, 05 Mar 2022 10:13:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/MM0HeyZ0Th4tenJoq2/b1En2hM1Tyt/SzPGuspo4wRFFLCKSYHG4o9YEfNHsPP4FSG4HKQ==
X-Received: by 2002:a37:55c2:0:b0:479:8293:d7d0 with SMTP id j185-20020a3755c2000000b004798293d7d0mr2560793qkb.182.1646504036653;
        Sat, 05 Mar 2022 10:13:56 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id w20-20020a05622a135400b002dd9806d532sm5376407qtk.54.2022.03.05.10.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 10:13:56 -0800 (PST)
From: trix@redhat.com
To: davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	idosch@nvidia.com,
	petrm@nvidia.com,
	edumazet@google.com,
	avagin@gmail.com,
	yajun.deng@linux.dev,
	johannes.berg@intel.com,
	cong.wang@bytedance.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: rtnetlink: fix error handling in rtnl_fill_statsinfo()
Date: Sat,  5 Mar 2022 10:13:46 -0800
Message-Id: <20220305181346.697365-1-trix@redhat.com>
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

The clang static analyzer reports this issue
rtnetlink.c:5481:2: warning: Undefined or garbage
  value returned to caller
  return err;
  ^~~~~~~~~~

There is a function level err variable, in the
list_for_each_entry_rcu block there is a shadow
err.  Remove the shadow.

In the same block, the call to nla_nest_start_noflag()
can fail without setting an err.  Set the err
to -EMSGSIZE.

Fixes: 216e690631f5 ("net: rtnetlink: rtnl_fill_statsinfo(): Permit non-EMSGSIZE error returns")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 net/core/rtnetlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index a66b6761b88b1..a759f9e0a8476 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -5440,12 +5440,12 @@ static int rtnl_fill_statsinfo(struct sk_buff *skb, struct net_device *dev,
 		list_for_each_entry_rcu(af_ops, &rtnl_af_ops, list) {
 			if (af_ops->fill_stats_af) {
 				struct nlattr *af;
-				int err;
 
 				af = nla_nest_start_noflag(skb,
 							   af_ops->family);
 				if (!af) {
 					rcu_read_unlock();
+					err = -EMSGSIZE;
 					goto nla_put_failure;
 				}
 				err = af_ops->fill_stats_af(skb, dev);
-- 
2.26.3

