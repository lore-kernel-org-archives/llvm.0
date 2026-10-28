Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158587;
	b=kTEmwcnaXCBkfGa6h/RhoREkywa+GFXuxNo6Y9JPtjOozIS0b06MJoBW+s6gBab4r7ql
	 vSWUnV+yhqpWVfAEsbOrl9Rz6B/4QpMcuCMiYOQlhJkmk8fnNAdvpPF9JLP09P4mD1uTy
	 i4VciCgVXJWIgfgq8s6ZYex7FuJm7RwH0j5FIyfSyByyHIaItdtD3rQegwnyU4Me44Yzx
	 Cv5d1OoxKjDeu+VOuR/eMWo2fYXzvEO8tryz1KrU2raw2xwAvcHsSxCe0Oi62XjhhJQMR
	 wwq9Ee4tnNPEPwLYb9RlKDtsH05GdnDsUBB17FICbXxzkUaMKk6Svd5CNUaMABdSMHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158587;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
	b=c5kOP4JyvKAJ6fgvR+14MM+hWJErIvlH4SB/XGd8DW8fnBfhkLJZtlLx6MkpnkEEY71k
	 nsalIiIchyyJpKGIHrvlzCcOCwaY+JyTsW+yzY7abZhe1gKEAaNGrn+vhddb3WY0uI1rQ
	 LWUSH5PpXd+pMNZPOmcQNB9/U0DZmwc5FXjULCk0vzkG+acExeD1cgwWc0d7amTcRPDMQ
	 cL7j8mDQVcas9pMFDkeNNf59rnciq7bbN00/PyJEUekvhr6PQASvOE0fEZqWm+DImWbWA
	 Z8FHzgda1kjPLNEZqVvdy52xhtxJlIdQP6+WecAYxDPALw6+/UmStkvc6aT29NlXjHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jve2qMQH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHQf9fGP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A6606A326
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1A6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jve2qMQH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHQf9fGP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0iuhL3274150
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=; b=Jve2qMQHUqrEssgK
	LflW6/l7KZ234zJVmm5v4avWWbV1TcUiioz11IU7xNAS3yhP+6JpgpsoOMhZWZvJ
	IPei/BNfJ7ExWg/tShStITm6QZsRQXDRsGswXFZFnq+o9ga6nmbSa33m3OhRLXWT
	jNycF1Ub6eUUeiAVgYu5ZaX6svI7KSL3EU6+K53Rnc/d554YMUVQJALzktVCxxiV
	q+Kz86xf3mp9SK5/sBZk8qiecR2lpX8aT+GhaHVmok95F2t7X+5DAAukw34dJtRr
	PnVGLMYR/XaeQ9zEg45sqiPgK2kxAakvx9jugL9konNgiu/4GNvqT3B3MXccU96s
	aGnIQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g29jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:36:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so459632b3a.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793158585; x=1793763385; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
        b=FHQf9fGPhZVmw97B/oXjmcAD5p3t8VJzTHKoZWrLbV6wJn3x8R4bu2ob5JmLPiUtAS
         05ROPmdpe+vO2qdW1n7TrZ90jKcQGU/IP4+h7xAY5l0yd/6OvL6De+ziBFyGec8qJxoF
         nXWXbovV0AUKNJy9dqjbrWplAQm2ask5c9d8YSSBhIV+x6vQC0EojyoXLR1SofgfyL5c
         whNlCEnG3pvGS0DCweenwXlH0zX2VjM67mdm0ij+nbYc/4UeNZjjXM4ZWLVmHgYLm/Fz
         RZlpQSEFuF4Oy/X138YKkfupME5KFW2jb7BZNnCjI+uPeNPQbNDm3WtdswGDVJKYOrR+
         yi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158585; x=1793763385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
        b=WBc7MP2bEDjcsSOOfXkRWGYezW94ybh5fAIKKXbOwpZgZRODJcpHOKTw2/xs6YA9Pq
         YIOcz0jE2Dmlg5vIuHBvEnWFL9dQFxBHihkrwA7aeLJi7uV/zaeQLGQEPJn8Zo0JWbjF
         gUN6RpmK78sNyAXGDa4GPkgQ/PGk5d3hTyOd0hRWUuAH6LGUNhKw8GETseU38UQmw+ux
         nEj0d8giTwWoZMPh2Vq1otDAMG9BfzYyAKu1AVIxNJ2CSZ7C4EauunJzwjGGVcotDcsv
         zC8i1/g2dcDfYeijKyXbMJchqNgnoBSzz2ViTbUZIb3MPH8KXCcED9VEMzP+iarO+fPK
         8fRQ==
X-Forwarded-Encrypted: i=1; AKwUvByckcLqMEcJCDarpguUutm2T7tzIISrMXXsJSdkICPeXTiSh6XUu/kUMHlGLDfQRdSsxkSQ@lists.linux.dev
X-Gm-Message-State: AFq9FYIBVMWe46ks23d2kgnk3PxOPFA5XhVhVpfJWyr/Z3gJpoYlzj26
	H1ZELgaKli8iqYsuzQQMPAy+zAXndU4Hht4xDnqNpXiRM7sN8fuh0r7CvfCYh9kK31GghCPHyQm
	KTDQah8BJc0MLVgyEVLENS+KbkRAPihtytDaasDvzWJYnrwmE+SFStY3q
X-Gm-Gg: AYBFou2j/tdu/AgSgcC8SsqkXj+kMNZbfYliPT4bmnsX7tgvXAIbAUyGHULLnt0MlJi
	NLH7Z2aHGaJdqx1abPBbmrDNFl9Vkt4RHgimb+v5TJfgvEUkJQjUTBdvDuBDngv5MJTBOOKphZa
	vcIG4LFUwo524m1Wfs0yqh1SQhOBHOqqwOfnpJ6pOrf72LkvTyPhxp1/X5kmoKy78t4mzZeu/wO
	7Xwz7pP49TlgB5ljKPweTsO92r9bOiE7Dd5/lW7v+gIZ0wRrS634ZF/4PJW3jCUpNiNPL0KMqvL
	e+k8tfLd660TjfFiSFBSwlZrkyLlCBZnsH8tcL0AH8cgmxs8EpKFsF3aSXiZfOnwwvkMUVuB9VK
	gWNir1Whkwps0lCy6j4aLT6ikl2h7x7K/dq/mSdMT4DFCDuvddv+5GfrxMebt8ZG+WJ98zgITwm
	FApQUS2+jmU0eQf7zSSLj3RcdfzhC/Tmd+8NqnnRTBkz0=
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr818173a91.38.1793158584993;
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr818144a91.38.1793158584441;
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48ec90sm899533a91.6.2026.10.27.20.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
Message-ID: <e5bd0521-36d1-447d-b71a-94a2e07414e2@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:36:16 +0800
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
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        zhongqiu.han@oss.qualcomm.com
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261027223847.652884-5-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfXwuw70pfP5EF7
 OzZqioOmZMMJ14GKfF/ZE+IkY0bxY6YzBfslF38RtqYkGq0czUKR+B9xJXJql17+URY1LxHft9r
 J0SHCgec37GrZG63i5OAgerycEEvBqbzbmIyLdhgiFlhHTwewp7YPiS+7wJ9KGe0/yEpwSeFaZg
 r2JPthynLiyCeB4+Two2T0/lnMD3t2+skyXhLWZo1yt7y9wTLh0s8HvqbpXbkO5M5pZWXpPT0V0
 497N+wA8nlNHrSG3pE44gl4pwxOrDmDSRpHRucUIUV61vioFlsubdklQtA1XoDSaWTh8d6dK/Mo
 muWTl09FTh15nbxppVmVvEP1hfwEz4OUPG3Be4GaWacF1L1aQYyzO7Xa+UvwJrJMyY1HkzhA9bU
 0E24UGuw3HtEBpATNrItW8xjWSZg55GvYhiqQvCl23RrIF3GAHWvrcU0E3Mh3UN6xskrEu313g6
 xBoYhMs/b+Bnm+6sRaw==
X-Proofpoint-GUID: UfE5sh3C9SRpTn-k0mLHusaL29eIgmE7
X-Proofpoint-ORIG-GUID: UfE5sh3C9SRpTn-k0mLHusaL29eIgmE7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfX0PanfnBxJ4au
 MIEnQUXccDcYzi4TXVuwpYjXHvWunHnn05ogpt9DM0vrR2qyk/RwTxNB3lOpRvtvvguSLXP37z/
 TjlFBEcDcMpjD38fQhkLJ33zBPnZQSA=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae16db9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=MbyaxBA4Lnn_ULkWIDkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280014

Hi Ian,

Thanks for the update.

On 10/28/2026 6:38 AM, Ian Rogers wrote:
> Export cpufreq_dbs_data_release() and set .kobj_type.release statically
> in the ondemand and conservative governors so their gov_attr_set
> kobjects have a valid release callback statically initialized, matching
> cpufreq_governor_dbs. Remove the redundant runtime assignment in

"matching cpufreq_governor_dbs" is a bit confusing to me
(cpufreq_governor_dbs() was removed back in v4.8 by commit e788892ba3cc
("cpufreq: governor: Get rid of governor events")), as it doesn't
seem to refer to anything in the tree. Perhaps we could just drop it,
e.g.:

Export cpufreq_dbs_data_release() and initialize .kobj_type.release
statically in the ondemand and conservative governors instead of
assigning it at runtime in cpufreq_dbs_governor_init().


The code change itself looks good to me. With the changelog updated
(in a respin if the series needs one for other reasons, or when
applying):

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> cpufreq_dbs_governor_init().
> 
> This prepares for annotating struct kobj_type::release with
> __must_init.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
>   drivers/cpufreq/cpufreq_governor.c     | 4 ++--
>   drivers/cpufreq/cpufreq_governor.h     | 1 +
>   drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
>   4 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
> index 02bfd46543e9..146a2353b1a2 100644
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *policy)
>   
>   static struct dbs_governor cs_governor = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> -	.kobj_type = { .default_groups = cs_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = cs_groups,
> +	},
>   	.gov_dbs_update = cs_dbs_update,
>   	.alloc = cs_alloc,
>   	.free = cs_free,
> diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
> index f3bd3dbe7c41..f8b5aca09b6b 100644
> --- a/drivers/cpufreq/cpufreq_governor.c
> +++ b/drivers/cpufreq/cpufreq_governor.c
> @@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
>   	gov->free(policy_dbs);
>   }
>   
> -static void cpufreq_dbs_data_release(struct kobject *kobj)
> +void cpufreq_dbs_data_release(struct kobject *kobj)
>   {
>   	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
>   	struct dbs_governor *gov = dbs_data->gov;
> @@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
>   	gov->exit(dbs_data);
>   	kfree(dbs_data);
>   }
> +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
>   
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   {
> @@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   	policy->governor_data = policy_dbs;
>   
>   	gov->kobj_type.sysfs_ops = &governor_sysfs_ops;
> -	gov->kobj_type.release = cpufreq_dbs_data_release;
>   	ret = kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->kobj_type,
>   				   get_governor_parent_kobj(policy),
>   				   "%s", gov->gov.name);
> diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
> index 806d8fb4dff1..1026712bb79b 100644
> --- a/drivers/cpufreq/cpufreq_governor.h
> +++ b/drivers/cpufreq/cpufreq_governor.h
> @@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
>   }
>   
>   /* Governor callback routines */
> +void cpufreq_dbs_data_release(struct kobject *kobj);
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
>   void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
>   int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> index 9942dbb38dae..7386d043c665 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/drivers/cpufreq/cpufreq_ondemand.c
> @@ -374,7 +374,10 @@ static struct od_ops od_ops = {
>   
>   static struct dbs_governor od_dbs_gov = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> -	.kobj_type = { .default_groups = od_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = od_groups,
> +	},
>   	.gov_dbs_update = od_dbs_update,
>   	.alloc = od_alloc,
>   	.free = od_free,


-- 
Thx and BRs,
Zhongqiu Han
