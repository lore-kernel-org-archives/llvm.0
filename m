Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AFB1B76
	for <llvm@lists.linux.dev>; Sat,  5 Mar 2022 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646492817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jzfuT3+UZ/fGMOnKdum70e9dYbgqhz4vQr25uVQN9DA=;
	b=eAWnwXx/iksucQAgKFI+G3tHbvLTzf74ayJhTGiozraex1Ar/++RKPEJN+SlirpEm8G8i+
	XfXPuYwjTCtg7qpFKzU9ZjE1Fe3CGicqdRGl0lM55YtpzW49vRa6fk6vf1T72qmM/VZj+G
	7R/Q/PVPHDz0syj1cdwAXkpzMCfg/ig=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-pWh0xO4eNmyrQgSepkgyaQ-1; Sat, 05 Mar 2022 10:06:56 -0500
X-MC-Unique: pWh0xO4eNmyrQgSepkgyaQ-1
Received: by mail-qv1-f72.google.com with SMTP id kd18-20020a056214401200b0042de5c14702so9387594qvb.12
        for <llvm@lists.linux.dev>; Sat, 05 Mar 2022 07:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jzfuT3+UZ/fGMOnKdum70e9dYbgqhz4vQr25uVQN9DA=;
        b=OlJXQ38iQvaRFJHbBd0NqwBF+uGErgSAfG/kvMWRPyNdwuE0wEgrAc+9xLPio+SS9Z
         v9P1FnbjcsNt9Nd7dURQ9/WR33R8/UzYIKV/XLuIHgAagRUqDh1+wyHBLS1S20fPgwa9
         iN54vJA5Y+2Qc1qZGq3mnm1h27te0LTBbzObPpObFDlDiZqlPYmOwpdHokUGNqr11jIU
         xkGRYSlMICZjplPZuFSiy8OBn/6w4Wc5qAxAjkU4Pgw9rQvxVpSYqMHZrfJcAGPR+YbR
         TMaGKPT5+a3hEPjQU1P6p9HU5UiSUSS7xDpvutPnNAi+TjkDU9BbOlu78nToFqam+mq3
         Tz6w==
X-Gm-Message-State: AOAM532BVRKaSnbQHQNkD0iWvH8W7cu2ZFtKIHxA/qzBdzjhWs/m8AUE
	r2Jk+gMCjC+IKriuRFOlaw1vEbqdbpxSLmMtfJiaSIK89pw/iPAEAXRzyThcq5JZl68QumX7DC+
	lbBbSLNinMEFSNA==
X-Received: by 2002:a0c:e781:0:b0:42c:4e4f:a6db with SMTP id x1-20020a0ce781000000b0042c4e4fa6dbmr2581485qvn.107.1646492815793;
        Sat, 05 Mar 2022 07:06:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXNODovOUBWo4HOvZzg3rfVWr4dLTHn/VYXWRhOb5U7dn9g/nH3+CwN0NmC7BVIBC0c7RVNw==
X-Received: by 2002:a0c:e781:0:b0:42c:4e4f:a6db with SMTP id x1-20020a0ce781000000b0042c4e4fa6dbmr2581464qvn.107.1646492815534;
        Sat, 05 Mar 2022 07:06:55 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id c6-20020ac87d86000000b002ddd9f33ed1sm5754191qtd.44.2022.03.05.07.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 07:06:55 -0800 (PST)
From: trix@redhat.com
To: aelior@marvell.com,
	manishc@marvell.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	Yuval.Mintz@qlogic.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] qed: return status of qed_iov_get_link
Date: Sat,  5 Mar 2022 07:06:42 -0800
Message-Id: <20220305150642.684247-1-trix@redhat.com>
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
qed_sriov.c:4727:19: warning: Assigned value is
  garbage or undefined
  ivi->max_tx_rate = tx_rate ? tx_rate : link.speed;
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

link is only sometimes set by the call to qed_iov_get_link()
qed_iov_get_link fails without setting link or returning
status.  So change the decl to return status.

Fixes: 73390ac9d82b ("qed*: support ndo_get_vf_config")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/qlogic/qed/qed_sriov.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_sriov.c b/drivers/net/ethernet/qlogic/qed/qed_sriov.c
index bf4a95186e55c..0848b5529d48a 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_sriov.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_sriov.c
@@ -3817,11 +3817,11 @@ bool qed_iov_mark_vf_flr(struct qed_hwfn *p_hwfn, u32 *p_disabled_vfs)
 	return found;
 }
 
-static void qed_iov_get_link(struct qed_hwfn *p_hwfn,
-			     u16 vfid,
-			     struct qed_mcp_link_params *p_params,
-			     struct qed_mcp_link_state *p_link,
-			     struct qed_mcp_link_capabilities *p_caps)
+static int qed_iov_get_link(struct qed_hwfn *p_hwfn,
+			    u16 vfid,
+			    struct qed_mcp_link_params *p_params,
+			    struct qed_mcp_link_state *p_link,
+			    struct qed_mcp_link_capabilities *p_caps)
 {
 	struct qed_vf_info *p_vf = qed_iov_get_vf_info(p_hwfn,
 						       vfid,
@@ -3829,7 +3829,7 @@ static void qed_iov_get_link(struct qed_hwfn *p_hwfn,
 	struct qed_bulletin_content *p_bulletin;
 
 	if (!p_vf)
-		return;
+		return -EINVAL;
 
 	p_bulletin = p_vf->bulletin.p_virt;
 
@@ -3839,6 +3839,7 @@ static void qed_iov_get_link(struct qed_hwfn *p_hwfn,
 		__qed_vf_get_link_state(p_hwfn, p_link, p_bulletin);
 	if (p_caps)
 		__qed_vf_get_link_caps(p_hwfn, p_caps, p_bulletin);
+	return 0;
 }
 
 static int
@@ -4697,6 +4698,7 @@ static int qed_get_vf_config(struct qed_dev *cdev,
 	struct qed_public_vf_info *vf_info;
 	struct qed_mcp_link_state link;
 	u32 tx_rate;
+	int ret;
 
 	/* Sanitize request */
 	if (IS_VF(cdev))
@@ -4710,7 +4712,9 @@ static int qed_get_vf_config(struct qed_dev *cdev,
 
 	vf_info = qed_iov_get_public_vf_info(hwfn, vf_id, true);
 
-	qed_iov_get_link(hwfn, vf_id, NULL, &link, NULL);
+	ret = qed_iov_get_link(hwfn, vf_id, NULL, &link, NULL);
+	if (ret)
+		return ret;
 
 	/* Fill information about VF */
 	ivi->vf = vf_id;
-- 
2.26.3

