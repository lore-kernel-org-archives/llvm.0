Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FCB3644CB
	for <llvm@lists.linux.dev>; Fri,  9 Jan 2026 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977903; cv=none; b=sPtffSyovutKtmgrgdu2HB9F24u7n6yIbUVuDk1phYwGxyQ8zN/O3jAEvCb44JyNIXVVNQcNqfosycLdIyKxLy6JjZQypujE/pCvhx2H1Q/J/PEKJDfFr5az5toSP9D1C9JxVHsFS4ZKdXI0fSDBH3Fg0WxQVsodFZTchV+OdSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977903; c=relaxed/simple;
	bh=T0iguywPlMIlSsxDnFb4fp3zFOJO07SWV8Pm8YIMsCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WaucL2a1CvayaAZfL0y1VyFEH9nBxdGGrJoBB4Y4CQ9O3otT2pQ+e6336B04wnsYScoxhXur00QsxJH6nyydq2WqI3mHqE5YAegYf6VPLt204WoEKR1Ae+02BSVsgOqRQtRsmepGKrdP3RqVkEGmVybQ7ir1TrMmNkrRr/GQjZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrKzJhB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHGo7OkE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrKzJhB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHGo7OkE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2ojw1062615
	for <llvm@lists.linux.dev>; Fri, 9 Jan 2026 16:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=; b=TrKzJhB0BPjVRZA5
	9HXeD+qqFANtO5FgzcPUflJJjsJPmL+iJaZopRqfyCmZ0dq0S/5iw14XtqHrOVgM
	4MO4vkkaBoarumcKSw5Se5ySi39PhjzujAkIjNf6M4uC/iH2NeGQWYZBPqgu5Axj
	6Jzyu6+djq56Q6do6Igt7/aNaLpBSvENldQireaPsTCDbDt4T+H0hHoB6jJt4Ucs
	CUn9EDyjfO7I0WpuJ3hezEvLPhB3lNfAGjRLsPX+bRz6/MoDRCWK3PYnff+6X4/s
	NZhrDeHnw4NdZhSkx595XpdxqPSfHy+/9h+vc0cnmB9eoTjX5fy12uMpe0V5g6o8
	wreOxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f690a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 16:58:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1d8f56e24so1105162785a.2
        for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977898; x=1768582698; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
        b=aHGo7OkEdxAnvd/MOlHRs/EPRaOTdc/Q2jkwFSJCukVV0tiA5wI+w9z3Ox9nF2VRxY
         WX31D8+L/lDMn0kunydReaFXLXkHueQoqVkgCzppgh1Lt54AYwIuzj35f1VwJfzsMoic
         /RYwUY/Mj9dvgbbSwWlECiAy9fxUvBEqVoNLT0MjNDhGGMU+bt092nEpPwRHL2k+uZ9E
         kYxg8K/bB0TQ7ELvNZGN/G5wqslVYmQJk36PFeBclGnCFo6hfLbfDWqDelelLWOoexHm
         RdSx713OcEzujG82RxxXMFr7YT6T0d94kDlIINwlQxeuDrxJT05SeUPL1+oYaZLMuJUh
         d5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977898; x=1768582698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
        b=fzc2r9ZRkucKBrfkIFEp21fHn1uTGmy/trKre9lO/1VN/manMKndDQJSQmMMS19W0Z
         9pcpTAfBXfBzGmZp+DIyyIlyYDAxsZOZ7HIqfuPAK01j9U8VNm5mEIKiCXG6yB4mONkc
         /FzBj+DuahclEaNx524r25RGJLxfnDOt60ffCqbeELGN0aefQnuZQU0Fq9NFdTazq2Sj
         DWv5q3l22iR2aesLYK8U7bXLkKbq6xeiGqfmmq4De1XDqzsvgZbBOBoL4BIH4XbHzFFO
         QbTXAmagtPBCjhYMNkaunim4+Qq5VAdcx+rdtjPzOgokMSVZMc4I0DgPLzrw0QY3BVhK
         jF2g==
X-Forwarded-Encrypted: i=1; AJvYcCXmHGSxB4w0Thw04mhE10Haa8MO0wBYbZ5TUI+3y8dQZ9+SeYCRiYKcl78IIISm5wZVGIQn@lists.linux.dev
X-Gm-Message-State: AOJu0YwOrm7HhtsYHR8xQ1OQO/uZxzsP6rxRCFNlUICefiGGHLdX9RgS
	UVAe9rzGCqSBioP0JbiBpkXyQXFRGHXESTHpY46PgXEzpy0Txk8wadB3Fc0+D4wMeslipQPhAHM
	Ua6+0Bl6ZzfC9VdzGehKdQfsGY+pchrYgb6RBZavK2SBYitDmBM9fuRWK
X-Gm-Gg: AY/fxX4p+DlCPanAQUce+o3NDBb+LmBTa6vajTr8SAgzsXLAiCySLia5/15Kc3GBxYF
	B7bDNGohqzMdYOe+u8H9MBYSmMEpsln0/fD0tP2/ZqkPYYrYSdiD4MAj6S27Agp5dk/uJ4O0r14
	XMaK1G86JALQ4NlQzSCGvT1qeKLIQ+Y8TaODB0N5Kk/PrEU07m/olygt0zQBY8Gyg5L1Dbn+1FJ
	OI7+cLjQIKsw+fN6oo48W5O6zvLOydhimMnZBh+gZa6sAUYrcc20dawW0COx83o17irQW/s0G+u
	xkiY38hZ83/s6sWRgSllkJ5IVH4WPaiUavHttBdkl0A82cSOUDxVUoug/iLibTL+5qEGMhZDnsL
	+L1+mNydz5Ei5+kaGm2+cnJbN/AkAzONimA==
X-Received: by 2002:a05:620a:4626:b0:8bb:7dd8:1922 with SMTP id af79cd13be357-8c38939d234mr1435772185a.40.1767977897591;
        Fri, 09 Jan 2026 08:58:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWFg16z7KscX7Y9jM28Hrz2EGd5LC+7ZiK/jAqogZOUQ1S1l+udCeLhRKjK2FRyHwECsbjsA==
X-Received: by 2002:a05:620a:4626:b0:8bb:7dd8:1922 with SMTP id af79cd13be357-8c38939d234mr1435769085a.40.1767977897126;
        Fri, 09 Jan 2026 08:58:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:48 +0100
Subject: [PATCH v3 04/12] powerpc/fsp2: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-4-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
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
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0iguywPlMIlSsxDnFb4fp3zFOJO07SWV8Pm8YIMsCU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOTq4JLeP1qeYnJbbJLJHoPa3XUUF+q1l3Qm
 yHiiBECvReJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkwAKCRDBN2bmhouD
 15CdD/9iKcwGZWr1TPTh1N8VgCg7pZ1MqIHopwRh10bIppgFfKknY9qqEgNJPMZtoa7VsQyBmMv
 oKYS4n2YHL3iPteJQF23gA4VqXj3G9RMN534g7OIvdOY1VJGEBQSl+S/zcv9CHL3/AM+Wgmr+GL
 SXGJvW8MORgp/6Fa4q/5EmRaJC7kuOFxfahl8sPf7WPKy8mPBpKzNEjyl6rH5IE3q8LDjHRMKie
 9pr788DrA4sTL3SEHINAg/agHf6qEM/IdmpIdrnGJMPbgQ/K48mKbcUFljA90vB9RbjDVdnQ+CB
 y4A+2bS9CVv/G8PivbgPctgYy7jtlcVbrNDTl9i9dKYHRchMdVRI7WiEIKPkbvC+v/9T32y9Yy4
 kYCl8DoUvqCJnfzIpCLnSy5EjuSlwV0LaR2d3KpFeQ6GcsUbpXWB4IeXGck635nvlBKutve/vVl
 Me/ZHK20+Or5+fP7foZ0RyVore8ucmE2QIScRBzh4+NBll1cn0luUyCMBl6u4UpbPf+EhK/D5nh
 y/wYpkFV76Bk1oPhj3d0HC5KQ5DX8TKVBFNz3PV5wq1PP2+qTXHFWjv0g3pn8lno5WN0520upkd
 vo0VjbpyCbLmimtcJE8uP+nLHpKnR5WjDlttXt/x0SfIUhk4GEeaUAgHStwNI/UeGDcgWnbYFF0
 L0NEdtwx5ztHplw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=696133aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=bRA1xQHzFO3ZoMUYUbgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfXwagVW5JabjvU
 l128w2ADCK+oGwvgevWtav043ejfogJW5I0ZhlUZnToCXJXdd33GYQFlUrRnm1pHoY3rOukkryi
 AbUcdK4kPDGDU1z0hdR0YXHDCeBF85jf/YVmwqQa7weFs60Wf+uIrD5fjy7U1EEazd1r4CszVlN
 VuHH05UmZleo+dnWTnpTEEfq/mgjlz9P7c+uhDpMgoxM+2pZZYD1Qaw1Kusnk21//3JYXnQ7tIF
 5SNEmhUOJa/NHQS/6f/5DFT1NCNzZ0DYj9ydMBtqeFqeYag56GcSqtrgCpXOwkQYYzhGSEt8k/e
 geK+c8VqfbLG2ez8qWL6xj/8UiHBhKAwTTb0pb7FNF/RZEmFrBd8V1O6haTrFbZtnEMBMqsHTD0
 gILQNhiJihGFGTdTVDwaB3IE0qcDnLNolxUun9HeEIrjvM5xYFjJllU7rZ/tLnamv4PQLxxKFel
 aT58UTeGxFBOgVdPEzA==
X-Proofpoint-GUID: 5kpYWezi2cFD8B4PBpqHc9lz5kuD2ruv
X-Proofpoint-ORIG-GUID: 5kpYWezi2cFD8B4PBpqHc9lz5kuD2ruv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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

