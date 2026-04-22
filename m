Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B83386C3B
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879012; cv=pass; b=TYhsAJUciD9VzWZZvT06GQCvNWWqNRJS6iFREcGXal2WzhjWT4KbX2WbJptrPv8CPw/dX2Gn5zwUoNPmqntLwNwEzqqbL0ycMeOQjgdxJKH0Lg8LY2Nt6GGijEngg4tGQel4DCk6ylS/JS58XN47EjwecrSfrlSSX8WqLN1G1wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879012; c=relaxed/simple;
	bh=o+rhAip9oNP1x3wW6R0UJRqzvmXDibZ1KLwtlgtklvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDpjDvOVdjX/GzL4XC8pvH4rBE8q40x8kAUxpIKun3vH7Eke+4XT2xhzObv2z5fRvZ0hf9QkxEwBmyz//V9WeBNajAJwx5CiLiz07YgfVZ4AKw9JaN5jn6bvsqj6V6XLattSQGmgotx7HyzcgVn4BASnmxYoo7zVzIjzUTWzfIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1h4iMsP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQU8muBc; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1h4iMsP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQU8muBc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG4lRe1587801
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 17:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=x+kv21v1RlyCw+hD9VXFd9bZ7kOUY5AThNH33zvfHGY=; b=V1
	h4iMsPgq4ohwYar4O+VpywY2FI7J5ZECADkWOVMLPopYZvebSw1IHfw0t3iWFuYY
	isDy5835TfahR5GnFTT6gr6khGBoDe2zNZ+lPunsbTLNvF0/t6FsRQDOOcsy/4D/
	6exM2InrWIiAZ2JdbU5PgaQqwKen0a7Ll+TnTgXcADs1tIvbp5YR7T5Z60rabcfi
	p4j7CK005eklkj9MvCaBfDrJZOq1onJd5b/Sk4z8PQN2dnSRxxMb1EjLO1tvIWIX
	Oc11cbGAxEXLgeLuh4XTdJbnOnohIPLmaGSmtIIjTSyMVVK3oEHZ3/Tp3rfl4vKz
	hqcoGifjKmWPpCyR5+ww==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq0a26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 17:30:10 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4236c3b8f32so10731887fac.0
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 10:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776879009; cv=none;
        d=google.com; s=arc-20240605;
        b=JC/3c1Y96z2q2o1mVn5UNMghq6T7y5hTINYU0hGsiaM3rq24oriPEX07RcNxfvEd++
         0elCjCcCUm2nDs312jIPWi7lX7uEKmE7Qqz6eWVc/297QubNsYuL7R1nhrazHWUTLIFJ
         sI1g/qRopiL6YP4hNpmXj+G+iu8OgOFOKVWhLlKPEqi6uZIYUZdy4kr3bzNLAxnEwzoe
         bAFHO4tiGdcFb6l6pnloZalwg1FbMKRToEEJtsQ7aIOOhcq9OcA1SjoUYk9sqy6YGN2o
         IsdvOItVgLiiHbeVbmzcKs/qhqNAob1XyybD5ZyLrhBkrO0O4rtInE1MYSJEbKvqdii3
         bg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=x+kv21v1RlyCw+hD9VXFd9bZ7kOUY5AThNH33zvfHGY=;
        fh=9zySLv2SRfPDbY3xirm+4cybFiDy0lT26RIt7WQ+844=;
        b=VbqZ3X23aYgSE/ajnIgIQ91KXFARLLibjYbk/e3nKT6qQ66S4jxqXfL7QmvWKpAtIv
         deDoU+vkoY1di/Xo4PpCrW9ttjRSY1XdrHsdNZyHkXho9BwVOJPX9UYSug68oWsyap6p
         Jh1Jfvwt69siKC9Iaw7sPZKDnPQydYScRpUcYzHPg41pfcc157PDbU8v9Ro0eKHOMgs1
         JXjtx8JmVaF3F3jCVXFlQyCbykHmXQPKJYUSooczL/O1YzZHW9ZQL1eIJr/vEnrTn4rr
         Zv2UXIrz1zOoWHzTQ+ydEpAr1xZCpyoZNncSQqDUHRcaBmBCI6fVZ6AnzyiSufxrJKGr
         fe0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879009; x=1777483809; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x+kv21v1RlyCw+hD9VXFd9bZ7kOUY5AThNH33zvfHGY=;
        b=HQU8muBcJs2f3nDZ9cTTaaaQOUQwUSttLKLfbpImDE7+RSRzgf3VFGFEuI0AesPxo9
         5vORWefT4gRzOuXdS6tBTFb1VaxKW/j2v8/Q23MAtzwNKA5o8lOSpHJeXKWAq0HKX0zF
         CyqBiXpUI6NGZbYbD71jdCNL66gcBcFQEGU34yqvJlYgobCmqdh2rcTsn0fNkrOf+8of
         hLsI5UHXdKdL2YVVk1YQ/nSBaS5Gso2G8fn1CFL0UTbLgY2JBa+rU94dzjJjjgF9evrH
         Nm+TVAEI+TeDGbl8cJylXhtYl89UMqZhJI8bvqxTNlHB6R8VTtCOM3tE3NQnzqTZQgT0
         Lmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879009; x=1777483809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+kv21v1RlyCw+hD9VXFd9bZ7kOUY5AThNH33zvfHGY=;
        b=Qv3+IHmACgavwcBEiU6jNOTtz+3bS8amXVOdgT5p4ta/oV3ZiXOmLACdPqi3LU1DAz
         KlxMwkX+WMVQTBA4u+ypqumAv4E9UClZA6lMr9ae358GJW26DKc1uolGyqxBIkN2AAvi
         AImLEVRjVc+MR1Tid/AdOp4YDQC/LxL3KRmdrSmU/r8WXSOIc7pS5UnrJ75wnX3w0K4a
         lX3uFBQD1KdiOe4TvYTdTjmLvI11hbnbqz4Vs5V1f92l5BIQs7Q/rw+Dua0qLwrbLot1
         43GYRJwE5fYXyLh7/8Msq27ZosnwDP5hF3SZ5lX1voiqbay2O5EWAL2xlWK3yn+Ijnvk
         0dkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W2K8+mBM6BEACj36tS2QubzU7KoVKp8G+2OvZIbQlVdVRJX1nqXKqt0QKcDPaMjvKiQPd@lists.linux.dev
X-Gm-Message-State: AOJu0Yy385eo4qniOMsEFLIbNZYTYT884Zs9AqyPQS12eofn8ColCnw4
	qfgFdWicwGIboknJx2eKYLtXjXtkfBeRgTBoU59rc6EBcabEdvSUuxJDS8lPZGIGEh2xW+waujZ
	63xlmrGzIWW7jOcaW/qwG4kMceOiRjAdI/CPFfFV2VZSg+y/XMCx8fWW/lKsjPR0i33cCxmDAsn
	rRynbL5DiBcePnJT6kpsRm5gaK0pFvTSs=
X-Gm-Gg: AeBDieuyj/SoKkENQWJ1gc1X0OqaoOPmG77jqkQtABUFF1LcL17/kaPWJgoj5ZSisWx
	rYrWKHWcJZbHiyufSoI2UqBOSL/fHVus90K2u4ytp5dsM8r7v7nOn72gXlwQSJpOoqPdvuFv3z9
	a9yDxNotTHnmxOD9TxPci6c8sjN5dYr7HL4i4DhXjIHgVEqHNpIQGU4bAC+HyT79Le7qzaUNzVf
	TarTYMBtsm9zAV0s7iYOohUFgYipge3Q42su2li6WlceoqP
X-Received: by 2002:a05:6870:89a8:b0:42e:9bd8:479f with SMTP id 586e51a60fabf-42e9bd89791mr4009268fac.3.1776879009460;
        Wed, 22 Apr 2026 10:30:09 -0700 (PDT)
X-Received: by 2002:a05:6870:89a8:b0:42e:9bd8:479f with SMTP id
 586e51a60fabf-42e9bd89791mr4009236fac.3.1776879009015; Wed, 22 Apr 2026
 10:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com> <b4hkax45ohmz3dk4b2wgfmq73px7er66wqxixquxhwd64ngboa@zu4frfofekef>
In-Reply-To: <b4hkax45ohmz3dk4b2wgfmq73px7er66wqxixquxhwd64ngboa@zu4frfofekef>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 10:29:57 -0700
X-Gm-Features: AQROBzBaTNAnhQpwHwM1yr1F-gZQj6ZcnfACIOuyGg5pITZEduYhvobo34Eh-AQ
Message-ID: <CACSVV02a0tt83+G6svZ_foEuoZ=aag75z7D8TveQnLO74pTMww@mail.gmail.com>
Subject: Re: [PATCH 00/13] drm/msm: Add PERFCNTR_CONFIG ioctl
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE2OCBTYWx0ZWRfX2mfw4O/nfdHj
 FD9SvD/Kx9x/mAuvzTUJJVO/lr3s1h1ltJC/zuDS6qv1Qoo6WOeixi+AogwRd+20Q3jmUEI14az
 Tpdrq3Plz/DfqvAgo0ahqb8+CZ/BUeTFgYxwk8TjZNSw58e4orSOOriZfwWjrUIWYaL/VNDYpzt
 1eZX0OY2dyUmY4lySdoRmcgpVy61Vmxvlr3f9xI4S6ZaBb6It4gDPcHLaZbKMg2wwm7F3HeaAMv
 DK374f4BDHu5I2KAICR7cFA+0RY+Bq4G13Iz7KKZBGYTgoYIEVy7yYVQhRQhvut8T+BSo/jaV6C
 KzlbnWJJPoRb/q2kehxonDzxHhrMTRq6aefFPJ112N2c7afN33DmLdhLQoPpmwFcTF9/UMFI6ND
 b2DDYsADtoCXnhihRUyHcmDlD8w8nwFRby0HqwvZn/7Fyg4Dym+/W4h2D9E3XxneeDiI2C+P2wA
 DFlQFs3fJZApJB2/DBQ==
X-Proofpoint-ORIG-GUID: q4ywGc2PBjrP2vgjP4LSCZ6m_WiMBLc5
X-Proofpoint-GUID: q4ywGc2PBjrP2vgjP4LSCZ6m_WiMBLc5
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e905a2 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=M9zKgLJNyvpdfU1V1vkA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220168

On Tue, Apr 21, 2026 at 6:54=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 20, 2026 at 03:25:22PM -0700, Rob Clark wrote:
> > Add a new PERFCNTR_CONFIG ioctl, serving two functions:
> >
> > 1. Global counter collection (restricted to perfmon_capable()) using th=
e
> >    MSM_PERFCNTR_STREAM flag.  Global counter sampling is, global, acros=
s
> >    contexts.  Only a single global counter stream is allowed at a time.
> > 2. Reserve counters for local counter collection.  Local counter
> >    collection is local to a cmdstream (GEM_SUBMIT), and as such is
> >    allowed in all processes without additional privileges.
> >
> > The kernel enforces that counters assigned for global counter collectio=
n
> > do not conflict with counters reserved for local counter collection, an=
d
> > visa versa.  Since local counter collection is scoped to a single cmd-
> > stream, multiple UMD processes can overlap in their reserved counters.
> > But cannot conflict with global counter usage.
> >
> > In the case of local counter collection, the UMD is still responsible
> > for programming the corresponding SELect registers, and sampling the
> > counter values, from it's cmdstream.  But by performing the reservation
> > step, the UMD protects itself from the kernel trying to use the same
> > SEL/counter regs for global counter collection.
> >
> > For global counter collection, the kernel programs SEL regs, and sets u=
p
> > a timer for counter sampling.  Userspace reads out the sampled values
> > from the returned perfcntr stream fd.  Releasing the global perfcntr
> > stream is simply a matter of close()ing the fd.
> >
> > Since the counter sampling is done in the kernel, this prepares us for
> > not having to disable IFPC while global counter sampling is active.  Bu=
t
> > wiring this up will come in a later patch.
> >
> > The mesa side of this is at:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522
> >
> > Rob Clark (13):
> >   drm/msm: Remove obsolete perf infrastructure
> >   drm/msm/adreno: Sync registers from mesa
> >   drm/msm/registers: Sync gen_header.py from mesa
> >   drm/msm/registers: Add perfcntr json
> >   drm/msm: Allow CAP_PERFMON for setting SYSPROF
> >   drm/msm: Add a6xx+ perfcntr tables
> >   drm/msm: Add sysprof accessors
> >   drm/msm/a6xx: Add yield & flush helper
> >   drm/msm: Add per-context perfcntr state
> >   drm/msm: Add basic perfcntr infrastructure
> >   drm/msm/a6xx+: Add support to configure perfcntrs
> >   drm/msm/a8xx: Add perfcntr flush sequence
> >   drm/msm: Add PERFCNTR_CONFIG ioctl
> >
> The series doesn't apply to linux-next. Please switch to b4 and use b4
> --edit-deps to specify dependencies.

fwiw 20260411150312.257937-1-robin.clark@oss.qualcomm.com is the thing
missing from linux-next

BR,
-R
