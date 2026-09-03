Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD793D34AC
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462173; cv=none; b=AUAVjx5hIQ3+d1RagJ4zwfchqLeljAxD40iJjJYReeXcKQHJ1ijiEOVNYN39XeVuFXvuhJoigTm8tP2ZXpTYdlsClA4Mk2DbIQj0inSyu8Vp5xMZQjhFOZuug5rSDKJQ5J7Qp+o7q9RpD25JakgEJBGVlZlgS6Ss7jITX7DrPtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462173; c=relaxed/simple;
	bh=gsd4KWtCsBvu5WSWvwFSKMFeW2aHCI2LbDE3Kp+Sbkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JYfbISjhm9uAaAQQQd8YXZ2yWnaAHGiANlpvolXX35CbbgvNxKVHZxSHhAJXYHoIvbXUKWyc9A3c4GBLJfXXZhNA7jXfeQ328H31XONshG8YPcEARlew8lX1KOIUvyqmrvKf0iguSLUtSD9z2cp2QifI75I54Ky1x5mFSZY2YPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmSHvHWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUPRp6sx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmSHvHWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUPRp6sx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3VeJ1430687
	for <llvm@lists.linux.dev>; Thu, 3 Sep 2026 19:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=; b=NmSHvHWYB+vCIRfW
	Zh65/AzBrKTVGmUnXZ0E7b4vX0XXmNjcU7yHgvLRsItKGN7J4EycM1Qi18XhTmwX
	8n4bUhNML1Npv4Pu4ngNLHatq5rZquFG82M19rKf13LOOGyjYNK/opFfLeSnPvxj
	p4VfdYpug6yD0TLqZazxqWT+K+JoEmolnvmHaINFfcilvJHp5Pn3DA2mAu0jg4Hi
	X9zm7qBK9HVLFvOJUQ/zYvpFmEYVlpkCE2MZKLXe5GbcPC5tYfTgaA/EnTACCHr8
	KU6+XEgWW0fvE/5XGPSL030wC4fbbbVokPmDIPU9YQoSwLDOPSmePryUQmxEZQc7
	6Gb6fQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4kmrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 19:02:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so170722a91.1
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 12:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462160; x=1789066960; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=;
        b=EUPRp6sxNY2cnlMYJv3yyP0iCKoT2EUVdbfAS4j4YyVD2dRjy7KPGBa83Q9V0xyJ+4
         iiNXYUEetY5QyoZGpTs9R8EmooTz21K85UIiBr8RMdZb9yi6CPxOa2ZgWOV4W0O9M4WZ
         OFv8BAJbyMLiy4KJJ6RBI/mSs9TJYMavmTUfmzbF5r55oxfGauwB+5bsHHJC5rxVGtdN
         32ngFpgB4mh+CYZ89ux3fiEkbqOLhv9Cz+UAxk6Q7rLzjPuazOZhRLiQFQKuqUw3mnY8
         vZMDword7WFkPIFnBiFdhrFXEPnbiCp2JssReA6FgwOdRxPDkX4AbP7jTKixEarqk2gQ
         8X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462160; x=1789066960;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eeL7lzBwTDAvHtt/OIh+AAbkDGWXDc+4IzQjWdsxnw=;
        b=DQYrLhdKFtLEXziN/ZLuUNgtifoRjum9Zl8rpMXTNw4nO0m++sCd6EhBOvvd6NOL1c
         hECkk/NypJMj7HRbSh15yTaDjJEppAPOE6OSE9lpTRuDBDr0gNase9xY7sktvZCwjFro
         VgKVHMVkUXB4+9DPtTHnR7b1LrpBmX9Ad06cunxJ0bWlMt/zVfaOpeuKebUnhAawiImg
         OlZbPCuKBDL44+fQhhjdL7gvVVGt9y7oZEQD4CFrjvGh+msMLyo0AOskkaeuYO5TuATM
         2CEyCJ/hMUBfsTnKE9NAfFJSG35nvX5c5uFZu7sucBLDsXFVQvZC8rmEJz3AUe5OZpGQ
         FTFg==
X-Forwarded-Encrypted: i=1; AKwUvByanz5qTOe0Lu30lCKa4tIKk/cIVjM8y/fbid7xrrLefbxBK3ejbA7pepxR1jXxZmlqB/U2@lists.linux.dev
X-Gm-Message-State: AFuF++nI1sKHZ94PJYM4Muq7ZAamCG1ZniOufdJHLir2nB5HXhQMhJ8A
	BwUJpn0FZcgwlYW2BFU2qUFduFbsIxvSvpQ7kRBcLV69ltvneS0Kd3u/RiqP37ZqUbmHucB+eSb
	gMxKg8TGMv/00C1nelpbP4JYeBK010ol/n6qT/Ionecz1jY/0LSt3OxL2
X-Gm-Gg: AYBFou2jq6Uq+fTWzqOKx+rVDOZ8DXHkjw9VWxm/5THC0J1TkZnp+IdhrDjsz9Of4ST
	LkpDWShy8KargfLRff52PZA/+BwaPUXWw9XrRk9sKcwUxPtUMGHhvGtUK87wpPDnjcSzFSYo1Z0
	caZm65KWCF1RY7ol6526nd4TMfv9Jvy3uTOE5vVHPJYCiJ2/gSmbqMIZ/t0OZO4zI5fSKlU6ex3
	mQ3dnyrH7moZjutGQbZ07hgV505zyTjsrGBSZu5juOnnn1lyPL2AXeEc2CZEMLXGzaGaxgvKJhI
	6DNzp/e9E/opyVZvciwST4aWL1hEx/CAyDOB4UxOiodu7gGN616ximR5pucQb5HiPBiVJylhLme
	uas/4LSH0gz51zaWGXTpFKlHFyG5xXfZasFNSjfVmjh7Ncw91/LuwPpM=
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr977395a91.9.1788462160092;
        Thu, 03 Sep 2026 12:02:40 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr977271a91.9.1788462159534;
        Thu, 03 Sep 2026 12:02:39 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
        justinstitt@google.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, baochen.qiang@oss.qualcomm.com,
        stable@vger.kernel.org
In-Reply-To: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
References: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
Subject: Re: [PATCH v2] wifi: ath11k: Fix possible memory leak in
 ath11k_dp_srng_setup()
Message-Id: <178846215711.824911.14716922396673159484.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:37 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99c451 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=znwm85vKAZ7j0MCq4kIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: lBHA_xk6bjJzUdFezenqdu354UOEFkQI
X-Proofpoint-ORIG-GUID: lBHA_xk6bjJzUdFezenqdu354UOEFkQI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXwWF9ysxf01+L
 Si3uiA0l+/gDyX4erZ7SQsAPkRRQ3pxwEyJn03IpBizCH/zUvnz+S3t6u2jWNhuhI5BYl2D2ynw
 4VAtmQ93ucJXnpAZjAW2mRL5Yu90nvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXyiw53kse1743
 7odlbqSZaLTLpb9yLZ0pjjbNbAn+7SDI99ga4+1CQMnkh41050K81j8A/1SRF+ut84dTKnndrnN
 6Q9lJrCJ1Zd7HNfGwvMQOdo+91ckdOZDxURbQC4ABHa0EJQMMG/PHfNUplbnY9iORJvjwy+2Sks
 EwHkJXiMLRDWTAI9qFfsPvpLaT7vtwo20bLOq9sTTjxuUr+AUEcuXkCF1S+zhF7xaNJRFO2tERv
 OQFgC/jUU7IeQDDqv4ezYcU59AU7S5yFYZEgcMs4eYlRZVL3PoPDD2cf0sCVfUxLvI/n8VC5qf1
 lYuGVH065DJdwusT6Of/IghpD7VmdToDegbrINqRwsdIO9wP8LA9R3xv4Z0V+LrWJgNLM6KLsJR
 DWYPw5lTVy+7fvgXZwkMZPF3lAB0UiRs2V6niGPwJQJu4QTba1Nk1JJ4OeZp2jebp/3ELGQphHt
 YJ6JgFnX6LvTgqnX6XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166


On Sat, 01 Aug 2026 17:19:09 +0530, Abdun Nihaal wrote:
> In ath11k_dp_srng_setup(), the memory allocated for
> ring->vaddr_unaligned is not freed in the error paths that follow.
> Fix that by calling ath11k_dp_srng_cleanup() in those error paths.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> built on the LLVM compiler infrastructure.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()
      commit: 6132d70d0890c03546f6970893fd71938efb2a2f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

