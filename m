Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765C73FCD
	for <llvm@lists.linux.dev>; Fri,  3 Sep 2021 10:39:01 +0000 (UTC)
Received: from [192.168.1.101] (83.6.166.149.neoplus.adsl.tpnet.pl [83.6.166.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CE5C81F511;
	Fri,  3 Sep 2021 12:19:26 +0200 (CEST)
Subject: Re: [linux-next:master 10841/11508]
 drivers/clk/qcom/gcc-sm6350.c:179:37: warning: unused variable
 'gcc_parent_data_2'
To: Stephen Boyd <sboyd@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202109021640.TXyMlULd-lkp@intel.com>
 <85c61a79-3e83-84c8-1b75-3e4640ac3490@somainline.org>
 <163062849533.405991.5146021696613255539@swboyd.mtv.corp.google.com>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <5b7edab0-4756-94d0-d601-050120cbf4cb@somainline.org>
Date: Fri, 3 Sep 2021 12:19:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <163062849533.405991.5146021696613255539@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

> Please send a patch.


From a12e6478a26573babc0fd0df218bc908e80e4d5e Mon Sep 17 00:00:00 2001
From: Konrad Dybcio <konrad.dybcio@somainline.org>
Date: Fri, 3 Sep 2021 12:17:59 +0200
Subject: [PATCH] clk: qcom: gcc-sm6350: Remove unused variable

In the commit "clk: qcom: Add SM6350 GCC driver" (no hash yet) an unused
variable has been overlooked. Remove it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-sm6350.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index 053089f83677..3236706771b1 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -176,10 +176,6 @@ static const struct parent_map gcc_parent_map_2[] = {
        { P_GPLL0_OUT_ODD, 2 },
 };
 
-static const struct clk_parent_data gcc_parent_data_2[] = {
-       { .fw_name = "bi_tcxo" },
-       { .hw = &gpll0_out_odd.clkr.hw },
-};
 static const struct clk_parent_data gcc_parent_data_2_ao[] = {
        { .fw_name = "bi_tcxo_ao" },
        { .hw = &gpll0_out_odd.clkr.hw },
-- 
2.33.0


