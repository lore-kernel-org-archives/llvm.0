Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9328CF59
	for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431564; cv=none; b=CvuZch5vMjyjWXNlJSwFwQCpl+li8444xSKzTQsLQzKLCERfihNRO2G/7prw0Ga4s5BLqFzHBJ7daL0Q4gIuGLWyPWsl3yVQ7sjZ0mQLzu4X/LLDtrH0Pljwwk5LTHvI8/x/DOsfgMHN3d5THGphVeLbOwUY+DRoH72jr7F02v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431564; c=relaxed/simple;
	bh=+sZPVtVlSFQLAyBPuIDI8PsMq/i8uNZ0PcmkYsFTrrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7esHPateYX/PyJRqID6JgKUVOlhpLnyEoMjsBWTGuwJ32uw1Y4gWcaz8eYuy/kRhqpWIkNYgedpfQ8mnWgZkd6NVtwlyDz3KE0nNygsR+PhVKJCzjCqXK+V2i4yndzmcUEJ6V8mYWOpa+6gU3pjIhWQeA+B0ja9RLhG8X5wxAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzLZkDzF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzLZkDzF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAVHFI015748
	for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 18:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaE3ugE5vPzSinlOeagCJcB8zCB5MqDkxFqSX7SGm5E=; b=MzLZkDzF6Gd/ZMYv
	VKlitnGJYzKA7e/Kw4n31LTEjugRCsbvh/w6VHFU4Nu7Wt4xVpKxorocveN/+YKT
	EFyp9sovYvLOrXzNGJ4hpMLIgdS+F1hsbw9ry+IypidI3wDHU8ze3oMVB6p9jPnS
	oIMzx6ohZ6c/wFK6Es6Qqp4wJ7+g5uHwL1Gc6/+43SKLI8B8kJItjcfaBhP471Wd
	nYDuG6gVbGl1Bw0DnCqHuLEQJYOUbQ6sBKpBzJO2GDM4CQGVoOiIXltjgNT0NV90
	XtAJfz/RZnNxhyBkvNtgVElKuURrcAivmd5U/7UvGhiSLcBP1KirhQNQVrrNPHrm
	3WXR9A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0k0uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 18:06:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af91ea9e884so88429a12.0
        for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 11:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431560; x=1746036360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BaE3ugE5vPzSinlOeagCJcB8zCB5MqDkxFqSX7SGm5E=;
        b=nZgbsk22OxSjCOWfGlD65IgGp+/gvhZh9GPoGgaJskIyxJc4NkZYj8pMWG4dtM/JcZ
         pnTedrpqFe9cgOwlasUR5l1ekQ/uTSjvCy2ccmaW99RLC9Xv4VXtSA+/6cuVdWOUIgaG
         WgptInmgVxTfTeL9Wr1TdHoorMHpPq0OL20OIBJ8DMCuWKpI3fZY7vbNs3hYn4oIfZgn
         7g9/L+dkmzgJ4IGP2/3WF6AiXu4qznpLD18XdEEHvBrmt5ODi1KLJd5NVNk6nE2r6HVx
         /6hJ2URqVnhorKz/Ir0GkFPO2GwQXkX+z6AeBptEu2weot3ZVPAkhCdJF3KpSedQbXiw
         t6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWAeLuYZ/K7Y55sbQyIUvcf5VdJER+SUuBoP8PhklejfpOFhFwyapmQylBM/p74SKIx16RQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzCrWAkyEaMB0ofggN37cQYzWOLDVlcJG+vWG/6TAPubCj4JiQR
	uUi2y3MEfrUa2XvRK7xyIsBvZIKz0AumvAuaZagd/AJ18btZ5smHSrnTGbwGqpP5LQNG+Rh0AA/
	uODwdthUCSp/nsvhzcgS6wYgG3dnBmnTNGggPtBZpF0b9qpQENYXr
X-Gm-Gg: ASbGncvXg5UFKilVhQRkyYKv5ftNeIC+jXrHB70pz2GnMuHkl33r3mdIa130cSK4DfB
	u0akowQEMJX1Fdhif6cNuxHLk6hHuZCVAfbl2+BFyFxZHu90QJL408a3T/PKcC72WIixswdoY34
	PSQj0rOKKIRzAVJ0vWWai34YIon5F9H0noh2HNeCvj3UyZDG7N+KucCdTtmQj76zSuSm3tqGQ6t
	N6dY6+EGfBLzXwrOGxf7aYiWhEeAzny3n+6io4LNMxtC1xFxQNahYI2r94eRLIcHHMbUWOzEo3A
	EyAaBoyVl5QZkTFXaKm78hyxovCIfj6qYo0Hmnn7lMk4ybgbGo1td3/BCvoSlsgkL9OMxy/KW2Q
	VpzOQ
X-Received: by 2002:a05:6a20:7350:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-204428732fdmr222589637.5.1745431560151;
        Wed, 23 Apr 2025 11:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMrARP/m9bsGTLL17jz8nZcyUaPfX9EbmJw5sWgd+pENLjq2lyoM/AdSZbE+MxuS5BlOOl4w==
X-Received: by 2002:a05:6a20:7350:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-204428732fdmr222551637.5.1745431559766;
        Wed, 23 Apr 2025 11:05:59 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13a4084sm9362325a12.32.2025.04.23.11.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 11:05:59 -0700 (PDT)
Message-ID: <99d239c6-e276-4a16-b7db-6e1f8ecc0bf6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:05:58 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        ath12k@lists.infradead.org, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <202504220128.2KvxCzaG-lkp@intel.com>
 <47ea4e64-cd87-4c42-a20d-f663f197e44c@oss.qualcomm.com>
 <aAhEc8yrW4vcrE7J@rli9-mobl>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aAhEc8yrW4vcrE7J@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2xA23kyAyBg874NZZu8OYwZrC-XeOald
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68092c09 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=mHkUAZ6zn0caESaBz8IA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 2xA23kyAyBg874NZZu8OYwZrC-XeOald
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyNyBTYWx0ZWRfXwcfZ7G3zNYtk XmARhOTBggMvsawDfFURb7UR3NNgdR0aHHcj/c4+Z2ARhfoT7nmRT7NV5K6I8SYWmjZ48QE5M0l EtUGmWU9g7JGVviWe9JDazJTeorX/gG6MLrQdHMubGPbNh3GJdP1erT62sgRYCuGI86MaDBulPg
 gwcdOhr2uWxRKC012JWmtit2MF5QCwMymHjyyE9rTB+/kIFLh5ezd2girPt3MzK3zw+nH1Pay1t lGqYptznu6vvZn+xh4bG6xiPCpYVIJTTfot/aBnXa6xBmtsDOLxCZn6RmVhtoBEmF/Jd8FWtZKm xQrxVgkaZ8LVHeUjzONbI0DQGD6lI4PWaQR9UezVIgCG72JtQ8rCqzXWhv9bnAlPxG5SvyUaFCh
 elagbmLpEL5/wmw/9MUa1qL3iY9zP2Xiku2edvW0gFd7GsjL277Wx0W8WKtlE1qRxOrwl8VK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=522 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230127

On 4/22/2025 6:37 PM, Philip Li wrote:
> On Mon, Apr 21, 2025 at 11:44:46AM -0700, Jeff Johnson wrote:
>> On 4/21/2025 10:16 AM, kernel test robot wrote:
>>> Hi Karthikeyan,
>>>
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on d33705bb41ff786b537f8ed50a187a474db111c1]
>>
>> lkp@intel.com folks:
>> This patch contains the following footer:
>>
>> base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
>> Depends-on: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>
>>
>> Is there a different mechanism needed to tell the robot about the dependency?
> 
> Sorry for confusion, for now if there's base-commit specified, the bot would
> only consider it as the base and apply the patch. And actually, if there's
> a dependency specified by link, the bot so far can't recognize it well.
> 
> BTW: for this case, does it mean the patch need be applied on this "Depends-on"
> patch, and this "Depends-on" patch is on top of the base-commit?

In this case the Depends-on patch is applied on top of the base patch, and
then the actual patch is applied on top of that.

/jeff
