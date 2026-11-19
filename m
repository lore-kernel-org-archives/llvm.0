Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066525;
	b=gLyxzuc2nzbTQP/0Pvii8p2Cqr+ZUGJ2KI65DMiYT1WJIB4/zkYRBagxi4XtXdZZaqPg
	 0jPNVHSQ6XLuQOXGAJu/75w2zZERP6oCmnuI6Zi7Au/sphREgITdCtFCvH7NvFJVCl6Bg
	 ZLsputd9XvHnob8T6Qmd12P0dtS2CAd8QNO0ECpbk4REB0ezgtWANNVqsDOqQv/LVW4ew
	 8xhY7N2r+95mCwTRrM3F3nj76FkrOzPaFMSYSpBKpiGHD8KKzHgp2PnrJe+vI/S2VfZus
	 YyPWrSkpDjT8z1e1LPzS/TNlBNeI7eHrdtbS3BBXEAULTxyy3xOll8WWcEXMfIgQUxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aBeNCmqQjJ5PIUejaTF9P8YIavL7geM4L0esq0uJFsg=;
	b=m3Aq1QZmZtxxLRlgCltAcf3iHZj+lGxMDbOdj6j3veKYMTj+hXZmIxll5Bo5MS3u9M8o
	 Ec+TCpvjCzFeNlDUsxSkN1hiR9PD22I242gW/H0/y3L+5utwH9R14d5jVJK5+7s03HQ0M
	 GwKuqTAhogb/FIatTxrvTV2t6ZObM8Qq6ii0p18eXGf0gaiOGyZmaiZFw6db3CJnnEVHZ
	 6/ElCphmA5nmcRsZkaAiggt1jjc3UYQHEyu2278qi+KPAdRYyhHj3f18za4zgmbR8BvFK
	 yJhUj9H8rI3vrgAxLKAbOFrTSQ+y45Uab2HCAtT7YuarhXEOrGbdVXixB8FCxo6trYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xut2iW6M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hq0R1TFi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CCB606A339
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CCB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xut2iW6M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hq0R1TFi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1BDov786501
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBeNCmqQjJ5PIUejaTF9P8YIavL7geM4L0esq0uJFsg=; b=Xut2iW6M1Nu2XWXe
	LReS0EApq1RyzIOcdfggGW5GjpEhKmmN5wErenliBOSPiI/9BzmCoShnHAMthg0z
	Kz2J551Fq4UdPTTPQRLOEfF/PHweNEkKvAhdt0vE7dYXoeSdXbNsQ+FCa1dGIYa6
	8ago2xQGujdns11Qvx82wWh66mlTmpH2J3+35W9PavI/GjdFecV1k4c7ErgMF6zW
	LwIxcEtGfYcoYKcmwyOYT5lPmGW8ih1blevtDGNzuxKKNgF1fT/ZG6/Ngh0xx2ns
	TDV8NeE+gAWd+cb0TcEwXRND3ur6RDz5H5nkyICpt55BdSPVAhzHJadWJGzhdU+W
	OoTLUA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcbfe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:35:23 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6df538053fcso1554994eaf.3
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 21:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795066523; x=1795671323; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBeNCmqQjJ5PIUejaTF9P8YIavL7geM4L0esq0uJFsg=;
        b=Hq0R1TFi0atdDvecqAm6BX+QgIrIRBNAgCfaooQ3C2iY1LJbgZ0ayh6rqC9+NAgBjD
         Fesa3YjDPH9j5t3dLm18huPe8y/DtezUJ+j1M3NB7nBV31cr5ozE7VxHw2FWrPZrOk+i
         Ilnpow738/C+RpHloSZTlq58AX2MYWsYbEYM9QjwSoSIf7q+Bg0LAFzT9/f9zlW+CyMd
         jZRC9gfNxsbsycIDhuX1XO952gC+hxM2lvH6Z/zNA0RYXF9Pgh044CmoBVslfqBJOmZY
         41stCIRL+/8haFoztS1WwgXrPXCis58x/+Vm8VYad1IVfLTn4xcmX4JT7XWYR4wGJsuT
         H8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066523; x=1795671323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBeNCmqQjJ5PIUejaTF9P8YIavL7geM4L0esq0uJFsg=;
        b=a/zGfB8QvuuemLX1scwZCl7Lz1eq4rPJOYK4r0EcPZ2F9JUveGgEpYQK5kPlIrBnB6
         A+fQR6MXXLUDCm9FB/6OLl98iEMX4JVya2Jzl4kXD82QJWNzfJczFaG8nfchsJig2NVZ
         XXKnuLXGY6P7LkjRHgbm1txAmoJ45p4Yqxx1ITM+pnhFKrBkFBHUv0GfKgutXz/Wfed+
         mWHZV/EpBbkx7pdLId7fmcVbDC7HA5hHfn174/3jRzuuDgjiskW1Jv1ZUa9ZBrijp4u6
         P5JKk32hkZZzbzFeVOHKKsR8KLaW6NuYHIhZqlNJgk/EdiA43b95d2N0OMgKzTJtcha/
         /dXg==
X-Forwarded-Encrypted: i=1; AL+hErHMnoFpO9E8qoNI8HGKZUNPFcpMe1QzA6BYyu3n71en0WIo1ic8AA5XxPQ7LHkxTOKsdDj1@lists.linux.dev
X-Gm-Message-State: APuU4Z9JpzBYZUkIKk/vW10AnECGdZUWY4ywDkgVzJrxGxj4YQt1E4Pi
	2ZKWOSnnrcn+0oDgThA5xMKaqY5KSltLMxZGjsLj2VKRJakF+El/3TERZnDhJCnEvR2xWjmGLgT
	I0klgdhnJeWgpUHarvIRm/X3kPE669Y7qPX/KTuC+GZtLNiFt7fZM/2oE
X-Gm-Gg: AYBFou2xnl6FlFTB2OmFMPezDFG8sYZgl0Fi8tuGVdw+tfjQki1UqOaEG7d/+20DCA7
	yCyU+Fjp/aNGaZF4R4u2RO/FwSB9rZ+8fABedgirBy+BnpgnKyd4YgSFWT/Zz/HKWZciFHEFZWE
	eKyqr+H2gca1rNWllRxAuBT/Zs2gMK3p4HG+NXnHGgZDr8GVW7ff6QdtJYbHRQMrW6NJulHoaJM
	cL9McwvOwVqtkgkEQW3oGUbrrc71JwI6+GkAiJMYEpAwSch7tx61y65tvzt9xd9519Id7kw8uz1
	H3890K3FltrIsMxRMwexwER/1sq9269UEBcZh0yp/toaO8JKj5rngOSgb6H9NewqR+B9zlkbV03
	1SXhWdYtJ2fdHywhUtQTA5234q/XFH4QNBFtNWUTUX76ijPaq60/b8d/bgzIW8nca/17mAjaTJ1
	cRpVWTzMa6CjcwQu0tKlkuoLbQMXz9VwZGPCYj4TekK7kAAt4pGfnO
X-Received: by 2002:a05:6820:7404:b0:6da:9dae:a2a with SMTP id 006d021491bc7-71b1865e7dbmr3386580eaf.55.1795066522530;
        Wed, 18 Nov 2026 21:35:22 -0800 (PST)
X-Received: by 2002:a05:6820:7404:b0:6da:9dae:a2a with SMTP id 006d021491bc7-71b1865e7dbmr3386563eaf.55.1795066521927;
        Wed, 18 Nov 2026 21:35:21 -0800 (PST)
Received: from [192.168.1.199] (104-54-226-75.lightspeed.austtx.sbcglobal.net. [104.54.226.75])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74412113asm4362018fac.8.2026.11.18.21.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:35:20 -0800 (PST)
Message-ID: <7b181aeb-39d8-4a07-a882-f851a6a76036@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 23:35:14 -0600
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
Subject: Re: [PATCH] hexagon: bitops: use the compiler builtins for ffs(),
 fls() and ffz()
To: Tzu-Ching Yang <shingekinocore@gmail.com>, Brian Cain <bcain@kernel.org>,
        linux-hexagon@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261117054939.2126980-1-shingekinocore@gmail.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20261117054939.2126980-1-shingekinocore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe8a9b cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=ZLGELXoPAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=g06FUb9VstfVpfQm8boA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=CFiPc5v16LZhaT-MVE1c:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMSBTYWx0ZWRfXwpUXjVxEbLPd
 XedodJoI7edvaw/oBVHXMzDbkOFz/9kCrLsUKwFvKIMxUc3E5DE++GgQdFSeF+UDALyQKoNagOY
 eecPP0XTx8OMQs0bIeQB7YnXuWwarfk/uXih/MdSl5xnjiFK3dWaYiwWj0V97G3joxCcyD1FISY
 fTMUs/3nq5cAq37rQ764jHBgw79rZFD9TQSUEMF8kTuZ5xFB+viSurxl+JGVMvkyP7gQL++z8jh
 p8VNEdaPQwlhxdcQTXh3W59tDmS7F8o9dMyu9/beMz8l1YVy1vTxJWKvuzLVNE2BqolWzb7tNOM
 bgZDL0mu+iUzdym1x3NasfaWCbGF6uA3W6xTlY97mSKbTiCE1cMzObwb65UlWk0zouWHJ4om7zf
 sG4AXsOWD/GY9QB9KtbyrrYvB56rQs5njPNDog+/Z8807Fe4WbFt+qB2rUrx5EztEShLSbr9KCk
 i08e3MPDxK6Ql2on91w==
X-Proofpoint-ORIG-GUID: PhreE3aPf7Wu5j7xQJOshHj-q5y54KG9
X-Proofpoint-GUID: PhreE3aPf7Wu5j7xQJOshHj-q5y54KG9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMSBTYWx0ZWRfX3+iOLaO+5q3M
 G4nFWGCUXt6Csjmg1wQFovCNnQvRW+VmejDuxWCG35VLq0QzWqKsWW/dobbFT4QL4GheMr4QAHY
 zSqRTVojfoaBZc8rj05HX4FqkCSClGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190021


On 11/16/2026 11:49 PM, Tzu-Ching Yang wrote:
> The hexagon inline asm for ffs(), __ffs(), fls(), __fls() and ffz() is
> not needed: Clang, the only compiler that builds hexagon kernels, emits
> the same ct0, cl0 and ct1 instructions for the compiler builtins, and
> unlike the asm, the builtins fold constant arguments. The asm dates
> from the 2011 port (a86a7ce30ac0, "Hexagon: Add bitops support"),
> before the builtin-based asm-generic helpers existed (048fa2df92c3,
> "generic: Implement generic ffs/fls using __builtin_* functions").
>
> Replace the asm with the asm-generic builtin helpers, and ffz() with
> the generic __ffs(~x), as arm64 does.
>
> ffs(0) and fls(0) still return 0. __ffs() and __fls() now return
> unsigned int, which is as wide as unsigned long on hexagon, and ffz()
> returns unsigned int instead of long. __ffs(0), __fls(0) and ffz(~0)
> remain undefined.
>
> With Clang 17 to 23, the functions of a defconfig vmlinux shrink by 1972
> to 6068 bytes in total (scripts/bloat-o-meter -t). One helper in
> lib/find_bit.c gets worse: _find_last_bit() executes one instruction
> more per call that finds a bit, because LLVM rewrites 31 - clz as 31 ^
> clz once it knows clz < 32, and the hexagon backend keeps the xor, which
> needs the 31 in a register, instead of sub(#31, Rs) [1]. A few 1 <<
> ffz() sites also grow by a few instructions, as LLVM rewrites that
> expression too [2]. __find_nth_bit() executes two fewer, and the other
> helpers that find_bit_benchmark calls the same number.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/all/affe7da1-41aa-4710-bee0-5e3c2b8a8dfc@app.fastmail.com/
> Link: https://github.com/llvm/llvm-project/issues/236764 [1]
> Link: https://github.com/llvm/llvm-project/issues/236765 [2]
> Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
> ---
> I have no hexagon hardware, and mainline does not boot in QEMU yet. On
> Brian's out-of-tree bcain/hexagon-qemu-virt branch (dc370baa041d,
> v7.3-rc1 plus 24 patches) with this patch on top, qemu_defconfig plus
> the ffs and bitops KUnit tests and find_bit_benchmark, built with Clang
> 17 and 23, boots under qemu-system-hexagon from qualcomm/qemu hex-next
> with -M virt,hvm=on (and under -M qcs6490-cdsp with the prebuilt H2
> hypervisor); the KUnit tests pass before and after, with the same
> .config on both sides. Under -M virt,hvm=on, with a TCG plugin that
> writes the same bitmaps into both kernels before each test and counts
> the executed instructions without interrupts, find_bit_benchmark's
> find_last_bit executes one instruction more per iteration,
> bitmap_find_next_zero_area_off 36 more on the random bitmap through its
> find_last_bit() calls, find_nth_bit and test_bitops' fns() two fewer,
> and the other tests the same.
>
> Under qemu-hexagon (user mode), the old and new helpers return the
> same values for every defined 32-bit input, and fls64() and __ffs64()
> for selected 64-bit inputs, with Clang 17 to 23 at -O2 and -Os.
>
> defconfig (also with the KUnit tests and find_bit_benchmark, with -Os
> and with -mv73) and allmodconfig were built with Clang 17 to 23 before
> and after, with the same .config on both sides: same W=1 warnings, no
> calls to __ctzsi2(), __clzsi2() or ffs(), and a smaller bloat-o-meter -t
> total in every defconfig-based vmlinux. allmodconfig does not link with
> Clang 17 and 18, before or after: ld.lld before 19.1.5 rejects the calls
> in head.S as out of range.
>
> Instructions of each helper in a test function that only returns its
> result (return included), built with the kernel's flags by Clang 17
> to 22 at -O2 and -Os; Clang 23 adds an allocframe to both rows:
>
>              ffs  __ffs  fls  __fls  ffz
>    asm         6      3    4      4    3
>    builtin     5      2    3      3    2
>
> The instruction saved is the copy of the result to r0: the asm's
> early-clobber output ("=&r") cannot share the argument's register.
>
> In packets, only ffs() takes one more than the asm (4 -> 5): with
> df5e4db805d5 ("hexagon: disable the LLVM packetizer") applied, each
> instruction of the builtin version gets a packet of its own, while
> the asm is bundled by hand. Without that workaround, which linux-next
> does not have yet, ffs() goes from 6 instructions in 3 packets to 5
> in 2.
>
> Against the bcain/hexagon-fixes branch of bcain/linux.git
> (0304683b4c43); also applies to next-20261113 and to bitmap-for-next.
>
>   arch/hexagon/include/asm/bitops.h | 100 ++----------------------------
>   1 file changed, 5 insertions(+), 95 deletions(-)

Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


Thanks for giving QEMU a try - we're in pretty decent shape for the 11.2 
release.  One caveat is that the built-in h2 in 11.2 doesn't forward the 
DTB address, so that can be a bit inconvenient.  Use my h2 fork with 
upstream QEMU or -- like you've already found, use the QEMU fork that 
has h2 built from my fork or the built-in HVM.


> diff --git a/arch/hexagon/include/asm/bitops.h b/arch/hexagon/include/asm/bitops.h
> index b23cb13833af..975328172b7c 100644
> --- a/arch/hexagon/include/asm/bitops.h
> +++ b/arch/hexagon/include/asm/bitops.h
> @@ -194,101 +194,11 @@ arch_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
>   	return retval;
>   }
>   
> -/*
> - * ffz - find first zero in word.
> - * @word: The word to search
> - *
> - * Undefined if no zero exists, so code should check against ~0UL first.
> - */
> -static inline long __attribute_const__ ffz(int x)
> -{
> -	int r;
> -
> -	asm("%0 = ct1(%1);\n"
> -		: "=&r" (r)
> -		: "r" (x));
> -	return r;
> -}
> -
> -/*
> - * fls - find last (most-significant) bit set
> - * @x: the word to search
> - *
> - * This is defined the same way as ffs.
> - * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
> - */
> -static inline __attribute_const__ int fls(unsigned int x)
> -{
> -	int r;
> -
> -	asm("{ %0 = cl0(%1);}\n"
> -		"%0 = sub(#32,%0);\n"
> -		: "=&r" (r)
> -		: "r" (x)
> -		: "p0");
> -
> -	return r;
> -}
> -
> -/*
> - * ffs - find first bit set
> - * @x: the word to search
> - *
> - * This is defined the same way as
> - * the libc and compiler builtin ffs routines, therefore
> - * differs in spirit from the above ffz (man ffs).
> - */
> -static inline __attribute_const__ int ffs(int x)
> -{
> -	int r;
> -
> -	asm("{ P0 = cmp.eq(%1,#0); %0 = ct0(%1);}\n"
> -		"{ if (P0) %0 = #0; if (!P0) %0 = add(%0,#1);}\n"
> -		: "=&r" (r)
> -		: "r" (x)
> -		: "p0");
> -
> -	return r;
> -}
> -
> -/*
> - * __ffs - find first bit in word.
> - * @word: The word to search
> - *
> - * Undefined if no bit exists, so code should check against 0 first.
> - *
> - * bits_per_long assumed to be 32
> - * numbering starts at 0 I think (instead of 1 like ffs)
> - */
> -static inline __attribute_const__ unsigned long __ffs(unsigned long word)
> -{
> -	int num;
> -
> -	asm("%0 = ct0(%1);\n"
> -		: "=&r" (num)
> -		: "r" (word));
> -
> -	return num;
> -}
> -
> -/*
> - * __fls - find last (most-significant) set bit in a long word
> - * @word: the word to search
> - *
> - * Undefined if no set bit exists, so code should check against 0 first.
> - * bits_per_long assumed to be 32
> - */
> -static inline __attribute_const__ unsigned long __fls(unsigned long word)
> -{
> -	int num;
> -
> -	asm("%0 = cl0(%1);\n"
> -		"%0 = sub(#31,%0);\n"
> -		: "=&r" (num)
> -		: "r" (word));
> -
> -	return num;
> -}
> +#include <asm-generic/bitops/builtin-__ffs.h>
> +#include <asm-generic/bitops/builtin-ffs.h>
> +#include <asm-generic/bitops/builtin-__fls.h>
> +#include <asm-generic/bitops/builtin-fls.h>
> +#include <asm-generic/bitops/ffz.h>
>   
>   #include <asm-generic/bitops/lock.h>
>   #include <asm-generic/bitops/non-instrumented-non-atomic.h>
>
> base-commit: 0304683b4c43048082483e9445fdd0691d088431
