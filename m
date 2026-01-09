Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC8B3644A5
	for <llvm@lists.linux.dev>; Fri,  9 Jan 2026 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977895; cv=none; b=AgRA7EUUN+/mc+StNzo69fKdp3AUbReKYowbLst3w93QKjFlK64FltxW99eDvLMcikXZ2ettBjv1FJm5K8iEw7Im6VyWCqS2LXVexyoZXWXGGKyPEgIcLrTygDmKfvfGZZ8alodtl4oMKsd4RsKnGgWANiRuaX/iEVFBZ5JYFss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977895; c=relaxed/simple;
	bh=/vmRDAbY7uS1UoozvlR9f7hg8o56xUtijAL2sU3FXNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRQaDgi8Z9nnSwBC5jWxMex+AFZ0Pz5Sagmf4vkuYghYcuWNDY9oy6CjqNt/TH1Ci7NuGxhx/ihZ8bJ6Aqoeg3hD5wOCRatHCi0TcHy9g3AdQeBxaYNtkhF1Y4/DFRDxfmx0nWFyAIls/GUau9i547UHh2MSMRk+UZ1OwG7xbyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/T1wnZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Luss/NzT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/T1wnZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Luss/NzT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099Xltn1048572
	for <llvm@lists.linux.dev>; Fri, 9 Jan 2026 16:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=; b=T/T1wnZqVNpxiZp5
	hD+LFonCaQQAFUllDlTuU68BvCYFxaJ+DKJcdJ0VdJjZ9V0EulEXir1pbSlxoTQc
	PAK0TPhlKXzOONBBjHcXOGB2fazcViaO9itphbnlLfDKHxUaD9Ok79bMH2dmz1l9
	fsmIO/JUYI1gvZR4E6lWUN/TALDirKH6zoTGvKi47pvt7i6vF/3JdK/GNjXkpidC
	kSc8hpHnDBQL2GjIMYUHGIPZ6TND8NTY3H5W/MfPJP2uxhT6gmjXEy9ueF5U+8Wb
	SlBU8BfQ+tfnSnrMASPNhDP8b8FyMfvqGfp3KRNJSkEPmMFSMfladaeu1M0KS+nX
	dZXMNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b9785-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 16:58:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1126098985a.1
        for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 08:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977890; x=1768582690; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=;
        b=Luss/NzT2lFekqhOxlKOXG0fC+ZzI4eRxrkzNksofBStubwmfKnSmZVSjFkIIu8+Qg
         gJn3FgWz+xe5dwVq7j5NlMtB2j4z+IhzqA361sblowVin9x3fGnk065QSp5GQlBx6avv
         amXk4f1VAiWDcqMCYJG3tjjk7IvFpVK5a/J+Q0rQdxaYUSuxDUcENZGR5X8bf7Po4W+/
         dipD9AhoG342Lh19XsmCGWo/pr/6TN0o4eN8vo1elTnOmP/LQm45IGsdUUyB22aiPUw/
         3S+WdcSIu+qJ6KWgaSvBc1ATR/Ggs+ZxTh9XIv+LRk8Woqn7Q1VSD5Q2sxjeep8lbsXs
         bnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977890; x=1768582690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qTsZzzQjLQdLtv9m8IuzwsIR3tyk5XoO7YmtPsNR0j4=;
        b=SmtJOd+TgQSc9XeQbIHnOduI6Ldi5MM4Bn7G3JD7na9ZLv+zUlTAB+KkaELQUfEumf
         LWMk2DaTb2hSHPno4/qg/4nuNsonuORrnABwhn4mBJDOEqKp1ZnjpMdHCXAFlMcMgmD2
         BQXUPs4cmyuzutjLx6SAr4t9CxnuT8KWyrAkJsKmoxS+J23ziP37G/VeRmKBFC1TrIT8
         V+V/Bkj3eBuGaCG4tyucXuAaRCTmNJzlyk71FBVPKK5McTbKdsE3wf83EhdZKZzDwHVd
         WHaWWD+WYL7XGjSt+PKFHMEqXsf6VSjRMfwvhU0naC7kv+vdBWkd6vYbBgBBq7EGqlWa
         Jb5A==
X-Forwarded-Encrypted: i=1; AJvYcCWW1kE8nIvEFGoTp672X/q7Wg0JksVCUn3gy4jTNqtWYqib7fWHXYf6aFeIXLhOvsa5AGnK@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Ig8/Z4o6OmLd5/grUrLI+ug/SAVPWi7/XXyrQE9G9XED8GjF
	KeUp1m1bP9vVEzaut3Otd9AKuJhUiDPbz5YW7nA1wAaXCreHcE399N7kH8H3X3iv6oe7RXUFOKa
	+nh3I7N1RdYfHiNs2aLP9i3CIxcR60HLTXnHiTbl9g6pEy8KNdHcwPXWX
X-Gm-Gg: AY/fxX62mtc3H/Ua5jxokgjJ42QP8BVYVfe0Ffwi6avGLWWfOTVgFwIKa5GpQWRSJsE
	fXiqBoiWC7zb1L2UoOv9MIClKa55yaC5z7rWuCyipA6UcfZWRfE1uWTCpFfMusq620yqmgVHlBC
	LL52XBR14VMQ5zecYjgC4Z0Y9vn4nnEzDUUz1ED1C/97eYT4CFyI33SBtTm10/Q8yTxGp3pYuv3
	gjgTDs/4MO1CMddNDwupCs1WQq11eCu3pJi8L5+dthLrHhqJn/R9JFDk9foq36NpvT+WDWgtjKY
	lZGi0Ok4jh35bV/3htbheZh22JPD0h/iDAeHx4peEu3zmpUyTiM0RQtolrJZGE0QYeN8eWtPRL+
	++ld+zuCOx2q9CkNx2Q7OlXVfCSHryOxf9A==
X-Received: by 2002:a05:620a:450d:b0:8c0:d16b:b09c with SMTP id af79cd13be357-8c3893f2882mr1251304785a.58.1767977889650;
        Fri, 09 Jan 2026 08:58:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfygeLKT4WxsJq2f59hRzHmtCZgHcvEaJnVArr1Jk26l50+rbiaa9DJq621bHoEVLD5i4iPg==
X-Received: by 2002:a05:620a:450d:b0:8c0:d16b:b09c with SMTP id af79cd13be357-8c3893f2882mr1251301585a.58.1767977889107;
        Fri, 09 Jan 2026 08:58:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:45 +0100
Subject: [PATCH v3 01/12] of: Add for_each_compatible_node_scoped() helper
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-1-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/vmRDAbY7uS1UoozvlR9f7hg8o56xUtijAL2sU3FXNw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTORfxtpTacTz6ZE5ouIOsI5kOFpz+cbr7zLD
 7GEBv5R2FiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkQAKCRDBN2bmhouD
 1/R9D/9awDSv9Skzn4Os8FgAZhOeF+IX6AxHTJvFa9IvTukIrYSoGBHRYpZ0E0boMZR+6wG+f3C
 TiIx/LQwD6zud4Q0JtXfs0AQ3WWBZBsmnclpVFTDzdqwnl0YEf+OI2xR2Q1eFsI+Kb61KWrRScQ
 7wD49DB6MdqQvzephOQSNS3tNRncHz22nL0/3YGj5I+JWwXp0CkH3jPFC12GoP2v9F7X5QYxnot
 rQpzcblFkV75PdYWX8Sm3qHfCSF3YNxO2twZNCEQmGIE3LKR5J91J6IgCfecO1mAVLVnIxKzz1S
 6znhWZcLim5uKCoXLjLVdEg3Fn41FkgH4E5iyn5QWGc6iV5Ghoy21ydJcsBc/6zS+ezS3zdsjaA
 d8TqL/6osDfqfRNQu1Pp+2/vaU/0gT6BYIwd+Dt/Mcmw6avWhUBZH1Z/kKepP92Y0W6JHFAOKbD
 4wC/PrnocUb4wMm+Q4Li5a+RA13hbJcI0/M7D9j8stwiBur/XhRU/QdQP5FEk5n2qi1FlsUd+ip
 NuqryOarJ+okJFf4pu7X8dAbBtYX1jeUBGbVSnoNZqFMTSfSZrjT9RC3S6zyMR2ZQiCgYwDvP7K
 57ueeO+ZSE0gHgCjXlATjeQqeniZpoq4FfRTULcgQ3P3FgdBSDAuLeegLPBdSmHFtWDgscg6Xcs
 Q/QoA7qPzEiiMxg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2_i00WqX6NSze-c_CnwQ4sJFOA9yhhxk
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=696133a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=onCjdZOYdOMVgCgPd3IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX1SDY4I8a3BBG
 qi8b7duZuwOgs+2crEbiTmSOXSN8Y9wwQ7bbfnR9/Arw0lZmLtI+KILxNyAFokNTFKCGCmvgN7g
 d5ZRWcaK2nKN14nCFkznUph6u9tTDYES84priLJg9G4iBAJtcpY9EDMEshx944elwxbsvcWgC7t
 JXf1sM2ZOpBPAbK7HLjGQXFDM+PWe7uiKNb5fdlkttsapkICXaQmEju3SRcu5NWW4VZKu081hwG
 IXE83kUlDH3QI1aiF782ln3Y8yV+Dnzes3WSfoq3Cd8VmUK/WayiJGkIATbPw7Fz8ZzeR9LeshH
 rkEe3zs18nkBxvIiGzxe379pSVqSWISbX/zUUcWCp7Ic+okmOqFasqgCZOa2HjdLiYzaQ3roMZR
 UwxFd8Z9fcbylQrUr5z6qNkBo53Ci5m33qVewxcoutnbcaiFrD4ZFCADCpQ8YRo2X1j6ZvIb3N1
 S+UhEgMoMViHB95NaSQ==
X-Proofpoint-GUID: 2_i00WqX6NSze-c_CnwQ4sJFOA9yhhxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128

Just like looping through children and available children, add a scoped
helper for for_each_compatible_node() so error paths can drop
of_node_put() leading to simpler code.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Prerequisite for all further patches.
---
 .clang-format                      | 1 +
 include/linux/of.h                 | 7 +++++++
 scripts/dtc/dt-extract-compatibles | 1 +
 3 files changed, 9 insertions(+)

diff --git a/.clang-format b/.clang-format
index c7060124a47a..1cc151e2adcc 100644
--- a/.clang-format
+++ b/.clang-format
@@ -259,6 +259,7 @@ ForEachMacros:
   - 'for_each_collection'
   - 'for_each_comp_order'
   - 'for_each_compatible_node'
+  - 'for_each_compatible_node_scoped'
   - 'for_each_component_dais'
   - 'for_each_component_dais_safe'
   - 'for_each_conduit'
diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b4..be6ec4916adf 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1485,6 +1485,13 @@ static inline int of_property_read_s32(const struct device_node *np,
 #define for_each_compatible_node(dn, type, compatible) \
 	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
 	     dn = of_find_compatible_node(dn, type, compatible))
+
+#define for_each_compatible_node_scoped(dn, type, compatible) \
+	for (struct device_node *dn __free(device_node) =		\
+	     of_find_compatible_node(NULL, type, compatible);		\
+	     dn;							\
+	     dn = of_find_compatible_node(dn, type, compatible))
+
 #define for_each_matching_node(dn, matches) \
 	for (dn = of_find_matching_node(NULL, matches); dn; \
 	     dn = of_find_matching_node(dn, matches))
diff --git a/scripts/dtc/dt-extract-compatibles b/scripts/dtc/dt-extract-compatibles
index 6570efabaa64..87999d707390 100755
--- a/scripts/dtc/dt-extract-compatibles
+++ b/scripts/dtc/dt-extract-compatibles
@@ -72,6 +72,7 @@ def parse_compatibles(file, compat_ignore_list):
 		compat_list += parse_of_functions(data, "_is_compatible")
 		compat_list += parse_of_functions(data, "of_find_compatible_node")
 		compat_list += parse_of_functions(data, "for_each_compatible_node")
+		compat_list += parse_of_functions(data, "for_each_compatible_node_scoped")
 		compat_list += parse_of_functions(data, "of_get_compatible_child")
 
 	return compat_list

-- 
2.51.0

