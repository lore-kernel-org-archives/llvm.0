Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64B1FC5
	for <llvm@lists.linux.dev>; Sat,  2 Jul 2022 15:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656774626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cqp43LfXGvDDWLcjAcU0nNREspk+kElXMNXTMGJ8P1E=;
	b=iHChBTlhi0ZO4t/yuEFiwq283rbT2hz5Jx9MEGIU4SsbwMmivwdIjSpikCuTTo3UFxMfvq
	3/KvPihmtnGR7cWpNvUYRbvyim+UvAFvjDw0Wp31WRAHpghLhBObgb+kN4XEhfZOLzSRzZ
	9/AbxZKtAhO2dZFCsaWfNiJhL3qK9hQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-1b_aKMHjPvqYiCMF_uOJ1g-1; Sat, 02 Jul 2022 11:10:25 -0400
X-MC-Unique: 1b_aKMHjPvqYiCMF_uOJ1g-1
Received: by mail-qt1-f198.google.com with SMTP id q21-20020ac84115000000b0031bf60d9b35so2791211qtl.4
        for <llvm@lists.linux.dev>; Sat, 02 Jul 2022 08:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cqp43LfXGvDDWLcjAcU0nNREspk+kElXMNXTMGJ8P1E=;
        b=PwaCN4mZF2IPpH5H4YXECVqrivVhcAmVb4H2h5C+ry1o0L9mqGVPx8+6yflzdtFMLG
         fc2AHMb8TNBf1uX+VNp5Vsd39/PyPISlu6oiMhQFchdUvv5InhCQiWkqkfNGydmiD0JP
         Y6qtUL7kOZVN1zeuRkgxEv868Yhy/lR/sk2B4WhLgAIBGVFu9tvE8Is5FN5OucXW6IAJ
         Ou/5Em2ZEPfdEwrREYEG/NALfwr6aoEMePW2pJ/07gfjk+klG+2KtidXYy7yNYrvrpuL
         TriSXfeffqU+6cJO00M8KqWrlGXWgE3dJFAGIXAKo2Tlm3IkkpW6fQ90FL24bV3iQtjH
         F7Nw==
X-Gm-Message-State: AJIora9U+Q9WS8wIJEGXsgWmeDwpBCkGlk4Ynk/1eK/5fOMpMxWsKqKm
	AzhEkVwxBQkqb5HQn8ro8+vSMfCd0A9/J+2e6EQIzeEr8VQb3Z+uwPYAe9V/CUWjbVEL3eAEwfw
	kusqv1ywVt6BhUQ==
X-Received: by 2002:ac8:5816:0:b0:31d:4178:5fd0 with SMTP id g22-20020ac85816000000b0031d41785fd0mr1632037qtg.253.1656774624761;
        Sat, 02 Jul 2022 08:10:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vl3/Ai5Vps6cqyXNHSW43QW8v5SfQxKSachr4YHT8JFyALP6kBEa7qly/qiC2VBYhdMdg8Gg==
X-Received: by 2002:ac8:5816:0:b0:31d:4178:5fd0 with SMTP id g22-20020ac85816000000b0031d41785fd0mr1632016qtg.253.1656774624536;
        Sat, 02 Jul 2022 08:10:24 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id hh10-20020a05622a618a00b003154e7466casm16292230qtb.51.2022.07.02.08.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 08:10:23 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gregory.greenman@intel.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	luciano.coelho@intel.com,
	ayala.barazani@intel.com,
	miriam.rachel.korenblit@intel.com,
	johannes.berg@intel.com,
	matt.chen@intel.com
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] iwlwifi: mvm: return an error if setting tbl_rev fails
Date: Sat,  2 Jul 2022 11:10:20 -0400
Message-Id: <20220702151020.2524220-1-trix@redhat.com>
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

clang static analysis reports
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1048:17: warning: Assigned value is garbage or undefined [core.uninitialized.Assign]
        fwrt->ppag_ver = tbl_rev;
                       ^ ~~~~~~~
tbl_rev is optionaly set by a series of calls to iwl_acpi_get_wifi_pkg()
and then jumping to the read_table when a call is successful.  The
error case when all the call fails is not handled.  On all failed,
the code flow falls through to the read_table label.  Add an error
handler for the all fail case.

Fixes: e8e10a37c51c ("iwlwifi: acpi: move ppag code from mvm to fw/acpi")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/intel/iwlwifi/fw/acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/fw/acpi.c b/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
index e6d64152c81a..1ef1e26c3206 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
@@ -1044,6 +1044,9 @@ int iwl_acpi_get_ppag_table(struct iwl_fw_runtime *fwrt)
 		goto read_table;
 	}
 
+	ret = -EINVAL;
+	goto out_free;
+
 read_table:
 	fwrt->ppag_ver = tbl_rev;
 	flags = &wifi_pkg->package.elements[1];
-- 
2.27.0

