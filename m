Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311577;
	b=ZmzrL7/nxamvpqflMjAYfqQuW4akkHucplsX2Ao91IMbZU6Ea/qAvoMNUYQLceF4kPP4
	 NaUBIYjoOEcaOQRMcmTHrRzBszeFnetzNQL8Sl7cm3fJnlZB/xGmIpblrim9YH1Xg8jYA
	 ukOJtQ2pRT+t5SNlBoLnp15sffsoxRit+jFnNHg/mvgHoObJL/LquBC6odpeKuNAd5imy
	 /mgSQqrA9AEXq8sX94vz6ACBbSdfIY2omPlgAn/AbR5hfrliK9OiI+LzG+hFbzdniGxza
	 hcywph23uk0JHreGyxXuAQnoSaIfIieJZtCIfyl6l6RshtBGnhqnYPAQwcTFmrz4EpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
	b=x0mULPq9ogrsPH6vt0RZ1b+FjsiZZjtcu77XfvV4Mz8FYQSqIOEWYzzEgedTPTqsQKvp
	 hZKTTgIorou4AeyQ6IZJSw3o9+MNix5+CBt+bBuSiS67eLTjWP2U5xFadYGnFayPPt/fj
	 BnnKaUGWIb4o9xxR92dhiPvAKZlC4In1WBrcdLrcWp9EVSVgOAJlwB5zVqzuQGYJ+bR6A
	 PaeGia2LF/CR6azm6xJ6GgWRNUNnrIVCPfv5RHymvNlFA213Z9RiHoW+rMDWAL4x4ybWu
	 xbFF+CrUgSVJTWyEe2pH6z2X0t2ZlCGgoHJQIuyiHKZIhOn7IWJnxnmHoU3h34hz8GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMf7r9hS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UH0oc/xX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F7606A31D
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 22:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632F7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMf7r9hS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH0oc/xX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TLb1dM2372851
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 22:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=; b=aMf7r9hS+ZZLMfI9
	kMEUYytN/y66qnXyFTLQkKN7v+JEfgHh6ho6zFpTS+SSYxYf+IKnREgR0WwJboxf
	GX30XnbgTQQ/T+csTSzl8wEqiFXXnrxsNC2AeX1CE5HKI7M3QdnwpKPNCVDJ7Nxf
	h4n1HxnYbAu0gGJz+ge3TI+D/KHmT1LTX1iOC+DGuEO/W/uwp22SFr/+qwECKBx/
	sXi7wdbM26pd69eJzEKHmMpULtewTY0Tr9GADsjhpTebr+J02/7DIHuy9Uy+wEh3
	J4NuH2vPGRnMf6chJ2ZgUGQCVap1hxfeHPSZR9PXs3bOt8DvyUbmE9M9UShqsIFM
	GTZkWw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75037s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 22:06:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf08dc2fc8so5778137.0
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 15:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793311575; x=1793916375; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
        b=UH0oc/xXsp1182QJQ4RPtZHnpcRFEQ7oJz9X4voEZXEe+EIWJGclpIzytLhssv62Op
         1W5s+TDnFh1oP2jWGQEgn+U1tybpS+fp5gc6/HengoGmOKUBqR628I64Np+RDzuxC6g+
         KfZIoI+lD683zg5M1Ho7xaqkXjLbmB9Hnrpm99uWeEWM2NqnfhRIJwcX/Doz07z0FSmD
         qtp2NhL8tjm3+ZWBB3jZAOTOfH+XuDcxE8t91QtWC6e9OLEllu/g4qeWv4h6st2QoXNh
         Eva9AQy3RuvAOu6b6Hsq50OiYeCw3Wgykdyovpe12GAD2kzYZohGmJzszxtorfGXxLsh
         iSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311575; x=1793916375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
        b=Fqf83949maJhHb+YK1pG2HdYbx1hH7PYWLSCZ9SJ4i+9ahNryGBzvydPg2boSx3ozu
         sDItt/qfCMtUDdWWtk2dsbRC4gDuYMS+Qbm10Jj2FqgvGV8jTYZQBnb2Llkjv2gvVT2W
         VM5Sz4Hx62cfKoZVCZHzieRzzw/AIaFQ3yb8s1T95saHKPpyMbifwNXySozwwEukLM5n
         uAIfIhMdyI5QVHNmYPqJRzEJOOL/3o5IA3t3joEgdW1vaR0uo98LjQ9iiSOt72TGi4Rm
         XROeVTz266GDBPfM9+kMxpPkyODebXC/5EmAsyvsduBbQ9pGpc2ARfocNATwYTBmeqGA
         Gp2g==
X-Forwarded-Encrypted: i=1; AKwUvBzIAPyrXWM3U5pg4q7lPBEu1Mmr1hkMq9ZNN5UMIT9t1OLkjv/p+0uAOlr/1OzOz3Eqg9Jm@lists.linux.dev
X-Gm-Message-State: AFq9FYI5j3+WK2qV8bfTKRtS2w1ki+ml+uS2NDzY4wD7wafJMej7m83A
	3Krxb1wLUtQbc8UnJ4QBrEIVOfmIa9X+ZyyAxAVrHP6f/zPpnDOUN6Wy9FiHBTzE6Slx0YqhSqL
	FlrlVPtSYLadk1RpS+nVasXChARc8X3RS/tFeZ4e7rdcIC9ud0PFO8906
X-Gm-Gg: AYBFou1uDtjqJV2kmGy3c8mCR/xUwivFNzbvpHsQhT6VWYrwEjKalTHXdDRKCGzqCG+
	EJTLWrHkLUtuWEB8AezCDw7G+3OYj11gGU6DD2NaOt9FmJ1/tvxOvTJJRX23KfTOgyoYfm55N2e
	6nH3uBuyrduKXSQFON3xF9GVOFM5gzUXQ1CHnWJBFFOyCQDXhfmXg7J5a3BW9HJdx3h6ghkvYBY
	lpgg/cbo5MePih9mHDA3bmGitpjKr+ea0eLS+cOaHOekLOBpTkYqGRhPmPYhAAnCzZzowig5cdq
	wR7hvTyJZLOfOT5UCz/19zEnAOIDWAGSzGchSsZS5A6d2t39FWTgsaI1nCnMRd2szYe14xhSdW9
	VMDbANlqbQVbtx9pzZD636Z0GTQ+/QgyuQGMDaXHa5PHCj6rn+qJiSjrjxQVBOxeeyuv/lz8UTo
	hk1Dgwh2R7SCQZrrCI1OiKSJ5UzQeYhRI4ebY=
X-Received: by 2002:a05:6102:32cd:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d072d818d7mr296180137.37.1793311575347;
        Thu, 29 Oct 2026 15:06:15 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d072d818d7mr296170137.37.1793311574895;
        Thu, 29 Oct 2026 15:06:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e712cbf2csm9212f8f.34.2026.10.29.15.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:06:14 -0700 (PDT)
Message-ID: <542fea3d-c587-4077-bc75-28afdf3e543d@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 23:06:13 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202610290223.iOEGeDs2-lkp@intel.com>
 <20261028202400.GA835963@ax162>
 <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lkkASsuRSneMLJebFkv7yAopaENbFRZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NyBTYWx0ZWRfX/g0DrvUumu7v
 lsWPvSo6lk7+Bnr2wZ6GY7fo/bHfSvhXDjdWMz5w657BcD/c1CIZxXGyTk5RUcKnyZT+UtjcFjw
 Bhkp9qaubE+k5BUJNvPOydq2CukvjSZjKlTFoXq4yGppH32yzkeusNr2X/yQb+JUWjLdBSKXC6o
 Zf9xwu5YRwGJ2QjvGCFzdQgIY6w0Jr98Yjf0JwjiHC+XDKfcI+ly6gq7jm7HD0vrzDy7Wnx0ASf
 2eByoo5MrhtDrqcXZQxAkF98Z2MznRo4Jvjkbt7cFnaFzan0eyJVKNcONxneUdMf+gdiKIUpSlt
 mYfRirI37xRFXFWBO52UVgKOcBXsbSniNjyO8aB58Wq3p+RvTAM2bu+0kJSwEi2s+nnVjoitgaN
 ERqiPSnI3HnyEYaXwqdAJ2zYfDkuxeXN1/ZJB1zIV52LSALiNf/r+70FnwyYkRhQjiJ69IWQu4x
 qhPnkKAlJx4puYK8k9w==
X-Proofpoint-ORIG-GUID: lkkASsuRSneMLJebFkv7yAopaENbFRZC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NyBTYWx0ZWRfX20oWDLJPwpYv
 vqW27cPPv/Fi2DpdfglpumHv5F+4aprR1DnOoUR890ts5+4bg1qNw7SAqQdleaG9u1+btQD95sS
 crDEC+P44/9r1ENN5ubs7pRTIWQ7o4s=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae3c358 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=aSKgorFW_ocjRd5Bht4A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290087


Hi Luca,

On 10/29/26 19:54, Luca Leonardo Scorcia wrote:
> Thank you Nathan for the analysis and suggested fix. I agree your
> patch would be useful even if the warning wasn't there, to make the
> device probe more robust.
> 
> Being a new contributor I'm not quite sure what the process is now -
> should I send out a patch with the correction, just as I did for the
> initial contribution? 

If you can send a fix that would be nice

> Or is it going to be fixed by the maintainers
> autonomously? (Obviously adding a Suggested-by tag with the rest of
> the bots' tags).
> 
> Thank you for your help

