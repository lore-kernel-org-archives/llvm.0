Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066636;
	b=WKnASntmqUpMc/cn+1/xU4E3z1Gvjb3GUgA/qWQipxU14qrqq5l55yVo5NB1XSnAPlU1
	 1Gdyb9VKwCvqENVdTl5zu0XQ2pI7y8PIDQlCNHYtueMXqsiNCEnlXowTdl7BbTSkWVPg7
	 KBdljAFugAnMSTTdxzCMiUpj6/NjXQZgrqGfNepLo3UWYQT+RZb7CaUNB734OgVCXDVoO
	 HhqBBCBcJVNMj482KLoVqec6exANo87QQ11XF4Jgmqx7uZ/hfmCfr5xOfxsMWLfBIEp1m
	 HQIJ6WGQVEkrZnQ+0afCjMgHd2uh+miNBOHxJSZZ5yHRM52QF8AcU90JpAoTbzI8Upg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066636;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kXuNtSAmr+Pqww7RppGgLBQmvifOl6Hq2LhWjIe71V8=;
	b=I6rK9dYlDqI9LIdNhj20Pjou8QYqANKfIzEIpn9JJrlS6JqOi0xSbNgmIompoLZT8TLo
	 gv8xzd5fOhjNS9S7J4BvqZMQELvlnPMJ8hkfawDaY48H3LWoQTzvqkBzdEPVyEjUgIBNQ
	 YrniGW/vg4BTa/qVNUkuUHyhLlplULJYiDXCFUtPb+gMrr9ptkUM1WWLOjgWzNTmexM0k
	 GhV8KdPbqLNe321dZrGLkOQzzpO0ctLHtc/MJzKziWwXZPfPRXkHNAsCTSyiQq+by6VZg
	 eITdX8NzaiF32fx0f5Fhq5dFv2iA2Rp/VUwn8Mr9akXCBFFDd5ujrjvmG3OVA3GqHrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJYwbou9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LixZdWAo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E1606B423
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08E1606B423
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJYwbou9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LixZdWAo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B7aP786416
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXuNtSAmr+Pqww7RppGgLBQmvifOl6Hq2LhWjIe71V8=; b=aJYwbou9o1/UPQ+J
	xkqhiHpIVeQUOiIk8ldF4poGvECw3lXj8r9Phir65vm5e/5s++idTxpRfJFjNPPE
	JEURtN29gzHQNQSASetnPP1GfW/c5f5xuPBRn3nXC8zwPBdBqHllTn55yuy8bBOH
	o69+Ijt5lDp4KZkFRyKcqCDHg3bu3isHex+QxRAjVhg0RSTYwaGUNX4YXItzEQQ5
	RxHGVC1yC0w0HlalEl0DIshJh2bS8iHnrIu0DStpbTRkWTyTQD8oj94JkISWYwe+
	UUGEImr4TVf346/fMp1HvqxG+yV6kfDqOSbt6OQ9dnJf29ao25POkNoCBnCfDmOZ
	lCXhDA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcbfnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:37:15 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862b081153dso635606a34.0
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 21:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795066634; x=1795671434; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXuNtSAmr+Pqww7RppGgLBQmvifOl6Hq2LhWjIe71V8=;
        b=LixZdWAomI7+tS1oYvC0ktOcE2+1dxFHVec5SytcyB6BJ+T2m2Cjgb3ZqOgAuSK54k
         FZTKrxK/E4WIAQcD346crSEtPoWkJ1sudBildFVyaCQqVb0ZMBTyEwTjuTuKWMCEwwHb
         UkXkxN3ezIUEGsbpViolTm838cGi5LQLMWx9kjv3v0TSu199Rrn2jjSrkk1jqjqQ5VAv
         vcS0LL/XzYBGUg0pGNrJmPmx8UKEqakSVQZDAS/hxDu05kL9Yp7KdKEtD8fFku7Ywq4j
         kdVYmmU9GuZwpTdKnNGoQnJ9ujYNPs84UNQdweNHJGoppisoUKtOQFOYiPkqjLDPiRyk
         KxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066634; x=1795671434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXuNtSAmr+Pqww7RppGgLBQmvifOl6Hq2LhWjIe71V8=;
        b=2u9lqotoNifXkaO6XXTfFgNnbKnfKOSYrVq8YhZe4+lGVTrBeZZTvykirBUk4x4wPK
         blIMgpdh+vHJSFoISdhDVbFZ3IVG+fT9cegBMdcSrmEMWA1CPGuzSrNVvlzjQMVRR6JT
         tW++gZAP7478LvM6NnDf0oUIKbupNeUib2rtdkx2QQaLVhTIGoUPrp7zE0dfRusf6b36
         Ru6K1cjpL7/DA49zXf4wOvBoYUUpr5DS8+T0ot++u3eChjShdDkRAsMZre9jRd/hbRai
         W4cmgB8THtH65Qg0seXaAZdTb82DUDtumYDgMiIBqm23+gKY/+S1KNDQIdvW5upmOn7k
         L+mg==
X-Forwarded-Encrypted: i=1; AL+hErEgh/cNRX6S/tNbJCXNvKyWWS+qHlFeVCPgi456dqWbGuL0GNJdC2g9/iY3lfem/IJMFfR+@lists.linux.dev
X-Gm-Message-State: APuU4Z+j0REF8Hdi8vx+1uuXaBakSOkz15tw6ZW+CCGHCONjGbWaO0Xz
	ByjtbvuR2dhQusGXKkiOEfNlO5e8dwOvP/TIwkpITCud+Gh1m0v0XN+7TWZptyWggJgefz4DIQZ
	T6zpdgyo3VgbSuTTZDBu2ybPkgogpT8XKifbrzO2F6/UBCqB6NGEgweUI
X-Gm-Gg: AYBFou2k3dyKLsxRxqU0/H58oB7w4dSDg6q+SBHUFJE7FEiB5ZTsvumotZAoTW6VOxV
	0lQYYu7PoOPT3W+7rDXfDyVx6+MRTrHxhTgr1fxl0mC0FLSrxLuPJNKNNujhkJCuPJA8qQBWqNl
	tboa/03sswELj2dRKHK2QnMe5GNEGiZiI/mzpgcurpr3cxPUVP696j9TSgy+uOd7mmGTMtTyODD
	jXg4HRDGtuf3prxyKKfqnCc1+D+qo0IgrLQ8fM+AP+JnJPXZiTJ0wjRSkjEN5pULwqs1eRGSCrt
	YkAVeBNCo1YQw7Nq6DQnViMd+UuxKdjV/cHCFd6Eh9GOzvTFr1teKmK4NnBo4o9YUH4YX5Oq93U
	s2AYuxGyJphpneronZQsHY1bDmvCzyK1F84aJoDRAaP32GQiOCsymBUzHaj1RMJCyhMuAl9GPE0
	lKrBZklARJCDE7nUik7a0MN/1IZ1/sBzEkVd/bkGLCokuou/ct0jlt
X-Received: by 2002:a05:6830:2543:b0:862:cac9:8ed5 with SMTP id 46e09a7af769-86308fe3689mr56287a34.2.1795066634387;
        Wed, 18 Nov 2026 21:37:14 -0800 (PST)
X-Received: by 2002:a05:6830:2543:b0:862:cac9:8ed5 with SMTP id 46e09a7af769-86308fe3689mr56276a34.2.1795066633920;
        Wed, 18 Nov 2026 21:37:13 -0800 (PST)
Received: from [192.168.1.199] (104-54-226-75.lightspeed.austtx.sbcglobal.net. [104.54.226.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f0138042sm3494162a34.2.2026.11.18.21.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:37:13 -0800 (PST)
Message-ID: <7b19010e-54e7-418d-9fdd-bcab69d8a885@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 23:37:07 -0600
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
Subject: Re: [PATCH] hexagon: bitops: use the compiler builtins for ffs(),
 fls() and ffz()
To: Tzu-Ching Yang <shingekinocore@gmail.com>, Yury Norov
 <ynorov@nvidia.com>,
        Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261117054939.2126980-1-shingekinocore@gmail.com>
 <av3-Nf01tdGw62lh@yury> <20261119053249.2098578-1-shingekinocore@gmail.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20261119053249.2098578-1-shingekinocore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe8b0b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=G0DxCgSbUnPEjjFRZWsA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfX4dMTp3kcrlsw
 a5hBZ/fIA2T44+2oXplqVaWJTqrHKFLO5S66aAYJfdUVyWtB/J28t9S7wfpQeW49k8oyCwPBjZE
 p9fZd/qmZ+fTOnU4TUTBXX6Y4UNC36hvcRD7CFAg3UgF/8KBBdA932zQdRW8NBl8rxyqlwATQAC
 XVLvRU0Iv9gnA46jpVGfi7c5iTluHoQPIiX8ThdDaNAD0tIzeiu9JUU0Ek4E3Ou+ZTqUf3EGfWJ
 pfgvc1qUFigAWC7f+WKVuyQb6ASVdv/tyxLonk2OZO/v+J3HJkkeP+pxg+tj9B6DJgJ1r//LkwV
 uWxyZKpjJExyM7d/SwCOWZd/mqUW01JWreUDq4RZAFOZV7bjnNM+8rSDTxmLthiYFVA7c32NIxv
 E8nauI6LbjIQ9gZWmnjdGGoPVlgZuZv6c39plWcCx3xkVg4oIU9E5V3W1Vb3uX4+6l5A2LQje9V
 mi39s8gg58cFRADgZ5A==
X-Proofpoint-ORIG-GUID: XByS2lJbqeMAbEGxXT3hUmqt0SgG3ijt
X-Proofpoint-GUID: XByS2lJbqeMAbEGxXT3hUmqt0SgG3ijt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfX99sxAtN1rjQd
 WfKAKbQ08K7Zsikp7Vcz9A4+AYhahXc/yBRLwYkxAHPRf3zmWVPYdbCZoFYYnLPb2iAtTe70an5
 UqmyJtpkcshjgs+S49HEM66of6j2e/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190022


On 11/18/2026 11:32 PM, Tzu-Ching Yang wrote:
> On Wed, Nov 18, 2026 at 02:36:21PM -0500, Yury Norov wrote:
>> Reviewed-by: Yury Norov <ynorov@nvidia.com>
>>
>> Would you like me to move it with the other bitops material, or leave
>> it to Brian?
> Thanks for the review.
>
> Either way is fine with me. If Brian has no objection, please take it
> with the other bitops patches.
>
> Brian, would that be OK with you?

Sure - sounds good to me.

>
> Thanks,
> Tzu-Ching
