Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F459324B0A
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620052; cv=none; b=ne4qx90Ew48ByBa0bfiublhz5l0zOk9E+FfSTQBxH1mvfiQQBOYcpG0fzUkDxtyuinrr108dNuMWDEx+z25pPSlmdUY4+clbySAKVOnDQ7ouJL585l9wDlU/mf55nvvscZfDrZEv/EJ5P8N+OoveLrC4Tjq6QplDIb6Sv+lShcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620052; c=relaxed/simple;
	bh=LVLzy0PUtWV8BS2tmtolxGrxYJ3Rutx30xWjiFUNeE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWjqsST2sdhInsezZTqbkiMDvmQLSavrQUuE96nYWrHohXhtMQDAoNC/arLjblQCWVsG/bcg8eyacbIGlhKeQqoNJR1l1eGe3wVeVqZaRUOjvbWCjUJVMiatp/gfmoMvuAyBQczKT2YLC8atfidUag8lFoaNmTTDu6TMKGWmh6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cqq+Tvia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZExzUg6K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cqq+Tvia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZExzUg6K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059ckLn610322
	for <llvm@lists.linux.dev>; Mon, 5 Jan 2026 13:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=; b=Cqq+Tviamb8ohm1N
	qJMGiuQ6TRAQg/hGCAvjozssKyzNHDhBVl8EI4QxNSQ8oF+1U32/wJnNXW+n8gjD
	8wAjGWlGqIkS1vJqrOW16+rYlI/s5+9CesvEbKs7Pa+37mN0BRBuHJJVx9f3Uo4O
	RudXhY4JOe77hHwt3+KHZ4/qUagXde4wsVcUXpJevKRqoW2jl7Uum8aJy6uKdnR5
	0kl9mGnPu19TMVfo/ASTEeVNg2VPSm+LR1QDOHdHCaxgQT8bGI3XubV0xJv+Zgt4
	WNRsCjjUkx4qxjUlYQZ3VslIFReKQHYfsPCAaKxQ8L3d1nLGf9Kg7woYRHD2fGc9
	LE9frg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0jdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 13:34:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1f42515ffso375479851cf.0
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 05:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620045; x=1768224845; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
        b=ZExzUg6KtgrFvj49uxYyU6e409XsHE2rOenge8oRCYQIYu0NIQOP/yOILVyJfEnTf8
         kExrXiPTN4p/5H5egRtVZvMpWnD0IutDyBbiiZj6mfv4jFE9nHe4ySYKHQm/hTUTDkNd
         7A9gYC0jYutgSWSXEaLnZO60UUublXi2Hxb/YVIJYevlRNY8g4akqU/u8ycPjtQX7+t2
         maRBK7vKwUjFaQ0wp4XvLLQ5eQyrh2g8RhEDiaPw2NP321epP6eAtxhb6YbDZC2W+VCg
         V1TD5LOBtatLH8Gm7sJc2bBPlgxepD8tVyPmaiNXmXKLHjSycZBy0GBuoef0ibmgpJeK
         15iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620045; x=1768224845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
        b=FetvXpSyjoMRiNB7GmhjgVS1oUZMNQL7OLD34POhRhRUn/SWb1f/PxVrj/Loo9dPWi
         5t8VIlWn3PXUwQV2yNMMO21vi7OAXKNWzgmP5GXm6+PRQ6JWEl36yyl1B7Y5SsVEBifi
         aCmjJan8dwIBYsWAwjvIL2yXxduj39Bg31/NIBkHSuZurSSzwZibAqRfj9N9Uwgc+8+W
         DWouGPp58v8r9VAq6JGnuD4KIrogFzU4wagW3wJ22Z11xGN+blds64phta/IhXAYgokR
         GgMeMSD37YnObpW6mI/keKumOI2COOElxlTT5r+GtZso5ZrY1qEOrXIALNo/R/5UeVf3
         jPcw==
X-Forwarded-Encrypted: i=1; AJvYcCUz14yh3TxGbyIxKQzfBmZfWkBsSTKn5UC1nT9mVGyiqc7KTpTmRAe+UctGAEvxEJeKnqmN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/6xTgLelcX0KdzpqP9bnMCojp7b39Q5FaQWb7MNAwnfPfcZFk
	lwc9it4p92OdX349UfCnd3jm4M3RZR7UR6Ml07Emi7OM5NqU08gQnjYdAft71IMJRX8P5mYUEZm
	kQq+Nkk4AX2eT4da0qjtndJVj4uEVTY9JqXY/0iZ/AniWBry4WjkKsRBi
X-Gm-Gg: AY/fxX7GOZ47V29QTn2WZjhYVEhjyEFQkOYFyP9n7omyiwhvEsUKeI7G6Y6fBuN/KDy
	HApyXEO8p0rTrN8eRsBSjv8YPlCvQwnMfArBoBx02APihYbfcs84D8KVin2sn2S8Z8aWeXgkMl9
	Dbv9gWNUzHc8gt6qUA8z+GnngbtAngzMroQPG/3JpYlnh6zQtr3oG0G6wxrX1Q2cxXC5sPlFb1y
	8jUQdCl2kU+ifhn4ikhiTvSh8JBuZfpw2r0gv6/sR2Sy1YRtgsSg8mU5z4QAAvNaOkXpCARiX9o
	+NPtMX22znnYH9Ullblaglt9eWg4Nsd3La38Vv49jrp5BOCtKQPY4OWu9o8QcEp3T2MyHv4YeMF
	IIiZKQXHTI7m1qjzfYGzaDakNd+ip2PkqZg==
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id d75a77b69052e-4f4abd1fd20mr854415901cf.37.1767620045469;
        Mon, 05 Jan 2026 05:34:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaegexSj096K3fUiheKT2eEZCKoRyRaf9tDTO6HJyvQ3dPuQF/hQFiRxGLj+JZN3lJsktzbQ==
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id d75a77b69052e-4f4abd1fd20mr854415341cf.37.1767620044848;
        Mon, 05 Jan 2026 05:34:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:42 +0100
Subject: [PATCH 04/11] powerpc/fsp2: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-4-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LVLzy0PUtWV8BS2tmtolxGrxYJ3Rutx30xWjiFUNeE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW725Sthfa38INoq+BFrKBCIQ9LENj28mNcejT
 zH4La1FBV2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9uQAKCRDBN2bmhouD
 1+Y3EACFb/c5RPWrsm9EJCGgElk5vs16RKVssUJeI8OeCDe7qdbUwCuVZxqQKA9r/qGQOvjvryT
 hX1qwbs//UAEeuNPZV2XNaE3dmO+F3Hly+GEsYAz7c0N+h2s56k/uDY5eXRpmlEmFTIySUAHDbR
 GEq8fQjte6VxHDXwURB9tn1H/t/djxNMYWHo6p1BGJkA70pTZyp6+Cdpzj+6JguPl9xOcg0Rm1k
 PuJe7XLwfWmdFYdjjoWNAmL1U9f2lO744KzgnVSiuIFbhiQEm9MR9x54yUAcuGgvHmpwh/nXVSO
 svb+ji0Nrkp12dBF2Tx37D3xIgYqw4CdAkNc4TsN8FA7xzGfdjnp0p1917/yozTqg3uw9poYf0s
 L6wG2dEzDp9TOu5hT3wPQSyZJUg6/H8J52lQKd4pZXvRK7LrOw3WH99h5BAp40dXR4NuaQPe+fd
 sFEuD9e7N4KLOUYa4VACZbhVGPSIPmdEsrvjkoEiotFcGCRNWcfNA5I4Q2JXlBwPhzQtmBDhBPa
 tp0G+hWwzQahW0uFa+KcCd0sPoUz48CQP62nynSjLl7rsA2XvCYLPo8HEzevq0q2pmJnNYznbAq
 vhbVRAcFTXI7l5F/Ph7YDmX7evKLAzxjmpU3wjr/16y3Id3dr/lcqHb4vmmZBPry3EU8sU4akYy
 NGGA0x15ltZqDCA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: OhwrjptHUMWJwJ2e3IcBdLr7cHGRnXz9
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bbdce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bRA1xQHzFO3ZoMUYUbgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: OhwrjptHUMWJwJ2e3IcBdLr7cHGRnXz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfXzNg+01pqWAvd
 PRQ1T8uw3ydkMBrTbeVizmeYnAaHF79hxrIGiUeOoQ5QmJF4ci9UawwvlGpGbBY0YsY2SKsF3vR
 ci+dF93/NU2PA+CjHGflfX2RxjKIRNG3mf+RnOR9yc5rowYrMpI2fUREZMMUuHOLSW1lIpkPwQP
 cfpeSjVZRL42ekLDGtRwkiPnCZU58wOxG5kBOBATrgO9+I1MVEyU3JMGollNk6H2PEzbKALyT9g
 WWmmGyFBZSD2sSb5OBFReDIw6S8vgPIpku5AbXfUjnEzNony0V+FZoR5AbNoruPHapoObcDD0Ky
 aMUIpOFRlsxi5kJ9SwTfQwppaWaV03aD4EYJo/7+A3xhLITdxKd1wCtZ6dh9rNr8SjNBDUirtgh
 YAUbJg1480LquQb1PM7UDI2fJ6vJMZjeAC+5y9e/tymCIOOTYX0n+3N6G+7BB4hLHPy7TppQikg
 IWJ1bnBcQPjSX0lqImw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/powerpc/platforms/44x/fsp2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index f6b8d02e08b0..b06d9220844c 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -199,16 +199,14 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
 
 static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
 {
-	struct device_node *np;
 	unsigned int irq;
 	int32_t rc;
 
-	for_each_compatible_node(np, NULL, compat) {
+	for_each_compatible_node_scoped(np, NULL, compat) {
 		irq = irq_of_parse_and_map(np, 0);
 		if (!irq) {
 			pr_err("device tree node %pOFn is missing a interrupt",
 			      np);
-			of_node_put(np);
 			return;
 		}
 
@@ -216,7 +214,6 @@ static void __init node_irq_request(const char *compat, irq_handler_t errirq_han
 		if (rc) {
 			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
 			      np, rc);
-			of_node_put(np);
 			return;
 		}
 	}

-- 
2.51.0

