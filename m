Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5D2D94A3
	for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314816; cv=none; b=uyL7SCKwDDg99Zsm5NrDyVgWegMShfvvqHZ3xgb7npWcjZM2691eOQAIsaWG7xm0GAthUVCnPOWDbZ9KnDCN6cjtZWOYUD2FOYyVJctdre1doJ8OnLKAmrdin7xZSY7iPp9YnG4KmFcSpOCBmOZIZRMjDymKHebXzVDuv5Pasd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314816; c=relaxed/simple;
	bh=u10W0dZQkXKK92GV/cpGKMrlxzSLCDLg8iUDPQNa+Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiqmi6wcTnOAuX1N2olAfKzvuVWAmPgW4tzPHUsVI4mEXRHfyI5vSxk0ihyEuKrncE/bTsGadMFvEBg8a4QjWbQGNncl4jJ8R/nwl4HhA3lJhh9VIVPaBW+yQTQlM7LK7VhEWl/NVi6+x+ck9G7pducOp/WLkzCJTOz2f14xcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh/DgkVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXdxcNle; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh/DgkVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXdxcNle"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54ons2112149
	for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 07:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HlyIZEog6J3u33MMe7AFXbsT
	oOYrvaz+iKp7UgWrFA0=; b=kh/DgkVMfTUv94MQxfiFtIZvNho6Sio2iEoAmdwt
	p9wU7zr1g7ZzxgGBXfXYlLjq3TPOM3hJ8D/b9aSchRwQxwjF3e1rthYMJutvF2vt
	EDvweYnq4avWV8HWeNz8wQPR0a6rjvhP/Gy9m78DqnJoDvhWhNwFPzf6cYjloITR
	WlRrIBZZkeKKGf1mPDdDqAGO1R0Pv4FdvTQ5K3zENBUVBmxKAovlQVsrsCZtT5Zr
	ZFCsnc5h5NmVAks3u2iFAGJ/DgN8EtQRvlauC9OFjC1wQ0CdmcrOqwmQf4/WAy8u
	PQcuvuH07hVls331ZoxcCkHIK7kDNjmeAsIsWRdN9UFYdw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4gahe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 07:53:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896ff58f17aso353475806d6.2
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 23:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314813; x=1771919613; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlyIZEog6J3u33MMe7AFXbsToOYrvaz+iKp7UgWrFA0=;
        b=SXdxcNleKXi4vADlAiZ5nYBtxDXrj/c31oVrxdmnCC+oGuOIZYFi/ExP8zzXl11E6A
         133QU0CB86IHFjad4wd36iBREeIjv7QB8yxlakG3Wh+NTrEQlZrsh60OVt/5P9LGvwnM
         K6aHeG6CW2I66/fpIOVuT5SdHGioR84l4E2Zh5zroLUsBiO00XyJNg3OSBVDzy220QyS
         XsLOCqqXLcsjoLx5iEb8v2ZunEis5Pd92WALG+BmOng+UdZQbJGqhgFnWNkWRJ9Ddsf7
         tIbr5gXZutX8mXZ87hrcMbFGVfQ18LSJWPCLsIEeNG6XNK6ON63C9HRNJ0NqPV/TPMnq
         EAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314813; x=1771919613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlyIZEog6J3u33MMe7AFXbsToOYrvaz+iKp7UgWrFA0=;
        b=H/wvZW1rslMQOJcwz+RmpW/mR829V63jzAD/AaCW8BfPCkyDUrAZNQE5wltDgFbTlT
         q1jLyHzJ81npEWJanpEfIQyK3zeoyGL7D87r3t4LmD4m6AtUHcXFui+P7cvDUjXQrKnW
         ecCZwXVReTLvUS/gGYZLmqa2uK8qb7xP1qNUXP27UboMdpb37I4ZUMluSkwa7+puQo60
         ego2eFHnFsYnFdQZgTbE8L6EGCGT3FRJTKPJ9uIDG1Yh7mRKK/YXttsHwZb21EE1XwDf
         yxVFr0vrJRfJ2D/BxSkCou8XqKn9PR+O2xnYjO1APs863CT5FD4qCHyriPRtgo/vK/Fp
         3uIg==
X-Forwarded-Encrypted: i=1; AJvYcCWvZ+XjCe0iB8BC/u0ixOuhJnHwd18UUJeUqcNmIzDFP3IhfVSx8l/kKfKK2ehFwlx3phBS@lists.linux.dev
X-Gm-Message-State: AOJu0YyN+wShRMs2aEL8OSKQ/pbRSkFVc0n3gm2sDHeQ+kIGSYc+1R0v
	TYqlyBKHCv9qpd2Y6R3HtQVjJo7qODpry8QFqgIVG9s9F2veMou94oTA2PqywFmI820UNDd7eOk
	SouS0BEhqlPb0kHguRhD/s0Hm/whvFi+BHMhiMRGgZfN+aO+TqilpMgOy
X-Gm-Gg: AZuq6aKI0bDBu/IwXRol4g9936ypUz+HEXy/D3CMjRyynA80BaVdDcjST1Gny5wOnv5
	rPOs74NwW1c4kwgdrk7J6qMSD7KSDeWh5x/xZzgExciSKLqoR8cDZBinrzAJuwYf5PisV7Dcab5
	6Elry2X4+GZ8Hrjcr9Pp+ZDNvHEPAdaHpZ6Ts/eoZQIN6qKZVKc6NCiXcnhzjjvhRNAzSabzk+b
	dDZKTD5HtxKBoTgljL10xqauA1haencV/9K0aa1mKZgthwzocGBwv679y90My0oiM1Kc6CgjTmc
	jTwUcNGtwRzhAzxafp48nhrqYI91mqSAjO9Ucjmwj16osuCh6kL296pVvJ7dSNQeqn3qVCXOIlr
	OPB3/PiQi0pyUwKfRD4hCNsxkWzZgRSuSMofW
X-Received: by 2002:a05:620a:1728:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb4225fdb1mr1520260385a.2.1771314813327;
        Mon, 16 Feb 2026 23:53:33 -0800 (PST)
X-Received: by 2002:a05:620a:1728:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb4225fdb1mr1520259285a.2.1771314812848;
        Mon, 16 Feb 2026 23:53:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29866948f8f.33.2026.02.16.23.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:53:30 -0800 (PST)
Date: Tue, 17 Feb 2026 09:53:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <ckfybgx4suqpm2hjkm3zgdssxh4rmy4dxxjy35yqarg2ybu6fk@fl77gdnzvnhy>
References: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
 <202602171002.SP54PXRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602171002.SP54PXRC-lkp@intel.com>
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69941e7e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=gSbDSvPH9l2sfEXJlosA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX/r6wyLQhIDEP
 MsA6WXxv9qnmxxbcDydm+Tfct4FJgalZN0kDjzICN5YihQA7oNTS+ocPOMqMN/fYHSHtnXrRmwy
 6Df26xivUfWuKLEn7qvCX2exPGEHC7950FFmo1eELwOLczMN/DQSoC8F9xSaJiwmwUY3YzPfzn0
 A9BATG/eFbYhhrCSkTdXwZ0ucscL//RtXCfV+LEmNFD9AB+bBFLrZruaxg3JNQU7SnBPakGoW1r
 U8csgJ/lLKaNfN44TVY1V7Unj6uqj6BgZPOlz/d+Sm7wgsiFh8Vn5Tewv9+6S4IKPmD+EA1o9HO
 Ko1uYd/se7bWVzOc+JpJKR64hvPPgyAFF+9liLfvNv+iLRkO3WXyTEwLoFvtYHrtf9PO9XAXXND
 N6JvdACWF9DfI5lHitPx79oIx/mr41eZKwaO6Heykgdl1lmaou4KPup4bqwyOs52F9mcf+XtL+b
 WIuop/4XLImxuktnskA==
X-Proofpoint-GUID: ZJYzk8-WmTNFA2TxVK9qtwdUNpSBDPUu
X-Proofpoint-ORIG-GUID: ZJYzk8-WmTNFA2TxVK9qtwdUNpSBDPUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064

On 26-02-17 10:31:45, kernel test robot wrote:
> Hi Abel,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 635c467cc14ebdffab3f77610217c1dacaf88e8c]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-clock-qcom-document-the-Eliza-Global-Clock-Controller/20260216-215148
> base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
> patch link:    https://lore.kernel.org/r/20260216-eliza-clocks-v3-6-8afc5a7e3a98%40oss.qualcomm.com
> patch subject: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602171002.SP54PXRC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/qcom/tcsrcc-eliza.c:126:3: error: use of undeclared identifier 'TCSR_HDMI_CLKREF_EN'
>      126 |         [TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
>          |          ^
> >> drivers/clk/qcom/tcsrcc-eliza.c:128:3: error: use of undeclared identifier 'TCSR_PCIE_1_CLKREF_EN'
>      128 |         [TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
>          |          ^
> >> drivers/clk/qcom/tcsrcc-eliza.c:145:14: error: invalid application of 'sizeof' to an incomplete type 'struct clk_regmap *[]'
>      145 |         .num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                ^~~~~
>    3 errors generated.

Fixed in v4.
