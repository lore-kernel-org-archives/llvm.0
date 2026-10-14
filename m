Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4CB3451AB
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 04:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791951894; cv=none; b=De9AYIb0yHZG2cFF6ebLYhhSOUX4dxYjkLjI+D2Mt7knITgYCk9TYb4ZHqC7UjLe3nX9DuCenhtltIGQco+nYBwhW50HZ3yOM+uNLElQ6f+ktFkuMsw0U/ueF+tVIMPi4eTItuL30vLH+Qz2FagJjyf97CXniDKmUzZecV0BkVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791951894; c=relaxed/simple;
	bh=uX2IrYZKuunh5Ay8wtG5R15VefK9qebescjFxGpBE28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfhWf2dAjkDklbVAX7ylMAWyjWHej4bVGcqKTESqusOwmnOJHXNREVLuBXonaTym3pKAYE+0jAxrzfWOe5H3eHGfkXw2IIBwkUD8ifQ9zOxEZBoYetyhiwEQlgdIAP+8S1vJDvMOTNsOXTFn6Con4R/5vwePQXro15rD0KDaoN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfBIXI1u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaeweMUN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfBIXI1u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaeweMUN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2JZR81125169
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 04:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/YWOWusTmnn9Tx8/iLnPWjpANYDhhlrDY+RymDC9lQ=; b=mfBIXI1uLAOYHNpx
	M+pskrgQQbpJj/+60jNFLzZFxHw2r6RDPCnEYQak0C68FqNpjyua8eynX8SGcd1Y
	2J1k4+K/t/BHMHnNSVt94VWd+zjp21ADu/+gT5GHSxkze+TVoAJ8ZcEJUegyUcj3
	l02tjV+K80HtT6WpkHCz8hJA1pNAkGFI0embeDgtOOxCvfUQQ4c9lcW5zqnNjbim
	+IIDJbRdlgftjP27N4Ac7M+zpCtJs+D/UR8kPP45vYPVDrD5gR3xqxJhNmnwyIgi
	K4kI1TWbCLNx+Vt70sIiD4gGFEtC25wsPGiQD9gMthErtmViPMA3SxZL1fMU3msx
	O1ZOMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg825yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 04:24:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso6038194a91.2
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 21:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791951891; x=1792556691; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/YWOWusTmnn9Tx8/iLnPWjpANYDhhlrDY+RymDC9lQ=;
        b=AaeweMUNm94W/CR9InV3o0XZ4ZEacDLuPZ5YyaGBDcQzzCGXAEaP6ffIPpFWHfAmji
         WPhePzmQey/8m8uhwDQ27zJ5CiyM5ezoA7rsPukSdlpiOFnxs0PRK1exyO6BXqWnPBDA
         v8hiXalB8xYcFGJuX+N0OkZK3kJ6tMEdO0wOR3WhJbHOSaN7Lm8ZiYDlfhJPCpejOPVa
         wulB0xirX5lwQHtukUR1FzZI6sYwrGF0ucbZ/pzaL8USatgyyeO2cVPLxSsVtvxo6L2e
         ePEUNVH1HvvdMkc5WNIed8CJPJi5gUNEXdpRHA4N+s3OAJymVfOGk4RHA7AjETH1oOls
         Hh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951891; x=1792556691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/YWOWusTmnn9Tx8/iLnPWjpANYDhhlrDY+RymDC9lQ=;
        b=P064ymWZj3eOkWvKbl8JoqxSINRthvQi2dIC512zD+HSngbocWgymkTDquKKD7mU8r
         YbV+04XybOzRZEw9idkEuFKDmxm4OTwyJY9Ess7SdRB0m66zRtAEM8pWEPapKIs44mJ6
         UM6Uy6HBslWNt6hcMgLCwBtqEH5heRok7L4s03ZH8iHuXKNpQYJGxX40/JyEnHFtDFXH
         Vhm2ZUzruvYl1wL8j8Y1pkfIX1QYW0cg4KQy2wZ9YJlWP4RKTUw7p7GgmssUxRpg+600
         QfRZc3l/mA4k8GXtW8MfWACjhkls4uTduiIdrSxQ9j47v6z8m8JtSuJKOuuXiV64RrYz
         Yo6w==
X-Forwarded-Encrypted: i=1; AKwUvBxaLHHiDCNI171M2oBXbyMcBFd7SuqcbpuBRIsyX2MzEIYhyL4gU/uD7z6mULdGwoN5Tozp@lists.linux.dev
X-Gm-Message-State: AFq9FYKG7UciiqqtRtbreVBxHD7/d09rz6xbr0Mp96OLiXzWGo6pkh4r
	qjkOpXHx49AiW+NzfKjENMpZIOir+nBZc6sXcXe8mSdX9gqDa6FWxWySbtEkMzre8ScBstY2ysg
	OIkOIjVgvSOPMxGdJjzAZ7CANoOUszjL7xNg6TckfSEH81D77M0lUP4Pl
X-Gm-Gg: AYBFou3PvLodNjOXgFM9D3KUjrzQjavvMhcI6ppjsD3WSBf+Bqjr6jfuwOxbTRwjYFr
	SAmYRE8ZvtiQkvBlWoeBoQv3XPgdxeJ9Us27we2lYDFjH2cBQuhAkF4ECN52f4eGLv0uz7L5/Eh
	oG18UQPRGIafLa53evt6Ao8QvNZdOsIK0gRh9D4mqbF/yVO+v5FkvxAQ2VuHKrx7oj856yPso1t
	NULfbI7Bc73V8wnE1E4q5fC3W67GwLX1Nk1gX9pTKk8SQmVqVq8uxWvGrMGRP5Or1drrdSShvXl
	ybxyohsWDOeAwiL8BzxSXTQ7U/lc0tX6C/NZzuQqxGTThCBoy9VRo/0LC5E9F9qFuZj0ztoh2xy
	nsjzvXF9V2eIVggzPEFCTDyiUhhKkBb2TKnrlMqfxMha1qsfifhBRSF5s3CL0mVOdrGePcBbT
X-Received: by 2002:a17:90b:35cc:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ab3a33db36mr12329616a91.8.1791951890973;
        Tue, 13 Oct 2026 21:24:50 -0700 (PDT)
X-Received: by 2002:a17:90b:35cc:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ab3a33db36mr12329579a91.8.1791951890405;
        Tue, 13 Oct 2026 21:24:50 -0700 (PDT)
Received: from [10.133.33.242] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac63279277sm860530a91.1.2026.10.13.21.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 21:24:49 -0700 (PDT)
Message-ID: <252e86f2-9663-4ac7-a19e-6056b44e769b@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:24:38 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] cpufreq: Initialize kobj_type release callback in
 ondemand and conservative governors
To: Ian Rogers <irogers@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich
 <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Nayna Jain <nayna@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        David Teigland
 <teigland@redhat.com>,
        Alexander Aring <aahringo@redhat.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Richard Weinberger <richard@nod.at>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        driver-core@lists.linux.dev, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
        gfs2@lists.linux.dev, xen-devel@lists.xenproject.org,
        linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-5-irogers@google.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261013223946.1836757-5-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bQDr-jTdJ4nvJnrxeVnX0LNHcRtSkMCu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNyBTYWx0ZWRfX2/EvKLv0Uh3d
 VJ77UaYylzFG8G6rZahy0XSyQw9t++r/F5y/Fr4Cj42ScYRDdNoyYz0V5Lh1u4HMq2w4imDD8qR
 LbrhbozxVJi5CC2gXq0UUUICopfbVe8=
X-Proofpoint-ORIG-GUID: bQDr-jTdJ4nvJnrxeVnX0LNHcRtSkMCu
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acf0413 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1XWaLZrsAAAA:8 a=Stt4M9KXtKJ5ZbChFzoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNyBTYWx0ZWRfX8wxBaVmReMKH
 SHYuvxVhYLrD+qaYtzPzXx79xFUl7NdIfBuHSZQ0a5w/J53JVuJRQlFZCArL+8SK3uMwhLtpTzW
 egdm5WLwirfkDalc8Ld7SQOZOarDj+LIYYEL+pV5mZCS7G/GXJlPPMUhMHEuoUaqcdAa9zzCqHm
 /prDARAL86a/yLbJ/dasu0pvg8H+CC1Av69SiWuo5lMHLWoiNjZUBVR5nGpfzk24g1xvXA5eDH4
 27QAwmZLLnR74R+QbrRM630bOdzn6Ppv6omVLzZmMPLEW1sHym55+7Vd2Y3m18Sx9sMzaaz7YTe
 uD7NiqZwHYn+9yR2GH/fx/ERK2A+CMaoQ85tCiMnSMaDr1GanaN1CJUw6UaamxgAlbEc9vV7eFq
 mj0px8RcbvI4EmNsMT4ymT6a26KuM/5rVh8+DmRMhFJ7dye1BxKHmvCLdYG6rfU6qI9UkFyPeKv
 Q4EzL7XH7wagiTmzkVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140017

Hi Ian,

Thanks a lot for the patch.

On 10/14/2026 6:39 AM, Ian Rogers wrote:
> Export cpufreq_dbs_data_release() and set .kobj_type.release in the
> ondemand and conservative governors so their gov_attr_set kobjects have
> a valid release callback, matching cpufreq_ governor_dbs.

Commit a85ee6401a47 ("cpufreq: governor: Use kobject release() method to
free dbs_data") has already addressed the missing release callback
issue(it adds the missing cpufreq_dbs_data_release() function.), with 
its Fixes tag pointing to c4435630361d.

Besides, "matching cpufreq_ governor_dbs." seems to be a typo?

> 
> This prepares for annotating struct kobj_type::release with
> __require_explicit_initialization.

It would be better to use "cpufreq: governor:" as the subject prefix.

> 
> Fixes: c4435630361d ("cpufreq: governor: New sysfs show/store callbacks for governor tunables")

Since a85ee6401a47 ("cpufreq: governor: Use kobject release() method to
free dbs_data") has already fixed the missing release callback issue,
current cpufreq patch 4/11 seems to only move the release callback
initialization to the static initializer in preparation for 11/11. The
same callback is already set at runtime in cpufreq_dbs_governor_init(),
so there is no functional change or bug fix here. Should we drop the
Fixes tag?

So, at least for cpufreq, the issue described in the cover letter
doesn't seem to exist, right?

"Patches 2-10 fix 10 struct kobj_type definitions where dynamically
allocated kobjects, ksets, or enclosing structures were either leaked on
kobject_put() or freed prematurely before kobject release"


> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
>   drivers/cpufreq/cpufreq_governor.c     | 3 ++-
>   drivers/cpufreq/cpufreq_governor.h     | 1 +
>   drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
>   4 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
> index 0b32ae28ec85..38c3bd5bf75a 100644
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -316,7 +316,10 @@ static void cs_limits(struct cpufreq_policy *policy)
>   
>   static struct dbs_governor cs_governor = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> -	.kobj_type = { .default_groups = cs_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = cs_groups,
> +	},

Nit: In that case, may I know can we also remove the following runtime
assignment from cpufreq_dbs_governor_init() as below:

gov->kobj_type.release = cpufreq_dbs_data_release;


>   	.gov_dbs_update = cs_dbs_update,
>   	.alloc = cs_alloc,
>   	.free = cs_free,
> diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
> index 710d93ec89b5..97b64985927d 100644
> --- a/drivers/cpufreq/cpufreq_governor.c
> +++ b/drivers/cpufreq/cpufreq_governor.c
> @@ -404,7 +404,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
>   	gov->free(policy_dbs);
>   }
>   
> -static void cpufreq_dbs_data_release(struct kobject *kobj)
> +void cpufreq_dbs_data_release(struct kobject *kobj)
>   {
>   	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
>   	struct dbs_governor *gov = dbs_data->gov;
> @@ -412,6 +412,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
>   	gov->exit(dbs_data);
>   	kfree(dbs_data);
>   }
> +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
>   
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   {
> diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
> index 73b8ed7cfaae..c03d067f42eb 100644
> --- a/drivers/cpufreq/cpufreq_governor.h
> +++ b/drivers/cpufreq/cpufreq_governor.h
> @@ -148,6 +148,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
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
