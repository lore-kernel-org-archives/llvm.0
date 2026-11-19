Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067358;
	b=GUUa9ALUMh78gF0mVJHvb8OJSEc78CPFW8a2IAthgnNeh4ri8wgiuP255ERIEpJl3bkd
	 s80jc9MioEc6jT7ZV/J43gqj6+6tjs0An5lDQj+YGRbWcQ51/fjtAojWk4F0D+DV2xHMe
	 +b/m80xI3d4bndS10DNY15K4SlXLbon6cBIguooZ+YI/AWnRJIu93URZyxEBXZXFUr82u
	 ehq8DVN69SclZznPptkPEMARNZyrEw1X8fi2rR1grst+/lO1guYBECFAmqRO/apuUYG0B
	 iY6g5emf/5DgrFWg2zgkHbOV0LK2b2ZosfioUT3japryAq/EhWXTyjfo5edrXL66sGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g3p7m7TkH/7KFsHJqKL1wxqRtKVLah1m/6dsx1ky3KI=;
	b=lwRgoe8gPRTA+a47lm1lQB9tD5HDLUeJiC7/+qPKiPU2qVPfKwq5msNrF72PmqK6koxd
	 jNWsup322gVfuZxJVhDol3G147OXf9RPkxxthn3jclP7FBiMTsT5jHIFlYFgdA3knh9hy
	 1Zh2bTG1gH1wsuUe/wi1QeRGCvhUGfOpvCbNmhkhozEMeG4lXvi8AdYrhjWZRMqnXTDLB
	 6OsTOBMj/hMsCat8HuPmP2vQ82H9BrI1GkqGmxeuxoe1YAGUu4EaLIrrjhpRwzEopDS6r
	 hfKXfRuw2eoT6i9CanJYXpVTPjsoP96L29i8dLAuouETom43x0PFQutttQ03LDID5RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8WTGNG0;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9202606A339
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9202606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8WTGNG0
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1068342b3a.2
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 21:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795067356; x=1795672156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3p7m7TkH/7KFsHJqKL1wxqRtKVLah1m/6dsx1ky3KI=;
        b=v8WTGNG03X+mrQLjsvNgJCZBgykwLCL2fstVs87seDkniNV5WJNncAq2GSlle3Mc9d
         AVK1TaxOlB4U/yaOQRNDyvf0KuNu6p4wayJdthTKKqQAEigoiND9euRmouUzdrKkBCBf
         loGA3X/eDdHmelLgmpfmDfPgBAKH+BbyL5sz0LIXBkvjrBMAiYw2pRuuRo2qhe35rqCZ
         I9Mql2c27JbArYlMwABaAAcHJxA+YsyZrZZrtEh/4/7hHFlwe4FW91qJ3mMsZXCF0I3U
         02grQoMc9asGv5T5giQH+MLXu89uPOCnBatD2TzoZ11FkZZQDNa+ZMn1x5B42aKeelUR
         MmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067356; x=1795672156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3p7m7TkH/7KFsHJqKL1wxqRtKVLah1m/6dsx1ky3KI=;
        b=y/6KJWfs3B3bJQMDrixW4suX5avUiIAn31AhbEAlDH8QjcyJHfm4TdnPf5ygHsJuHD
         t1MFz/yAzgTk4maPw4+NIzvzmXzN+NFWahQWnY4HqVNhwxArMhQnU8husgAgrC1Aoas6
         Ceqisex67EGRDn7FDZpULiRiEjIPiOo+xEQ/KNGohDmBKAMYBha5UYG6oLY+d1wRX7m2
         XeH//yT71AERvveLlhbxq8QpICFJ6xerKWSfz8cqXUnf5feW8XTj5B4J8BshvUCET6sq
         6tiqcsT5ptk5lPkYlkX9mC2V3oVS2jCMpvR9cG4iXcYiThK160gHObsn4/c6zXLwua/D
         pocw==
X-Forwarded-Encrypted: i=1; AL+hErHBPIou+pF63/GZQ3DslNzdzTmz+q70eR+BqoGUCjA7ejPtZ9QEGOfv0lI7MkOSvrCw9yWK@lists.linux.dev
X-Gm-Message-State: APuU4Z8VJwacOjM8zQpR3HdotmwJGswJ6RDaL5oiWesZCx+pXWqjelB5
	O+YVK8M2TNnzrARdO2CCyPFcDulCCmjAwUeoX8mc+iFxbLCFI30njTyy
X-Gm-Gg: AYBFou3cLfPG85t8QaI3WHRMVU6TbEdqnrqvGdp0pV9bANuLcaD+VBDT20qt3O5+TsM
	M3XkYcdOvgFerSdRqEUvTNE8h0MadZ4NHG8Yv7JyWQhjTO+xqB3dIhkvOS/2cM+7pI32eozZRyH
	pd+OqN41gteqMaJcOK2lsuqelQutdG6yZAwt9QiPZVR5j4LXM8GYn+UqyYsEqNikDC1SG+JpH02
	i98eSUm3CTAqh8xyWQr9EYh8CKjZA3xSi6kpF4CPkbOtDJyziVP0IS82OqPHvL1aO3fn5B8y5hu
	gXbAngvdImrG+3q/JsTz4te6oXFimLTIezPD7Or2akSQI0XHLAfvSGMdAMmsjE7eVvYYjMqnxAJ
	5GGz5T20IZFUqewLOUh9GTEMIbPWEzu4oBu6JYShGVzORdYt/2sSd2rNIf/RGwBnM/MjW6gR5+s
	PC/F6tDD/0WwBoq+YvKxUmIPpVj3hNHRqqgy0Uq6Tqf3a5pyLtZirUrM0ijXJnwNQeuzxjz+KnM
	fEG/vqKpPOwasq/CBS4yqKhBXoePPvY8FjGHwzwXCNVS9ppbSF1FMaS0yLvWR/J/Xuc2LJsNO+7
	lWWcUD6WQ36eaNlEcuFAFAZGhND7NSuhr5kjLTYH8/flXCuib71A55A=
X-Received: by 2002:a05:6a00:2888:b0:89f:db59:193c with SMTP id d2e1a72fcca58-8c5d2a738f0mr4157796b3a.9.1795067356199;
        Wed, 18 Nov 2026 21:49:16 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8fe3csm2200984b3a.21.2026.11.18.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:49:15 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: hexagon: allmodconfig does not link with LLVM 17 and 18
Date: Thu, 19 Nov 2026 13:49:08 +0800
Message-Id: <20261119054908.2988120-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Brian,

hexagon allmodconfig does not link with LLVM 17 and 18, on mainline
and on stable. Your hexagon-qemu-virt branch has the fix, 09df35bd9d9f
("hexagon: constant-extend head.S calls to out-of-file symbols");
could it go to hexagon-fixes, with Cc: stable?

With CONFIG_WERROR=n, LLVM 17.0.1 (the minimum the kernel supports)
and 18.1.8 fail with:

  ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):
  (.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2242552
  is not in [-2097152, 2097151]; references '__vmnewmap'

and the same for the second call to __vmnewmap and for the calls to
__vmsetvec and memset. I see it on v7.4-rc1, next-20261113,
hexagon-fixes (0304683b4c43) and v7.3.4; v6.18.63 (LTS) fails with
LLVM 17.0.1 only. With LLVM 19.1.7 to 23.1.3, v7.4-rc1 links.

The calls in stext go from .init.text to .text, across the rest of
.init.text and the per-CPU data. On v7.4-rc1 with LLVM 17.0.1 that is
2.14 MiB; without CONFIG_LOCK_STAT, whose per-CPU data lies in
between, it is 0.76 MiB. ld.lld before 19.1.5 checks R_HEX_B22_PCREL
against 2 MiB instead of 8 MiB, which llvm-project 64e3466fd09e fixed.

09df35bd9d9f does not apply to the trees above: its context has the
"r2 = #VM_TLB_INVALIDATE_TRUE" lines of your series. With its five
changes made by hand:

- allmodconfig links with LLVM 17.0.1 and 18.1.8 on all five trees,
  and allyesconfig of v7.4-rc1 with LLVM 18.1.8, which failed too;
- where v7.4-rc1 linked before (defconfig with LLVM 17.0.1 to 23.1.3,
  allmodconfig with LLVM 19.1.7 to 23.1.3), vmlinux differs only in
  the code of stext, in the address of one local label and in the
  build ID.

Those trees do not boot in QEMU, so I boot-tested your branch
(dc370baa041d, v7.3-rc1 plus 24 patches), with 3 MiB of test-only
padding at the end of head.S to make the extended calls span over
3 MiB: qemu_defconfig built with LLVM 17.0.1 and 23.1.3 boots to a
shell on a buildroot root filesystem under qualcomm/qemu hex-next with
-M virt,hvm=on. I have no hexagon hardware.

Rebased onto hexagon-fixes, 09df35bd9d9f applies to v7.3.4 and
v6.18.63 unchanged; I can send the rebased patch if that is easier.
If it helps:

Tested-by: Tzu-Ching Yang <shingekinocore@gmail.com>

Nathan, once the fix is merged, the ClangBuiltLinux CI could build
hexagon allmodconfig with LLVM 17 and 18 again (disabled in
continuous-integration2 d9d773a8859c).

Thanks,
Tzu-Ching
