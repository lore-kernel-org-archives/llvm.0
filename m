Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CFC7B
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 23:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648854415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jNUDi778AJUhlrN3PBTxwa1i48FL+T4gzIs+ukoa52k=;
	b=D+ZvN87IQvQpKLFIbGeToRW/kr8fwGRWHBVv/HYVY9d1XNMISIUW6/EaWhS29nSHRtYB92
	fa9KJ2AcckosnsSYfHk6T7x13S5wAJYPaj53T8DqDdFP+WRsShbKF9gMKklZjFmtSBLspA
	UjmSDrKSKP7M3w6Og2Dr42gP8o9Vx0E=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-yoFnhPspMCmRbQmCguHVBg-1; Fri, 01 Apr 2022 19:06:54 -0400
X-MC-Unique: yoFnhPspMCmRbQmCguHVBg-1
Received: by mail-qv1-f69.google.com with SMTP id k20-20020ad44714000000b00440fd2c4a0aso3042035qvz.20
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 16:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jNUDi778AJUhlrN3PBTxwa1i48FL+T4gzIs+ukoa52k=;
        b=LwPo26o4mA1RnS3UKyMxN4ru5SOF1o60wjUFUMCSwO7a1rLtGzi9s5t/OvzkdhPgnl
         z7jQzFqnphd/udXPPz/DqKIli7NMpPk0unNMQUuwhclwz+O58stqeNtLwODnwmtl0bj7
         WipgVdVbnQ1X1TSplhzIQR1zaoykot80OpOiPoIdCZrXb1TkGkN9UJP29DycyAiq84jL
         8bbGUSQVAr3ejS1uOQnrvPLv68p1HgkT4/xDPnQIMQTd9rtJNtTP9cUuGfvD2ys9c+R1
         Dsng+PbIQ57BMIriCO4UnzQxmliJdCHF+r5gbDUip9xy+rJ/8ddbKrXhlsFH1XcrpPSq
         BBsg==
X-Gm-Message-State: AOAM53056ANv1PKoZt1ZyQyYXniMK2SrqUCqrRLbP+CknsZnrMX5vG8k
	7xJMtU7UB63H/1rsK2FccULT+k9vGdrALTRscRLsFW4eTXmQ+VPAnFsiAc12KXuXpEyEiDpQ3RM
	uMNUq7w7ME+b9pA==
X-Received: by 2002:a0c:fc46:0:b0:440:f78f:f4c4 with SMTP id w6-20020a0cfc46000000b00440f78ff4c4mr40795357qvp.108.1648854413665;
        Fri, 01 Apr 2022 16:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/F5Dq6Hq/AtU56gvFP3PTl65Ek+RzTn9Hp1ejEDvmMZTNZW0XxrZQHMh6L/ecLIyTztZc5A==
X-Received: by 2002:a0c:fc46:0:b0:440:f78f:f4c4 with SMTP id w6-20020a0cfc46000000b00440f78ff4c4mr40795338qvp.108.1648854413437;
        Fri, 01 Apr 2022 16:06:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y11-20020ac85f4b000000b002e1e038a8fdsm2712923qta.13.2022.04.01.16.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 16:06:52 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: luciano.coelho@intel.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	johannes.berg@intel.com,
	emmanuel.grumbach@intel.com,
	dan.carpenter@oracle.com
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] iwlwifi: mvm: initialize seq variable
Date: Fri,  1 Apr 2022 19:06:40 -0400
Message-Id: <20220401230640.3196196-1-trix@redhat.com>
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

Clang static analysis reports this issue
d3.c:567:22: warning: The left operand of '>' is
  a garbage value
  if (seq.tkip.iv32 > cur_rx_iv32)
      ~~~~~~~~~~~~~ ^

seq is never initialized. Call ieee80211_get_key_rx_seq() to
initialize seq.

Fixes: 0419e5e672d6 ("iwlwifi: mvm: d3: separate TKIP data from key iteration")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/d3.c b/drivers/net/wireless/intel/iwlwifi/mvm/d3.c
index a995bba0ba81..9b190b3ce6c1 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/d3.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/d3.c
@@ -563,6 +563,7 @@ static void iwl_mvm_wowlan_get_tkip_data(struct ieee80211_hw *hw,
 		}
 
 		for (i = 0; i < IWL_NUM_RSC; i++) {
+			ieee80211_get_key_rx_seq(key, i, &seq);
 			/* wrapping isn't allowed, AP must rekey */
 			if (seq.tkip.iv32 > cur_rx_iv32)
 				cur_rx_iv32 = seq.tkip.iv32;
-- 
2.27.0

