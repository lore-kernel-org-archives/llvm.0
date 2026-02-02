Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB635DD01
	for <llvm@lists.linux.dev>; Mon,  2 Feb 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029845; cv=none; b=sxdXIaX6Gwmz9HAgfmruu9iEEOQAQ8xh6LbNP+0UkcjvMWbAgW6IR8PhoPsRQUE4jtSY/f1OBtKnqiJY1bMG7IMHhxW3sYdNwQKstmlsqMqujSDSXGZ2NXwSUh8UD52mZMfSmywWwGRfe839pakIAZbQVcxn2yo+kwPPdYTYND0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029845; c=relaxed/simple;
	bh=TFTxp9Whu76WPWc8LoRr1IbswWOT2EZOfWCEsAXG3cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muaZ1HChRcvp6Wrs8bVX5ydDAdn46iIlawg1CHZrwkg16ANS1pvN+sQrWdGdMO71hA9V3uDIu0K6cAdTWdnvrHBr/E2tmeCTm1uLo9H6gESzmf0eQtq3fwMoifwPN6nEbiYZOeOLU0HF9hPSPIyE0me4eveeoY9GqYTGyW21Cwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dpt1V3u9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BW7CMNd7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dpt1V3u9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BW7CMNd7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285EQN2596340
	for <llvm@lists.linux.dev>; Mon, 2 Feb 2026 10:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=; b=Dpt1V3u9rKUpY5Oi
	GIjOPuOONwb0nuY3VNAVkxQHYXLsyznSjcYRh/g8lQmTfq8Mft9pVlCt5jsoOxFo
	RFH2Tya5hatwejqa0yztCYXi82sGp+Q/9C5NFJXRtQWiZY3VcuJrJJ7k/jhTLlT8
	uVbTosc1f7IGFO5gz5p47UG0DyX6w9MgenSLUOs9lalDMPCCChdc3//mvNVu3Tti
	kdly3kRD6R1IfsXWyJ5KtkkYrmWnIbLF+BxttNFvUNMvlOFG9Cek7GZP/qDYRVpa
	uOu4Gl3u8IWYq3Ro4W+nrenvnls67qtvuP2iQVLgc/u3g7ML0x5bHr9uQ0AyA9hn
	rZ5Rjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdd4ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 02 Feb 2026 10:57:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b48c08deso70504685a.1
        for <llvm@lists.linux.dev>; Mon, 02 Feb 2026 02:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029842; x=1770634642; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=;
        b=BW7CMNd7jGufUkE8ZMrFe+DgtM+9QV8ersGvyos4i6hhEmEwWv/bGW7DBmU7W5N5ID
         k9vIRfu9jdz9NwuVQcYUPLe1g0/SnUPyHTzmzJoe3M+t+bugagHB1YBbrfeGh06ETZmy
         KFvki7qzDzTAxm8kiDUCqAAsMtinppa59CEKzxtJx82qwI7ECS1brAw6mbcBGgo0v1Zx
         Uybz6K7r8+LF3PQ9XEW4/naddBm5oQ/gOt2XtRmrf3mG9Pf7dJugWzWB78rbm1FjZlTY
         +FWw1EpHPHXG5CRuYdldHjYmv3mH7ONhOOHh8mi+QFVcF8VePEwKq1OGsNxWw+BxwzGi
         LZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029842; x=1770634642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=;
        b=gHVAF1XK9diEyev331DEPs7jaYFYWDUYya1sHwTy1X/pVwqGZs7u7sapyOdCxotyWz
         sHFvCQkTjhbmrFnmGFLhLcmrftNtdaJ1HM45o8scBnpt2wsfCpnZ/Ej5FghenONp1LTO
         ji3pl6A//eeyxmL5rwMxgxO9BTrwcam44o82z26t1XPBPFJaGzy8LzpjpZMIa6RxCItb
         8dulB3J2aufQlTkKRC4QhCoa1H+wJ6kBNjQrfu6XB5E4wC7/A1s478FPDlq63ZUVAVTa
         Kg6pY5AEcPJiQet8fwwbFN1/KtC0RCxurCPsegNbBhj6Waxkn3huguhm13OJhvkda8wy
         W3iA==
X-Forwarded-Encrypted: i=1; AJvYcCX2EzDPe1fSCU/h5iNMo5vQlEgqp7nIzKXjIOSSlQ/I015Hg/8SJf5IhWSXBlpcbRdG/rHG@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9/odO6U5/KGtNkrzr73kZHS4FrR6Ls5NAZtBN8DHWQtwcdBFX
	i2BTfdYe1T3Ep+EhKrd35C/kwY+0pQEFXkncOQL5vAik2qu2WD3L/hYiTVs6kQWk6WTjQHt8+Lh
	UpGl/MBUx1c1+lS540y9yzoIxFoFSL2srT/N4pyJmGMbQalSh6RpXoh1x
X-Gm-Gg: AZuq6aLgJ6RB2msdM3P5b0W2KD+YoJe6dUDXVPDVdbQfUZivUrHOTuwkksaJGuk8Vrd
	RJipIXTVLIgC1C9eYTVgpJEqELG7vMLooZ9QdK5tqa0ysMgV3NJAUTy5DBOYQilYjOYwRLFf0Ob
	rqBoAKnGJyGnNDSTM8XdZ7XSXaRcHgZF2V3xafkEyCdxH4g29wSAt2yZUJOBbJuM3NF8V1I7tGW
	IFAjit2Z7lfTgCF3y9yLWB2IceHSbtRPe1bSEty6UbBD2Ik7wR/bUwN187M1kkgvCK+LMaAloHa
	vCghnSynxJlKzU2b8EGhu48QGEDhLVZCJAZDWe/CrlziGKNdivrq8HFpfbmejvtCznnuZwGnNaw
	Jcagmu6TngNy6E/s8Tg61rnj9seR4x5/MXzXxE2OWPbXINT6DpqBpGirYznU0mTviKlI=
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1085527185a.2.1770029841906;
        Mon, 02 Feb 2026 02:57:21 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1085526585a.2.1770029841519;
        Mon, 02 Feb 2026 02:57:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183ccbsm843100366b.34.2026.02.02.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:57:19 -0800 (PST)
Message-ID: <9b4ce86a-8529-4c55-9dcf-caecf81e46d8@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:57:16 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260201210230.911220-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201210230.911220-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UGbmS0oKYdzY0H5iJX-7pBPhENJtWD2a
X-Proofpoint-ORIG-GUID: UGbmS0oKYdzY0H5iJX-7pBPhENJtWD2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX1iO64HOllBIR
 HRa5JwsBiXCdr2E/ImZN6LXYvaBAYRR0QOlyFOvMO4udz2OHi2bAtkpFEaRpiIl9ciewUlL9NlW
 IUcg2VjoyGNc98/QjEzg1gndUoLri45JxUQ8st/n9BUwCzzJCmYxtWYh8/1Uj18TQHq8+HAtlUO
 efv5CAycX3oWUrecgyUqEnPKl1UOhFmRa8bGSolyNAMa7QwVj6NIRDnW4NX9GAq4bM5sJYmHPLl
 SZO6jcdEQZz6hYfYLp9BfRw8/WXivVwdU/9PrXDSa+lwrvGx+loEeCZBRb7+b2ruH+lAN1j6X51
 eEilqnWhRlRhj3gl+c8cG+zJ5m3dziNBUOOTPLYPJYgJ4jmvEGZnSPh9QecJcGoviVqkxdu5Avu
 yecNF70RVhCAY984fJVy/Q2ucNdzLY6ZnpnIVsi6YpCaAL7uqfHKZ5xsmkAO9AkadpI5WzaOuQV
 pjLCC/8n67rpBGl9/+g==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=69808313 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1XiK3UaZtGXvnlVxuGgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020088

On 2/1/26 9:55 PM, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
