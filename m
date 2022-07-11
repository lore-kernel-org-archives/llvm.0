Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928E4420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 17:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FC0C341C8;
	Mon, 11 Jul 2022 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657561268;
	bh=HaO+adNqd/9v4OcEiOAcWiu0KwhpZERuHu5pfrlo9Jw=;
	h=From:To:Cc:Subject:Date:From;
	b=R9Bgdoqt9BspDfwjIavckyu4YL063PwroK8RXQNtZJWM4uAFQhNi2Eb4dyohqiRYm
	 hAWoL1Fre6ZE+gnnplQE6zgw8Kz49PnSjQozBXUcXgMbCREC9aPJKepF0K8lghZ/It
	 woZFo/OLk2arcHMSOnz6/VE5+ZLVgaWNRxQoeemS90FdvknaLTvoT7jYe00ZhPNbFu
	 45ylM454dRVCtGp4xQCjh6+3bmpmuxn9bn+sA4g2ElZGpc5CQ1B9Z1xHlLxrfLOnAl
	 meGBENv4KIMdWW9+cac3UuOO/u7gsfkkQocXVwA/31Xp8I3N4YSo1rGlfdevQcCdpS
	 9axZQ/yUQHR2A==
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Robert Foss <robert.foss@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] clk: qcom: gpucc-sm8350: Fix "initializer element is not constant" error
Date: Mon, 11 Jul 2022 10:40:05 -0700
Message-Id: <20220711174004.3047516-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building with clang or GCC older than 8, errors along the following
lines occur:

  drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
          gpu_cc_parent,
          ^~~~~~~~~~~~~
  drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not a compile-time constant
          gpu_cc_parent,
          ^~~~~~~~~~~~~
  2 errors generated.

The C standard allows an implementation to accept other forms of
constant expressions, which GCC 8+ has chosen to do, but it is not
required. Just inline the initializer to resolve the error.

Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
Link: https://github.com/ClangBuiltLinux/linux/issues/1660
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v1 -> v2: https://lore.kernel.org/20220711163021.152578-1-nathan@kernel.org/

* Just inline the initializer, rather than using a macro (Dmitry).

 drivers/clk/qcom/gpucc-sm8350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index d13fa813d190..5367ce654ac9 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -108,7 +108,7 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_0[] = {
-	gpu_cc_parent,
+	{ .fw_name = "bi_tcxo" },
 	{ .hw = &gpu_cc_pll0.clkr.hw },
 	{ .hw = &gpu_cc_pll1.clkr.hw },
 	{ .fw_name = "gcc_gpu_gpll0_clk_src" },
@@ -123,7 +123,7 @@ static const struct parent_map gpu_cc_parent_map_1[] = {
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_1[] = {
-	gpu_cc_parent,
+	{ .fw_name = "bi_tcxo" },
 	{ .hw = &gpu_cc_pll1.clkr.hw },
 	{ .fw_name = "gcc_gpu_gpll0_clk_src" },
 	{ .fw_name = "gcc_gpu_gpll0_div_clk_src" },

base-commit: 0dd8e16bfbc003b009f843e75fae4046daa08fe9
-- 
2.37.0

