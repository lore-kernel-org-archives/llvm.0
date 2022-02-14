Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED397A
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644849217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oIIRJ21BwIfvNwz0gmLQtZq6j5ywHb6my37zjrdYjEk=;
	b=O75n34Aef/V1fpS4uKiwxVNbpwYzBP+sCMWrd3fnJ0ynFbZAXl/K0o7QrLEVFF4Qo74wSO
	ikkjDpk8uKJ9KN5tKSyWRh7X2wI0nmBA6O2Rs1ER+i9bM1VUAzfsiea5p9eY5CUBgHgfIH
	qIx6bygdzF7Mp1dKuHQ/mqQzXuIz/qM=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-PFZIXEbsPE60fBr_SuMZ9A-1; Mon, 14 Feb 2022 09:33:35 -0500
X-MC-Unique: PFZIXEbsPE60fBr_SuMZ9A-1
Received: by mail-oo1-f72.google.com with SMTP id h7-20020a4aa287000000b002eb15de5797so10702268ool.23
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 06:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oIIRJ21BwIfvNwz0gmLQtZq6j5ywHb6my37zjrdYjEk=;
        b=p+lSXMCUjRXTTQTsgrD1Yg6BgK5KgYhSBJmGOF3uELXN8Bqb0bTHyEgnPMiCUVJxiM
         KPCH/pLbQaKN2ZCaiR1/uoIY58VZ1xVdtmozashaPcKT8rESy+BG4iXFGEMeu6w+y9Yw
         XdI7FW6ZCHmbxZ0ISpFYpvh2MYNUCb9+3yD5AY4Viy6zPAq4xIB7CwVmUlPXY5hu1lGY
         rTf24719jnhKjW0iEni2Khe3BHtvEIF6QTtHooveuhwCsjwhwySppSccuvwR4FuSMc9N
         4d7IBZ6iZ7qK3fe3HVbrN9uo75WGjPNeJlNTJzVl0no7ERFDudRughrzSlDLyCDmK7Dg
         SOdA==
X-Gm-Message-State: AOAM53225fkH9kBKqNa7c81NdAinrNzZAY8Uf+BUqNP8R272tYkUfbaN
	0RaUlPJw5shyhJizwcRwIwszecZWAbpsB1hA5YTqZ8Xqh/sAMNO8vxNP4MGFB4XxEtTTGD/C3Fj
	zLtVR+H+kQb/jKw==
X-Received: by 2002:a05:6870:c095:: with SMTP id c21mr2067595oad.245.1644849215042;
        Mon, 14 Feb 2022 06:33:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdVQ5IR9sHLZgVPu2QVTSPw4yaT3G8ufJi3cdC6V7G9uaFDWwCWmnk8z6rfOM7YD50C4dtNQ==
X-Received: by 2002:a05:6870:c095:: with SMTP id c21mr2067577oad.245.1644849214794;
        Mon, 14 Feb 2022 06:33:34 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id z4sm12449303ota.7.2022.02.14.06.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 06:33:34 -0800 (PST)
From: trix@redhat.com
To: jesse.brandeburg@intel.com,
	anthony.l.nguyen@intel.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	jacob.e.keller@intel.com
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ice: check the return of ice_ptp_gettimex64
Date: Mon, 14 Feb 2022 06:33:27 -0800
Message-Id: <20220214143327.2884183-1-trix@redhat.com>
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
time64.h:69:50: warning: The left operand of '+'
  is a garbage value
  set_normalized_timespec64(&ts_delta, lhs.tv_sec + rhs.tv_sec,
                                       ~~~~~~~~~~ ^
In ice_ptp_adjtime_nonatomic(), the timespec64 variable 'now'
is set by ice_ptp_gettimex64().  This function can fail
with -EBUSY, so 'now' can have a gargbage value.
So check the return.

Fixes: 06c16d89d2cb ("ice: register 1588 PTP clock device object for E810 devices")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/intel/ice/ice_ptp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
index ae291d442539..000c39d163a2 100644
--- a/drivers/net/ethernet/intel/ice/ice_ptp.c
+++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
@@ -1533,9 +1533,12 @@ ice_ptp_settime64(struct ptp_clock_info *info, const struct timespec64 *ts)
 static int ice_ptp_adjtime_nonatomic(struct ptp_clock_info *info, s64 delta)
 {
 	struct timespec64 now, then;
+	int ret;
 
 	then = ns_to_timespec64(delta);
-	ice_ptp_gettimex64(info, &now, NULL);
+	ret = ice_ptp_gettimex64(info, &now, NULL);
+	if (ret)
+		return ret;
 	now = timespec64_add(now, then);
 
 	return ice_ptp_settime64(info, (const struct timespec64 *)&now);
-- 
2.26.3

