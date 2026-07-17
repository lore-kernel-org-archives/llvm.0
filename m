Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9C838F65C
	for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278739; cv=none; b=FkgdkeQJEmxgTx6D1wK4dOStYmycgtEVQPFKQvY9fd9tQLFOTLWM20MCxneSwob70CY+AcpdGTeZVWxAU55LPtn3Q43elgkANnNIto7Q6ububLwUto/MtujpNbBY3b2iRH344nnCfNk67OaPdf6KTT4hC7BKPMOrfjSVCSzFYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278739; c=relaxed/simple;
	bh=zfW2SW4jpYFqvKi6G3uf6HUeHVtbhZwG3kNrRUq2zbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZkWkNbOrOpLOgZqLevkWql2jgfY6tiykWMuPlypYSDQ1Jib+iIZP4YjRQv6BhCut9SKIKntqj/VYq8LGpE5fugto9wcUuEU4qcR76Ail77g0C1nPQpQhMP6WdTqVxtmQj4AO0rpQ792Xi02Udjx8JR1soa8yHbMOvQxwH4FHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCj6ZIP6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZjfeYgO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCj6ZIP6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZjfeYgO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cbdi979995
	for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 08:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+6zn65FvRDStkPzkD5hyeFLw+Q/tqVt1jRTbl33u6c=; b=gCj6ZIP6z7DNLnYt
	wH/JVe7Zsz9rnR1trAmit9dSRIdHx2oFTJR15O/jLtfpDiYVL7noiDo29gY4g+9m
	6TWTzcie58ggc1dqYS+2PlQ7Jav8iPPNeqm4bDaSN+6zNEcWUK3tC9uu84w1gqAG
	eKEktktHdx6SfNnSpzUurgk9uNNUFud2LoUBnmgOqaanFQyzG3fWv8x1J55PZ4Za
	Mr/YBNPEe6paGCztNJF40EiiXbRGxZd22MbOKt8SPwU7U1XU5xwmzEjY7hIECSg9
	nfGqUw36KC1L/aE0+CNKgG962z2phQtFDQQ53buZHzWrMIHGNrC5U0m2YdjgFe+E
	L2/H2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grh81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 08:58:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so91937271cf.2
        for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278735; x=1784883535; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+6zn65FvRDStkPzkD5hyeFLw+Q/tqVt1jRTbl33u6c=;
        b=BZjfeYgOgVJO6CIpGDe5Jsnk0QJBdHRNlv9hpL0XOkv1lxicRCZilQLL9FAxdaw6dl
         LlbF0dDor+XibutWdi0pRB72EBBOGkas1gWMnPJu/gWvzAx9LGanIldpvVjIXB1AJpiJ
         oh6vZE5pKSxGPzxAuZCoVnCBNtbCPTrKlgd9dhFkk7QStoVXKC7Lof/ZAXKT+1cB/txO
         XufuoMRJv+R3WezW10HW5ZSQ2ZTSLrGK5AcH6eaxzBChUtNl3RyOK2gfisurrcZSIWfI
         qOwlEQvK8AozBDY8tUX6gVY25uj970wHtm2lEqZHGgIenPY9ORj+CXWPOXcyCuBqndU7
         MSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278735; x=1784883535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+6zn65FvRDStkPzkD5hyeFLw+Q/tqVt1jRTbl33u6c=;
        b=I8mQVmYUoG8gxmpo9LfGQ2x6MK49alNuOHQg/Sq/GJxiIWCiBgT58lEtx/kXwJ3eVz
         Xt16nsp9zAGzD2rG3efq1DzbxFeLPXnArZ0FmtuU9mLs/yGX1WQNc4VNviXCgZ3GyKhd
         QIBKRZJcl3yLmnR05h6cMSiUKBdpA2m188rP/ItzPnco4qoDg9a99lmZ5ayS8VUoVPGp
         CMGXKPGAdvndTN2HP6o77OnkEg51MYrgu7K/xsjDCgn7Q9fobGP6RMex565ZWNAFdQpm
         XcuaegI6ICF83EBY5CNYg+TaTIyM16mtLmX36+JXEwe0mjOA/T0xCjhnpwKJrJZErRFq
         p7mA==
X-Forwarded-Encrypted: i=1; AHgh+RqULhYO5GgFZQPvGS+m+dwHna04T9J6o6lI4plC+7T+6ywavEuURMTuBdw9G/RV8tD2lYjo@lists.linux.dev
X-Gm-Message-State: AOJu0YzEyaE98PO6E8VvHv7aPDfIJrR27vixeBIvHjiOEXDexzkd/R1r
	fKDEe1hdN68o4BA6R/zu+aShu1wxYP3L2EvO6g80gSNhpbYfJ1GPEYqWebPxYUJ0YfoQTs9lZ+j
	2Ia9y75qOUZcVYhqk3e0WN+lXzKeqGmN5WxSsxaCxoXRAj2TyK7QrEmJW
X-Gm-Gg: AfdE7ckPJCO2+cVobxydsOngvI0aMMkz2L4K/r8N5OF2MGaPm/HDTh7L7uvK+xYNbRv
	q7yk/0wT4b2rKuBu7xPg3zd6Yi9LtfWbQDb8haj4SrQmyFDPjZjcXdptbvLjaCfnLbF+tixdc26
	xCOxiARb47KjcRQ0cOS3/ISMuIs29ZAwtCoLN2I7ySTrPusqkyPC3379dru9uytms5Sb6es+yRI
	tCY1fNt5oCRpRBMmquqvp0CR3yh2lUbDX0L5HJ3ZNnzP7T5/vwsDJtr5/d5jydh5ImkGoheuBNJ
	NIsgsokyYeCBdEdLaGunRLWSCx7zJdcpiMsnztx4q6xGlbJ68yiELUbR6sY22+Rg3DDXSw4COhn
	2HmOWLVy1KAv4I9dqM9+FFk1618JT
X-Received: by 2002:ac8:5a52:0:b0:51c:1f1b:afdd with SMTP id d75a77b69052e-5213c5f3a93mr12791851cf.24.1784278735083;
        Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
X-Received: by 2002:ac8:5a52:0:b0:51c:1f1b:afdd with SMTP id d75a77b69052e-5213c5f3a93mr12791711cf.24.1784278734623;
        Fri, 17 Jul 2026 01:58:54 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e65644sm1911449f8f.16.2026.07.17.01.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:58:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Michael Buesch <m@bues.ch>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: [PATCH] gpio: bt8xx: use devm_ioremap_resource()
Date: Fri, 17 Jul 2026 10:58:46 +0200
Message-ID: <178427872031.9452.11556035251702200753.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713232810.1144712-1-rosenp@gmail.com>
References: <20260713232810.1144712-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX2b1h7d6jUZ9C
 q60NteKYO2MuSXeV1Q+y5DC/1Mst0mLGXnQKPXrmdL49yQxYXMPMF96uOy+SxN8IwAo+hXPlpnR
 hm0Y0HywCtosUGVbG99uORhjro83+AA=
X-Proofpoint-ORIG-GUID: VLIB9kLk1f48fu7ufTTveY7NNqd9Q5lH
X-Proofpoint-GUID: VLIB9kLk1f48fu7ufTTveY7NNqd9Q5lH
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59eecf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wcrWqbcI9P797jCuS0QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX8zcPuMhj7fJ6
 vQwQfa/ZvpEmpIIvoCCDzMM9eA7zkuk0vXMLTkNly9wiLYqoqtg5szTiUdx1xqZkFFHa4/JSIb1
 9B2otn1LuldI/PdwqDE3tznIJkYGpj4ZWXw9bzutTBTkoXQeLmZmZCtA5ILcIE4NgFCo2k4/gko
 pTgwjcZf8oH6zg28rSbopyGQa9a5rv/Y9LPu2CXfTr9UEakuagzXKMqz/sW9F+eqS4lZ1Tx0z1l
 wWvBDKcQ+wkWFOdJdXxAEM1gouX6qlBLB3aeg3EE/VX7+Zj8CGsCZFxiySRY637iUEsfPsteore
 RUD6rsyqyJQoYlcZswsfIgBYqZPTJAtse1x8ZbawAj20UM7Yj2wDJhP9VOm/0zzOu20T5B0Gens
 X98lN2J8I9Zq+xu9ymb/LSAo2uNNz8sZE9lUnhS3qddi9cVrCG5UNJ6TQyHApSVy0lW4S3q0T/G
 nv4l9EbKY6vuZzxt/7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170089


On Mon, 13 Jul 2026 16:28:10 -0700, Rosen Penev wrote:
> Replace the open-coded devm_request_mem_region() plus devm_ioremap()
> sequence with a single devm_ioremap_resource() call on the BAR0 resource.
> This reserves the region and maps it in one step, and maps the full BAR
> length instead of a hardcoded 0x1000 (BAR0 on the bt848/878 is a 4KB
> register block, so the mapped size is unchanged).
> 
> devm_ioremap_resource() returns an ERR_PTR on failure, so check with
> IS_ERR() and propagate PTR_ERR(). Drop the now-redundant error message,
> as devm_ioremap_resource() already logs on every failure path. Since it
> can return -EPROBE_DEFER, place it early.
> 
> [...]

Applied, thanks!

[1/1] gpio: bt8xx: use devm_ioremap_resource()
      https://git.kernel.org/brgl/c/bbd8254da11c189072349003006091e8327e8d36

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
