Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F111376F1
	for <llvm@lists.linux.dev>; Sat,  9 Aug 2025 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754727642; cv=none; b=AeQ8CI3bO10jZJFuBA/MUMnRxZooLXuxRWMWa1Ibh3q8KFZSYXBwkcF3Ah8PDf+K/7vF+I8/1Jtj+O8jFp6FPd4ZdN0OPJd4YbwRObvMPTH2vqWNcA9IW4F+AbhbH+7bdrlLskl3FsOiQAzx9+VSztxLz+Lk/qv/V7dpNVPqEDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754727642; c=relaxed/simple;
	bh=SGjFGOE4lQDZczOSBQm6XCZj/aKwb7yDyErC94c8G/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ueu691e+3x13S6Skkm7sTt9e18Y/O7+ZPWB2rcHuO3B+NEsQxW1ECkoyWd7aLA5raUdqKLAvcUEdBKaXBr92TBxvJIHcZ45ynAfyrniyWrpErRr7lduahhWNJi0kEURYmcv41cv/ekklJbBaDyAhWV1Nk/P1t2g++Ykv0sObu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAGfaBA8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAGfaBA8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793ZCJN013377
	for <llvm@lists.linux.dev>; Sat, 9 Aug 2025 08:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2H9KRizh8IleLkCoQjNl9JsL
	yZ+FWKuglV3/DdZPO8Q=; b=MAGfaBA8T+Ra1m1wA7iBsHcVPnWichOrkJ6Hwa2P
	MDJWxFoJIyAChoNv7Whs+9DgoVdmCqEWVu91q0gSjXWHwtBMxxa7RuLZiUtG8Fag
	QMcPIvqAgLjCrqE+tFwUV9trMjCN/M9RtQpFw/Z9rPC9azPkItP4yxOT2P00z3dO
	+CHGX8SCr3dCjUy7dEKxEjs01qM7fNulbQI6Js+koHbfqr0p4BNRbI0ecCQoCLI1
	1GsUbAyQKCLD1ohKLTUErVQCdGt89ERmq7byNZcOKB6YrpPAFQHOFn8Zqzkt/SJk
	EVpAvcE8TihcMBj3HLOMv+ayG5eEIRvv2Pku9ZniMjOZKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj40an4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Sat, 09 Aug 2025 08:20:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4aedd0b5af9so58304231cf.0
        for <llvm@lists.linux.dev>; Sat, 09 Aug 2025 01:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754727639; x=1755332439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2H9KRizh8IleLkCoQjNl9JsLyZ+FWKuglV3/DdZPO8Q=;
        b=HxFB+ewKMaHK2bSTO1UobLQMY13HoM7N+66mzdY4rxROZ6XABXC7WHm7KH3jLu8Sf3
         Ek59F5pUyN1fIMG8yLzdFJ0YqmY4xgxovPG6Uaj1Y+pR9/vwP37PiPDpMp0FkNt6zDMY
         LKqc6g8qZGzPDo4HdDYXiuWdx3xtb2+Ciohll6bBXr3O3sbaHRTi2spgm40u7Vn1kSXK
         gR7pkY0PdDewPjp+f2B0AEgzD9KHTzr0czzPapq5TZnReAJZdFRttORsegD5oGYF4nf7
         4lW3kNh5qAaMmQ0BGpaSDup64dhOV81q8GUsEkvs6zmr1DwH58in1wC2atWNvxJpS2jy
         xc1g==
X-Forwarded-Encrypted: i=1; AJvYcCVZT8XzmXbihmMUO6mFgCk2qj0zVVsgQ9P9iB5sDvAAR7WpJAU+zxve6VF0fmlvUkhd43bM@lists.linux.dev
X-Gm-Message-State: AOJu0Ywuiutzwow7SCyEWo0vp6ssRyCsXMvQpDEuaVdyC0rS1kylAI2E
	gVLtX/JqQkmNlrRwEXuZN0ohRmmcSWOfSoq9fC3ObW3iG664OZ/JwPWsdPQ+ZLktkqDjvautFK3
	ctSzl2ENxWkSI64HD0hzHsMLxNhRMaSXhAHVzsSgo5rjsod3ohAfOjJqL
X-Gm-Gg: ASbGncuQd/BLxUpydzJpRQuyIdEZ+kGlrVyv96pUkU2Pkj9ivY5OKbn1KHqL1DP3Xzu
	PU2D1LBMvhxuaZQtV3DujCmhRShgGwxG2wJ6IMhASlGKZ++Ll3YTR9cASKs6hGuCrKiRBWijJlZ
	j7bCAYBTlm7LStKITp613zsy1MU81QU6c5RRyBKoAfq0zBaTUp0yGsFwZD1QznFcf2+pwShlfN9
	yYK81k1tXgxpzk10ilbgMPaMnlgwPUvBAWv+OkRJ7+s31q6cHaCoc7LmxQVpzk/V5fa1QwWCqqm
	8EBXO781diszAhAkiIpbmdLgJ1TZMPgw+d+eBMFqF6oCrYSv3neEG0eh3j/1hvng+Bbpuh9Owct
	0UM5QyphxYjllpNDE9wTtKAM6RF9nRCpvfrPNpQ+8n7h013NJ4d8k
X-Received: by 2002:a05:622a:20c:b0:4b0:6d53:a0fc with SMTP id d75a77b69052e-4b0af4deaafmr103917481cf.7.1754727639481;
        Sat, 09 Aug 2025 01:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaybZqS8e1II26PBLtR2MEev8RqN/YcLWWOjMTMd4jMxYQpAM2kTd+wUuQlaFFQ87m9qtgiQ==
X-Received: by 2002:a05:622a:20c:b0:4b0:6d53:a0fc with SMTP id d75a77b69052e-4b0af4deaafmr103917111cf.7.1754727638990;
        Sat, 09 Aug 2025 01:20:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc8d64512sm146866e87.11.2025.08.09.01.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:20:36 -0700 (PDT)
Date: Sat, 9 Aug 2025 11:20:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <fcgmsw66wi6eqtcwhcz5yc6migoauygaztqumztseo7uu4a62g@bg5xnnd4eosw>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
 <20250807143444.GA1009053@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807143444.GA1009053@ax162>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXyZaXLjtz+qOi
 enKa1A3Q+YS6TvLWiUVrNJKiUH7HyNmTofrMJbn7KLpY+yu/mxN8xXkxiHYZ+6MyD7nvv11oPDG
 j38+f3bqtuCR8P2VfgsF/hONzOAXNFGIJFvUpsVWT9LGkh1Mlj/9VMMH78dccRMCafd2idiDoob
 Z+qWsoMky3bOzgL28JG8vYxUxOUgbESoRQPm0r90yEhPHrqn50gtC9wBjY97rmsr7+wMR+fRpur
 VEvL4s3c/JqS7ux/u1CCjoq7jBevxnc5hNUj+nSFQF46+E3Qv7eMMCc44hLQXlserNMmc+E/a1c
 v32tPNnaOxF2mqqk9tw5Hk/1c3yyPYPNQPqi5tK0eP504GcgBL0zEIvNLpT56iyu/j+wkrLG5B0
 GaopfIZO
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689704d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=yl-pN8RVu-4QMKwhACwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: C1bmSy3b8QnXTm2xf_O5NLjC75Uczras
X-Proofpoint-GUID: C1bmSy3b8QnXTm2xf_O5NLjC75Uczras
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

On Thu, Aug 07, 2025 at 07:34:44AM -0700, Nathan Chancellor wrote:
> On Thu, Aug 07, 2025 at 11:09:38AM +0300, Dmitry Baryshkov wrote:
> > Having no plane->crtc is a valid setting and it is handled inside
> > drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> > false and returning early. Setting crtc_state to NULL is a correct fix.
> > Could you please send it?
> 
> I sent this fix three weeks ago, could this be applied?

It will be picked up for -rc2 (hopefully)

> 
> https://lore.kernel.org/20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org/
> 
> Cheers,
> Nathan

-- 
With best wishes
Dmitry
