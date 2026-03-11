Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DE735AC20
	for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218662; cv=none; b=nSK7oabD1deTYml6QnDWqXnF+RZx4BtJr+U4C3L0iT8S19x0kR6G+BbanViKok75xxEoo+qOdxH4eNeREAIUMgjDgI5ujX+XLyPCKVfFaW2uCPErB35XdHjzJtbed7XmOO03h0SEmjdVZ1OgXdDVKAgznG4QTp7+wSsktVgTaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218662; c=relaxed/simple;
	bh=Imjp1fxzvFdfmkh1WVAbM18uVmKE1yiH3pmg83B4nQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVE2zHQVqiD+C5+/l/VjbBsC5gqwvetSqkyOdWb9sQrIx/GhHQbpTY92REsUARFFdSq/MQZYyKJiLhB9r/J2TW1BbIC01IZxHCJPUZ7/xmQMWo/wyroxbrYirVuUvGw2EKGdZz3Vh24Fow7ODkkfgqRU+jtc4P8wibTvq5rnQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDk3i07k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmNGdlLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDk3i07k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmNGdlLb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B88iO4508287
	for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 08:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqiFk0X3+BAunLh8qic9ybUFgfcvYe5yryI0mSRxLWM=; b=XDk3i07k5AbMgZEE
	GPfzdLbnekR62LdXCUL2wbKO4dJuHBf5HvtlfhVS8gTAMhBWv2G6zp3ww7bY7cvk
	sflliOaL3Vab4D4/NIMSDO1xwwiINd5liCB2ewkeczDYaLxG31LqZW/ER/yrGd4E
	Y2avzBH9FkCKhqn5+qljEzCZ/UNcPCgizEfjtVlQpRLwEJQfm6FKXtM5SeNmhaLN
	q18X+nzPVATsnsGr8QwGTVLO1+ncxpCP/pPLvTK9NXP/Qe8xD8UZcM3ZM6J6QmHP
	nrG68etSME5UCppqhYxYYeR5HJ0y3siqmYNKyTLhDvP5cW+yP/aZt/ara6HDhADI
	UQ0ntQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppajyqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 08:44:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd83cfb36cso2275417285a.3
        for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218659; x=1773823459; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqiFk0X3+BAunLh8qic9ybUFgfcvYe5yryI0mSRxLWM=;
        b=ZmNGdlLbhfsFQR40y9Rq2EZERLcjLieuCxdvR8T/BFRA9ShLL+nv5QtfNQxWeLBPbH
         sm5doG7ubfosI5W3kzoekIX++9IxkWM+G1GmRFqq5bQVPRcxRmt1AS9cpdzYRyY+XvoD
         SKby/Fx+d7fb/59yTW7o6wIJ7929WMtF7HtQqHjJH4w/zefo+WNsudzykClW4wzRSm2k
         Ff34MQC+QG5tCv5NgHvjmYLQBF9IPCQijRHvwOLlo7aD0pqzqhUyhK8qAQGiKHMnA2K1
         nvh2p+XPVWKQ1stBTYF21GVFVYTYt03I1Wwmt30k+sbtKC6UvLiD9DK5X30LxRNa6jsv
         KGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218659; x=1773823459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqiFk0X3+BAunLh8qic9ybUFgfcvYe5yryI0mSRxLWM=;
        b=bycc+tx09BsG9E8C8DthUttfe7mBUlVZgjIZQhasziTbK8iIVWObgr9VRkoBbBlDxv
         rESyDked9ZFALFKjTBdaPuprmHbYEWGUEpekQImQXLnAPzSb1Nm/m0Jjn60+3Nm4C+WU
         reeLdndoukUiOrq1EidU6VlaBfT7Zpv7pvRTY4Jep4XSuKpWuDaJdFCYXYnXD0ovLJb3
         /iyT/8/Oak+1jklyCMN/aRbxaAgNKsHwfvFcmnXw8KNHtpBJZ7lUm3JBJnUiaC2LJT/1
         IWsn2Rzt3koDeKDp36VFKYcRf7jUsQ8RBWtfkoPqTTwPOO8NQsF4N4IWXCY5aIqaB17f
         4Vfw==
X-Forwarded-Encrypted: i=1; AJvYcCV+NTBQM8X4BS9uNLPeYflqHUljMTcSof/aiZv8ZMZEmCC52KpdQJMvjFIqAZIguLBrqN1b@lists.linux.dev
X-Gm-Message-State: AOJu0YyZtugoXN+VnI7vh6CC2eKxYb1J9AJe3tzocB5C7PLGdCbCwIqI
	S34O9sa1z6IQ1GYsJ+uhnJ9YtMbnWBD/4Zlfklt5Cz6ynrWzpZUhBdtmokTAyKLY/7TKf6g3/5z
	raspNF0TRfzWjQqLKHNq6J9veEOIWA5nWQRCw52jiZoCPAJsGs9lID1RW
X-Gm-Gg: ATEYQzx0w1tbHxWJ/5Zhp/0t67yTc6weSdYZbLKHKvvZk9C/4LTJDHCjDoUXn49U1ro
	REMXz5/dBxvytLaCWgnXJY3xPg7Oer9iYcptk77AA6Z8Iflkc/PoMpqj+UTIuPyPUJQ+F+YfouT
	zUu/BaUZcIU85If/MPyc0nsyPUsZJbOXwOgd+KZwdyUcYoKIkVtczDV01tmi9mJmbsdEkrn6JUu
	jMaJ7ljeX2VJ9yacbsDe3o4rZIQY04suDCtJoUIULbCTLencR7Z2tFsFmFaxNJdPzZZkhG72IEQ
	yG7z3Xj/cQpXGqR6C7Qu7NeCQV00Q2jXiPIACcA0kxJfgnkOpxAXyfm2M/RRMh1kagj7vkCXSbf
	RlOMDZJKFBTbagvLUDgOboscmOXhpdkOj3qsGPVH832cUEbPWnSqYTzXIA11eqHH+FcQgQnisGm
	40cwSHvNwY
X-Received: by 2002:a05:620a:294b:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8cda1a58338mr222187885a.68.1773218659206;
        Wed, 11 Mar 2026 01:44:19 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8cda1a58338mr222183885a.68.1773218658603;
        Wed, 11 Mar 2026 01:44:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d5eesm5866352f8f.1.2026.03.11.01.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:44:17 -0700 (PDT)
Message-ID: <6707888c-a31a-4d38-a99a-86ae42351561@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 09:44:16 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/30] tools build: Append -fzero-init-padding-bits=all
 option
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
        linux-perf-users@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uOLFHQoH9noLX0NpZ7koYwN-oguMI-G1
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b12b63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=fUoFdtiNKAmboDELQeUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfX2c7LPv3T+AZH
 1B2kKp7FM/LDvxX3TzPZMvEBlOs6dhk3A5GiSh64jJNrJxMaIHTtx4dyrqtXi9jHdyIOVHnPMUt
 R8nZDgc6E7JEMJyUaOwEVe7AXSxmy6pW0WheKoAKKTO/7OL355FcuTmjgo1jRq2q7h7rA/BOTRO
 AT5xOXNbSk8fYxOHVJHJS+JPxpt18R2hVhVNh5F4eWjUBPlyj2kLEEhLl32AUV0OXrFxfUxGGAS
 HzomIK9jJd3+BAZRbjkVsIcZ+mEHD46CkGp80qC9rmbygn+WvFNXtISZbRmf/sTRbY+129fd0El
 J5diCaKrCjTg38Y5YYa4TEEG4ONL9XuBSFXAE7NWguyfLSzHD+qQeThZyQ4smIm8nX13p6X/LgO
 R/KuvOnOhCY+Hwe6GPGJCORZt49quF69m8N3R2QlQ+ZLHZCRkDIwMoRhVE8bRdAYB8TAGMWBpWF
 UDOhZW9NxukJwekyT7Q==
X-Proofpoint-ORIG-GUID: uOLFHQoH9noLX0NpZ7koYwN-oguMI-G1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110073


Hi Leo,

On 3/11/26 09:29, Leo Yan wrote:
> Thank you for reviewing v3 and I appreciate much Ian's suggestions, most
> of which have been adopted into this series.
> 
> For anyone new to the series, the reason for appending this compiler
> option is described in v3 (see "Link to v3" below).
> 
> In this version, the changes are organized into three parts:
> 
>    Patches 01 – 07: Preparation before adding the new compiler option.
>                     Fix typos, adjust Makefiles to ensure the newly
>                     introduced option does not cause regressions.
>    Patch 08:        Propagate -fzero-init-padding-bits=all to
>                     EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
>                     CC and HOSTCC compilers, respectively.
>    Patches 09 – 30: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
>                     project Makefiles.
> 
Through which tree do you expect these patch to be picked up ? Each 
maintainer picks the patches related to their subsystem ?
