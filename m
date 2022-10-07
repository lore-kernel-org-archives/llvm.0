Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F14A33FE
	for <llvm@lists.linux.dev>; Fri,  7 Oct 2022 22:23:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id ay36so3669248wmb.0
        for <llvm@lists.linux.dev>; Fri, 07 Oct 2022 15:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MImtf0Wf4m+QCdLQViE/JC/7ATAAtbSE1jIuWWLnJvA=;
        b=EkmsnPinOHoAe1msnfPZIqppKVi9NZfAp14tWuESUEWdySA7FzW5P/Lx7qmFQc5xoT
         tIKmNTq6cmITRsdnhWIdolKS/+mmCrIMH1Aisj0SVlIvqptcAnQ+WsiTrKqWlI6LGhIV
         Tc46U5KQE4FgKgp9V94Y4A9sSU9QoVvPDUqbkZnrS98Qvz6+LJIkucRiHUX+ojVUTUB+
         1i9RXsjYBZc+1bSKss029x+0cBASDUBc09UNd0Sasm4ix6ScqlDlk98SOUHk/OT6VRmz
         r4tEwMbLwO/NjKoOWpsj+p4kAeDQIXdnOhao/zrS3U8OoV9fqbVLz7eyb2zBy1cHie5y
         joYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MImtf0Wf4m+QCdLQViE/JC/7ATAAtbSE1jIuWWLnJvA=;
        b=Qjt0PDQBo8iLXm4S4jtrzUMPyFEqKj8AjJu/1Nq09m94JyPVIvZfendU7jAwSfTG4h
         4Ub1q0tCSQ4nI/jL/Z1CSeNdueHbNKrmoIWcvFo2JKhATWEcktY441m0Iz2DEV5SM/60
         axQPy0cNnsg46L/t2RLc4cbLZD5Jxjo0D+eGvo9r2CnjJPVr3JvUcvUrYoWfTE7Z9nmk
         LTPHLQiUQNfKvnDM+5gdL5cj9isR0MMtbVU9tmXCuaDOxOJcnAhdfp64Ln5q3zu2w4vE
         iII38nIsSiPNRI2d2F3odcnq4XXVIK/gvYNgs2dHymbhvuQ2/NFV6qLWdgIy6UEphARq
         CdBA==
X-Gm-Message-State: ACrzQf3sLbDOQdvm1N1MzvI938/M2U00sdFKCMMxaCusLId0S7+f5kds
	Ax94EFriyzjr4qWHNfDE3GOqww==
X-Google-Smtp-Source: AMsMyM5biB58MjjwoI54Sm9NJ1aowLkAk7UBf2LQFmWAjoz9bJsxy3V8abHtA4Ks8YUspX2Axq9hPg==
X-Received: by 2002:a05:600c:1d23:b0:3c0:7701:8a54 with SMTP id l35-20020a05600c1d2300b003c077018a54mr9273178wms.84.1665181393349;
        Fri, 07 Oct 2022 15:23:13 -0700 (PDT)
Received: from localhost.localdomain (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id d5-20020a05600c34c500b003c409244bb0sm1115777wmq.6.2022.10.07.15.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 15:23:12 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	phone-devel@vger.kernel.org,
	Caleb Connolly <caleb.connolly@linaro.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v5 0/2] power: supply: introduce support for the Qualcomm smb2 charger
Date: Fri,  7 Oct 2022 23:22:01 +0100
Message-Id: <20221007222205.126190-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for the Qualcomm PMI8998/PM660 Switch-Mode Battery Charger.
This is the second generation SMB charger, and replaces the previous
SMBB hardware found in older PMICs.

This driver provides basic support for initialising the hardware,
configuring the USB input current limit and reporting information about
the state of the charger. Features like type-c dual role support and OTG
switching will be added in future patches.

This patch series depends on my previous series adding support for
the Round Robin ADC which is used for reading the USB voltage and
current, it is currently queued in linux-next, and can be found here:
https://lore.kernel.org/linux-arm-msm/20220429220904.137297-1-caleb.connolly@linaro.org/
This has now been merged

Changes since v4:
 * Fix typo when setting FAST_CHARGE_CURRENT_CFG - the OnePlus 6 now charges
   properly!
 * Limited charge current to 1A until we better understand the thermal
   protection features and how to use them.
 * Address Sebastian's comments (thanks for your patience with this)
 * re-run clang-format

Changes since v3:
 * Drop DTS patches, to be sent in a future series
 * Add POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT so that the charger will
   be exposed as a cooling device,
   see https://lore.kernel.org/linux-pm/164f2458-fb66-f238-7143-bdbe1e200870@linaro.org
 * Run clang-format and prevent it from breaking the formatting of the
   defines
 * Apply Sebastian's suggested fixes

Changes since v2:
 * Use devm_delayed_work_autocancel
 * Minor driver fixes
 * Pick up Krzysztof's R-b on the DT patch

Changes since v1:
 * Rename the driver to pmi8998_charger
 * Drop unnecessary (and very broken) mutex
 * Rework the driver based on feedback to v1
 * Fix some minor bugs and improve Automatic Input Current Limit support

Caleb Connolly (2):
  power: supply: add Qualcomm PMI8998 SMB2 Charger driver
  dt-bindings: power: supply: qcom,pmi8998-charger: add bindings for
    smb2 driver

 .../power/supply/qcom,pmi8998-charger.yaml    |   82 ++
 drivers/power/supply/Kconfig                  |   16 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/qcom_pmi8998_charger.c   | 1040 +++++++++++++++++
 4 files changed, 1139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 create mode 100644 drivers/power/supply/qcom_pmi8998_charger.c

-- 
2.38.0

