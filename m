Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6A39182D
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661915; cv=none; b=ilC2Qov2e7pJuQMLxoPdny1kIvIWfUSpkfpQSKLrlWIF9RiQZMe63LaYuLSjAtHLMwfIYxzYIFE+T4UGgeM9IQeQAJG2ss0yPG0Zc3Yixdny3+dNE14IuP2u45lNoZ4yqnZHLCEMPGiCQphOS0FHI4iybnASZj/OhVaQMJI/b9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661915; c=relaxed/simple;
	bh=YLpCc002qTAuD1kMTo9L2KKQ3cL9ptha/TF1A8yfeIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfUkLEobCQnKdQvNyGuj2yvBRYSyQrOUsBtvTgwWqgPJuEO8/KcLmhkiMH3BhgTl8RcASRNcFg+SQUdL9DluAbURlKfhwz2Xmql+32lp/wnzjGFoJXJnUNBueA30oXwkSVJ6vX6mx/hOu5kpYKo/AMCzD+ruizrb5mZ7FQzpLBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7gZHh9X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClCRSgEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7gZHh9X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClCRSgEe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64brZ2672149
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 11:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVZQrImfTrVRlq9EnXFdF8VyCUmvC/OmzTav/z10XOY=; b=R7gZHh9XPlUicz4h
	ApdGvsVcPW0AlNGGFSPnNMHzdRsfpQ9dZkk8Q20sXtLvj2zpPxt94+PE6ukW3SWI
	IUDl6ZVbt2JjlXZURxrJLC79qRoPNWHVhIxm52CpLWKffjY/oW5UQhdj2EW+90gH
	zpK1zTzp1q/qH1JH6UHZWJhFYlBwn6bS4cs9PhHWk3mK28PTq0dI9PxFdgIcZXSI
	QI+TnToLJdb3zKgYYBV1CwXAMuR4CKCCfF9ne1ryeYkg2MjOjEzDIowzWK3azep8
	OtpOD7W4dslo6YhaoDF+jNlZmZbzzYaWgBiCYuUHPMTRASEL/aC19DYNk+klafHL
	IH5BjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xnnr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 11:51:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so2923085585a.1
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 04:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773661913; x=1774266713; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVZQrImfTrVRlq9EnXFdF8VyCUmvC/OmzTav/z10XOY=;
        b=ClCRSgEeeJ4imLER1eotKzPAbPssjqvQKpFyfYIcrTIMJPwBBkJqzpoxI7qZlMPuQH
         06Q5RPXXcWU6XgiRBSZ0bmzvOy8CS8sOOviE92xQ3BJyL5ZOxLEQhRVafDmIIsUhWU97
         UlOgww+XqGScRsOpLYBPHbpqWRc+6CmZnUc82dwnJ4ycpG3PBtr0DmWngIN+88LYdTIy
         Gd8GTEswbkMzBP3Q20X8bz4EgbS+NYYkmodR7J1416rb1Tv2+XXA6S+UKRR5THUQxY2k
         U4zqhWw9dIGd0MHeU4D7o8jb+C+MR3D5TDfd00wKP8YLUv3dUJX0z5CrNVMZ+RnYKRGo
         tocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661913; x=1774266713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVZQrImfTrVRlq9EnXFdF8VyCUmvC/OmzTav/z10XOY=;
        b=mZKqyKPxx5MEecZTGZxiPxyAK6opQvoO2yO8lO8fDYsZSZz+GxQoD3WMDDYpm/Yg4n
         N1h3TNFuSH8xLYGIc+uQ/zN8pIfRKN68AAywT0/+cRmm8NQPPYTWHElynZTY4mCpnbRB
         u/RIL+GRhCApY0jp5PreXJ1+Q4G0b5RH4NTmqbC7/VAb2DsxNzYwo5MV2QsyV/HSVqKU
         +ZBdFY4GZ2Fsqvx7PdXx2n6Yao9xtk8zne7hO3R/INp1llJz3JLNrxWRHwVyzN1wIoX1
         o2Ip7MTnGcFRPlGq5uqdrDgLNXY3SKwzRNytQBuZoMM7vY4n5BDab0QLGtsStZxC/mGT
         D/qg==
X-Forwarded-Encrypted: i=1; AJvYcCUQPH++ZnFXNfr63OQvaIIwNgHRuZIn0WbBJMsRZgTvGeXK0M+jRLzMUW9VExg+ilnwtZ4f@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi4OagYvqvZdQo8wxU3O0tbZb1BuRndtji/ff8sTKJGsUPtvBX
	nDnmB2W5qSkCZE/GmvBnGqo4yuW74m0kzMIDhTkJxnnsZtnVH3pM0VjGl/Dj91/2bDWeiSZMX4j
	h8D9/AHe4eeWils6/arkUtYaeYqI5tvbYaKkDbJqgQNoMn+2RBKJOSXuQ
X-Gm-Gg: ATEYQzxoVU+iLLbIDsg8vUyUJSqdimZovqC6U2pgn+9DlqdqAlC6C6Ne4IBWZ0KvT5x
	bKaihFO0uW4gStEsLfcMliv6bXhArBjZGwtLDI7LvIuab/enLJ/Hzjt6UNIQznV3ZuMqWokAbFg
	UyPgv7Ea9VmV7Y7qZrkj8Y9+Uo9ShlUB9qD07mbbxGBCkJXXydp1rmHPSBu4FmijPR3Fq+2/06u
	weGKNGxoIa9+cRLdR58i73PZWACR537AvFI0dXCQp5OGcGilJLwAjEjwNWDoFUzdNOsUyXiRWM5
	ukGpqSSn51wwA6EpQzACudP1Cwe0lcxCkhP1qM7hu5PWkJen43f4r3HbhUbeT8jbDC+Muh+iriZ
	oepMqhotXNXblitVMsu89pvxPu/c3Xl4WmuCIwPQNGPFrsk5nfL8KvzvjcO9fWC7aMx4eokT6xP
	VB/Pv7ebaQ
X-Received: by 2002:a05:620a:4691:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cdb5a5479cmr1654676285a.2.1773661912802;
        Mon, 16 Mar 2026 04:51:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4691:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cdb5a5479cmr1654665485a.2.1773661911989;
        Mon, 16 Mar 2026 04:51:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5dfc:3995:22ce:d286? ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm40444943f8f.23.2026.03.16.04.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:51:51 -0700 (PDT)
Message-ID: <c214b66c-6ef0-494f-8f13-9d6000068e7f@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:51:49 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/30] tools: lib: thermal: Initialize CFLAGS before
 including Makefile.include
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
 <20260311-tools_build_fix_zero_init-v4-3-9e35bdb99cb3@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-3-9e35bdb99cb3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MCBTYWx0ZWRfX+X4jY6GyMaX2
 kg98PMEOUJril2nWsmtlgxLMlmcEuOHg55ilhJZ+zDpkvVUvKcx/vbm5L/u3DgFH2ccnHaQzje1
 YYZB1xHUa0DjC5XErwPf1XJPHknVjyg8dMuJUWdhbb3D0QUitE/8F14mu9n44cjsf1FpTon1ygK
 0laNmmK1GVPym+cHDbh8w3P1ZHjWdkFVBok9tK1iFOrhAEKwFGYqenrnvsK5ikC4dCM0Rz6LiPd
 J2FpfP2CgZVagX9hT3YkjOhiDfyXOrKX/Y8cwsOJiVYlta7KjhNo6Njy9f4TCVyzVIUnI+zHMpm
 5hKOgFLv7SKKICdfZ9G0blCq0FcKQhOcgqWzpKgLBUdiODQsZ2HFUaVjqg/egUn+P+8wYPqJZJj
 55aNdMt0ZYQBNS2na2Z0WKWN0yBrNedT6QT6jGwLpdJ4Mfuggfsf6v3fGPTHF8ZHY+OtDen8+Sa
 gArDx/5Udmy6WPrhIfw==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7eed9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=xTKRYfdV9gSblPpQG3AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 3gdH7TroNSAAPOjlOvZ2SxOqyeSxHyB_
X-Proofpoint-GUID: 3gdH7TroNSAAPOjlOvZ2SxOqyeSxHyB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160090

On 3/11/26 09:29, Leo Yan wrote:
> tools/scripts/Makefile.include may expand EXTRA_CFLAGS in a future
> change.  This could alter the initialization of CFLAGS in the thermal
> Makefile, as the default options "-g -Wall" would never be set once
> EXTRA_CFLAGS is expanded.
> 
> Prepare for this by moving the CFLAGS initialization before including
> tools/scripts/Makefile.include, so it is not affected by the extended
> EXTRA_CFLAGS.
> 
> Append EXTRA_CFLAGS to CFLAGS only after including Makefile.include and
> place it last so that the extra flags propagate properly and can
> override the default options.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@kernel.org>

Thanks !

