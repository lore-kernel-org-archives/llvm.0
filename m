Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154152902
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 16:30:38 +0000 (UTC)
Date: Mon, 10 Oct 2022 16:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
	s=protonmail; t=1665419436; x=1665678636;
	bh=SyFCPIcMkbaeh4oGZzzC4dCXwDR/aCjKy8Lzyx9l6ow=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID;
	b=VHpBKXy+rKcZiLte2rUx0d/UGQhg61fkXtuEryZBrJ31iTaXMXUEqD12mwS4hwpyx
	 2GWtRTbfmZAoMjC/fmhV5csnNnaoYMCNoPj3LuwT6uZY71jmfl/4emhi74nAYiopqx
	 0ErW4ayhUJgw5DTox5h21qNxcuDzgNYyfMC8Yps0=
To: caleb@connolly.tech
From: Caleb Connolly <caleb@connolly.tech>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeff LaBundy <jeff@labundy.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Rob Herring <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
Subject: [PATCH v6 0/2] input: introduce support for Qualcomm SPMI haptics
Message-ID: <20221010162945.1325770-1-caleb@connolly.tech>
Feedback-ID: 10753939:user:proton
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series introduces a driver for the SPMI haptics hardware block
found in Qualcomm PMICs. SPMI haptics support LRA (Linear Resonant
Actuator) style haptics, as well as ERM (Eccentric Rotating Mass).
It also supports several modes of driving the haptics, e.g. by loading
the pattern to play into an internal buffer, or using PWM.

More information about the hardware can be found here:
        https://gitlab.com/sdm845-mainline/linux/-/wikis/PMI8998-QPNP-Hapti=
cs

This driver has been written based on downstream sources as no public
documentation is available. It includes initial support for LRA haptics
in buffer mode, this combination seems to be the most common and will
enable haptics on the OnePlus 6 and 6T, PocoPhone F1, OnePlus 5 and
several other Qualcomm devices with mainline kernel support.

The driver is implemented using the ff-memless (forcefeedback) input
framework and makes an attempt to control the strength of vibration relativ=
e
to the magnitude set from userspace.

Changes since v5:
 - Fix dt schema errors
 - Fix typo (thanks Vincent)

Changes since v4:
 - Significant rewrite and cleanup
 - switch to dev_err_probe()
 - Run through clang-format

Changes since v3:
 - Adjust example DTS to avoid creating new warnings in dt_binding_check
 - Address warnings from kernel test robot.

Changes since v2:
 - Addressed Rob's comments on dt-bindings (I'm not sure what to do
   about the pmic compatible?)
 - Fixed some typos

Changes since v1:
 - Replace old QPNP naming with SPMI
 - Address Bjorn's comments on the driver, various style and code cleanups
 - Address Bjorn's comments on the DT bindings and DTS
 - Pickup patches from Joel and Jami to enable haptics on the OnePlus 5
   and Poco F1.

Caleb Connolly (2):
  dt-bindings: input: document Qualcomm PMI8998 haptics driver
  input: add Qualcomm SPMI haptics driver

 .../bindings/input/qcom,pmi8998-haptics.yaml  |  71 ++
 drivers/input/misc/Kconfig                    |  15 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/qcom-pmi8998-haptics.c     | 690 ++++++++++++++++++
 4 files changed, 777 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pmi8998-ha=
ptics.yaml
 create mode 100644 drivers/input/misc/qcom-pmi8998-haptics.c

--
2.38.0


