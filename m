Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C87A
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644853250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NsyCA1by/ak8R1lwSMjCXJyyH1qXb4V0zf8axMvxNR8=;
	b=D76JO1VuFa5VT6Kb/Piz9d3MFdyjVn2tUldPx9JyB441Z6MpWvbKKwTP7z8SznwmPpHW8C
	Xm4QeRakfIhI/NwBJ0ZiCGciU4SmqRdrgNwpfbNa1zoPlOOwwD4hzJVoib/EmzSNf3bkbR
	PjXoWLKhP4tRKFukRQAuGkW6BxT+47Q=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-0frNZTBgPeCccdlt0ZTNYg-1; Mon, 14 Feb 2022 10:40:48 -0500
X-MC-Unique: 0frNZTBgPeCccdlt0ZTNYg-1
Received: by mail-oo1-f72.google.com with SMTP id t16-20020a4ae9b0000000b0031877e91c80so7259664ood.13
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 07:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NsyCA1by/ak8R1lwSMjCXJyyH1qXb4V0zf8axMvxNR8=;
        b=wXtmWmAsdUUeb053gdh7OAzVmbiY+agMpXLRw2vAJlk7rg9VrxkDwd/n3DmPTJtMSO
         7eKu7VJGrLHGmb/EPG9SZfb4MuJTvmjfwAk7Bgt3ow5EWSvjA6b40B039ZqFMX29k6zd
         /jyS7FmrPoRI5V268F8RUbaZ/Otnf0aSgy7Y9A1K3A4RHF0acjbJyqr9hN8vtZr2KcCn
         9LlGkm9mYyLY3eUPteulaFi5+0b8hmTry62rn+Md5Sm6P1OLYiJ3F8ZJ00hqabXV8lVx
         +K8nLc0bNuhjJi8kP9+XEDOgSgkwvhAfCR6iMa9fU59fEqzIn5A2z6m0rV5F66zRNGOd
         0QNQ==
X-Gm-Message-State: AOAM531wJtP505fLCQ+X4/gPb8aLJkHAQonsVBTx0fEVYE+ZuIeduBvs
	5z01mrTlpnTOuZSqgWpHxK0swI4KUL1osUVV0m5uYgWHZn7goIXofzsI/P+Md9KOvmAEx4zYmo7
	zBbN7R32BQIIPvQ==
X-Received: by 2002:a05:6808:30a0:: with SMTP id bl32mr34577oib.262.1644853248094;
        Mon, 14 Feb 2022 07:40:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuAZBJGNoWdrA+012X1djizbpdOBot5gLyfgpONhsQ6+8gC+0JtSILPzlYULjoQUEuunFbBw==
X-Received: by 2002:a05:6808:30a0:: with SMTP id bl32mr34562oib.262.1644853247928;
        Mon, 14 Feb 2022 07:40:47 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id n11sm4432445oal.1.2022.02.14.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:40:47 -0800 (PST)
From: trix@redhat.com
To: jesse.brandeburg@intel.com,
	anthony.l.nguyen@intel.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	paul.greenwalt@intel.com,
	evan.swanson@intel.com
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ice: initialize local variable 'tlv'
Date: Mon, 14 Feb 2022 07:40:43 -0800
Message-Id: <20220214154043.2891024-1-trix@redhat.com>
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

Clang static analysis reports this issues
ice_common.c:5008:21: warning: The left expression of the compound
  assignment is an uninitialized value. The computed value will
  also be garbage
  ldo->phy_type_low |= ((u64)buf << (i * 16));
  ~~~~~~~~~~~~~~~~~ ^

When called from ice_cfg_phy_fec() ldo is the unintialized local
variable tlv.  So initialize.

Fixes: ea78ce4dab05 ("ice: add link lenient and default override support")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/intel/ice/ice_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index c57e5fc41cf8..0e4434e3c290 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -3379,7 +3379,7 @@ ice_cfg_phy_fec(struct ice_port_info *pi, struct ice_aqc_set_phy_cfg_data *cfg,
 
 	if (fec == ICE_FEC_AUTO && ice_fw_supports_link_override(hw) &&
 	    !ice_fw_supports_report_dflt_cfg(hw)) {
-		struct ice_link_default_override_tlv tlv;
+		struct ice_link_default_override_tlv tlv = { 0 };
 
 		status = ice_get_link_default_override(&tlv, pi);
 		if (status)
-- 
2.26.3

