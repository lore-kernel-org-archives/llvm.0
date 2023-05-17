Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FEE10966
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 18:00:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34HHtGuQ007084;
	Wed, 17 May 2023 12:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684346116;
	bh=ZdFx4WJk7gaa50DEFIuKLu7bef6RAjGgSB7wWhI1fE0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zj5/EobOmHNK6dbld/PufMWVa6QAmdKJ0g2Yp/sY6EQjnji4GK9a13D8riZA79kWP
	 QPThPn4sKRzio4cBccuMvG3XxebaAI/Re0BDCnuMdK4cerRJqbvxQMTRfSxzIRskO+
	 OwcE8U0xQKb5u0KF70j3o3hnewe0jKWG/eKyr+PY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34HHtGQm023786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 May 2023 12:55:16 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 May 2023 12:55:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 May 2023 12:55:15 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34HHtFjM104816;
	Wed, 17 May 2023 12:55:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>, Simon Horman <horms@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Nathan Chancellor <nathan@kernel.org>,
        Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <llvm@lists.linux.dev>
Subject: Re: [PATCH] soc: ti: pruss: Avoid cast to incompatible function type
Date: Wed, 17 May 2023 12:55:15 -0500
Message-ID: <168434598652.1537118.16232593863715460020.b4-ty@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418-pruss-clk-cb-v1-1-549a7e7febe4@kernel.org>
References: <20230418-pruss-clk-cb-v1-1-549a7e7febe4@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Simon Horman,

On Tue, 18 Apr 2023 13:41:48 +0200, Simon Horman wrote:
> Rather than casting clk_unregister_mux to an incompatible function
> type provide a trivial wrapper with the correct signature for the
> use-case.
> 
> Reported by clang-16 with W=1:
> 
>  drivers/soc/ti/pruss.c:158:38: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>          ret = devm_add_action_or_reset(dev, (void(*)(void *))clk_unregister_mux,
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
NOTE: I think this is trivial fixup, which I think is better off for
the next window.
Thank you!

[1/1] soc: ti: pruss: Avoid cast to incompatible function type
      commit: 413552b360e72604b8c0cf3f60f9e6f01c8ff963

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

