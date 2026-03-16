Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E7C3939A6
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 11:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661895; cv=none; b=BAN53x3LLTwBMyBGerVcdqgmOIGWIfbOBWAVjXqiDqH/2jCJ+IwPdnbKb6P3LWHp+izdqXXKKhrirUVzEkErLUMGx0LKWWEKuTm9wBbb0IHuUYJcRCfhkAyUrMRyK5a9QxiWTM3CnYLxQwbDVUVMNd/9WSyw/6D+U0sNRgzXFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661895; c=relaxed/simple;
	bh=wMfcOM1E8NveOMqBTy2g6Kl0T5mgMJ6P36Bxrnzupx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGRpl7Y1gST3rkJ2VYlOPyaUVG9cgBZSxcZAx7REGD0T7k8tHfpOG1QD3eDeSMQDLoOFkO1TwVOeI/LmNdtxjcfOnNRtIkbY2lPuMCrH/rgwrkPbhVeyf8DiTxiX1shS2vCGNMeXlRstcy05Eu44A1LqWczqie2D/bpSSsopqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jn5C4KsD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFcfVCRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jn5C4KsD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFcfVCRT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA465K3124546
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 11:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ZXaHmFaCXo06Z77INsskRFP9ADKCiNWDgJzdazMXTg=; b=jn5C4KsD9OFzgWxR
	MrdUrbYqFnKXwZzWsOVEVJE2t4JS6NeWON/rsCmqtYcpQQHVPYv11tJWf8J5zN+f
	gWdtYyyxmnjQyljVOuqDhD1ivVpREbikOcLyAOF+dZh6zVYB9NqV8rFeiU88+dw1
	aA1QJYxz+RGOoeMvzffqhiFsi0X4/gK2W4DGa+aEi2Othp6vJIbkQoblbxd6WJZe
	1sIzibrRG1FqL6x6tGR6rauFQ4ZuQlWd9VqnJZSzpgykRRq7SMDUg51COHArf59g
	Xm3xmtxPWLcoVU9MS/4/i2tucosBqVchnPJ7K/RcXhAOhArRWZh+/5lD8/3kgBqt
	JVjaMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmgc7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 11:51:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd820c6a4fso4098922585a.2
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773661891; x=1774266691; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZXaHmFaCXo06Z77INsskRFP9ADKCiNWDgJzdazMXTg=;
        b=EFcfVCRTl2CC7m/JSkapzZOJv+NIj3WGR7MysVHajt6T7nMGBMa+BMVW6/rBH0Ig3x
         wRIRrMRWnArfMjOF29WjNCxEFpa+OvFytz/nxlUzucmr0joOK21WhzdcV8S+K2gNbtoQ
         2QINnBSExms5LZRO1HlqeqnTkOXTwNCG4vbtU2eO1x+coCuBYo7US3kIFI5cQk4cGlcx
         q5bf4oZ6MsBQJ7p1S9UlDZ+J6t1rwdTSH9+t+BCpOwJTuRIMxMwKWxonuveQpYSV6guM
         O17MPv014Rn9XFwMYzNaTeLb+wsJkgEP8Qk2smH2Psd+KfoY2u6nleaKpgsalI2anYjR
         6CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661891; x=1774266691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZXaHmFaCXo06Z77INsskRFP9ADKCiNWDgJzdazMXTg=;
        b=W02aC4POJIJjdCIb2+vmh9HWSZ2eMjD0BZIlT0YoRVgiMCi7uoWB0e3c2KyfJJewgI
         k4USIXNSBvVC2pdT/iPFDyzSu4QxOqOzmsHs7VraX0hM3sYQwquSdvxroVsFLjEz8qfy
         7Nze0yOBKoEmp5/ChCSviPuVPS72fZrhGU9j8r3ET/DRkRmyn8SF9QL4lkQZarItEUwu
         +UP6hiH0H3dvHlEMDGeyDwAeylUhNO9kZXum7/XxTUQVprLtR/QM1jyYIzk8PvrMZ6rE
         Z5fpF+Y3vUlBJBAqxl8AVLgBy56TydZUIi4jIhBj7v8l1BwjtiD2UazbZ0jD8AUgPC9S
         E78g==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7p/mFb123soYdtMhnxdHPha9dH8D06ZE2GFTwksHnO0LYYJ4vZ7O2MY1tEgYnGpTld8j@lists.linux.dev
X-Gm-Message-State: AOJu0YwWVLt1CW9ChgU8JL3DbINsHEW7UOfWRLKdPM2ehfz0l5C79eXK
	JmSvPfSkbm39CnM2qKzKDCcVZyn+894OHvaJBhn7simQ8Q1K9KMg+tk+lu8x+WQNIuImzhj2r4C
	LLClRvDhWSGyDibM3sMk+yda4m5vOhg2AzRvWARTpyEdb+CJWsH8UV65P
X-Gm-Gg: ATEYQzwMyRKIDA/9hVekKTPpy5Bqv+uypW9l0GCbwGBryPkaM0lw8+VF/8iVo3ENfEK
	4Gy+JEZKxp2WeUncrsFLkbQwr3tRijUpO9ug35eN1ASeLmdsCztXJvaVfAYIAwVjHAyBLVQBfA6
	/qCjN3ZE+hvoFt7uNuunz+Mqz+T11ltA9fU1YARtA7ulKYAIwbZvICqAqk9FGTbgf4dShvTMdTB
	4tvxqtNBghNDQ7kZpMufywKEGoOtEZRaWwOvvfMq6e/W1si5G0Zm5Xb5I7ox+3uA43KGcHMkkjh
	+HvsXIeCdFHQR0DQZoDExt1NwUiP9wNjwlfdHcV5DYqYzQMXypcHaBPg5Ka390CS7N2AldzJkEK
	r8bZK1d2ZwANOQIpOtiqmhdPCu0KGEXitrezCo6MduFwlLEORy40eXQj/hit4hZcvUCIAFw==
X-Received: by 2002:a05:620a:468c:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cdb5a964famr1517109285a.26.1773661890676;
        Mon, 16 Mar 2026 04:51:30 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cdb5a964famr1517101585a.26.1773661890086;
        Mon, 16 Mar 2026 04:51:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5dfc:3995:22ce:d286? ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm19896229f8f.0.2026.03.16.04.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:51:29 -0700 (PDT)
Message-ID: <9de4e5fb-3ce9-4b3c-aa51-f7e09ac5b3e3@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:51:27 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/30] tools/thermal: Fix typo
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
        Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau
 <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        William Breathitt Gray <wbg@kernel.org>,
        Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
        Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
        Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, bpf@vger.kernel.org,
        linux-perf-users@vger.kernel.org
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
 <20260311-tools_build_fix_zero_init-v4-2-9e35bdb99cb3@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-2-9e35bdb99cb3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MCBTYWx0ZWRfX+aSMTiz8esQg
 dzcVebyaqtBY48AmES0XS3RaMxugThWldAM/DEr7EnDKFJopcV/4qRho87B+6uruLnlT2b3VdGc
 gdoV2XfRCGqM25BzGISG620ffhkhKV2QkWh0YAZ8puOi++EpJ/CN4rHiMQ9cjcuTvVh9jjjiGfW
 EWNob4WrHG4GxGgI5vGJWWY1xZYVpLAXzSpOiV5Jr10mH/tzCQ6fG0BjcGAYCF9qtE8JQn5UODg
 WWpcFNKn63jnyqOjCJbX6cJ8qNcovJ6omguvHU/cO8H53Vj14raIHbxUqgOVVZ6vS1Ak4W45Na5
 wX6LrOVGmcIgWcDq/LUbRegFwCov1Lc7FV+fbWHaeO8b6NzAATBbfZBPFFeZOi45N2ZQXXwy3Hz
 MUgN2NmAEhCOVrZEcCKIOzjITHp4oL7TRbvZPzeYgnZDi7mHw2kQaJJKKCDWrgWFbMqiXkcMk2Q
 aqYiFS/DXBBTCeAw+rQ==
X-Proofpoint-GUID: G1m4SXdE-aV1Q4m5z8c3dlRzSFVnMcXB
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b7eec3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=9qkRzJ4zGrA7FPkgJCsA:9 a=QEXdDO2ut3YA:10 a=u2kJyrKl4JkA:10
 a=0lgtpPvCYYIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: G1m4SXdE-aV1Q4m5z8c3dlRzSFVnMcXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160090

On 3/11/26 09:29, Leo Yan wrote:
> s/CFGLAS/CFLAGS
> 
> Fixes: 3b7c5e8adf9c ("tools/thermal: Add util library")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@kernel.org>

Thanks !
