Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE633506C
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620068; cv=none; b=b1iOjTYCzJYLNSffla3nbmxVGOGYtxu1A6caEVwzjZiE+TdYkakrIj/nJItdY+R3FYU90xLt1lqGruw6gNj31GYRFm7pVYkJ9wvULyEkBTI9bxGL4JW/HZhh8bQSVwi3apkZ1iIa97TGKolz3oD5Tka7DHGqpWuotz6Xde/3LmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620068; c=relaxed/simple;
	bh=wadaFrSSj2BDmJ3Y9ZwRT2wmM4bLw1N+eXfF5sF3PLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YssC0y5Y1WR9EWOJAjq025Y8Jf48oh5oKZ/OYY5ko06hjL5B/8WtBIRzZabmo1u/TBvyNJMw++HyamhmOJK/HR026GKQ03io4qQPW3aYUpTjQOouR5/Wn24ftNs97vBGFIISejNFcDz/Qr3dZF8DEHAQwHeisUPBJlSPQ+8yVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTN5IPmH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtJgGaPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTN5IPmH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtJgGaPY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058PZG41234621
	for <llvm@lists.linux.dev>; Mon, 5 Jan 2026 13:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=; b=kTN5IPmHWAYwIMY6
	bTLm2FRvrzsWg0872uWjazo7CtUOthJGNScCOTLOWLSf6G7Xgbu68N72t5VmBtj8
	V1vy6UXeIQ0QcTmZ9mLevu5YGYBvojNHO8KM4IXlI5UqJ9axXuAP9wjiLzoUrRwG
	55sfv3mDCLAJYwKE7B20HFLQa9Ri0ZNQClVaA3MJ3WNngbl7yK7cZKQfIyxnj81n
	ggNcNLySHHq7qb17OzIvJo3zg6wg8sHNiClltJc/kYgue1GRnG2zYnbKO27Fdbub
	DAFZEg0Pt0XNzX8FPlx55KdHXpmPCiTaq5+p1Kk6wwMq8ZlJSBp+7iKz/Hv1Rbmk
	joMj9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hcj2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 13:34:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee16731ceaso284720931cf.2
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620056; x=1768224856; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
        b=NtJgGaPYFuJqZ76H39C8gdjrJAm3E+Aw9PWlK0aT2aGgLBrdI07YlO0INRnm6s6e37
         +famIAUQ/ISdLQgm/02P6TA2imRIc536+F3Ji04+JrYpMqVowbygXPZQ6K3oyX/7KZtR
         JhPgXW+kNPQ1JZCscsLH0OcuqBktC4Xj9Q7FmPmaNg2B+c5/3UWjeNC4SNbUtJDr7cJc
         isa/sIhAt3qkWdjduztOvZoPQfQ51kQ1Ws0PnK6IvlGq3jg+DUY8s5sXo4S9qUoqzBQw
         XsYAU+4X5bDpl00lDpe22Eg+dsKZ+H9OvDg25Um1xY2j5ZsfQKLdn+VR1b4bFETGPvxR
         aQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620056; x=1768224856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
        b=hSuHbuRW6qRHpNI+g00heFAf8sK5C/vicC8WDO2KMoT+MmaWEXCiU2YFwtthbLtuUU
         HTKPMVVN4rm4qCSKta4usKRbeBP966NVBhEtqXAkflGSYs4ZlDDNkgrHWA0d13MPvxqb
         n3d8JHsDPMMEfUYfM2J/5mN+X8dCwjpWSn7/kt7fiaszSxMNitaXFNud0JpdQKyn5LQ0
         n3/s3lA+AWeE3um9CtoP8/UcDd2fJmfNKDHpG930LpTOSPtdGp4/Y7qsVRDh7Zij6sgF
         i1V47qOWyh5FM8W6XBIHz+IaRWx7LHOFIpX9Rz2Pns+9cqJsql2nafxPi+qYBbxQpDlQ
         YKAg==
X-Forwarded-Encrypted: i=1; AJvYcCVJwcZX9QEDON5GuYtSRCyMRWkCtcN+w3kE0+cM55aHSmJ/kbRkU8khKSlIyLa6Qiyy9xH2@lists.linux.dev
X-Gm-Message-State: AOJu0YzhQHdKqKxm4cyFpA8xWA30tQy5F82R95EuYEU3UJeEk64l55vs
	fXQKr3H7IrB582Lq+9/d22RCdjhwu2+buC1HKnkwW3fxvTqCRMP+VRJ2dd+pylSvqxji0eLRN0T
	oJO5HYarKAJiXubMi2gkFPjO2ouFYuLdQkW2emManhqT1IppcL8k3vA+C
X-Gm-Gg: AY/fxX7FiKWAqoiV/uP3EB4beafqvb32nQU7OB9dgqKnn5kx8CtiUYelyfwk4Z9IQIc
	uE2D1FWp6/BARSq3n286jONix2dqolspIlP6ykLmCHp8So7BwjDw75Iatt9zuguBadxAx+urVkN
	a2IhmvwcbqVOqVG3mNqy2AbgD1i4ThTU+PZaZJLddEX/EQbmjOPwqVJhTDO1I10r7ShsChDRpBq
	NQi9dI973W75WYrgLGDnNY9KtaMIo3BhvR+LQ+Ezo98JxkHd3rhIMZEOw29KZYpwatrElaRQvLa
	sGRChSRaAu4D9tvTIV/T5lz//jvXIWCFGUlZJQjOHubPgBfA9wYSUs7yte9juK81gneQrf818H1
	Flt0/Rb/qhUwt/zIOmEWNV1EGLY93s1/g/A==
X-Received: by 2002:a05:622a:1f13:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f4abd103f5mr849343191cf.37.1767620055821;
        Mon, 05 Jan 2026 05:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvCss19TuzHTSn4xc5KfwRsOoyqP2KDps/f1CJU56eHf9wA/2/5GRqU+YaxUO4C+nFYpkDnA==
X-Received: by 2002:a05:622a:1f13:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f4abd103f5mr849342761cf.37.1767620055259;
        Mon, 05 Jan 2026 05:34:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:46 +0100
Subject: [PATCH 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-8-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wadaFrSSj2BDmJ3Y9ZwRT2wmM4bLw1N+eXfF5sF3PLA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW728Erceuq7BAzG0tJPUBxSPGgMpB/EHmi/cc
 Q1ZyCkRLGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vAAKCRDBN2bmhouD
 1zE6D/wIyBX5G3Tz0OKc86+zlTFfb3sgWPJPG2/wE9P5S1QCt8BMPbgtOESBU4oTjXn66148vpl
 4XA433YmKdR7SjWdruBtZOqiX7mSmQX7D+8XZlzsjDmqMWDshv3n41mHz4BGlTPsmIVG80LeFfK
 STAvr/njh8HCX/m/zH+CrDN13GYwT3TzdmD7vqgN6mzGCpWHa03kWlTa0d2Bp5aB/1N2W6DB3XT
 acNWdBnPZ6dxvlZc3aqgTDyQw2qfuUOLW2oNPKKD6lzpwYhMDCapLOok42Gd6H1U0OOl++WqP9b
 KuYbkdEqhXte22rq3yX3IOCFTL88H2iTL+ucTcNvzbE2k5lnbidNefylPrbT54uegORpnd6cp+A
 wyr58AVOWkbYBUvOwHu0p2gjbvVMXCTvjRASpUORfyC+/eHriePowQyW4pSkRr6TKufiu/mSDxk
 BsG5gwL07OGLc4LaBJKhnFKbNcokTq5Lh7z9zSbhb2MISrgYXZjF01TISh3QIZ5XsrKILL4iKW7
 XhBXMbwi3s3zYmfJUxdLjtJJ/rMqYOkG+BD39Jowg8p5T5RstO/N3aqVr9AfjiMAKQzyr/njdXy
 dlH4tFltIR7kP3B3ceyM4jdNp6Mi/8elfSx3k5QjysshnK68eMtnAnlIA4lsOHWUIfFP9EFpEqC
 PaSRKa+5UVrrIBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfXzchyvDli+rLG
 d+xq0a42/g3aKJDHwoGri39+2uwbyItDrODk7m3/GZnpv3S2z+rHbUzremoDFKLoMudyyIVaPkP
 a9+CyBaio2fzEp+sgjK35CmbmUTiexuSUItfJRqDqMH+AxBv1p46Uel9Vue+iZLi8tFvPy7BvjB
 kE78LP8KkJ0XOSzlg8k+bRCSI2FtLMjS+MgFX9444+nFvrb2nDYrY98AchILEY549YRpRjo+fd/
 UdHy/2iIjmp8ZZwLY/eQyaL7I6ztWuTjI72ve5SE9gJNHZFFE13h8+YGf+yOmg1KTyOt70Cmvwh
 cDfYpnLg2JBr3uh1RJR2BhITOZtL1nBVvj/TWKBEzOqDxoMVRJKvag7h39ObVsYQgKjvF4k+Ln6
 nnC4lX/uC/taAZKibpJ6xQrGn0gVUWdxL70CRlXSQTefaG7rCGzyxNtXH3P7nGUy15WNBjJehht
 q+aJ7d0kTAC+7UgRA9A==
X-Proofpoint-GUID: UthDrMea7RbXras6kj4kLC4w9n06cdQ0
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695bbdd8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UthDrMea7RbXras6kj4kLC4w9n06cdQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on first patch.
---
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0

