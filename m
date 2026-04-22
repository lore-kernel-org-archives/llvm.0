Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41766263C7F
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864991; cv=pass; b=X0wPaeZTE118YWnBdAoIO+htIJitBhHB/OAtWjAFEZOSYarbDZfTgV4+9J8pqSDdpGj2PLnkOMJkhJGS/exDateFlsGUekV1DFurwEPwXtT0VnyCEgDtVOANO4+cLvSqLTb4lqicPqKPyit/M+KMSwdO0WS93psqLnOTkUMcelU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864991; c=relaxed/simple;
	bh=DW6Pb/0MwBlZ2vfOk4h67wtFTEicoYLHmE0Xchy77uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrIfNWla20QKNzXWghyPuj38lPuY6Yw0HsML64F+PJEIsFuStkylXin6I0MWAWeWvmcv2dKTHq+lye2sFH+4Bjk3KJb4+cN0I2iZ7ak91x/2sYKourYmkdtJiQEN3CSPtS8SO2eWFIYAdwKWRVODPxdYGS5o01hFOGvgyufKJGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bu7KSuGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDiofeZB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bu7KSuGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDiofeZB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAsXl3976179
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 13:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=g9nefJHLcFDzgFYMQF2xfJqqHCRUAKm/oWLJR0bSSUU=; b=bu
	7KSuGYhMoV2C8gojbjrBV6e/xch/wN/o+rlqGsvc8t5BMIIbGcwaTz11aZyOf9nW
	l42ECE69Q5KaoDbwgboZkZx38WBRV4GVjkTMs9a5njGMfHiKKYCxBs+GLQL0f4W2
	IxvfoepR5GeCSSRrvg9MrUcDJNyRaI3n79Rxi+odfY7NzStx2UQpCXN4Q0w/pF3s
	tVIYgHBV/0o7JSZ1Vy6hXvOE8aBWTP52cTXQJObbRJkB28QDqej38tukB+JbOWdX
	DEN2qI1jcez1uMzj+knW3OUw5KUz5jFHaP7Jl7VGy70imXKog69smqReOn4+hU0S
	0c7O0gRaZtuZGGpZOxbw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenebp3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 13:36:27 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4718a1723a5so7770499b6e.3
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 06:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776864987; cv=none;
        d=google.com; s=arc-20240605;
        b=F7q0JMHD+VbJ8ygoNBC73IpW8jZu14b/EncRBLboxWonIxeZfBzzDlilCpvtu03nMv
         UsuvQQI8kevoNx2QrvhZVkhmKmmvYtIUCdZM4+eIzCmBEuVC+gzhz8KZVjxWbf876Btb
         knV165DUB+3+49/6habt9NkOPlPOPI7WRTMceYa8MyTdjPFM611boteIoycqOaItXoXr
         oGYAKABzywGoP50ku5yL13L7Wp68Pfo7/Up5+sXih23OyTNU7iA2KFm0nCCuAsRQoTAc
         mrpmvT36OXLHW4eyL8ZfHOftHB2vDwebPdT2417WNWSqoGennKvhts5WBhy0kGkvN3Fe
         LFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=g9nefJHLcFDzgFYMQF2xfJqqHCRUAKm/oWLJR0bSSUU=;
        fh=IhKRc98roE23iOScDwrvAe64OqxIbn9oTGPh51mkuIE=;
        b=fBiBK4HlqJ7mLmtLpGvm1xrsUhVEMk7YqDjjxGGZdfzidQAiypYhQqjGsxJSywlm5v
         z9dYFzPjWPBa14KzRrD2RuOcMSqdDFbsU5ho5N3Zzgq8Iz1MpABo/xEJkSyvGaoLpWrS
         ZFgI5W9TF14Ezk4bGfuVrJ4w40FWH1N05PjRE4NgD1kVw9gdpZOazCjocN+cN+79M3UX
         6RRRpk/K9u0X+6VnZoJOJoVVGjWWJ4RGsTLDsulsUVg7Ew7xatuiDx9GmwAtpxhgc0jl
         B++HNeqZdVQLT92aWePy3lWYUdGazA+QmMFAfNW7wE3+LF3lPjg1m7Edy1Q2xYrgzOWZ
         MthQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776864987; x=1777469787; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g9nefJHLcFDzgFYMQF2xfJqqHCRUAKm/oWLJR0bSSUU=;
        b=LDiofeZBXAfPcvWS+VGP+2cfUioYhUq8oMovbWOZcxtw9hu27R9J++RqaGJFPfLqC0
         r8VSncdgCGSCLlJctlKGAr8R3+sXk1sDeeoCQ/3rDuVhxYR1n2zMtrtb9gcrlmj6OaK3
         DnecB0LcO+3+in2Pz26VpPHemsy4Vp8azwigeggxESawmJbY8yETjQv1EHAcifULowBZ
         b+q93TPC4bYayoLRcTd/v4YzJrFJUtStYFd6wc5YKixx19pxV0wKFB+M2cMTlxLFZZW9
         Q1X++tFdolY4iR8kYBqVHc2FQj0phTz25JiSUw3TciMdUy/DXfnwSgSmsJmO9/ZvDYsL
         6aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864987; x=1777469787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9nefJHLcFDzgFYMQF2xfJqqHCRUAKm/oWLJR0bSSUU=;
        b=BV8dlp4X91HW1xGoz4DK3NCYlYboFAyvtEkq3rZI4ERMP6eDcwT3zNxxMpXWeMDjmr
         lgoOplPZ5d8M0kYCdS9lpku4HBM2Vqi7T8DZJQo5fnm+tN+HGOfzhznUc6wU/yyXFku4
         DKHsGUTfNoGWMzzXBH8VWZVM0vfmdNXn+XgQmCypMRLPPmxNJu1XrJMrhLK3m6VYPIiT
         7mgKCa6QnSsAt3EcFacTZmih6oodItNG8QTkl2Av7rSJYh+lbbhveBdRIoIOd9xjpVNu
         G8tBqEsZRYSXevCO4VL1tYMrq5Ix6Vf+FpBjDMS80huk9hq04dQzNUkiCFbi1wCssh3O
         thqA==
X-Forwarded-Encrypted: i=1; AFNElJ8krr8zIXHDrRAqhTgO8jCOpDcxzErtl9Y2Z/Rkis1P918qZvfBgxck2GLQnY3ADBlCn4b7@lists.linux.dev
X-Gm-Message-State: AOJu0YxKvj5DcgV0UVDnlMZdDADp3yDZ7tkMX6DzqBMna1mIzlPvzCdP
	SPjbX9e7qQIWOK6MFX7DKcvJ9ew4wyhsqxQr2c6giPi2zQUlDq6PnV2WIGG1h9cFNjQHPguu0HG
	MFbfI+yVa3Ld4ss2xcm4qelOiPCqmt5U3SFh1IyHNAH4gfgv/TNbmG4fb/Z8/TXqFWo+Arp/yt2
	Nlgy1XEvgxD1RQF1IRu5qQ2hWRIzKoOX4=
X-Gm-Gg: AeBDiesYT5CcpgwKRP0/RFi4+4hfprpzfDDTzXeyq5cWVccirONAwyKBI+q3JGQLHln
	o8VDFqVEwR5P9wVkxOjqpo+152mQMJgZ/DZ8iTvLx+MSl0k4bBo9Rg56pTXQ7eFwrKsV6jRYqca
	YcrRAwd6bel0u+f9twIrPj3Fx45ZJeYo61SABbx4CaJOYN6sLDdHYx2CULSfVzPvm8Ftoeh+kzK
	ExBcPviXchsxpcabqf2lsVjA9pT9qwUpkb+qnv16uHTg0wC
X-Received: by 2002:a05:6808:30a0:b0:467:13b5:8af2 with SMTP id 5614622812f47-4799c7ec4d6mr13102249b6e.5.1776864987144;
        Wed, 22 Apr 2026 06:36:27 -0700 (PDT)
X-Received: by 2002:a05:6808:30a0:b0:467:13b5:8af2 with SMTP id
 5614622812f47-4799c7ec4d6mr13102227b6e.5.1776864986760; Wed, 22 Apr 2026
 06:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-4-robin.clark@oss.qualcomm.com> <qpvedddi36ihfldioqep7alve7ah3lbsk3txkru57e22f4ud2h@rhxsnu2fovot>
In-Reply-To: <qpvedddi36ihfldioqep7alve7ah3lbsk3txkru57e22f4ud2h@rhxsnu2fovot>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 06:36:15 -0700
X-Gm-Features: AQROBzDpl_YQ4irJrW5IPEjK4Fxl70V756sJkA12Vz0QJ03GGx5p1Lde8HxXvx0
Message-ID: <CACSVV00pBmXQLTpJfH0-bD9UBvEgwrru_pv6Yw2BSQqEqO=FXA@mail.gmail.com>
Subject: Re: [PATCH 03/13] drm/msm/registers: Sync gen_header.py from mesa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzMSBTYWx0ZWRfX2sjZRQEE9mB1
 n83yWXcIR4rowoXs9U1YAnBarueLwdkMlg5si74uk0BN62D2N2yP/5Olj6WiQ/duKIv+VgN1CyY
 47teo6DBSdRYneoZv8Sm9cbjnKuxH0rtBSbD1VBuQ+Rq1CkFtN9qBU1vxo2AYnIryRv2pg+yh0E
 Yzk27brGNNTrduXzXGTuY+s4K9GxRTbnHyUsHu2OgpB0I2UeSpw+lmf0VFJXCqrC9x8v/p028Ik
 wGglVRnP2vIJ3fOLvCKnE3kPbh8B+yIgR5a8NgqK1sbg2c31DTgCua9L2Sv0tgFt0UC7H9jCXzv
 YQhNtpusu3bQ007fph/zl9hqGuF896242tX7970hnSd6DhZlFFAGycbEtdBnF9F4TMziQCKw6Bj
 anvon3tu7a/LfwzntP7u5lqBKHd2dEjpoIr8+rNO8zCwLEa9oQniOmJ5T85v1XU5X8RI0uIZdmB
 7N1SNm3E/l5k67GKfDQ==
X-Proofpoint-GUID: f2X9tmnKsuqCJJCA5NXwS79kgI-kt9dl
X-Proofpoint-ORIG-GUID: f2X9tmnKsuqCJJCA5NXwS79kgI-kt9dl
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8cedb cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=N1XRXrzMJDIqkiJVU_QA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220131

On Tue, Apr 21, 2026 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 20, 2026 at 03:25:25PM -0700, Rob Clark wrote:
> > Update gen_header.py to bring in support for generating perfcntr tables=
.
> >
> > Sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/405=
22
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/registers/gen_header.py | 2079 ++++++++++---------
> >  1 file changed, 1146 insertions(+), 933 deletions(-)
> >
>
> Syncing with the MR is not so nice, it's a moving target, but I assume
> we don't have a choice...

final version will sync to a merged commit, ofc..  that just doesn't
exist yet :-)

thx

BR,
-R

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry
