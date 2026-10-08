Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365AF492188
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460181; cv=none; b=AqpQAy67mA8J8ibb+c5qJDqUS3maoKe0459O4WLsegKWHQhkTJbOlDWNRLTyIohczay+5OXlzdYv4/wQppiago0xcN74I9zu5yOXJzjgxWtzwUYjZCZc0akHDlpdP7kzdwUgSp1XX87XOdQzVKuavE8nGKbNbBdXltUD5miQnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460181; c=relaxed/simple;
	bh=z1Lv6bBiVaV/AE1698NmYcqqikCeK/dLos+yJzskyMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfSJ2Cnx8Z1X1RIyJJ5eA4OGIyNzKcO+wvmKmEZ3rIbt9fqKL+RhNM+I/GFs1gbT+rRhdWMsbD7sptvwqEp8e9AxfZUI9dleYFc1KD7D3nYoSl2s7PuvGLGpfpjKiVuUr9w26JiIKnQK+2ieRco+A8IUhzGZD24NaYqnXE59VAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrSZL12g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+J+Zrn3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrSZL12g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+J+Zrn3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BJvq43732623
	for <llvm@lists.linux.dev>; Thu, 8 Oct 2026 11:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONa57ks5ga652cPMfwS6ylXGao8ogu8BA+2+sbiyCTI=; b=IrSZL12gPR1LytLM
	ho2XNe5p3YUC3j0ZfUqlyXFbRCChLsQENBec/V255WXlNHczp1hmsSEbWj7eER8U
	Zja7MII7BRRhW1CO6eVqdH8PZio6nd9abHOwfUGVNOzji+B9oWMx+L6Ew1wZCZhR
	OF7S86m6BTQ346R6+H3iarRkO3dxqE+YuG0hLmZi5AoLxk6I7MWqa48c8Y5oXJ1T
	9tX5cW1V52MKXBZuYfWktQvAq0i1yqSpelG4lY9QYp8eUSCAq51WljxJnTfEFdFc
	urN2HDvbGs/H4u7tgOZT20Qx0GI7xyRde/3FtLP74wAxBleSvyHI+E7s2PWVZKiK
	XAquMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6aryv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 08 Oct 2026 11:49:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so1129717585a.3
        for <llvm@lists.linux.dev>; Thu, 08 Oct 2026 04:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460178; x=1792064978; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONa57ks5ga652cPMfwS6ylXGao8ogu8BA+2+sbiyCTI=;
        b=N+J+Zrn3Xt+MeIfwPX2DUOCS7KSBvD1+bp4GTFelbmELqPjMaqKDDOISYuRrMIf1N8
         1oDLAIhamB6xsZWPr49swKbu0e/Y3ccY39/CmPNgpvOH1dAAL7eDnQwWziC5VLhmHHHF
         hpuQ7jDJbohzHDZBHIjGWgYYmGu5XNPVsDxPAlP3FRa4AoIAoT9Ko1qEoE1CqD47jWjN
         j3V33ChiAPfU5DV1PjCiACX5pyZtPl0X3u9C364YZ1KpOvCf9+mEMQ8ajj0TXX8yAJea
         ozreuI6A6QpGJNLAU1l+FOV0LOup8dwZYij2e6YJ1dmiyAkeadH8sPKnyakw+06g2+Ad
         s4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460178; x=1792064978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ONa57ks5ga652cPMfwS6ylXGao8ogu8BA+2+sbiyCTI=;
        b=h2XOsyFuSXDSDIKjJyY6B0lhBJBgn4W/NvHY4z/n4bDkkdjE0+LMOaF+3ygyA1AF6c
         K7SQzc2SqAkVSiE2w4cIsrefsy2F3C2c9HumO/M3MzDyKSxAAfRe/ZmDcFwbi3pHtKkH
         9itRq288wWdOKtr+wryhwoz1olXltxS9nQ1HKUHdnVdmrWB7EsbJiI3OcQx5+Say1tUO
         57rSdg3LdM/pLhL2fxEfhybSniQKltFpL3RE46ajeHHTJOCcJ9LvCSnD+4pMrr5gx3k4
         WmXInVW7bS4WT7/wBBP3EHmCiCOE9S5Lzq+kchc/2g473OX8StKbOYtDttuoDLAbveQs
         OHXg==
X-Forwarded-Encrypted: i=1; AKwUvBw4w+ZKlWu6OxiNXbmqOtqsI2n6wxeeF/Gfkzz6Q9VlgP0i+iFc2OWbKP3CHNmRPXEsJ0CR@lists.linux.dev
X-Gm-Message-State: AFuF++laCPHgcm0yTGIkGRQdG+O5uggeBj3yaJ2ViclM8aoiG0duLicP
	ydE3hD0KnRgUTSGXUskY8MPh9KYvUJztSWhELglMnZ4+at1Fv3WGAZD6rYkvjEHFu19md1vzIo1
	4nZVYMPkVJjpZmAN1KFPZmhIrb2JBxSqG1HUG5Ew8im79rd2dIKhAQf1w
X-Gm-Gg: AYBFou2DxIVt+/4y6Tx/mje/KewK8FJ3ZvdnnCgnCJTc6EmHHL6NmE+PQHjTJ8TyYJe
	gAOQ6wCtnmnYBGwjhTj6xR69aeKW5t3dedpEKZcHAlYlOO0uqYCrKd9Bhjs+Jh7UgizFhV4+Coq
	jMAYbqgtkBKzN7GCix2BdbZJtcmdq9+tH70LMyDG7TkvQppfK+8nBaaoiW01O+PFGH7P6kG/xnq
	y+DX8BkM/QeyqRXvjj39NeBboy3UQaj3MCEBMoFML5es9f9o/f/lRC/Rsr1WVsy0yfzoVq57a9j
	yMIF8uQmkJMh6ytFh4FmSwgWQbKbvQj2kuKxnPM5VszdNZ/Fa7OR4Y9iabwERVutqT623lvm8e2
	8ynK1O6s+SrMDtis=
X-Received: by 2002:a05:620a:271c:b0:939:9edf:edb7 with SMTP id af79cd13be357-93e9b0f3275mr1099342785a.6.1791460178148;
        Thu, 08 Oct 2026 04:49:38 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:939:9edf:edb7 with SMTP id af79cd13be357-93e9b0f3275mr1099338485a.6.1791460177532;
        Thu, 08 Oct 2026 04:49:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a183f7ae14sm29634815e9.3.2026.10.08.04.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:49:36 -0700 (PDT)
Date: Thu, 8 Oct 2026 14:49:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>, Tingmao Wang <m@maowtm.org>,
        Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Justin Stitt <justinstitt@google.com>,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
Message-ID: <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
 <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: TDkxJFbdXq80l6ml7a6y9vHvFOys64cH
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac78353 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=65UEQdh2eEdUBxeNKyQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TDkxJFbdXq80l6ml7a6y9vHvFOys64cH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXzVbLnoL8mQh4
 /3g9GDg+sk3HraA9TIp9POZO5PXMTxGqwjlgGttGDXdxAVeLqFxHAgPKfCX6DrlcU9E2nsl1SZp
 +FyHsl0nmtLLtPak+QygUSiyGHDEqVlgNgnOTe93akyD8VlO31vMOPCbBp6RmHzd9jpdPZb4sx/
 dV3ilEQAFMi8/IJGU16IRcfa5Tf1sRGr0Z44O55x+X3cxED58sZ4cFddOpp43v3nXa2a82MbqEc
 67XvDc4vTEh4rPAsbbPC/0eHnKL2jZpKv0J3fShl7l+Ap4+HiJLC9pRJs26YQ7hirZuz2G7bE/4
 tIxIOk8/TLVRp78gu1Vg1ZfZqX85p+zCqr8zSxoxax1IdI7ZD/8mZOl06muwMsMlzhu8q64UfRg
 47ONB/yw1c74uGQw3O4ta9xT1li99Npi/WpQLsTRsIPQeXgKCafw4gQ0IRluo7ZbXaHXAlkakKK
 nkz+4TruC+C+XCYD/DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX/WGQHWdjEH+K
 5ZbgctVpaV8zNkDYBSrZnKZdLdx0bB431x153LGnMp083zwX9SbQYwjIp6d2RpZO8Scjq9XuNqz
 Cjq8jSWXOkMxG2i28mQCR4ywmfJ1uCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080047

On 26-10-07 14:49:28, Nick Desaulniers wrote:
> On Wed, Oct 7, 2026 at 9:28 AM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > With Clang 20 and CONFIG_FORTIFY_SOURCE, stacking Landlock domains can
> > trigger a fortify panic in the handled_masks copy in inherit_ruleset():
> >
> >   __fortify_panic
> >   landlock_merge_ruleset
> >   __arm64_sys_landlock_restrict_self
> >
> > Clang miscalculates the location of the __counted_by counter in the
> 
> Thanks for the patch.
> 
> Would you consider this a bug in clang, or an error in how the
> __counted_by attribute is applied?
> 
> If the former, then a bug report against upstream llvm-project/ and a
> link to that bug report would be appreciated.  Then Bill can take a
> look.
> 
> Or if this was a known issue specific to clang 20, then we should have
> a link to the fix (or consider bumping counted_by support to the
> compiler version that is bug free).

This is a Clang code generation bug, and it is not limited to Clang 20.
I checked a reduced reproducer with Clang 20.1.2, 21.1.8, 22.1.8 and
23.1.2. All four reproduce it at both -O0 and -O2.

The native x86_64 runtime test returns zero for the dynamic object size
of the zero-initialized array, despite num_layers being set. The AArch64
assembly also shows the count being loaded from offset 40 rather than
num_layers at offset 36. Moving the counter and array out of the union
makes the reproducer pass with all four versions.

It turns out Amaan Qureshi has already reported exactly this Landlock
issue and proposed an LLVM fix:

  https://github.com/llvm/llvm-project/pull/228309

Thanks,
Abel
