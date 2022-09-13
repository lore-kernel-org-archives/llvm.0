Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0FE6AA3
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 23:07:45 +0000 (UTC)
Received: by mail-vk1-f202.google.com with SMTP id x3-20020a1f3103000000b003a285826de2so1087153vkx.2
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 16:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=nQIPAqtSgyJ/LHof5ggHUlg0YR/i7dEWTiUZqzvgn8s=;
        b=r39QugdHbnvu6UBNDFOeYIgOZv+KRMsRAszRZrgG2Uh7MHuqGKm8GdYVygbetKozou
         yHu9Z1R+N652uNKZHNmPNxnoehVS18xeKrpISfehyuC/tjduCdokNoyYyOspp2Ebl1JB
         Qsn4nQNyVSbPpZ4m9qEZzSfkB5rmGrKxfI8uJpXePrM5Tb9qSlOkoHhzitYN2rGx4L01
         A0yH+OdMQ0dxmeI9ijhJtFFUijZBivI0uMoDCVtX5oioG39AN6MX67ladm2OefYPeGcx
         HGGgwQ9HUI6SYtrPu591oIf6aHCO9lgB39yYvLG7OLP3QHdkOXCK3KvxrmFG7SWZkw5b
         eptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=nQIPAqtSgyJ/LHof5ggHUlg0YR/i7dEWTiUZqzvgn8s=;
        b=GLlt443dufOlEwT/4SE686mpqwgyh0UYrim6/wc0/HJLUuLn8ou+95ebzjQA6g0FGw
         gakV+JiMwMc0hvyGZRVUBcjOZANTrAhvqMOb4HaAsSduQeXYNGyZ6ILzPplDfDuMiFCm
         +Xoexsb/R4p1AGZGU8dyZLiU7qnTk9TAZ9+wmAP76EL+z4dbkqESaH2FjUmeIQE+x4Rx
         bcvflBPm9DHXea8BDi4F3n+JPJgpQxeRS8Iwmi+yNuBOlqr6/pQVeNEfSWRI8dblAZRD
         ko7AyR9DU5gs6uiy/g2LGCCya5fPrTR48uJQX55d6g1a9oJyLTmV5pcc/zc1r8MWot/n
         uLYw==
X-Gm-Message-State: ACgBeo2kn2g2ytfSx1VmUhSJH5Jp9WtL4I0Y2v07pwmgFyYe48fZSaXC
	LDs3UdBNmzJ0HkQ0+LE2/PY1IaZ13w==
X-Google-Smtp-Source: AA6agR7gin9Q9ggEELh11q577gqRI3VqclYGFLam1G26ejizXnicJDQSt0YMtQ28PzsDauQfHw2oY6IVJg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a67:c983:0:b0:398:2c7:b3bd with SMTP id
 y3-20020a67c983000000b0039802c7b3bdmr11658783vsk.57.1663110464805; Tue, 13
 Sep 2022 16:07:44 -0700 (PDT)
Date: Tue, 13 Sep 2022 16:07:38 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913230739.228313-1-nhuck@google.com>
Subject: [PATCH] openvswitch: Change the return type for vport_ops.send
 function hook to int
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Pravin B Shelar <pshelar@ovn.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

All usages of the vport_ops struct have the .send field set to
dev_queue_xmit or internal_dev_recv.  Since most usages are set to
dev_queue_xmit, the function hook should match the signature of
dev_queue_xmit.

The only call to vport_ops->send() is in net/openvswitch/vport.c and it
throws away the return value.

This mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 net/openvswitch/vport-internal_dev.c | 2 +-
 net/openvswitch/vport.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/openvswitch/vport-internal_dev.c b/net/openvswitch/vport-internal_dev.c
index 35f42c9821c2..74c88a6baa43 100644
--- a/net/openvswitch/vport-internal_dev.c
+++ b/net/openvswitch/vport-internal_dev.c
@@ -190,7 +190,7 @@ static void internal_dev_destroy(struct vport *vport)
 	rtnl_unlock();
 }
 
-static netdev_tx_t internal_dev_recv(struct sk_buff *skb)
+static int internal_dev_recv(struct sk_buff *skb)
 {
 	struct net_device *netdev = skb->dev;
 
diff --git a/net/openvswitch/vport.h b/net/openvswitch/vport.h
index 7d276f60c000..6ff45e8a0868 100644
--- a/net/openvswitch/vport.h
+++ b/net/openvswitch/vport.h
@@ -132,7 +132,7 @@ struct vport_ops {
 	int (*set_options)(struct vport *, struct nlattr *);
 	int (*get_options)(const struct vport *, struct sk_buff *);
 
-	netdev_tx_t (*send) (struct sk_buff *skb);
+	int (*send)(struct sk_buff *skb);
 	struct module *owner;
 	struct list_head list;
 };
-- 
2.37.2.789.g6183377224-goog

