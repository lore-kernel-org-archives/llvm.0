Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5543366578
	for <llvm@lists.linux.dev>; Fri,  9 Jan 2026 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977910; cv=none; b=TrAdNKzzzroQGKwdDexHXLIc7CvqdzBmaxZGq44M3IuIJnRKV/O9rhDcJ7nb4hzEsy7V3kJRGaENbAM77N9/MXkZ1UyZSWwE3OBksK+7u++oJ36C2V/pO7e9mXSl4T4Miwsbta3lKvpKsLRF7DEBbstJhglS2fYKb0f4JUiMx94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977910; c=relaxed/simple;
	bh=X+rJqgWZb7AzM0cu+pmQcyBAFnuuYCBdFr+ESsAnRIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EH6OdZhjoNLhlzuTX3EcuiD7S2CvzA3dlkxENirzD3gxwZYziRZNqK6qVO6arqOBcrjll/fLmRKrRZq5Wlcans0io+WDxsUfFKq/IoL9uk+ywa7C767lR5VTIePyVyQdFHrFxcyrMFyLlL+W/xmpylNTge3m0BQkNNW7Frtlfjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLLk73qH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ygl4OQeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLLk73qH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ygl4OQeD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609Ecab93142492
	for <llvm@lists.linux.dev>; Fri, 9 Jan 2026 16:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pS94iKUZ1ZfNhKbyBy+xUgSm1zdImwT1//knkyqK6zM=; b=HLLk73qHKf0AEcm3
	ZjzclVmLeQ0/Ah6IGmE38mGb8WeT7jkmCfgh3Qhq7o7iAMC9TMWTvb/v3TfrkoWm
	rTJHj7cFsKnO7AOfejr9gYB4KoyZh8Q8/AP83uWDcREQRbmXggFdKDH7zHksGjIY
	+346youzmL0/w61L1v0BhkvOYwxSoMWwS6zZvE7WA5o8HqVR0ADPaoutLXKO6Qdg
	cnWCF72VIPRVdRwKLf6roz8zagjxDXW0ilwhrt0cEhupDMoPd9gEEZnmVLYOqHmH
	sNtKvWEEP3xrXM37MwdtQRa0KoAjjtzu+dk6iIKy2JqYcShpU4Bqo4/T0xw8AQHE
	RMWEJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j3d8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 16:58:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b8738fb141so886348185a.0
        for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 08:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977906; x=1768582706; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS94iKUZ1ZfNhKbyBy+xUgSm1zdImwT1//knkyqK6zM=;
        b=Ygl4OQeDhTgT/8cKb2hMYzYoJeaqmqzNB+2zm43zN5Zj0aan21ZWJ/KqPCtGp+6h49
         PAi/WAx9M2qrRjAuhUgCpnrxqHC3x//q7snYlEGDK4n++QCQWqHlGOw9WrKYluMrz8mm
         ER8MB51dCcjyiVJZ3DHRJMXdxy6bJkBthNg900qhMu7+yL83da7alv6nByhIw4fNml70
         ryv0znKhfiabcVcx+gZ5qVw6uBPI2WTyq7b5G0Op9cAq40C/mOcY0T0GsrcevBFYb6VI
         XMK7QtWMQy5R0qtVMZa2ydJ/WwfzVLZWWi7ZiO8HszQ2hedqKJVzKXZBDpg4HYtkMLcQ
         Qs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977906; x=1768582706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pS94iKUZ1ZfNhKbyBy+xUgSm1zdImwT1//knkyqK6zM=;
        b=JBzL076FiFC9+0I1vVcWYJBZVIU0ZliHjKd2OkedSLugmpCRcCqLFuOdwwm/Kz8R4g
         i3rQvrPLT2WNbKbyAPDtkQrkh7loP5p6ZlVRT+03o9dhE6+O4NY5UdglnljXylGFCCvD
         P8+eadn/IQYf2vP1eR+0/c4j8o+ZOIF3SgIksaAHAV5WI4EoDAWiS4yZZ6RrNfZNPOc+
         QujkidQxEd7gRhqFIQv5i3tJKqjuSpWCNp+pPBoXmymb+S+2Lmh7wUh/Y6dsozrzqbG3
         wwcUibnUZ04UFlSV7miXWu6OwlRIYuRYAt8yyfLtJgOUeg8nKihtAiVvSCHAE83yZVAG
         wQhw==
X-Forwarded-Encrypted: i=1; AJvYcCXkX9qU77m2bd+RNNVTmnRlQcmXkWV4pfdrwU/efh+8Gxy9NfnUD/9BuXJFhYZdZ/+MfIvW@lists.linux.dev
X-Gm-Message-State: AOJu0Yw74NAdLznA/XsKybwC7tZUBawXgQEEjAXQj+e3Q5vszMVAlviA
	hJ8mF3IJV6uiIaq6cPHzNIu/iPVD72dDscJxrTFOPbzstj9x0w/KRpiG5RZx+OAjdLbleARiDn7
	AY4luyQJ6v/OnhbD5Woi7ZgEf/UQIgZjkvXnkPP7aOZIEkw4YzZ9LUD3o
X-Gm-Gg: AY/fxX7ZQIgjCAfx0vVS4bq7lRKVIf6Ai/YXiYPAlVAx5XqHCpN22lhy45JZfOu6cT0
	fdB5jxJ0c0VYefhBA3Eg26enpvBN3gDv2F4B9RHDbgrb0dVye4ydWPUAlEYGhN+kDwvBKLvJiJG
	xZnp8xdGLVdtOr0dLEtXbRGuBWBLUZpvL/j7rW4fmJz6ZIJM9E2R2v7km3qpnSXzkURpnegL28b
	4g1gQDhpEVLyjEvXR7jBURGHylQXNbTUyPu3ph0IvXmiFGt+O5Hui0YUfhbmZgNmtFMS4ZDY7JA
	coiB3xfVqtV5d1u6nGmZNveBtRj9nozubvtG2VRep00ISFOH3oYne8p5jAK1qHhEanDML2zh8N0
	E/Tz5GljDAGu+u8janznW5wSruvh2WlKz3w==
X-Received: by 2002:a05:620a:4508:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8c37f535f19mr1820073785a.29.1767977905765;
        Fri, 09 Jan 2026 08:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsfjFGqbAxLc23gcdJYsriEigu5ohevlkCtmB7A0Yd5kZaYg4F8i/gp5IEYHwuSzY4tC8AiA==
X-Received: by 2002:a05:620a:4508:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8c37f535f19mr1820067085a.29.1767977905236;
        Fri, 09 Jan 2026 08:58:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:51 +0100
Subject: [PATCH v3 07/12] cdx: Use mutex guard to simplify error handling
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-7-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X+rJqgWZb7AzM0cu+pmQcyBAFnuuYCBdFr+ESsAnRIM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOWTG2xT0pRpBkG2Oxza7snBRuC4VjYU3M/U
 qAWA101mfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzlgAKCRDBN2bmhouD
 1z25D/43t1RnWOYzf6VK4emya2IvUXE4PE2KamRZbdrtRYUt33wpN5FW/mIaskpIim+yLl4Mz57
 Q99PnqT67OgRKNWb5vmCgdvzae2SWBlxdKcnNPQnlosJLQrzfUCiZ0JDB1SUJRi7Gkkt2EYH1FR
 ABmiT4JE4sfEYLpZYwp0xtuNfjNRa3KTkJMP5pE3gHAfHHfmLaw0FImBWZKPPa3vPfJ9G7c0WtP
 i68ZQ7BIm5bYdiwMB3H6oYmovINgnOafL8vV1vuCxpCEg2a4L931KEMc+hmHQE4vPjpr5MoZOV1
 6NrLnPJTqdu1x0qXBS0iyPV5wNigBxrB23X+AAecmDUiNNDKSRa432oGjKMxmqRcVlyehngW8qv
 kryEBlWuLwaUiwOBxco/J6hgP6KeFL10P9udg8CAfutYUMxVAoU3ZDhNEZjIzZ7B+TR5yUjG3Am
 kKEusMDjK0bNXrAVkFkmYgSddWZK9KeNtqGe1jaKsr/WnyFFbNIyY3FjjqitFE6wg3fZSGLnnPM
 HluYuCBYQrTbNLEw021XbRsgnYSjh2j3tHlJWE8ajcwk8qzdhuugpcOFQ6ADF70mVzyRdFMSIbL
 YMdfyfOEGuzc1cFMbv7kIwtnmyv5mpgwGMlBRVfqlb8udSpwuJ09qezcbQ169bmtQve+3z3ZGHc
 gkOPygD7XBxOF/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX66GEEnCQ5sRF
 2iOjvwu1uKebX41A/Wsg9nrP2O1opsB/RGjR4MV52s+fzp/Eatw41jyFeZ72vbpBd3nGG36McBD
 D6hbupabmmdUw9rnbYskaLoz4YMUxDxXjR5NNQlw+KiNRWslWvHPTgo7L8XICxAYPNU89yiJO0e
 UF9uposX3sqM+u7icVOEuiu+/FDvAEe7Hly6lAWzBXGNFXlG09AyU1ZPJVqs+8hpJT4nD8/ro+B
 LLJkJfYt8DXXtcdq3/IzBlYkSXCPoKEYtYb9Frfm+KCvUIKUaYZRtcuq93QKybLq0/a0i8kS2i1
 eYqHA/uh4cdm/1BkaLI5CODthMDG4p5PclDZk1Sn90YPi+0xNQrMulrbPdfzBxxmP5GHsj7tnGe
 Y6gijiauBjYRCksFb/+rsVOpwn11hYyPQj1YVr1u+WtlkgWFPooweR46bRL3kL4jgIQcYs21P0/
 wfoi/oLPYk6FtUnrFcA==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696133b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=HFiHojuE27rTourpOroA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: n_gH1u1xk7FBOb4CabkiyXTcgwv76PX3
X-Proofpoint-ORIG-GUID: n_gH1u1xk7FBOb4CabkiyXTcgwv76PX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Mutex guard allows to drop one goto/break in error handling and the
less expected code of assigning -EINVAL to unsigned size_t count
variable.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/cdx/cdx.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index bbde529aaa93..588dd12e8105 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -616,7 +616,7 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	if (!val)
 		return -EINVAL;
 
-	mutex_lock(&cdx_controller_lock);
+	guard(mutex)(&cdx_controller_lock);
 
 	/* Unregister all the devices on the bus */
 	cdx_unregister_devices(&cdx_bus_type);
@@ -624,10 +624,8 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	/* Rescan all the devices */
 	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
-		if (!pd) {
-			count = -EINVAL;
-			goto unlock;
-		}
+		if (!pd)
+			return -EINVAL;
 
 		cdx = platform_get_drvdata(pd);
 		if (cdx && cdx->controller_registered && cdx->ops->scan)
@@ -636,9 +634,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 		put_device(&pd->dev);
 	}
 
-unlock:
-	mutex_unlock(&cdx_controller_lock);
-
 	return count;
 }
 static BUS_ATTR_WO(rescan);

-- 
2.51.0

